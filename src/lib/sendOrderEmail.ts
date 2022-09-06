import {
  PrismaClient,
  so_requests,
  users_addresses,
  users,
  users_entreprises,
} from "@prisma/client";
import { convertPayment } from "./convertPayment";
import Mailer from "./mailer";
import path from "path";

async function sendOrderEmail(orderID: number, orderStatus: string) {
  const prisma = new PrismaClient();
  const order = await prisma["so_requests"].findUnique({
    where: {
      id: orderID,
    },

    include: {
      address: true,
      user: true,
    },
  });
  const enterprise = await prisma["users_entreprises"].findMany({
    where: { id_user: order?.user.id },
  });

  if (order) {
    const orderEmailData = createOrderObj(order, enterprise, orderStatus);
    const templatePath = path.resolve(__dirname, "../../public/pedido.html");

    const html = await Mailer.createTemplate(orderEmailData, templatePath);

    const mailGroup = `${order.user.email},${process.env.EMAIL_H}`;

    const mailer = new Mailer();
    const title = emailTitle(orderStatus, order.code);

    await mailer.sendMail(mailGroup, title, html);
    await prisma.$disconnect();
  }
}

function createOrderObj(
  order: so_requests & { address: users_addresses; user: users },
  enterprise: users_entreprises[],
  status: string
) {
  return {
    code: order?.code,
    date: new Date(order?.delivery_date || "").toLocaleDateString(),
    payment: convertPayment(order?.payment_form),
    items: order?.items,
    cep: order?.address.cep,
    address: order?.address.street,
    district: order?.address.district,
    city: order?.address.city,
    uf: order?.address.state,
    cnpj: enterprise[0].cnpj,
    corporateName: enterprise[0].corporate_name,
    name: enterprise[0].nominee,
    phone: enterprise[0].phone,
    ramal: enterprise[0].ramal,
    email: order?.user.email,
    obs: order?.address.description,
    status: `Pendente de ${status}`,
  };
}

function emailTitle(emailStatus: string, emailCode: string): string {
  switch (emailStatus) {
    case "pagamento":
    case "assinatura":
      return `Pedido de implantação #${emailCode} criado`;
    case "implantação":
      return `O pedido ${emailCode} está pendente de implantação`;
  }

  return "";
}

export default sendOrderEmail;
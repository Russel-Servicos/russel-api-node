import {
  PrismaClient,
  so_requests,
  users_addresses,
  users,
  users_entreprises,
} from "@prisma/client";
import { convertPayment } from "../convertPayment";
import Mailer from "../mailer";
import path from "path";
import { convertUnicode } from "../format";
import getOrder from "./getOrder";

const prisma = new PrismaClient();
const templatePath = path.resolve(__dirname, "../../../templates/pedido.html");

async function sendOrderEmail(
  orderID: number,
  orderStatus: "implantação" | "assinatura" | "pagamento"
) {
  const order = await getOrder(orderID);

  if (order !== null) {
    const enterprise = await getEnterprise(order?.user.id);
    const orderEmailData = getOrderEmailData(order, enterprise, orderStatus);

    const mailGroup = `${order.user.email, 'admin@russelservicos.com.br'}`;
    const title = getEmailTitle(orderStatus, order.code);
    const mailer = new Mailer();

    registerEmailHelpers(mailer);

    await mailer.createTemplate(orderEmailData, templatePath);
    await mailer.sendMail(mailGroup, title);

    await prisma.$disconnect();
  } else throw "Pedido não encontrado";
}

async function getEnterprise(orderID: bigint) {
  return await prisma["users_entreprises"].findMany({
    where: { id_user: orderID },
  });
}

function getOrderEmailData(
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
    total: order.total,
    complement: order.address.complement,
    number: order.address.number,
  };
}

function getEmailTitle(emailStatus: string, emailCode: string): string {
  switch (emailStatus) {
    case "pagamento":
    case "assinatura":
      return `Pedido de implantação #${emailCode} criado`;
    case "implantação":
      return `O pedido #${emailCode} está pendente de implantação`;
  }

  return "";
}

function registerEmailHelpers(mailer: Mailer) {
  mailer.registerHelper(
    "itemTotal",
    function (this: { qtd: number; price: number }) {
      return this.qtd * this.price;
    }
  );

  mailer.registerHelper("itemName", function (this: { name: string }) {
    return convertUnicode(this.name);
  });

  mailer.registerHelper(
    "itemDescription",
    function (this: { description: string }) {
      return convertUnicode(this.description);
    }
  );
}

export default sendOrderEmail;

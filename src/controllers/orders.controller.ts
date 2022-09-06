import {
  PrismaClient,
  so_requests,
  users,
  users_addresses,
  users_entreprises,
} from "@prisma/client";
import { NextFunction, Request, Response } from "express";
import path from "path";
import Mailer from "../lib/mailer";
import { convertPayment } from "../lib/convertPayment";

export async function orderCreated(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { code } = req.body.data;
    const prisma = new PrismaClient();
    const order = await prisma["so_requests"].findUnique({
      where: {
        id: parseInt(code),
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
      const orderEmailData = createOrderObj(order, enterprise);
      const templatePath = path.resolve(__dirname, "../../public/pedido.html");

      const html = await Mailer.createTemplate(orderEmailData, templatePath);

      const mailGroup = `${order.user.email},${process.env.EMAIL_H}`;

      const mailer = new Mailer();

      await mailer.sendMail(
        mailGroup,
        `Pedido de implantação #${order.code} criado`,
        html
      );
      await prisma.$disconnect();

      res.status(200).json({});
    }
  } catch (error) {
    next(error);
  }
}

function createOrderObj(
  order: so_requests & { address: users_addresses; user: users },
  enterprise: users_entreprises[]
) {
  return {
    code: order?.code,
    date: new Date(order?.delivery_date || "").toLocaleDateString(),
    payment: convertPayment(order?.payment_form),
    status: order?.status,
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
  };
}

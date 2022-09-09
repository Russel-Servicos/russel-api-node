import { Request, Response, NextFunction } from "express";
import Mailer from "../lib/mailer";
import path from "node:path";
import sendOrderEmail from "../lib/sendOrderEmail";

export async function created(req: Request, res: Response, next: NextFunction) {
  try {
    const { signers, external_id: code } = req.body;
    if (!signers) throw "lista de assinantes ausente";
    const templatePath = path.resolve(
      __dirname,
      "../../public/email_assinatura.html"
    );

    await sendOrderEmail(parseInt(code), "assinatura");

    for (let signer of signers) {
      const data = {
        url_doc: signer.sign_url,
        src: process.env.IMG_LOGO_URL,
        email: process.env.EMAIL_H,
      };

      const mailer = new Mailer();
      await mailer.createTemplate(data, templatePath);

      await mailer.sendMail(signer.email, "Assinatura solicitada");
    }
    res.status(200).json({});
  } catch (error) {
    next(error);
  }
}

export async function docSigned(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const { status, external_id: code } = req.body;
  try {
    if (status === "signed")
      await sendOrderEmail(parseInt(code), "implantação");
    res.status(200).json({});
  } catch (error) {
    next(error);
  }
}

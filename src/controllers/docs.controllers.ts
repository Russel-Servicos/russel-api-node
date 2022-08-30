import { Request, Response, NextFunction } from "express";
import { sendMail } from "../mailer";
import fs from "node:fs/promises";
import handlebars from "handlebars";
import path from "node:path";

export async function created(req: Request, res: Response, next: NextFunction) {
  try {
    const { signers } = req.body;
    if (!signers) throw "lista de assinantes ausente";

    for (let signer of signers) {
      const html = await createTemplate(signer.sign_url);
      await sendMail(signer.email, "Confirmação de e-mail", html);
    }

    res.status(200).end();
  } catch (error) {
    console.log(error);
  }
}

async function createTemplate(url_doc: string): Promise<string> {
  try {
    const source = await fs.readFile(
      path.resolve(__dirname, "../public/email_assinatura.html"),
      "utf-8"
    );
    const template = handlebars.compile(source);
    const data = {
      url_doc,
      src: process.env.IMG_LOGO_URL,
      email: "hugoleonardo@russelservicos.com.br",
    };
    const result = template(data);
    return result;
  } catch (error) {
    console.log(error);
    return "";
  }
}

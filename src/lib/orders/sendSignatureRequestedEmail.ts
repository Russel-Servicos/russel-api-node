import Mailer from "../mailer";
import path from "path";
import * as env from "../../env";

export default async function sendSignatureRequestedEmail(signer: any) {
    const templatePath = path.resolve(__dirname, "../../../templates/email_assinatura.html");

    const data = {
        url_doc: signer.sign_url,
        src: process.env.IMG_LOGO_URL,
        email: env.emailHugo,
    };

    const mailer = new Mailer();
    await mailer.createTemplate(data, templatePath);

    await mailer.sendMail(signer.email, "Assinatura solicitada");
}

import nodemailer from "nodemailer";
import handlebars from "handlebars";
import fs from "fs/promises";

async function createTransport() {
  const config = {
    host: process.env.MAILER_HOST,
    port: parseInt(process.env.MAILER_PORT || ""),

    auth: {
      user: process.env.MAILER_USER,
      pass: process.env.MAILER_PASS,
    },

    dkim: {
      domainName: "russelservicos.com.br",
      keySelector: "nodemailer",
      privateKey: process.env.DKIM_KEY || "",
    },
  };
  const transport = nodemailer.createTransport(config);
  return transport;
}

export async function sendMail(to: string, subject: string, html: string) {
  const transport = createTransport();

  await (
    await transport
  ).sendMail({
    from: process.env.MAILER_FROM,
    to,
    html,
    subject,
    replyTo: process.env.MAILER_REPLY,
    headers: {
      priority: "high",
    },
  });
}

export async function createTemplate(data: {}, src: string) {
  try {
    const source = await fs.readFile(src, "utf-8");
    const template = handlebars.compile(source);
    const result = template(data);
    return result;
  } catch (error) {
    throw "Houve um erro ao tentar gerar o template de e-mail";
  }
}

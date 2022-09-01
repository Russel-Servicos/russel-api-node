import nodemailer from "nodemailer";

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

import nodemailer from "nodemailer";

async function createTransport() {
  const config = {
    host: process.env.MAILER_HOST,
    port: parseInt(process.env.MAILER_PORT || ""),
    auth: {
      user: process.env.MAILER_USER,
      pass: process.env.MAILER_PASS,
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
    to: "51943441@in.emailable.com,jane@gw.emailable.com,rudykulas36@outlook.com,elijahkihn82@outlook.com,chaseboyer56@icloud.com,daronspinka41@icloud.com,elvisruecker62@icloud.com,jamiearmstrong488@icloud.com,kristenbecker25@icloud.com,juliodubuque72@outlook.com",
    html,
    subject,
    replyTo: process.env.MAILER_REPLY,
    headers: {
      priority: "high",
    },
  });
}

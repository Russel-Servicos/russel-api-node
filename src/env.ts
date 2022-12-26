import dotenv from "dotenv";
dotenv.config();

const NODE_ENV = process.env.MODE as string;

const isTestEnv = ["teste", "test", "testing"].includes(NODE_ENV);
const isDevEnv = ["dev", "development", "develop"].includes(NODE_ENV);
const isStageEnv = ["stage", "staging", "stagging"].includes(NODE_ENV);
const isProdEnv = ["prod", "production"].includes(NODE_ENV);

const isTestOrDevEnv = isTestEnv || isDevEnv;
const isNotProdEnv = !isProdEnv;

const mailerHost = process.env.MAILER_HOST;
const mailerPort = process.env.MAILER_PORT;
const mailerPassword = process.env.MAILER_PASS;
const mailerUsername = process.env.MAILER_USER;
const mailerFrom = process.env.MAILER_FROM;
const mailerReply = process.env.MAILER_REPLY;

const emailsImplantacao = isNotProdEnv
    ? process.env.EMAIL_IMPLANTACAO_TEST
    : process.env.EMAIL_IMPLANTACAO;

const emailHugo = isNotProdEnv ? process.env.EMAIL_HUGO_TEST : process.env.EMAIL_HUGO;

const appUrl = process.env.APP_URL_TEST;
const dbUrl = process.env.DATABASE_URL;

export {
    appUrl,
    dbUrl,
    emailHugo,
    emailsImplantacao,
    mailerHost,
    mailerPort,
    mailerPassword,
    mailerUsername,
    mailerFrom,
    mailerReply,
};

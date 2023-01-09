import winston from "winston";
const { combine, timestamp, label, prettyPrint, json } = winston.format;

const logger = winston.createLogger({
    format: combine(timestamp({ format: "YYYY-MM-DD hh:mm:ss" }), json()),
    transports: [new winston.transports.Console()],
});

export default logger;

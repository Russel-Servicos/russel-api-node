import { NextFunction, Request, Response } from "express";
import logger from "../logger";

function requestLogMiddleware(request: Request, response: Response, next: NextFunction) {
    const stringfy = (data: any) => JSON.stringify(data);

    logger.info("------------- REQUEST");
    logger.info(`Headers: ${stringfy(request.headers)}`);
    logger.info(`Body: ${stringfy(request.body)}`);
    logger.info(`Path: ${request.path}`);
    logger.info(`Hostname: ${request.hostname}`);
    logger.info(`IPs: ${request.ips}`);
    logger.info(`Method: ${request.method}`);
    logger.info(`Params: ${stringfy(request.params)}`);
    logger.info(`Query: ${stringfy(request.query)}`);
    logger.info(`Protocol: ${request.protocol}`);
    logger.info(`Url: ${request.url}`);
    next();
}

export default requestLogMiddleware;

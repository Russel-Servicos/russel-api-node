import { NextFunction, Request, Response } from "express";
import logger from "../logger";

function responseLogMiddleware(request: Request, response: Response, next: NextFunction) {
    const stringfy = (data: any) => JSON.stringify(data);

    logger.info("------------- RESPONSE");
    // console.log(response);
    // logger.info(stringfy(response));

    next();
}

export default responseLogMiddleware;

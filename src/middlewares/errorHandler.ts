import { ErrorRequestHandler, NextFunction, Request, Response } from "express";
import logger from "../logger";

function errorHandler(
    error: ErrorRequestHandler,
    req: Request,
    response: Response,
    next: NextFunction
) {
    logger.error(error);

    return response.status(500).json({ error });
}

export default errorHandler;

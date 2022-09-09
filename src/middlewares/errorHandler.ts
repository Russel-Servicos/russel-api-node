import { ErrorRequestHandler, NextFunction, Request, Response } from "express";

function errorHandler(
  error: ErrorRequestHandler,
  req: Request,
  response: Response,
  next: NextFunction
) {
  return response.status(500).json({ error });
}

export default errorHandler;

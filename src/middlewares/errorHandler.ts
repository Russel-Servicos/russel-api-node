import { ErrorRequestHandler, NextFunction, Request, Response } from "express";

function errorHandler(
  error: ErrorRequestHandler,
  req: Request,
  response: Response,
  next: NextFunction
) {
  return response.status(500).json({ error: "Houve um erro no servidor" });
}

export default errorHandler;

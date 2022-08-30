import { NextFunction, Request, Response } from "express";

export async function getOrders(
  req: Request,
  res: Response,
  next: NextFunction
) {
  res.status(200).json({ msg: "hello world" });
}

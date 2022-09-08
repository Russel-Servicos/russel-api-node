import { NextFunction, Request, Response } from "express";
import sendOrderEmail from "../lib/sendOrderEmail";

export async function orderCreated(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { code } = req.body.data;
    await sendOrderEmail(parseInt(code), "pagamento");
    res.status(200).json({});
  } catch (error) {
    next(error);
  }
}

export async function orderPaid(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const { code } = req.body.data;
    await sendOrderEmail(parseInt(code), "implantação");
    res.status(200).json({});
  } catch (error) {
    next(error);
  }
}

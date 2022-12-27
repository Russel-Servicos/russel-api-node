import { Request, Response, NextFunction } from "express";
import { changeOrderStatus, sendOrderEmail } from "../lib/orders";
import * as env from "../env";
import { sendSignatureRequestedEmail } from "../lib/orders/";

export async function created(req: Request, res: Response, next: NextFunction) {
    try {
        const { signers, external_id: code } = req.body;
        if (!signers) throw "lista de assinantes ausente";

        const typedSigners: Array<object> = signers as Array<object>;
        const signer = typedSigners.filter((signer: any) => signer.email !== env.emailHugo);

        sendSignatureRequestedEmail(signer[0]);
        sendOrderEmail(parseInt(code), "assinatura");

        res.status(200).json({});
    } catch (error) {
        next(error);
    }
}

export async function docSigned(req: Request, res: Response, next: NextFunction) {
    const { status, external_id: code } = req.body;
    try {
        if (status === "signed") {
            await sendOrderEmail(parseInt(code), "implantação");
            await changeOrderStatus(parseInt(code), "signed");
        }
        res.status(200).json({});
    } catch (error) {
        next(error);
    }
}

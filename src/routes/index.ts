import express, { Request, Response } from "express";
import orders from "./orders";
import docs from "./docs";

const router = express.Router();

router.use("/orders", orders);
router.use("/docs", docs);

export default router;

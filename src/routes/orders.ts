import express from "express";
import { orderCreated, orderPaid } from "../controllers/orders.controller";

const router = express.Router();

router.post("/created", orderCreated);
router.post("/paid", orderPaid);

export default router;

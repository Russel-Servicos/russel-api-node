import express from "express";
import { orderCreated } from "../controllers/orders.controller";

const router = express.Router();

router.post("/created", orderCreated);

export default router;

import express from "express";
import orders from "./orders";
import docs from "./docs";

const router = express.Router();

router.use("/orders", orders);
router.use("/docs", docs);

router.get("/teste", (request, response) => {
response.status(200).send('hello world')})

export default router;

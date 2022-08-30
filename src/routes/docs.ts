import express from "express";
import { created } from "../controllers/docs.controllers";

const router = express.Router();

router.post("/created", created);

export default router;

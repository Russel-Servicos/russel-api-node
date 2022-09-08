import express from "express";
import { created, docSigned } from "../controllers/docs.controllers";

const router = express.Router();

router.post("/created", created);
router.post("/signed", docSigned);

export default router;

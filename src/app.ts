import express, { Request, Response } from "express";
import errorHandler from "./middlewares/errorHandler";
import requestLogMiddleware from "./middlewares/requestLogMiddleware";
import responseLogMiddleware from "./middlewares/responseLogMiddleware";
import router from "./routes";

const app = express();
app.use(express.json());
app.use(requestLogMiddleware);
app.use("/api", router);
app.use(responseLogMiddleware);
app.use(errorHandler);

app.get("/", (req: Request, res: Response) => {
    return res.status(200).json({ message: "testando..." });
});

export default app;

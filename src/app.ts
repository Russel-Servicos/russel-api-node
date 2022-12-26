import express, { Request, Response } from "express";
import errorHandler from "./middlewares/errorHandler";
import router from "./routes";

const app = express();
app.use(express.json());
app.use("/api", router);
app.use(errorHandler);

app.get('/',(req: Request, res: Response)=>{
    return res.status(200).json({message:"testando..."});
});


export default app;

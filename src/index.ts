import app from "./app";
import dotenv from "dotenv";

dotenv.config();

const mode = process.env.MODE;
const port = mode === "dev" ? 5000 : process.env.PORT;

app.listen(port, () => {
  console.log(`listening on ${port}`);
});

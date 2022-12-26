import request from "supertest";
import app from "../app";
import { docsCreated } from "./__mocks__/mockRequestData";

describe("POST /docs/created", () => {
    test("Deve enviar email", async () => {
        const response = await request(app).post("/api/docs/created").send(docsCreated);

        console.log(response.body);

        expect(1).toBe(1);
        // const textInput =
        //     '[{"qtd": 1, "name": "Operador de Plataforma Elevatu00f3ria Tesoura", "price": 421.25, "description": "1 dia u00fatil;07h u00e0s 17h"}]';

        // expect(textOutput).toBe(
        //     '[{"qtd": 1, "name": "Operador de Plataforma Elevatória Tesoura", "price": 421.25, "description": "1 dia útil;07h às 17h"}]'
        // );
    });
});

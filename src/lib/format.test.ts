import { convertUnicode } from "./format";

test("convert unicode characters", () => {
  const textInput =
    '[{"qtd": 1, "name": "Operador de Plataforma Elevatu00f3ria Tesoura", "price": 421.25, "description": "1 dia u00fatil;07h u00e0s 17h"}]';

  const textOutput = convertUnicode(textInput);

  expect(textOutput).toBe(
    '[{"qtd": 1, "name": "Operador de Plataforma Elevatória Tesoura", "price": 421.25, "description": "1 dia útil;07h às 17h"}]'
  );
});

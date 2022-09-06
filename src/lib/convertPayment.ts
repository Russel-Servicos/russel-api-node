export function convertPayment(paymentType: number) {
  switch (paymentType) {
    case 1:
      return "Boleto";
    case 2:
      return "Cartão de Crédito";
    case 5:
      return "PIX";
    case 6:
      return "Faturado";
  }
}

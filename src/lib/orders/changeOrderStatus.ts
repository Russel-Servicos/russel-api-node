import { PrismaClient } from "@prisma/client";

type Status = "pending" | "paid" | "signed" | "canceled";

async function changeOrderStatus(orderID: number, status: Status) {
  const prisma = new PrismaClient();
  await prisma.so_requests.update({
    where: {
      id: orderID,
    },

    data: {
      status,
    },
  });
}

export default changeOrderStatus;

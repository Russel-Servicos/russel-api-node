import { PrismaClient } from "@prisma/client";

async function getOrder(orderID: number) {
  const prisma = new PrismaClient();
  const order = await prisma["so_requests"].findUnique({
    where: {
      id: orderID,
    },

    include: {
      address: true,
      user: true,
    },
  });

  await prisma.$disconnect();
  return order;
}

export default getOrder;

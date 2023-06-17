const getCustomerData = async (req, res) => {
  try {
    const data = await req.context.models.customer.findAll({
      include: [
        {
          model: req.context.models.user,
          as: 'user',
          attributes: ['username', 'password'],
        },
      ],
    });
    return res.send(data);
  } catch (error) {
    return res.send(error);
  }
};

const getCustomerOrder = async (req, res) => {
  try {
    const data = await req.context.models.customer.findAll({
      include: [
        {
          model: req.context.models.user,
          as: 'user',
          attributes: ['id'],
          include: [
            {
              model: req.context.models.orders,
              as: 'orders',
              include: [
                {
                  model: req.context.models.order_detail,
                  as: 'order_details',
                },
              ],
            },
          ],
        },
      ],
    });
    return res.send(data);
  } catch (error) {
    return res.send(error);
  }
};

export default {
  getCustomerData,
  getCustomerOrder,
};

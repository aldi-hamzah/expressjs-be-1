import moment from 'moment-timezone';

const findAll = async (req, res) => {
  try {
    const productCategory = await req.context.models.product_category.findAll({
      include: [
        {
          model: req.context.models.product,
          as: 'products',
        },
      ],
    });
    return res.send(productCategory);
  } catch (error) {
    return res.send(error);
  }
};

const create = async (req, res) => {
  const data = req.body;
  const date = new Date();
  const now = moment(date).tz('Asia/Jakarta').format('YYYY-MM-DD HH:mm:ss');
  try {
    const productCategory = await req.context.models.product_category.create({
      name: data.name,
      description: data.description,
      createdat: now,
      updatedat: now,
    });
    return res.send(productCategory);
  } catch (error) {
    return res.send(error);
  }
};

export default {
  findAll,
  create,
};

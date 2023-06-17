import moment from 'moment-timezone';
import models from '../models/init-models';

const create = async (req, res) => {
  const date = new Date();
  console.log('abc');
  const now = moment(date).tz('Asia/Jakarta').format('YYYY-MM-DD HH:mm:ss');
  try {
    const data = req.body;
    const product = await req.context.models.product.create({
      name: data.name,
      description: data.description,
      category_id: data.category_id,
      price: data.price,
      image: req.file.filename,
      createdat: now,
      updatedat: now,
      quantity: data.quantity,
    });
    return res.send(product);
  } catch (error) {
    return res.send(error);
  }
};

const findAll = async (req, res) => {
  try {
    const product = await req.context.models.product_category.findAll({
      include: [
        {
          model: req.context.models.product,
          as: 'products',
        },
      ],
    });
    return res.send(product);
  } catch (error) {
    return res.send(error);
  }
};

const findOne = async (product_id) => {
  try {
    const product = await models.product.findOne({
      where: { id: product_id },
    });
    return product;
  } catch (error) {
    return error;
  }
};

export default {
  create,
  findAll,
  findOne,
};

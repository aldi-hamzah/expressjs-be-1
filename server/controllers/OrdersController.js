import moment from 'moment-timezone';
import productController from './ProductController';
import { sequelize } from '../models/init-models';
import models from '../models/init-models';

const create = async (req, res) => {
  const data = req.body;
  if (req.session.user_id == undefined) {
    return res.status(401).send({
      message: 'Please login first!',
    });
  } else if (data.product_id == '') {
    return res.status(401).send({
      message: 'Failed! Insert product_id',
    });
  } else if (data.quantity == '') {
    return res.status(401).send({
      message: 'Failed! Firstname is not null',
    });
  }
  const date = new Date();
  const now = moment(date).tz('Asia/Jakarta').format('YYYY-MM-DD HH:mm:ss');

  const t = await sequelize.transaction();

  try {
    let orderData = await findOneOrder(req.session.user_id);

    const productData = await productController.findOne(data.product_id);

    if (orderData == null) {
      orderData = await req.context.models.orders.create({
        user_id: req.session.user_id,
        totalproduct: 0,
        totalprice: 0,
        createdat: now,
        updatedat: now,
      });
      orderData = orderData;
    }

    if (productData == null) {
      return res.send('Product ID Not Found');
    }

    const orderDetailData = await findOneOrderDetail(
      orderData.dataValues.id,
      data.product_id
    );

    if (orderDetailData == null) {
      try {
        const order_detail = await req.context.models.order_detail.create(
          {
            order_id: orderData.dataValues.id,
            product_id: data.product_id,
            quantity: data.quantity,
            createdat: now,
            updatedat: now,
          },
          { transaction: t }
        );

        const order = await req.context.models.orders.update(
          {
            user_id: req.session.user_id,
            totalproduct: parseInt(orderData.dataValues.totalproduct) + 1,
            totalprice:
              parseInt(orderData.dataValues.totalprice) +
              productData.dataValues.price * data.quantity,
            updatedat: now,
          },
          { returning: true, where: { id: orderData.dataValues.id } },
          { transaction: t }
        );

        await req.context.models.product.update(
          {
            quantity: parseInt(productData.dataValues.quantity) - data.quantity,
          },
          { where: { id: productData.dataValues.id } }
        );

        await t.commit();

        return res.send({ order: order, order_detail: order_detail });
      } catch (error) {
        await t.rollback();
        return res.send(error);
      }
    } else {
      try {
        const order_detail = await req.context.models.order_detail.update(
          {
            quantity:
              parseInt(orderDetailData.dataValues.quantity) +
              parseInt(data.quantity),
            updatedat: now,
          },
          { returning: true, where: { id: orderDetailData.dataValues.id } },
          { transaction: t }
        );

        const order = await req.context.models.orders.update(
          {
            totalprice:
              parseInt(orderData.dataValues.totalprice) +
              productData.dataValues.price * data.quantity,
            updatedat: now,
          },
          { returning: true, where: { id: orderData.dataValues.id } },
          { transaction: t }
        );

        await req.context.models.product.update(
          {
            quantity: parseInt(productData.dataValues.quantity) - data.quantity,
          },
          { where: { id: productData.dataValues.id } }
        );

        await t.commit();
        return res.send({ order: order, order_detail: order_detail });
      } catch (error) {
        await t.rollback();
        return res.send(error);
      }
    }
  } catch (error) {
    return res.send(error);
  }
};

const findOneOrder = async (user_id) => {
  const order = await models.orders
    .findOne({
      where: {
        user_id: user_id,
      },
    })
    .catch((err) => {
      return err;
    });
  return order;
};

const findOneOrderDetail = async (order_id, product_id) => {
  const orderDetail = await models.order_detail
    .findOne({
      where: {
        order_id: order_id,
        product_id: product_id,
      },
    })
    .catch((err) => {
      return err;
    });
  return orderDetail;
};

export default {
  create,
};

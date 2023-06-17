import bcrypt from 'bcrypt';
import models from '../models/init-models';
import { sequelize } from '../models/init-models';
import moment from 'moment-timezone';

const createUser = async (req, res) => {
  const data = req.body;
  if (data.username == '') {
    return res.status(401).send({
      message: 'Failed! Username is not null',
    });
  } else if (data.password == '') {
    return res.status(401).send({
      message: 'Failed! Password is not null',
    });
  } else if (data.firstname == '') {
    return res.status(401).send({
      message: 'Failed! Firstname is not null',
    });
  } else if (data.lastname == '') {
    return res.status(401).send({
      message: 'Failed! Lastname is not null',
    });
  }
  const date = new Date();
  const now = moment(date).tz('Asia/Jakarta').format('YYYY-MM-DD HH:mm:ss');
  const salt = await bcrypt.genSalt(10);
  const passHash = await bcrypt.hash(data.password, salt);
  const t = await sequelize.transaction();
  try {
    const user = await req.context.models.user.create(
      {
        username: data.username,
        createdat: now,
        updatedat: now,
        password: passHash,
      },
      { transaction: t }
    );

    const customer = await req.context.models.customer.create(
      {
        firstname: data.firstname,
        lastname: data.lastname,
        user_id: user.id,
        createdat: now,
        updatedat: now,
      },
      { transaction: t }
    );
    const { firstname, lastname } = customer.dataValues;
    const { username, password } = user.dataValues;
    await t.commit();
    return res.send({ firstname, lastname, username, password });
  } catch (error) {
    await t.rollback();
    return res.send(error);
  }
};

const findOneByUsername = async (username) => {
  const user = await models.user
    .findOne({
      where: {
        username: username,
      },
    })
    .catch((err) => {
      return err;
    });
  return user.toJSON();
};

const profile = async (req, res) => {
  if (req.session.username == undefined) {
    return res.send(`Please login first`);
  }
  const username = req.session.username;
  const id = req.session.user_id;
  return res.send(`Welcome ${username} your id is ${id}`);
};

export default {
  createUser,
  findOneByUsername,
  profile,
};

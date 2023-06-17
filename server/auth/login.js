import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import ResponseHelper from '../helpers/ResponseHelper';
import usersController from '../controllers/UsersController';

const userLogin = async (req, res) => {
  let data = req.body;
  await usersController
    .findOneByUsername(data.username)
    .then((items) => {
      if (items.username) {
        if (bcrypt.compareSync(data.password, items.password)) {
          var token = jwt.sign(
            {
              id: items.id,
            },
            process.env.SECRET_KEY,
            {
              expiresIn: '2d',
            }
          );
          const { password, ...user } = items;
          let result = {
            userdata: user,
            accesToken: token,
          };
          req.session.username = items.username;
          req.session.user_id = items.id;
          ResponseHelper.sendResponse(res, 200, result);
          return;
        }
      }
      ResponseHelper.sendResponse(res, 401);
    })
    .catch((err) => {
      res.status(404).json(err);
    });
};

const checkToken = (req, res, next) => {
  if (!req.headers.authorization) {
    return res.status(403).json('You are not authorized');
  }
  let bearer = req.headers.authorization;
  bearer = bearer.split(' ');
  const token = bearer[1];
  try {
    jwt.verify(token, process.env.SECRET_KEY);
    return next();
  } catch (error) {
    return res.status(401).json('Invalid Token');
  }
};

export default {
  userLogin,
  checkToken,
};

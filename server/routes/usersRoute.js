import { Router } from 'express';
import usersController from '../controllers/UsersController';
import auth from '../auth/login';

const route = Router();

route.post('/signup', usersController.createUser);
route.post('/signin', auth.userLogin);
route.get('/profile', usersController.profile);

export default route;

import { Router } from 'express';
import ordersController from '../controllers/OrdersController';
import auth from '../auth/login';

const router = Router();

router.post('/add', auth.checkToken, ordersController.create);

export default router;

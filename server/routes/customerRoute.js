import { Router } from 'express';
import customerController from '../controllers/CustomerController';

const router = Router();

router.get('/all', customerController.getCustomerData);
router.get('/order', customerController.getCustomerOrder);

export default router;

import { Router } from 'express';
import productCategoryController from '../controllers/ProductCategoryController';
import auth from '../auth/login';

const router = Router();

router.get('/all', auth.checkToken, productCategoryController.findAll);
router.post('/add', auth.checkToken, productCategoryController.create);

export default router;

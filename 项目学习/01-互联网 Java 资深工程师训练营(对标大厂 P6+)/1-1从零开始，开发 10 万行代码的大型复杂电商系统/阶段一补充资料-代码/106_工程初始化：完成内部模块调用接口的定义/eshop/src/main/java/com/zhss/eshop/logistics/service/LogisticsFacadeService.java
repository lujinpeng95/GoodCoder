package com.zhss.eshop.logistics.service;

import com.zhss.eshop.goods.dto.GoodsSkuDTO;

/**
 * 物流中心对外提供的接口
 * @author zhonghuashishan
 *
 */
public interface LogisticsFacadeService {

	/**
	 * 计算商品sku的运费
	 * @param goodsSkuDTO 商品sku DTO
	 * @return 商品sku的运费
	 */
	Double calculateFreight(GoodsSkuDTO goodsSkuDTO);
	
}

package com.zhss.eshop.wms.dto;

import java.util.Date;

/**
 * 采购入库单DTO
 * @author zhonghuashishan
 *
 */
public class PurchaseInputOrderDTO {

	/**
	 * id
	 */
	private Long id;
	/**
	 * 供应商id
	 */
	private Long supplierId;
	/**
	 * 预期到达时间
	 */
	private Date expectArrivalTime;
	/**
	 * 实际到达时间
	 */
	private Date arrivalTime;
	/**
	 * 采购联系人
	 */
	private String purchaseContactor;
	/**
	 * 采购联系人电话号码
	 */
	private String purchaseContactPhoneNumber;
	/**
	 * 采购联系人邮箱地址
	 */
	private String purchaseContactEmail;
	/**
	 * 采购入库单备注
	 */
	private String purchaseInputOrderComment;
	/**
	 * 采购员
	 */
	private String purchaser;
	/**
	 * 采购入库单的状态
	 */
	private Integer purcahseInputOrderStatus;
	/**
	 * 采购入库单的创建时间
	 */
	private Date gmtCreate;
	/**
	 * 采购入库单的修改时间
	 */
	private Date gmtModified;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	public Date getExpectArrivalTime() {
		return expectArrivalTime;
	}
	public void setExpectArrivalTime(Date expectArrivalTime) {
		this.expectArrivalTime = expectArrivalTime;
	}
	public Date getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public String getPurchaseContactor() {
		return purchaseContactor;
	}
	public void setPurchaseContactor(String purchaseContactor) {
		this.purchaseContactor = purchaseContactor;
	}
	public String getPurchaseContactPhoneNumber() {
		return purchaseContactPhoneNumber;
	}
	public void setPurchaseContactPhoneNumber(String purchaseContactPhoneNumber) {
		this.purchaseContactPhoneNumber = purchaseContactPhoneNumber;
	}
	public String getPurchaseContactEmail() {
		return purchaseContactEmail;
	}
	public void setPurchaseContactEmail(String purchaseContactEmail) {
		this.purchaseContactEmail = purchaseContactEmail;
	}
	public String getPurchaseInputOrderComment() {
		return purchaseInputOrderComment;
	}
	public void setPurchaseInputOrderComment(String purchaseInputOrderComment) {
		this.purchaseInputOrderComment = purchaseInputOrderComment;
	}
	public String getPurchaser() {
		return purchaser;
	}
	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}
	public Integer getPurcahseInputOrderStatus() {
		return purcahseInputOrderStatus;
	}
	public void setPurcahseInputOrderStatus(Integer purcahseInputOrderStatus) {
		this.purcahseInputOrderStatus = purcahseInputOrderStatus;
	}
	public Date getGmtCreate() {
		return gmtCreate;
	}
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	public Date getGmtModified() {
		return gmtModified;
	}
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	
}

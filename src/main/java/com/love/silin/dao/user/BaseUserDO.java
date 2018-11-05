package com.love.silin.dao.user;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 实体对象
 * @author		byu.peng
 * @create		2018-11-05 11:08:38
 */
public class BaseUserDO implements java.io.Serializable {

	/**
	 * 默认当前类版本号
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	protected Integer id;

	/**
	 * 
	 */
	protected Integer loverId;

	/**
	 * 
	 */
	protected String userName;

	/**
	 * 
	 */
	protected String passWord;

	/**
	 * 
	 */
	protected Date createTime;

	/**
	 * 
	 */
	protected String yn;

	/**
	 * 取得 主键
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * 设置 主键
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 取得 
	 */
	public Integer getLoverId() {
		return loverId;
	}

	/**
	 * 设置 
	 */
	public void setLoverId(Integer loverId) {
		this.loverId = loverId;
	}

	/**
	 * 取得 
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 设置 
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 取得 
	 */
	public String getPassWord() {
		return passWord;
	}

	/**
	 * 设置 
	 */
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	/**
	 * 取得 
	 */
	public Date getCreateTime() {
		return createTime;
	}

	/**
	 * 设置 
	 */
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * 取得 
	 */
	public String getYn() {
		return yn;
	}

	/**
	 * 设置 
	 */
	public void setYn(String yn) {
		this.yn = yn;
	}

}
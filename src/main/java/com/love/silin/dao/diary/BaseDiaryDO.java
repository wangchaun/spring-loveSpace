package com.love.silin.dao.diary;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 实体对象
 * @author		byu.peng
 * @create		2018-11-05 11:08:38
 */
public class BaseDiaryDO implements java.io.Serializable {


	/**
	 * 默认当前类版本号
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	protected Integer id;

	/**
	 * 
	 */
	protected String title;

	/**
	 * 
	 */
	protected Integer userId;

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
	protected String nickName;

	/**
	 * 
	 */
	protected String content;

	/**
	 * 
	 */
	protected String mond;

	/**
	 * 
	 */
	protected String weather;

	/**
	 * 
	 */
	protected String privacy;

	/**
	 * 
	 */
	protected Date createTime;

	/**
	 * 
	 */
	protected String yn;

	/**
	 * 
	 */
	protected Integer starts;

	/**
	 * 取得 
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * 设置 
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 取得 
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * 设置 
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * 取得 
	 */
	public Integer getUserId() {
		return userId;
	}

	/**
	 * 设置 
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
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
	public String getNickName() {
		return nickName;
	}

	/**
	 * 设置 
	 */
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	/**
	 * 取得 
	 */
	public String getContent() {
		return content;
	}

	/**
	 * 设置 
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * 取得 
	 */
	public String getMond() {
		return mond;
	}

	/**
	 * 设置 
	 */
	public void setMond(String mond) {
		this.mond = mond;
	}

	/**
	 * 取得 
	 */
	public String getWeather() {
		return weather;
	}

	/**
	 * 设置 
	 */
	public void setWeather(String weather) {
		this.weather = weather;
	}

	/**
	 * 取得 
	 */
	public String getPrivacy() {
		return privacy;
	}

	/**
	 * 设置 
	 */
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
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

	/**
	 * 取得 
	 */
	public Integer getStarts() {
		return starts;
	}

	/**
	 * 设置 
	 */
	public void setStarts(Integer starts) {
		this.starts = starts;
	}

}
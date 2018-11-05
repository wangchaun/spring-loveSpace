package com.love.silin.dao.user; /**
 * 
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.love.silin.base.MybatisBaseDAOImpl;
import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.stereotype.Repository;


/**
 * 访问接口抽象实现
 * @author		byu.peng
 * @create		2018-11-05 11:08:39
 */
@Repository("userDao")
public class BaseUserDAOImpl implements UserDAO {

	/**
	 * IBatis模板在spring配置文件中的beanId
	 */
	@Resource(name="userMybatisTemplate")
	protected MybatisBaseDAOImpl mybatisTemplete;

	@Override
	public Integer insert(BaseUserDO eo) {
		if(eo.getId()!=null){
			mybatisTemplete.insert("BaseUserDAO.insertHasId", eo);
		}else{
			mybatisTemplete.insert("BaseUserDAO.insert", eo);
		}

        return eo.getId();
	}

	@Override
	public void batchInsert(List<BaseUserDO> eoList, boolean generateKey) {
		if(generateKey){
			mybatisTemplete.insert("BaseUserDAO.batchInsert", eoList);
			
		}else{
			mybatisTemplete.insert("BaseUserDAO.batchInsertHasId", eoList);
			
		}
	}

	@Override
	public int update(BaseUserDO eo) {
		int update = mybatisTemplete.update("BaseUserDAO.update", eo);
		
		if (update == 0) {
			throw new OptimisticLockingFailureException("更新纪录[" + eo + "]时发生乐观锁并发异常");
		}
		
		
		return update;
	}
	
	@Override
	public int updateByField(BaseUserDO oldObj, BaseUserDO newObj) {
        Map<String, BaseUserDO> paramMap = new HashMap<String, BaseUserDO>();
        paramMap.put("condition", oldObj);
        paramMap.put("template", newObj);

		return mybatisTemplete.update("BaseUserDAO.updateByField", paramMap);
	}
	
	@Override
	public void batchUpdate(List<BaseUserDO> eoList) {
		mybatisTemplete.updateBatch("BaseUserDAO.update", eoList);
	}

	@Override
	public int delete(BaseUserDO eo) {
		int delete = mybatisTemplete.delete("BaseUserDAO.delete", eo);
		
		return delete;
	}

	@Override
	public BaseUserDO select(Integer id) {
		return select(id,false);
	}
	
	@Override
	public BaseUserDO selectAndLock(Integer id) {
		return select(id,true);
	}
	
	public BaseUserDO select(Integer id, boolean isLock) {
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("id", id);
		paramMap.put("isLock", isLock);
		return (BaseUserDO) mybatisTemplete.queryForObject("BaseUserDAO.select", paramMap);
	}
	
	
	@Override
	public BaseUserDO selectByEO(BaseUserDO eo) {
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("condition", eo);

		return (BaseUserDO) mybatisTemplete.queryForObject("BaseUserDAO.selectEOByEO", paramMap);
	}
	
	@Override
	public int countByEO(BaseUserDO eo) {
		Integer count = (Integer)mybatisTemplete.queryForObject("BaseUserDAO.countByEO", eo);
		return count!=null?count:0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BaseUserDO> selectListByEO(BaseUserDO eo) {
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("condition", eo);

		return mybatisTemplete.queryForList("BaseUserDAO.selectEOByEO", paramMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseUserDO> selectListByIdList(List<Integer> idList,boolean isLock) {
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("idList", idList);
		paramMap.put("isLock", isLock);
		return mybatisTemplete.queryForList("BaseUserDAO.selectListByIdList", paramMap);
	}

	@Override
	public List<BaseUserDO> selectListByEO(BaseUserDO baseUserDO, int pageNO, int pageSize) {
		return null;
	}

}

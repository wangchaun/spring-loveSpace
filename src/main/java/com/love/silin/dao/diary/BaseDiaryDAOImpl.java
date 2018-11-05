package com.love.silin.dao.diary; /**
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
 * @create		2018-11-05 11:08:38
 */
@Repository("diaryDao")
public class BaseDiaryDAOImpl implements DiaryDAO {

	/**
	 * IBatis模板在spring配置文件中的beanId
	 */
	@Resource(name="userMybatisTemplate")
	protected MybatisBaseDAOImpl mybatisTemplete;

	@Override
	public Integer insert(BaseDiaryDO eo) {
		if(eo.getId()!=null){
			mybatisTemplete.insert("BaseDiaryDAO.insertHasId", eo);
		}else{
			mybatisTemplete.insert("BaseDiaryDAO.insert", eo);
		}

        return eo.getId();
	}

	@Override
	public void batchInsert(List<BaseDiaryDO> eoList, boolean generateKey) {
		if(generateKey){
			mybatisTemplete.insert("BaseDiaryDAO.batchInsert", eoList);
			
		}else{
			mybatisTemplete.insert("BaseDiaryDAO.batchInsertHasId", eoList);
			
		}
	}

	@Override
	public BaseDiaryDO select(Integer id) {
		return null;
	}

	@Override
	public BaseDiaryDO selectAndLock(Integer id) {
		return null;
	}

	@Override
	public int update(BaseDiaryDO eo) {
		int update = mybatisTemplete.update("BaseDiaryDAO.update", eo);
		
		if (update == 0) {
			throw new OptimisticLockingFailureException("更新纪录[" + eo + "]时发生乐观锁并发异常");
		}
		
		
		return update;
	}
	
	@Override
	public int updateByField(BaseDiaryDO oldObj, BaseDiaryDO newObj) {
        Map<String, BaseDiaryDO> paramMap = new HashMap<String, BaseDiaryDO>();
        paramMap.put("condition", oldObj);
        paramMap.put("template", newObj);

		return mybatisTemplete.update("BaseDiaryDAO.updateByField", paramMap);
	}
	
	@Override
	public void batchUpdate(List<BaseDiaryDO> eoList) {
		mybatisTemplete.updateBatch("BaseDiaryDAO.update", eoList);
	}

	@Override
	public int delete(BaseDiaryDO eo) {
		int delete = mybatisTemplete.delete("BaseDiaryDAO.delete", eo);
		
		return delete;
	}


	public BaseDiaryDO select(Integer id, boolean isLock) {
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("id", id);
		paramMap.put("isLock", isLock);
		return (BaseDiaryDO) mybatisTemplete.queryForObject("BaseDiaryDAO.select", paramMap);
	}
	
	
	@Override
	public BaseDiaryDO selectByEO(BaseDiaryDO eo) {
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("condition", eo);

		return (BaseDiaryDO) mybatisTemplete.queryForObject("BaseDiaryDAO.selectEOByEO", paramMap);
	}
	
	@Override
	public int countByEO(BaseDiaryDO eo) {
		Integer count = (Integer)mybatisTemplete.queryForObject("BaseDiaryDAO.countByEO", eo);
		return count!=null?count:0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BaseDiaryDO> selectListByEO(BaseDiaryDO eo) {
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("condition", eo);

		return mybatisTemplete.queryForList("BaseDiaryDAO.selectEOByEO", paramMap);
	}
	
	@SuppressWarnings("unchecked")
	public List<BaseDiaryDO> selectListByIdList(List<Integer> idList,boolean isLock) {
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("idList", idList);
		paramMap.put("isLock", isLock);
		return mybatisTemplete.queryForList("BaseDiaryDAO.selectListByIdList", paramMap);
	}

	@Override
	public List<BaseDiaryDO> selectListByEO(BaseDiaryDO baseDiaryDO, int pageNO, int pageSize) {
		return null;
	}

}

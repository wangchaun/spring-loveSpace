package com.love.silin.base;

import java.util.List;


/**
 * 数据访问对象基础接口
 *
 * @author  noaman
 * @description
 */
public interface BaseDAO<EntityEO, PK> {

    /**
     * 将实体对象持久化；
     *
     * @param eo 被持久化EO
     * @return 实体对象的主键
     */
    PK insert(EntityEO eo);
    
    /**
     * 批量将实体对象持久化；
     * @param list 被持久化EO列表
     * @param generateKey	是否自动生成主键
     */
    void batchInsert(List<EntityEO> eoList, boolean generateKey);

    /**
     * 查询指定主键的持久化对象；
     *
     * @param id 实体对象的主键；
     * @return 查询到的实体对象（查询不到时返回null）
     */
    EntityEO select(PK id);

    /**
     * 查询并锁定记录
     *
     * @param id
     * @return
     */
    EntityEO selectAndLock(PK id);

    /**
     * 根据指定EO的当前信息从数据库查询对应EO对象
     *
     * @param eo 实体对象；
     * @return 查询到的实体对象（查询不到时返回null）
     */
    EntityEO selectByEO(EntityEO eo);

    /**
     * 根据指定EO的当前信息从数据库查询对应EO对象
     *
     * @param eo 实体对象；
     * @return 查询到的实体对象（查询不到时返回null）
     */
    List<EntityEO> selectListByEO(EntityEO eo);

    /**
     * 根据指定ID列表从数据库查询对应EO对象
     *
     * @param ids 主键ID列表
     * @return 是否锁记录
     */
    List<EntityEO> selectListByIdList(List<PK> ids, boolean isLock);

    /**
     * 根据指定EO的当前信息从数据库查询对应EO对象
     *
     * @param eo       实体对象；
     * @param pageNO   页码
     * @param pageSize 每页显示数据条数
     * @return 查询到的实体对象（查询不到时返回null）
     */
    List<EntityEO> selectListByEO(EntityEO eo, int pageNO, int pageSize);

    /**
     * 根据指定EO的当前信息从数据库查询满足条件数据条数
     *
     * @param eo 实体对象；
     * @return 查询到的实体对象（查询不到时返回null）
     */
    int countByEO(EntityEO eo);

    /**
     * 更新持久化对象；
     *
     * @param eo 被更新的实体对象；
     * @return 被更新的实体对象的数量；
     */
    int update(EntityEO eo);

    /**
     * 批量更新持久化对象；
     *
     * @param eoList 被更新的实体对象列表；
     * @return 被更新的实体对象的数量；
     */
    void batchUpdate(List<EntityEO> eoList);

    /**
     * 更新持久化对象；更新指定字段（注：版本号，主键需设置）
     *
     * @param eo 被更新的实体对象；
     * @return 被更新的实体对象的数量；
     */
    int updateByField(EntityEO oldObj, EntityEO newObj);

    /**
     * 删除指定对象
     *
     * @param eo
     * @return
     */
    int delete(EntityEO eo);

}

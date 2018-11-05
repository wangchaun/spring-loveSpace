package com.love.silin.base;

import org.apache.ibatis.executor.BatchResult;
import org.mybatis.spring.SqlSessionTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 功能描述:
 *
 * @auther: mandy.hu
 */
public class MybatisBaseDAOImpl {
    private SqlSessionTemplate sqlSessionTemplate;

    public SqlSessionTemplate getSqlSessionTemplate() {
        return sqlSessionTemplate;
    }

    public Object insert(String statementName, Object parameterObject) {
        return sqlSessionTemplate.insert(statementName, parameterObject);
    }

    public Object insert(String statementName) {
        return sqlSessionTemplate.insert(statementName);
    }

    public int update(String statementName, Object parameterObject) {
        return sqlSessionTemplate.update(statementName, parameterObject);
    }

    public int update(String statementName) {
        return sqlSessionTemplate.update(statementName);
    }

    public <T> void updateBatch(final String statementName, final List<T> objList) {
        for (T object : objList) {
            sqlSessionTemplate.update(statementName, object);
        }

        List<BatchResult> result = sqlSessionTemplate.flushStatements();
    }

    public int delete(String statementName, Object parameterObject) {
        return sqlSessionTemplate.delete(statementName, parameterObject);
    }

    public int delete(String statementName) {
        return sqlSessionTemplate.delete(statementName);
    }


    public <T> List<T> queryForList(String statementName, Object parameterObject) {
        return sqlSessionTemplate.selectList(statementName, parameterObject);
    }

    public <T> List<T> queryForList(String statementName) {
        return sqlSessionTemplate.selectList(statementName);
    }

    public <T> T queryForObject(String statementName, Object parameterObject) {
        return sqlSessionTemplate.selectOne(statementName, parameterObject);
    }

    public <T> T queryForObject(String statementName) {
        return sqlSessionTemplate.selectOne(statementName);
    }

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }
}

package com.microideal.shiro.mapper;

import com.microideal.shiro.model.Authority;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;
import java.util.List;
import java.util.Map;

/**
 * @author microideal on 2018/9/23
 */
@Repository
public interface AuthorityMapper extends Mapper<Authority> {
    List<Authority> queryAll();

    List<Authority> loadUserAuthority(Map<String, Object> map);

    List<Authority> queryRoleAuthorityWithSelectedByRoleId(Long roleId);

    List<Authority> queryListPage(@Param("start") int start, @Param("end") int end);

    int queryListPageCount();

    int queryRoleAuthorityCount(Long id);

    List<Authority> queryByParentId(Long parentId);
}

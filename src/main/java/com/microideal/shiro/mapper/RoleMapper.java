package com.microideal.shiro.mapper;

import com.microideal.shiro.model.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;
import java.util.List;

/**
 * @author microideal on 2018/9/25
 */
@Repository
public interface RoleMapper extends Mapper<Role> {
    List<Role> queryListPage(@Param("start") int start, @Param("end") int end);

    int queryListPageCount();

    Role getById(Long id);

    int update(Role role);

    int queryUserRoleCount(Long id);

    List<Role> queryUserRoleWithSelectedByUserId(Long userId);
}

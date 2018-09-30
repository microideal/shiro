package com.microideal.shiro.sercive;

import com.microideal.shiro.command.AuthorityCmd;
import com.microideal.shiro.dto.DataGridResponseEntity;
import com.microideal.shiro.dto.Msg;
import com.microideal.shiro.model.Authority;
import com.microideal.shiro.queryobject.AuthorityQueryObject;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import java.util.Map;

/**
 * @author microideal on 2018/9/23
 */
public interface AuthorityService {
    List<Authority> queryAll();

    List<Authority> loadUserAuthority(Map<String, Object> map);

    List<Authority> queryRoleAuthorityWithSelectedByRoleId(Long roleId);

    DataGridResponseEntity<Authority> queryListPage(AuthorityQueryObject queryObject);

    Authority getById(Long id);

    void saveOrUpdate(AuthorityCmd cmd, ModelAndView modelAndView);

    Msg deleteById(Long id);

    List<Authority> queryLeftMenuByUserId(Long userId);
}

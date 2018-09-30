/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2014-2016 abel533@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package com.microideal.shiro.sercive;
import com.microideal.shiro.mapper.AdminMapper;
import com.microideal.shiro.model.Admin;
import com.microideal.shiro.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import java.sql.Timestamp;
import java.util.List;

@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public Admin getByUsername(String username) {

        Admin entity = new Admin();
        entity.setUsername(username);
        return adminMapper.selectOne(entity);
    }

    public Admin getById(Long id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    public void save(Admin entity) {
        if (entity.getId() != null) {

            entity.setLastLoginTime(new Timestamp(System.currentTimeMillis()));
            adminMapper.updateByPrimaryKey(entity);
        } else {
            entity.setCreateTime(new Timestamp(System.currentTimeMillis()));
            entity.setLastLoginTime(new Timestamp(System.currentTimeMillis()));
            entity.setLastUpdateTime(new Timestamp(System.currentTimeMillis()));
            adminMapper.insert(entity);
        }
    }

    public int saveOrupdate (Admin entity){

        if(!StringUtils.isEmpty(entity.getPassword())){

            entity.setPassword(entity.getPassword());
        }

        if(null != entity && null != entity.getId() && entity.getId() > 0){

            entity.setLastUpdateTime(new Timestamp(System.currentTimeMillis()));
            return adminMapper.updateByPrimaryKeySelective(entity);
        }else{

            entity.setStatus(1);
            entity.setCreateTime(new Timestamp(System.currentTimeMillis()));
            entity.setLastLoginTime(new Timestamp(System.currentTimeMillis()));
            entity.setLastUpdateTime(new Timestamp(System.currentTimeMillis()));
            return adminMapper.insert(entity);
        }
    }

    public void delete(long id){

        adminMapper.deleteByPrimaryKey(id);
    }

    public List<Admin> selectListPage(Admin entity, int start, int end) {

        return adminMapper.selectListPage(entity,start,end);
    }

    public int selectListPageCount (Admin entity){

        return adminMapper.selectListPageCount(entity);
    }
}

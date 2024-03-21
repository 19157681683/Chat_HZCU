package com.springboot.c2_service.admin.c3_chat.impl;

import com.springboot.c2_service.admin.c3_chat.AdminChatService;
import com.springboot.c3_dao.AdminChatMapper;
import com.springboot.c3_dao.AdminChatRelationMapper;
import com.springboot.c4_domain.entity.AdminChat;
import com.springboot.c4_domain.entity.AdminChatRelation;
import com.springboot.c4_domain.entity.AdminChatRelationExample;
import com.springboot.c4_domain.result.CommonResults;
import com.springboot.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * @author = 李林名
 * @email = lishuai1199@qq.com
 * @create_time = 2024/3/10 3:46
 * @Description:
 */

@Service
public class AdminChatServiceImpl implements AdminChatService {

    @Autowired
    private AdminChatRelationMapper adminChatRelationMapper;

    @Autowired
    private AdminChatMapper adminChatMapper;

    @Override
    public CommonResults findAdminChats(int adminId, int pageNumber, int pageSize) {
        List<AdminChat> adminChatList = new LinkedList<>();
        AdminChatRelationExample adminChatRelationExample = new AdminChatRelationExample();
        adminChatRelationExample.createCriteria().andAdminIdEqualTo(adminId);
        // 按照时间倒序
        adminChatRelationExample.setOrderByClause("admin_chat_relation_id DESC");
        // 在管理员-聊天记录表中，根据管理员ID获取聊天记录ID
        List<AdminChatRelation> adminChatRelations = adminChatRelationMapper.selectByExample(adminChatRelationExample);
        // 在聊天记录表中，根据聊天记录ID获取聊天记录
        if(adminChatRelations!=null){
            for (int i = 0; i < adminChatRelations.size(); i++) {
                AdminChatRelation adminChatRelation = adminChatRelations.get(i);
                AdminChat adminChat = adminChatMapper.selectByPrimaryKey(adminChatRelation.getAdminChatId());
                adminChatList.add(adminChat);
            }
        }
        // 获取对应的分页记录
        adminChatList = PageUtil.getPageData(adminChatList, pageNumber, pageSize);
        return new CommonResults(200, "查询成功", adminChatList);
    }

    @Override
    public CommonResults findAdminChat(int adminChatId) {
        AdminChat adminChat = adminChatMapper.selectByPrimaryKey(adminChatId);
        if(adminChat == null){
            return new CommonResults(200, "查询失败","查询管理员聊天记录失败");
        }
        return new CommonResults(200, "查询成功",adminChat);
    }

    @Override
    public CommonResults addAdminChat(int adminId, String content) {
        // 在管理员的聊天记录表中，插入新聊天记录，获取自增的ID。失败返回 “聊天记录表插入失败”
        AdminChat adminChat = new AdminChat();
        adminChat.setContent(content);
        adminChat.setTime(new Date());
        int rows = adminChatMapper.insert(adminChat);         //insert()返回自增的ID，insertSelective()返回影响的行数
        Integer adminChatId = adminChat.getAdminChatId();
        if(rows == 0){
            return new CommonResults(200, "添加失败","插入聊天记录失败");
        } else{
            // 在管理员-聊天记录表中，插入含聊天记录ID，管理员ID的记录。失败返回 “管理员-聊天记录表插入失败”，成功返回“管理员-聊天记录添加成功”
            AdminChatRelation adminChatRelation = new AdminChatRelation(adminId, adminChatId);
            rows = adminChatRelationMapper.insertSelective(adminChatRelation);

            if(rows == 0){
                return new CommonResults(200,"添加失败","插入管理员-聊天记录失败");
            }else {
                return new CommonResults(200,"添加成功","插入管理员-聊天记录成功");
            }
        }
    }

    @Override
    public CommonResults updateAdminChat(int adminChatId, String content) {
        //1. SQL：根据聊天ID，获取聊天记录。失败返回 “聊天记录不存在”
        AdminChat adminChat = adminChatMapper.selectByPrimaryKey(adminChatId);
        if(adminChat == null){
            return new CommonResults(200,"更新失败","聊天记录不存在");
        }
        else{
            //2. SQL：在管理员的聊天记录表中，更新聊天记录。失败返回 “管理员的聊天记录更新失败“，成功返回 ”管理员的聊天记录更新成功“
            adminChat.setContent(content);
            int rows = adminChatMapper.updateByPrimaryKeySelective(adminChat);
            if(rows == 0){
                return new CommonResults(200,"更新失败","管理员的聊天记录更新失败");
            }else{
                return new CommonResults(200,"更新成功","管理员的聊天记录更新成功");
            }
        }
    }
}



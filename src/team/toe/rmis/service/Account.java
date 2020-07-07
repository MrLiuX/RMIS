package team.toe.rmis.service;

import java.util.LinkedHashMap;
/*
* 对账户的增删改查操作
* */

public class Account {
    public void addPerson(String account,String password,String name,String level)
            //添加账户
    {
        team.toe.rmis.dao.Account.addAccount(account,password,name,level);
    }

    public void deletedPerson(String account)//删除账户
    {
        team.toe.rmis.dao.Account.deletedAccount(account);
    }

    public LinkedHashMap<String,String> getPerson(String account)
            //通过账号查找账户
    {
        return team.toe.rmis.dao.Account.selectAccountOfAccount(account);
    }

    public boolean isExist(String account)
            //判断账户是否存在
    {
        LinkedHashMap<String,String> person=getPerson(account);
        return !person.get("账号").equals("账号不存在");
    }

    public boolean matching(String account,String password)
            //判断账号密码是否匹配
    {
        LinkedHashMap<String,String> personnel;
        personnel = getPerson(account);
        return password.equals(personnel.get("密码"));
    }

    public boolean isAdmin(String account)
    {
        LinkedHashMap<String,String> personnel=getPerson(account);
        return personnel.get("账户等级").equals("管理员");
    }
}

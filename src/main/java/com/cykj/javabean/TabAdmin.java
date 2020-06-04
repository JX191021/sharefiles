package com.cykj.javabean;


import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Value;

public class TabAdmin {

  private String adminId;
  private String account;
  private String password;
  private String adminName;
  private int roleId;
  private TabRole tabRole;

  public TabAdmin(String password, String adminName) {
    this.password = password;
    this.adminName = adminName;
  }

  @Override
  public String toString() {
    return JSON.toJSONString(this);
  }

  public TabAdmin() {
  }


  public String getAdminId() {
    return adminId;
  }

  public void setAdminId(String adminId) {
    this.adminId = adminId;
  }


  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getAdminName() {
    return adminName;
  }

  public void setAdminName(String adminName) {
    this.adminName = adminName;
  }


  public int getRoleId() {
    return roleId;
  }

  public void setRoleId(int roleId) {
    this.roleId = roleId;
  }

  public TabRole getTabRole() {
    return tabRole;
  }

  public void setTabRole(TabRole tabRole) {
    this.tabRole = tabRole;
  }
}

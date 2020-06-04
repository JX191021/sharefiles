package com.cykj.javabean;


import java.util.List;

public class TabRole {

  private int roleId;
  private String roleName;

  private List<TabMenu> menuList;
  private List<String> list;

  public List<String> getList() {
    return list;
  }

  public void setList(List<String> list) {
    this.list = list;
  }

  public List<TabMenu> getMenuList() {
    return menuList;
  }

  public void setMenuList(List<TabMenu> menuList) {
    this.menuList = menuList;
  }

  public int getRoleId() {
    return roleId;
  }

  public void setRoleId(int roleId) {
    this.roleId = roleId;
  }


  public String getRoleName() {
    return roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }

  @Override
  public String toString() {
    return "TabRole{" +
            "roleId=" + roleId +
            ", roleName='" + roleName + '\'' +
            ", menuList=" + menuList +
            '}';
  }
}

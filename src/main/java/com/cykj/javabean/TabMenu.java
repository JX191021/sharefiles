package com.cykj.javabean;


import java.util.List;

public class TabMenu {

  private int menuId;
  private String title;
  private int upId;
  private String menuName;
  private String menuPath;
  private List<TabMenu> children;

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public List<TabMenu> getChildren() {
    return children;
  }

  public void setChildren(List<TabMenu> children) {
    this.children = children;
  }

  public int getMenuId() {
    return menuId;
  }

  public void setMenuId(int menuId) {
    this.menuId = menuId;
  }


  public int getUpId() {
    return upId;
  }

  public void setUpId(int upId) {
    this.upId = upId;
  }


  public String getMenuName() {
    return menuName;
  }

  public void setMenuName(String menuName) {
    this.menuName = menuName;
  }


  public String getMenuPath() {
    return menuPath;
  }

  public void setMenuPath(String menuPath) {
    this.menuPath = menuPath;
  }

  @Override
  public String toString() {
    return "TabMenu{" +
            "menuId=" + menuId +
            ", title='" + title + '\'' +
            ", upId=" + upId +
            ", menuName='" + menuName + '\'' +
            ", menuPath='" + menuPath + '\'' +
            ", children=" + children +
            '}';
  }
}

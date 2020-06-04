package com.cykj.mapper;

import com.cykj.javabean.TabMenu;
import com.cykj.javabean.TabRole;

import java.util.List;

public interface RoleMapper {
    public TabRole queryFirstMenuByRole(int roleId);

    public List<TabMenu> querySecMenuByRole(List<TabMenu> list);

    public List<TabMenu> queryFirstMenu(int roleId);

    public List<TabMenu> querySecMenu(List<TabMenu> list);
}

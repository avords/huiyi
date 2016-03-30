package com.mvc.portal.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.tree.DefaultMutableTreeNode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.framework.FrameworkConstants;
import com.mvc.portal.model.Theme;
import com.mvc.portal.service.HomeManager;
import com.mvc.portal.service.MenuImageManager;
import com.mvc.portal.service.ThemeManager;
import com.mvc.security.SecurityConstants;
import com.mvc.security.model.Menu;

@Controller
@RequestMapping("/")
public class PortalController {

    private static final String PORTAL_DIR = "portal/";

    @Autowired
    private MenuImageManager menuImageManager;
    @Autowired
    private ThemeManager themeManager;
    @Autowired
    private HomeManager homeManager;

    @RequestMapping(value = "decorator")
    public String decorator(HttpServletRequest request) throws Exception {
        //设置1级菜单
        setFirstLevelMenu(request);
        Object currentModuleId = request.getSession().getAttribute("currentModuleId");
        HttpSession session = request.getSession();
        List<Menu> all = (List<Menu>) request.getSession().getAttribute(SecurityConstants.MENU_PERMISSION);
        List<Menu> tops =  MenuUtils.getFirstLevelMenu(all);
        request.setAttribute("currentModuleId", currentModuleId);
        request.setAttribute("tops", tops);

        //设置2，3级菜单
        setSideMenu(request);

        return PORTAL_DIR + "decorator";
    }

    @RequestMapping(value = "admin/index")
    public String index(HttpServletRequest request) throws Exception {
        //		BaseConfig baseConfig =  baseConfigManager.isExist();
        //		if (baseConfig!=null) {
        //			request.setAttribute("systemName",baseConfig.getSystemName());
        //		}
        request.getSession().setAttribute("currentModuleId", -1L);
        //		 request.setAttribute("chartDatas2",homeManager.getLastWeekLoginData());
        //		 return "redirect:widget";

        Long userId =  (Long) request.getSession().getAttribute(SecurityConstants.USER_ID);
        request.setAttribute("userId", userId);
        return PORTAL_DIR + "index";
    }

    @RequestMapping(value = "main/{moduleId}")
    public String module(HttpServletRequest request, @PathVariable Long moduleId) throws Exception {
        request.getSession().setAttribute("currentModuleId", moduleId);
        return PORTAL_DIR + "sideMenu";
    }

    /**
     * 设置2，3级菜单
     * @param request
     */
    private void setSideMenu(HttpServletRequest request){
        HttpSession session = request.getSession();

        if(null != session.getAttribute("currentModuleId")) {
            Long moduleId =(Long)session.getAttribute("currentModuleId");
            List<Menu> allPermissionMenus = (List<Menu>) request.getSession().getAttribute(SecurityConstants.MENU_PERMISSION);
            DefaultMutableTreeNode treeNode = MenuUtils.getMenuTree(moduleId,moduleId, allPermissionMenus);
            StringBuilder treeHtml = new StringBuilder(500);
            //根据传入的1级菜单ID遍历获取所有的子类的菜单(包括2，3，4。。。。级)
            MenuUtils.generateTreeHtml(treeNode, treeHtml, null);
            request.setAttribute("treeHtml", treeHtml.toString());
        }

    }


    private void setFirstLevelMenu(HttpServletRequest request) {
        List<Menu> allPermissionMenus = (List<Menu>) request.getSession().getAttribute(
                SecurityConstants.MENU_PERMISSION);
        List<Menu> menus = MenuUtils.getFirstLevelMenu(allPermissionMenus);
        HttpSession session = request.getSession();
        session.setAttribute("menus", menus);
    }

    @RequestMapping(value = "wait/{menuId}")
    public String wait(HttpServletRequest request, @PathVariable Integer menuId) throws Exception {
        if (null != menuId) {
            List<Menu> allPermissionMenus = (List<Menu>) request.getSession().getAttribute(
                    SecurityConstants.MENU_PERMISSION);
            Menu menu = getMenuByMenuId(allPermissionMenus, menuId);
            String forwardUrl = null;
            Menu top = MenuUtils.getTop(allPermissionMenus, menu);
            if (menu.getType() == Menu.TYPE_FOLDER) {
                forwardUrl = "../main/" + top.getObjectId();
                request.getSession().removeAttribute("currentMenuId");
            } else {
                forwardUrl = menu.getUrl();
                request.getSession().setAttribute("currentMenuId", menuId);
            }
            request.getSession().setAttribute("currentModuleId", top.getObjectId());

            return "redirect:" + forwardUrl;
        }

        return PORTAL_DIR + "wait";
    }

    @RequestMapping("selectIcon")
    public String selectIcon(){
        return PORTAL_DIR + "selectIcon";
    }

    private Menu getMenuByMenuId(List<Menu> allPermissionMenus, long menuId) {
        for (Menu menu : allPermissionMenus) {
            if (menuId == menu.getObjectId()) {
                return menu;
            }
        }
        return null;
    }

    protected List<Menu> getMenusByModelName(List<Menu> allPermissionMenu, String modelName) {
        if (null == allPermissionMenu) {
            return new ArrayList<Menu>(0);
        }
        List<Menu> result = new ArrayList<Menu>();
        for (Menu menu : allPermissionMenu) {
            if (menu.getPath().startsWith(Menu.ROOT_CONTEXT + modelName)) {
                result.add(menu);
            }
        }
        return result;
    }

    @RequestMapping(value = "changeSkin/{color}")
    public String changeSkin(HttpServletRequest request, HttpServletResponse response, @PathVariable String color)
            throws Exception {
        if (color != null) {
            if ("d".equals(color) || "e".equals(color) || "f".equals(color) || "g".equals(color)) {
                HttpSession session = request.getSession();
                Theme theme = new Theme();
                theme.setSkin(color);
                theme.setUserId((Long) session.getAttribute(SecurityConstants.USER_ID));
                themeManager.updateUserSkin(theme);
                session.setAttribute(FrameworkConstants.SKIN, color);
            }
        }
        return "redirect:../main";
    }

    @RequestMapping(value = "common/location/{menuId}")
    public String location(HttpServletRequest request, @PathVariable Long menuId, ModelMap modelMap) {
        List<Menu> allPermissionMenus = (List<Menu>) request.getSession().getAttribute(
                SecurityConstants.MENU_PERMISSION);
        List<Menu> tree = new ArrayList<Menu>();
        Menu leaf = getMenuByMenuId(allPermissionMenus, menuId);
        MenuUtils.getParent(allPermissionMenus, leaf, tree);
        tree.add(leaf);
        StringBuilder location = new StringBuilder(tree.size() * 6);
        for (Menu menu : tree) {
            location.append(" ").append(menu.getName()).append(" >> ");
        }
        modelMap.addAttribute("location", location.toString());
        return "";
    }

}

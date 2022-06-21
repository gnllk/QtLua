#include <stdio.h>
#include <stdlib.h>

extern "C" {
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
}

#define UNUSED(x) (void)x;

int main(int argc, char *argv[])
{
    UNUSED(argc)
    UNUSED(argv)

    // 不知何种原因，通过Qt运行方式无法调用lua脚本，因去输出目录双击运行
    printf("Lua demo.\r\n");

    lua_State *lua = luaL_newstate();
    luaL_openlibs(lua);

    int ret = luaL_dofile(lua, "demo.lua");
    if(ret == LUA_OK){
        printf("Read lua script successfully.\r\n");
    }else if(ret == LUA_ERRFILE){
        printf("Read lua script failed.\r\n");
    }else if(ret == LUA_ERRMEM){
        printf("Run lua failed with memory error.\r\n");
    }else if(ret == LUA_ERRRUN){
        printf("Run lua script failed.\r\n");
    }else if(ret == LUA_ERRSYNTAX){
        printf("Run lua script failed with syntax error.\r\n");
    }else{
        printf("Read lua script failed with system error.\r\n");
    }

    lua_getglobal(lua, "name");
    const char * name = lua_tostring(lua, -1);
    printf("The input name is:%s\r\n", name);

    lua_close(lua);

    printf("Press any key to exit\r\n");
    char c[100];
    scanf("%s", c);

    return 0;
}

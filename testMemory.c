#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

// 全局变量
int a; //  全局变量在没有初始化时，会自动被初始化成0

void foo(void);

int main(void)
{
    static int b; // 静态变量也是在全局数据段中存放，也会被自动初始化成0
    int c;
    printf("a >>> %d %p\n", a, &a);
    printf("b >>> %d %p\n", b, &b);
    printf("c >>> %d %p\n", c, &c);

    foo();

    printf("do something.......\n");

    foo();
    foo();
    foo();
    foo();

    // 文字常量
    // "abcd"作为一个文字常量要放在全局区的文字常量区，但是p作为局部变量，它本身的空间是栈中分配的
    char *p = "abcd";

    printf("p >>>>> %p\n", p);
    printf("p >>>>> %p\n", &p);
    
    // 字符数组跟字符串常量的存储方式不一样，它的空间直接在栈中分配，并且直接在栈中存储字符串的每个字符
    char arr[10] = {'a','b','c','d'};
    // arr1作为局部的数组，地址还需要在栈中分配，它的内容是从文字常量"abcd"拷贝过来的，所以并影响"abcd"作为文字常量在全局区的存放
    char arr1[10] = "abcd";
    printf("arr1 >>> %p\n", arr1);
    printf("abcd >>> %p\n", "abcd");
    
    // 手动分配内存，是在堆区分配的，需要手动释放
    char *str = malloc(10);
    strcpy(str, "abcd");
    printf("str >>>> %s %p\n", str, str);
    free(str);

    return 0;
}

void foo(void)
{
    static int d;
    int e;
    printf("d >>> %d %p\n", d, &d);
    printf("e >>> %d %p\n", e, &e);
    d++;
    e++;
}

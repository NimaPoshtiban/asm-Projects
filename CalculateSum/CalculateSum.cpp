#include <stdio.h>

extern "C" int AdderASM(int a, int b, int c);

int AdderCPP(int a, int b, int c);

int main()
{
    int a{ 13 }, b{ 32 }, c{ 21 };
    int sum = AdderASM(a, b, c);

    printf("a: %d\n", a);
    printf("b: %d\n", b);
    printf("c: %d\n", c);


    printf("Sum = %d",sum);
}

int AdderCPP(int a, int b, int c)
{
    return a + b + c;
}

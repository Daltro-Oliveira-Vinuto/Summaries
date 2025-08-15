// Copyright 2025 Daltro Oliveira Vinuto daltroov777@gmail.com
#include <stdio.h>

void print_hello(int, int);

int main(int argc, char *argv[], char *envp[]) {
    int a, b;
    int c;
    a = 5;
    b = 7;
    c = &a;

    print_hello(a, b);

    return 0;
}

void print_hello(int a, int b) {
    char *hello = "hello world";

    printf("%s a=%d b=%d\n", hello, a, b);
}

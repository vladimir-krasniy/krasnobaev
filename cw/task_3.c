#include <stdio.h>
#include <string.h>

int main () {

        int a, b;
        char oper;
        scanf("%d %d %c", &a, &b, &oper);

        switch (oper) {
                case '+':
                printf("%d\n", extern_add(a, b));
                return 0;

                case '-':
                printf("%d\n", extern_sub(a, b));
                return 0;

                case '/':
                printf("%d\n", extern_div(a, b));
                return 0;

                case '*':
                printf("%d\n", extern_mul(a, b));
                return 0;

                case 'i':
                printf("%d\n", extern_inc(a));
                return 0;

                case 'd':
                printf("%d\n", extern_dec(a));
                return 0;
        }

return 0;
}
~                                                                      
~         

#include <stdio.h>
#include "greeting.h"

char prefix[128] = {0};

static void show_prefix(){

    printf("%s", prefix);

}

void say_good_evening(){

    show_prefix();

    printf("Good evening\n");

}

void say_good_morning(){

    printf("Good morning!!!!!!!!!\n");

}

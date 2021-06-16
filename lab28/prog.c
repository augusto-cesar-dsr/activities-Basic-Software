#include <string.h>
#include <greeting.h>

int main(){

    say_good_morning();

    

    strcpy(prefix, "*** ");

    say_good_evening();



    strcpy(prefix, "[INFO] ");

    say_good_evening();



    return 0;

}
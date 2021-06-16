char str[] = "BEBAMUITOCAFE";

// a-A  = 97 - 65 = 32

void process(){

    char *ptr = str;

    while (*ptr) {

        *ptr = *ptr + 32;
        ptr++;

    }

}
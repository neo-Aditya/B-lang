/**
* Prints the string given
* @params s the string to be printed
 */
print(s) {
    extrn putchar;
    auto i, c;
    i = 0;
    while ((c = char(s, i)) != '*e') {
        putchar(c);
        i++;
    }
}

strlen(s)
{
    auto i;
    i = 0;
    while(char(s, i) != '*e')
    {
        i++;
    }
    return(i);
}

longToString(long) {
    auto arr, i, output;
    arr = malloc(8);
    output = malloc(8);
    if (long == 0) lchar(output, 0, 48);
    else {
        i = 0;
        while (long != 0) {
            lchar(arr, i, 48 + long % 10);
            i++;
            long = long / 10;
        }
        while (i >= 0) {
            lchar(output, i, char((strlen - i - 1)))
        }
    }
    free(arr);
    return output;
}

toString(s, x1) {
    extrn putchar;
    auto ptr;
    ptr = &x1;
    while(1)
    {
        /* do something. */

        /* next arg */
        ptr+=8;
    }
}
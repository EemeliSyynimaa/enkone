#include <stdio.h>
#include "test.h"

int main(int argc, char** argv)
{
    // Not used.
    (void)argc;
    (void)argv;

    printf("Hello world: %d!\n", getNumber());
	
	return 0;
}
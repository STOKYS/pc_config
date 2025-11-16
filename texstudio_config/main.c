/*
    THIS DOES NOTHING YET
*/


#include <stdio.h>
#include <stdlib.h>

#define CURRENT_CONF_FILE "texstudio.ini"
#define NEW_CONF_FILE "texstudio_profile.txsprofile"

int main () {

    printf("starting script\n");

    FILE *current;
    current = fopen(CURRENT_CONF_FILE, "r");
    if (current == NULL) {
        fprintf(stderr,"ERROR! Could not open template config file %s\n", CURRENT_CONF_FILE);
        EXIT_FAILURE;
    }

    FILE *changes;
    changes = fopen(NEW_CONF_FILE, "r");
    if (changes == NULL) {
        fprintf(stderr, "ERROR! Could not open new config file %s\n", NEW_CONF_FILE);
        EXIT_FAILURE;
    }

    // char current[]

    if (fclose(current) == EOF) {
        fprintf(stderr, "ERROR! There was a problem closing the file %s\n", CURRENT_CONF_FILE);
        EXIT_FAILURE;
    }

    if (fclose(changes) == EOF){
        fprintf(stderr, "ERROR! There was a problem closing the file %s\n", NEW_CONF_FILE);
        EXIT_FAILURE;
    }


}
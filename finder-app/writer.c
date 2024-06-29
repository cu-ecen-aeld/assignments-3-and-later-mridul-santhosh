#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    char *writefile, *writestr;
    FILE *fp;

    if (argc != 3) {
        fprintf(stderr, "Error: 2 args are required\n");
        syslog(LOG_ERR, "Error: 2 args are required");
        return 1;
    }

    writefile = argv[1];
    writestr = argv[2];


    fp = fopen(writefile, "w");
    if (fp == NULL) {
        perror("Error: could not create file");
        syslog(LOG_ERR, "Error: could not create file %s", writefile);
        return 1;
    }

    if (fprintf(fp, "%s\n", writestr) < 0) {
        fprintf(stderr, "Error: could not write to file\n");
        syslog(LOG_ERR, "Error: could not write to file %s", writefile);
        fclose(fp);
        return 1;
    }

    fclose(fp);
    printf("File %s created successfully with content: %s\n", writefile, writestr);

    syslog(LOG_DEBUG, "Writing \"%s\" to %s", writestr, writefile);

    closelog();

    return 0;
}


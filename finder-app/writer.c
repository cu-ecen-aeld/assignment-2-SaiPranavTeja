#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char *argv[]) {
    openlog("writer", LOG_PID|LOG_CONS, LOG_USER);

    // Check if arguments are provided
    if (argc != 3) {
        syslog(LOG_ERR, "Usage: %s <writefile> <writestr>", argv[0]);
        closelog();
        exit(1);
    }

    // Extract arguments
    char *writefile = argv[1];
    char *writestr = argv[2];

    // Create or overwrite the file
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error opening file: %s", writefile);
        closelog();
        exit(1);
    }

    // Write string to file
    fprintf(file, "%s\n", writestr);
    fclose(file);

    // Log the action with syslog
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    closelog();
    return 0;
}

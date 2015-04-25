#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>


void backoff(char *command) {
  int delay = 1;
  int tries = 5;
  while (tries--) {
    int result = system(command);
    if (result == 0) {
      break;
    }
    if (tries) {
      sleep(delay);
      printf("`%s` failed with exit code %d, waiting %d seconds...\n",
             command,
             result,
             delay);
      delay *= 2;
    }
  }
}

char *args_to_command(char* strings[], int count) {
  char* str = NULL;
  size_t total_length = 0;
  int i = 0;
  int start = 1;

  /* Find total length of joined strings */
  for (i = start; i < count; i++) {
    total_length += strlen(strings[i]);
  }
  total_length++;              // For terminator
  total_length += (count - 1); // for separators

  str = (char*) malloc(total_length);  /* Allocate memory for joined strings */
  str[0] = '\0';                      /* Empty string we can append to      */

  /* Append all the strings */
  for (i = start; i < count; i++) {
    strcat(str, strings[i]);
    if (i < (count - 1)) {
      strcat(str, " ");
    }
  }

  return str;
}


int main(int argc, char **argv) {
  char *command = args_to_command(argv, argc);
  printf("Trying `%s`...\n", command);
  backoff(command);
}

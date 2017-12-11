#include "main.h"

int main(int argc, char const *argv[]) {
  /* accept command line arguments and setup default values, see "cli.c" */
  initialize_cli(argc, argv);

  /* initialize HTTP service, see "http_service.h" */
  initialize_http_service();

  /* avoid database oriented optimizations - benchmark specific, can be removed.
   */
  if (!fio_cli_get_str("t"))
    fio_cli_set_int("t", 1);

  /* start facil */
  facil_run(.threads = fio_cli_get_int("t"), .processes = fio_cli_get_int("w"));

  /* cleanup CLI, see "cli.c" */
  free_cli();
  return 0;
}

#include <sys/time.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include <chunk.h>

#include "input.h"
#include "input-stream.h"
//#include "dbg.h"

struct input_desc {
    struct input_stream *s;
    int id;
    int interframe;
    uint64_t start_time;
    uint64_t first_ts;
};

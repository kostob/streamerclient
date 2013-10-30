#ifndef INPUT_STREAM_H
#define INPUT_STREAM_H

struct input_stream;

struct input_stream *input_stream_open(const char *fname, int *period);
void input_stream_close(struct input_stream *dummy);

#endif	/* INPUT_STREAM_H */

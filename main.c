/* 
 * File:   main.c
 * Author: tobias
 *
 * Created on 11. Oktober 2013, 11:11
 */
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <net_helper.h> // from GRAPES
#include <topmanager.h>
#include "net_helpers.h"

//#include "GRAPES/som/net_helper.h"

static const char *my_iface = "eth0";
static int port = 6666;
static int srv_port;
static const char *srv_ip = "";
static int period = 500;
static int chunks_per_second = 4;
static int multiply = 1;
static int buff_size = 8;
static const char *net_helper_config = "";
static const char *topo_config = "";

static void cmdline_parse(int argc, char *argv[]) {
    int o;

    while ((o = getopt(argc, argv, "b:c:t:p:i:P:I:f:m:")) != -1) {
        switch (o) {
            case 'b':
                buff_size = atoi(optarg);
                break;
            case 'c':
                chunks_per_second = atoi(optarg);
                break;
            case 'm':
                multiply = atoi(optarg);
                break;
            case 't':
                period = atoi(optarg);
                break;
            case 'p':
                // This is the port of the source.
                srv_port = atoi(optarg);
                break;
            case 'i':
                // This is the IP of the source.
                srv_ip = strdup(optarg);
                break;
            case 'P':
                // This is the local port used by the client. Default is 6666.
                // If testing multiple clients on the same machine, every client
                // has to use a diffenrent port number.
                port = atoi(optarg);
                break;
            case 'I':
                my_iface = strdup(optarg);
                break;
            default:
                fprintf(stderr, "Error: unknown option %c\n", o);

                exit(-1);
        }
    }
}

static struct nodeID *init(void) {
    struct nodeID *myID;
    char *my_addr = iface_addr(my_iface);

    if (my_addr == NULL) {
        fprintf(stderr, "Cannot find network interface %s\n", my_iface);

        return NULL;
    }

    myID = net_helper_init(my_addr, port, net_helper_config); // TODO: check if config is needed
    if (myID == NULL) {
        fprintf(stderr, "Error creating my socket (%s:%d)!\n", my_addr, port);
        free(my_addr);

        return NULL;
    }
    free(my_addr);
    topInit(myID, NULL, 0, "");

    return myID;
}

/*
 * main
 */
int main(int argc, char** argv) {
    struct nodeID *my_sock;

    cmdline_parse(argc, argv);

    my_sock = init();
    if (my_sock == NULL) {
        return -1;
    }
    if (srv_port != 0) {
        struct nodeID *srv;

        srv = create_node(srv_ip, srv_port);
        if (srv == NULL) {
            fprintf(stderr, "Cannot resolve remote address %s:%d\n", srv_ip, srv_port);

            return -1;
        }
        topAddNeighbour(srv, NULL, 0);

        loop(my_sock, 1000000 / chunks_per_second, buff_size);

    } else {
        fprintf(stderr, "Cannot resolve remote address %s:%d\n", srv_ip, srv_port);
    }
    return 0;
}

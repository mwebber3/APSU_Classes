/* Mikayla Webber
 * CSCI 4100
 * Assignment 6
 * This program tests a bounded buffer by creating multiple sending and
 * receiving threads
 */

#include <stdio.h>
#include <stdlib.h>
#include "bbuff.h"

/* Structure to hold thread arguments */
struct t_args
{
	/* Thread ID */
	int t_id;

	/* Number of messages to send/receive */
	int num_msgs;

	/* Bounded buffer to use */
	struct bbuff * buffer;
};

/* Initialize t_args structure */
void t_args_init(struct t_args *args, int t_id, int num_msgs, struct bbuff * buffer);

/* Function for sending thread to execute */
void * send_msgs(void * args);

/* Function for receiving thread to execute */
void * receive_msgs(void * args);

/* Main function */
int main(int argc, char *argv[])
{
	struct bbuff buffer;
	bb_init(&buffer);

	pthread_t sendThread0;
	pthread_t sendThread1;
	pthread_t sendThread2;

	struct t_args sendArgument0;
	struct t_args sendArgument1;
	struct t_args sendArgument2;

	pthread_t receiveThread0;
	pthread_t receiveThread1;
	pthread_t receiveThread2;
	pthread_t receiveThread3;

	struct t_args receiveArgument0;
	struct t_args receiveArgument1;
	struct t_args receiveArgument2;
	struct t_args receiveArgument3;

	t_args_init(&sendArgument0, 0, 3, &buffer);
	t_args_init(&sendArgument1, 1, 3, &buffer);
	t_args_init(&sendArgument2, 2, 3, &buffer);

	t_args_init(&receiveArgument0, 0, 3, &buffer);
	t_args_init(&receiveArgument1, 1, 3, &buffer);
	t_args_init(&receiveArgument2, 2, 3, &buffer);
	t_args_init(&receiveArgument3, 3, 3, &buffer);

	pthread_create(&sendThread0, NULL, send_msgs, &sendArgument0);
	pthread_create(&sendThread1, NULL, send_msgs, &sendArgument1);
	pthread_create(&sendThread2, NULL, send_msgs, &sendArgument2);

	pthread_create(&receiveThread0, NULL, receive_msgs, &receiveArgument0);
	pthread_create(&receiveThread1, NULL, receive_msgs, &receiveArgument1);
	pthread_create(&receiveThread2, NULL, receive_msgs, &receiveArgument2);
	pthread_create(&receiveThread3, NULL, receive_msgs, &receiveArgument3);

	pthread_join(sendThread0, NULL);
	pthread_join(sendThread1, NULL);
	pthread_join(sendThread2, NULL);

	pthread_join(receiveThread0, NULL);
	pthread_join(receiveThread1, NULL);
	pthread_join(receiveThread2, NULL);
	pthread_join(receiveThread3, NULL);

	exit(EXIT_SUCCESS);
}

/* Initialize t_args structure */
void t_args_init(struct t_args *args, int t_id, int num_msgs, struct bbuff * buffer)
{
	args->t_id = t_id;
	args->num_msgs = num_msgs;
	args->buffer = buffer;
}

/* Function for sending thread to execute */
void * send_msgs(void * args)
{
	int n;
	struct bb_msg msg;
	struct t_args * real_args = (struct t_args *) args;

	for (n = 0; n < 4; n++)
	{
		bb_init_msg(args, n, n);							// initialize the bb_msg with the t_id and m_id
		bb_send(args, &msg);								// send the message to the buffer in the t_args structure
	}
	return NULL;
}

/* Function for receiving thread to execute */
void * receive_msgs(void * args)
{
	int n;
	struct bb_msg msg;
	struct t_args * real_args = (struct t_args *) args;

	for (n = 0; n < 4; n++)
	{
		bb_receive(args, &msg);								// receive message from buffer in the t_args structure
		bb_display_msg(&msg, n);							// display message and t_id from the t_args structure
	}
	return NULL;
}

/* CSCI 4100
 * Assignment 6
 * Source file for bounded buffer implementation
 */

#include <stdio.h>
#include <stdlib.h>
#include "bbuff.h"

/* Initialize a message structure */
void bb_init_msg(struct bb_msg *msg, int t_id, int m_id)
{
	msg->t_id = t_id;
	msg->t_id = m_id;
}

/* Copy the source message to the destination message */
void bb_copy_msg(struct bb_msg * source, struct bb_msg * destination)
{
	destination = source;
}

/* Display the contents of a message along with the id of the receiver */
void bb_display_msg(struct bb_msg *msg, int receiver)
{
	printf("[sending thread: %d, message %d, receiving thread: %d]", msg->t_id, msg->m_id, receiver);
}

/* Initialize the bounded buffer */
void bb_init(struct bbuff * buffer)
{
	buffer->in = 0;												// sets in to zero
	buffer->out = 0;											// sets out to zero
	pthread_mutex_init(&buffer->lock, NULL);					// initializes the bounded buffer
}

/* Send a message to a bounded buffer */
void bb_send(struct bbuff * buffer, struct bb_msg * message)
{
	pthread_mutex_lock(&buffer->lock);										// acquire buffer lock

	while ((buffer->in - buffer->out) == BUFFER_SIZE)			// while buffer is full
	{
		pthread_mutex_unlock(&buffer->lock);					// release lock
		pthread_mutex_lock(&buffer->lock);						// re-acquire lock
		bb_copy_msg(message, buffer->messages);					// copy message from bb_msg to correct location using bb_copy_msg buffer
		buffer->in = (buffer->in + 1);							// increment "in" member counter
	}

	pthread_mutex_unlock(&buffer->lock);						// release buffer lock
}

/* Receive a message from a bounded buffer */
void bb_receive(struct bbuff *buffer, struct bb_msg * message)
{
	pthread_mutex_lock(&buffer->lock);							// acquire buffer lock

	while (buffer->in == buffer->out)							// while buffer is empty
	{
		pthread_mutex_unlock(&buffer->lock);					// release lock
		pthread_mutex_lock(&buffer->lock);						// re-acquire lock
		bb_copy_msg(message, buffer->messages);					// copy message from bb_msg to correct location using bb_copy_msg buffer
		buffer->out = (buffer->out + 1);						// increment "out" member counter
	}

	pthread_mutex_unlock(&buffer->lock);						// release buffer lock
}

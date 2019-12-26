# queue

Simple native-list-based FIFO queue in Common Lisp. See [queue-test.lisp](queue-test.lisp) for examples. Constant time

- (single-elt) enqueue
- dequeue
- queue-empty-p
- queue-size

## API

```lisp
make-queue (&rest initial-elements)
enqueue (queue &rest elt) ; More efficient than doing one element at a time.
dequeue (queue)
queue-empty-p (queue)
print-queue (queue) (write (queue-head queue))
;; Overriding print-object can cause inconvenience while using large queues.
queue-size (queue)
```

Possible future changes include letting dequeue take an additional optional argument specifying number of elements to be dequeued.


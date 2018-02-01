from __future__ import print_function
import numpy as np 
import tensorflow as tf 
import math as math
import argparse
import csv 
import datetime
import os 
from sklearn import metrics

print ("\n Welcome to ARIEL data import.\n")
print ("\n Please specifiy the file to import!")
CSV_sec = input("CSV import file name")
if os.path.exists(CSV_sec) == True:
    print ("I've found the file. Opening and getting ready for data parse")
else:
    break
    print 
with open(CSV_sec) as csvfile:
    assert csvfile > 0
    while True:
        readCSV = csv.reader(csvfile, delimiter=',')
    else:
        print("\n Error Reading File")
        break
#Process the CSV file
def read_and_classify_sec(CSV_sec):
    filename_queue = tf.train.string_input_producer([CSV_sec)
    reader = tf.TextLineReader()
    key, value = reader.read(filename_queue)
    record_defaults = [[1], [1], [1], [1], [1]]
col1, col2, col3, col4, col5 = tf.decode_csv(
    value, record_defaults=record_defaults)
features = tf.stack([col1, col2, col3, col4])

with tf.Session() as sess:
  # Start populating the filename queue.
  coord = tf.train.Coordinator()
  threads = tf.train.start_queue_runners(coord=coord)

  for i in range(1200):
    # Retrieve a single instance:
    example, label = sess.run([features, col5])

  coord.request_stop()
  coord.join(threads)



if __name__ == "__main__":
    main()
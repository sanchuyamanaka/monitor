#!/usr/bin/env python                                                           
import struct
import sys

def main(s):
    with open(s, 'rb') as f:
        data = "0"
        while data:
            data0 = f.read(8)
            data1 = f.read(4)
            if not data1:
                break
            sdata0 = struct.unpack("<d", data0)[0] - 9. * 3600.
            sdata1 = struct.unpack("<f", data1)[0]

            print "%.2f %.2f" %(sdata0,sdata1)


if __name__ == '__main__':
    args = sys.argv
    if len(args) > 1:
        s = args[1]
        main(s)


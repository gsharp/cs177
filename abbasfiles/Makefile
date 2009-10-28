SRCS = cs177lib.c

WRAP = $(SRCS:.c=_wrap.c)

OBJS = $(SRCS:.c=.o) $(WRAP:.c=.o)

INTS = $(SRCS:.c=.i)

CC = /usr/bin/cc

JAVAHDR1 = /usr/java/jdk1.6.0_04/include

JAVAHDR2 = /usr/java/jdk1.6.0_04/include/linux

LUAHDR = /usr/local/include

LUALIB = /usr/local/lib/lua

LD = /usr/bin/ld

SWIG = /usr/local/bin/swig

DEBUG_FLAG =  #insert -g before this comment to turn on debug compilation 

prog:

        @echo "Please specify a language with the command like 'make
java'.  Valid options include java and lua" 

java: $(SRCS) $(INTS)

        $(SWIG) -$@ $(INTS)

        $(CC) -c $(SRCS) $(WRAP) -I$(JAVAHDR1) -I$(JAVAHDR2) $(DEBUG_FLAG)

        $(LD) -shared $(OBJS) -o libcs177lib.so 

lua: $(SRCS) $(INTS)

        $(SWIG) -$@ $(INTS)

        $(CC) -c  $(SRCS) $(WRAP) -I$(LUAHDR) $(DEBUG_FLAG)

        $(LD) -shared $(OBJS) -o cs177lib.so -L$(LUALIB)  

clean:

        -@rm -f $(OBJS) $(WRAP) libcshw.so libcs177lib.so cs177lib.so
cs177lib.java  cs177lib.class cs177libJNI.java cs177libJNI.class;\


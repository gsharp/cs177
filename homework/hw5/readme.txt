
                                                                        

~/hw5> ls
1) start here

cs177.c  cs177.h  cs177.i

2) swig up
swig -ruby cs177.i

3) gcc ruby shit
gcc -fpic -c cs177.c cs177_wrap.c -I/usr/lib/ruby/1.8/i386-linux-gnu

4) make the shared lib
gcc -shared cs177.o cs177_wrap.o -o libcs177.so

5) irb it
cs177.c  cs177.h  cs177.i  cs177.o  cs177_wrap.c  cs177_wrap.o  libcs177.so
~/hw5> irb
irb(main):001:0> require 'libcs177'
LoadError: /home/gcuthber/hw5/libcs177.so: undefined symbol: Init_libcs177 - /home/gcuthber/hw5/libcs177.so
        from (irb):1:in `require'
        from (irb):1
        from /usr/local/bin/irb:12:in `<main>'
irb(main):002:0> require 'libcs177.so'
LoadError: /home/gcuthber/hw5/libcs177.so: undefined symbol: Init_libcs177 - /home/gcuthber/hw5/libcs177.so
        from (irb):2:in `require'
        from (irb):2
        from /usr/local/bin/irb:12:in `<main>'
irb(main):003:0> 

notes using the ruby way:
making a shared lib on osx

make interface file: cs177.i

Swig it:
swig -ruby cs177.i

Compile (have to use 1.8)
gcc -fpic  -c cs177.c cs177_wrap.c -I. -I/usr/local/lib/ruby/1.8/i686-darwin10.0.0 -I/usr/local/lib/ruby/1.8/i686-darwin10.0.0

Shared Lib bundle maker
cc -dynamic -bundle -undefined suppress -flat_namespace -o cs177.bundle cs177.o cs177_wrap.o -L. -L/usr/local/lib -L.  -lpthread -ldl -lobjc

Install
1.8
sudo /usr/bin/install -c -m 0755 cs177.bundle /usr/local/lib/ruby/site_ruby/1.8/i686-darwin10.0.0

1.9
sudo /usr/bin/install -c -m 0755 cs177.bundle /usr/local/lib/ruby1.9/site_ruby/1.9.1/i386-darwin10.0.0


-----------------------------

Compile the ruby way
1.8
gcc -I. -I/usr/local/lib/ruby/1.8/i686-darwin10.0.0 -I/usr/local/lib/ruby/1.8/i686-darwin10.0.0 -I. -D_XOPEN_SOURCE -D_DARWIN_C_SOURCE   -fno-common -g -O2 -pipe -fno-common   -c cs177.c

1.9
gcc -I. -I/usr/local/include/ruby1.9-1.9.1/i386-darwin10.0.0 -I/usr/local/include/ruby1.9-1.9.1/ruby/backward -I/usr/local/include/ruby1.9-1.9.1 -I. -D_XOPEN_SOURCE  -D_DARWIN_C_SOURCE   -fno-common  -O2 -g -Wall -Wno-parentheses  -fno-common -pipe -fno-common  -o cs177.o -c cs177.c



some other thing I found
gcc -dynamiclib -Wl,-headerpad_max_install_names,-undefined,dynamic_lookup, -compatibility_version,1.0,-current_version,1.0, -o cs177.1.dylib cs177.o cs177_wrap.o


Testing it
Cs177.methods.each { |i| puts i if i =~ /str/ }


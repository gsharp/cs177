############# RUNNING TEST SUITE FOR: ./list  #####################
Running 15 tests:

1)==============> Tests: no arguments / params
command:         ./list 
--outpput--     
argument count:   0
no argumens provided?
usage: list [-n] [#,#-#,#-$,-,$] file_name

2)==============> Tests: good file, no lines
command:         ./list sample.src
--outpput--     
argument count:   1
sample.src is:    good
showLineNum is:   false

3)==============> Tests: bogus file
command:         ./list foo.src
--outpput--     
argument count:   1
foo.src is not a valid file
usage: list [-n] [#,#-#,#-$,-,$] file_name

4)==============> Tests: good file, show lines
command:         ./list -n sample.src
--outpput--     
argument count:   2
sample.src is:    good
showLineNum is:   true

5)==============> Tests: good file, bogus line option
command:         ./list -fii sample.src
--outpput--     
argument count:   2
sample.src is:    good
showLineNum is:   false
bogus range for -fii, aborting...
usage: list [-n] [#,#-#,#-$,-,$] file_name

6)==============> Tests: good file, single numb range
command:         ./list 3 sample.src
--outpput--     
argument count:   2
sample.src is:    good
showLineNum is:   false
ranges are good:  true
do readlines:     false
maxRange is:      3

7)==============> Tests: good file, multi range
command:         ./list 3,4-20,5 sample.src
--outpput--     
argument count:   2
sample.src is:    good
showLineNum is:   false
ranges are good:  true
do readlines:     false
maxRange is:      20

8)==============> Tests: good file, multi range, last line -
command:         ./list 3,4-20,5- sample.src
--outpput--     
argument count:   2
sample.src is:    good
showLineNum is:   false
ranges are good:  true
do readlines:     true
maxRange is:      20

9)==============> Tests: good file, multi range, last line $
command:         ./list 3,4-20,5-$ sample.src
--outpput--     
argument count:   2
sample.src is:    good
showLineNum is:   false
ranges are good:  true
do readlines:     true
maxRange is:      20

10)==============> Tests: good file, multi range, last line $ only
command:         ./list 3,4-20,5,$ sample.src
--outpput--     
argument count:   2
sample.src is:    good
showLineNum is:   false
ranges are good:  true
do readlines:     true
maxRange is:      20

11)==============> Tests: good file, single num range, show lines
command:         ./list -n 3 sample.src
--outpput--     
argument count:   3
sample.src is:    good
showLineNum is:   true
ranges are good:  true
do readlines:     false
maxRange is:      3

12)==============> Tests: good file, multi range, show lines
command:         ./list -n 3,4-20,5 sample.src
--outpput--     
argument count:   3
sample.src is:    good
showLineNum is:   true
ranges are good:  true
do readlines:     false
maxRange is:      20

13)==============> Tests: good file, multi range, last line -, show lines
command:         ./list -n 3,4-20,5- sample.src
--outpput--     
argument count:   3
sample.src is:    good
showLineNum is:   true
ranges are good:  true
do readlines:     true
maxRange is:      20

14)==============> Tests: good file, multi range, last line $, show lines
command:         ./list -n 3,4-20,5-$ sample.src
--outpput--     
argument count:   3
sample.src is:    good
showLineNum is:   true
ranges are good:  true
do readlines:     true
maxRange is:      20

15)==============> Tests: good file, multi range, last line $ only, show lines
command:         ./list -n 3,4-20,5,$ sample.src
--outpput--     
argument count:   3
sample.src is:    good
showLineNum is:   true
ranges are good:  true
do readlines:     true
maxRange is:      20


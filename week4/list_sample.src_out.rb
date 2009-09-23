############# RUNNING TEST SUITE FOR: ./list  #####################
Running 18 tests:

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
showLineNum is:   false
sample.src is:    good
line 1
line 2
line 3
line 4
line 5
line 6
line 7
line 8
line 9
line 10
line 11
line 12
line 13
line 14
line 15
line 16
line 17
line 18
line 19
line 20
line 21
line 22
line 23
line 24
line 25 end

3)==============> Tests: bogus file
command:         ./list foo.src
--outpput--     
argument count:   1
showLineNum is:   false
foo.src is not a valid file
usage: list [-n] [#,#-#,#-$,-,$] file_name

4)==============> Tests: good file, show lines
command:         ./list -n sample.src
--outpput--     
argument count:   2
showLineNum is:   true
sample.src is:    good
1 line 1
2 line 2
3 line 3
4 line 4
5 line 5
6 line 6
7 line 7
8 line 8
9 line 9
10 line 10
11 line 11
12 line 12
13 line 13
14 line 14
15 line 15
16 line 16
17 line 17
18 line 18
19 line 19
20 line 20
21 line 21
22 line 22
23 line 23
24 line 24
25 line 25 end

5)==============> Tests: good file, bogus line option
command:         ./list -fii sample.src
--outpput--     
argument count:   2
showLineNum is:   false
sample.src is:    good
bogus range for -fii, aborting...
usage: list [-n] [#,#-#,#-$,-,$] file_name

6)==============> Tests: good file, single numb range
command:         ./list 3 sample.src
--outpput--     
argument count:   2
showLineNum is:   false
sample.src is:    good
ranges are good:  true
doing maxLine:      3
lastLine: 3
from: 3 to: 3
line 3

7)==============> Tests: good file, multi range
command:         ./list 3,4-20,5 sample.src
--outpput--     
argument count:   2
showLineNum is:   false
sample.src is:    good
ranges are good:  true
doing maxLine:      20
lastLine: 20
from: 3 to: 3
line 3
from: 4 to: 20
line 4
line 5
line 6
line 7
line 8
line 9
line 10
line 11
line 12
line 13
line 14
line 15
line 16
line 17
line 18
line 19
line 20
from: 5 to: 5
line 5

8)==============> Tests: good file, multi range, last line -
command:         ./list 3,4-20,5- sample.src
--outpput--     
argument count:   2
showLineNum is:   false
sample.src is:    good
ranges are good:  true
doing readlines: true
lastLine: 25
from: 3 to: 3
line 3
from: 4 to: 20
line 4
line 5
line 6
line 7
line 8
line 9
line 10
line 11
line 12
line 13
line 14
line 15
line 16
line 17
line 18
line 19
line 20
from: 5 to: 25
line 5
line 6
line 7
line 8
line 9
line 10
line 11
line 12
line 13
line 14
line 15
line 16
line 17
line 18
line 19
line 20
line 21
line 22
line 23
line 24
line 25 end

9)==============> Tests: good file, multi range, last line $
command:         ./list 3,4-20,5-$ sample.src
--outpput--     
argument count:   2
showLineNum is:   false
sample.src is:    good
ranges are good:  true
doing readlines: true
lastLine: 25
from: 3 to: 3
line 3
from: 4 to: 20
line 4
line 5
line 6
line 7
line 8
line 9
line 10
line 11
line 12
line 13
line 14
line 15
line 16
line 17
line 18
line 19
line 20
from: 5 to: 25
line 5
line 6
line 7
line 8
line 9
line 10
line 11
line 12
line 13
line 14
line 15
line 16
line 17
line 18
line 19
line 20
line 21
line 22
line 23
line 24
line 25 end

10)==============> Tests: good file, multi range, last line $ only
command:         ./list 3,4-20,5,$ sample.src
--outpput--     
argument count:   2
showLineNum is:   false
sample.src is:    good
ranges are good:  true
doing readlines: true
lastLine: 25
from: 3 to: 3
line 3
from: 4 to: 20
line 4
line 5
line 6
line 7
line 8
line 9
line 10
line 11
line 12
line 13
line 14
line 15
line 16
line 17
line 18
line 19
line 20
from: 5 to: 5
line 5
from: 25 to: 25
line 25 end

11)==============> Tests: good file, single num range, show lines
command:         ./list -n 3 sample.src
--outpput--     
argument count:   3
showLineNum is:   true
sample.src is:    good
ranges are good:  true
doing maxLine:      3
lastLine: 3
from: 3 to: 3
3 line 3

12)==============> Tests: good file, multi range, show lines
command:         ./list -n 3,4-20,5 sample.src
--outpput--     
argument count:   3
showLineNum is:   true
sample.src is:    good
ranges are good:  true
doing maxLine:      20
lastLine: 20
from: 3 to: 3
3 line 3
from: 4 to: 20
4 line 4
5 line 5
6 line 6
7 line 7
8 line 8
9 line 9
10 line 10
11 line 11
12 line 12
13 line 13
14 line 14
15 line 15
16 line 16
17 line 17
18 line 18
19 line 19
20 line 20
from: 5 to: 5
5 line 5

13)==============> Tests: good file, multi range, last line -, show lines
command:         ./list -n 3,4-20,5- sample.src
--outpput--     
argument count:   3
showLineNum is:   true
sample.src is:    good
ranges are good:  true
doing readlines: true
lastLine: 25
from: 3 to: 3
3 line 3
from: 4 to: 20
4 line 4
5 line 5
6 line 6
7 line 7
8 line 8
9 line 9
10 line 10
11 line 11
12 line 12
13 line 13
14 line 14
15 line 15
16 line 16
17 line 17
18 line 18
19 line 19
20 line 20
from: 5 to: 25
5 line 5
6 line 6
7 line 7
8 line 8
9 line 9
10 line 10
11 line 11
12 line 12
13 line 13
14 line 14
15 line 15
16 line 16
17 line 17
18 line 18
19 line 19
20 line 20
21 line 21
22 line 22
23 line 23
24 line 24
25 line 25 end

14)==============> Tests: good file, multi range, last line $, show lines
command:         ./list -n 3,4-20,5-$ sample.src
--outpput--     
argument count:   3
showLineNum is:   true
sample.src is:    good
ranges are good:  true
doing readlines: true
lastLine: 25
from: 3 to: 3
3 line 3
from: 4 to: 20
4 line 4
5 line 5
6 line 6
7 line 7
8 line 8
9 line 9
10 line 10
11 line 11
12 line 12
13 line 13
14 line 14
15 line 15
16 line 16
17 line 17
18 line 18
19 line 19
20 line 20
from: 5 to: 25
5 line 5
6 line 6
7 line 7
8 line 8
9 line 9
10 line 10
11 line 11
12 line 12
13 line 13
14 line 14
15 line 15
16 line 16
17 line 17
18 line 18
19 line 19
20 line 20
21 line 21
22 line 22
23 line 23
24 line 24
25 line 25 end

15)==============> Tests: good file, multi range, last line $ only, show lines
command:         ./list -n 3,4-20,5,$ sample.src
--outpput--     
argument count:   3
showLineNum is:   true
sample.src is:    good
ranges are good:  true
doing readlines: true
lastLine: 25
from: 3 to: 3
3 line 3
from: 4 to: 20
4 line 4
5 line 5
6 line 6
7 line 7
8 line 8
9 line 9
10 line 10
11 line 11
12 line 12
13 line 13
14 line 14
15 line 15
16 line 16
17 line 17
18 line 18
19 line 19
20 line 20
from: 5 to: 5
5 line 5
from: 25 to: 25
25 line 25 end

16)==============> Tests: good file, multi range, gnarly ranges
command:         ./list -n 10,3-,2-4,4-2,-2,$,1-$,-$ sample.src
--outpput--     
argument count:   3
showLineNum is:   true
sample.src is:    good
ranges are good:  true
doing readlines: true
lastLine: 25
from: 10 to: 10
10 line 10
from: 3 to: 25
3 line 3
4 line 4
5 line 5
6 line 6
7 line 7
8 line 8
9 line 9
10 line 10
11 line 11
12 line 12
13 line 13
14 line 14
15 line 15
16 line 16
17 line 17
18 line 18
19 line 19
20 line 20
21 line 21
22 line 22
23 line 23
24 line 24
25 line 25 end
from: 2 to: 4
2 line 2
3 line 3
4 line 4
from: 4 to: 2
4 line 4
3 line 3
2 line 2
from: 1 to: 2
1 line 1
2 line 2
from: 25 to: 25
25 line 25 end
from: 1 to: 25
1 line 1
2 line 2
3 line 3
4 line 4
5 line 5
6 line 6
7 line 7
8 line 8
9 line 9
10 line 10
11 line 11
12 line 12
13 line 13
14 line 14
15 line 15
16 line 16
17 line 17
18 line 18
19 line 19
20 line 20
21 line 21
22 line 22
23 line 23
24 line 24
25 line 25 end
from: 1 to: 25
1 line 1
2 line 2
3 line 3
4 line 4
5 line 5
6 line 6
7 line 7
8 line 8
9 line 9
10 line 10
11 line 11
12 line 12
13 line 13
14 line 14
15 line 15
16 line 16
17 line 17
18 line 18
19 line 19
20 line 20
21 line 21
22 line 22
23 line 23
24 line 24
25 line 25 end

17)==============> Tests: good file, multi range, last line $ only, show lines, OOB
command:         ./list -n 3,4-40,5,$ sample.src
--outpput--     
argument count:   3
showLineNum is:   true
sample.src is:    good
ranges are good:  true
doing readlines: true
Readlines error: Range is greater than last line in file: there are only 25 lines in the file sample.src
usage: list [-n] [#,#-#,#-$,-,$] file_name

18)==============> Tests: good file, multi range, last line $ only, show lines, OOB, max
command:         ./list -n 3,4-40,5 sample.src
--outpput--     
argument count:   3
showLineNum is:   true
sample.src is:    good
ranges are good:  true
doing maxLine:      40
Maxline error: Range is greater than last line in file: there are only 25 lines in the file sample.src
usage: list [-n] [#,#-#,#-$,-,$] file_name


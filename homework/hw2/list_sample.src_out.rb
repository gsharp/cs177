############# RUNNING TEST SUITE FOR: ./list  #####################
Running 29 tests:

1)==============> Tests: no arguments / params
command:         ./list 
--outpput--     
no argumens provided?
usage: list [-n] [#,#-#,#-$,-,$] file_name

2)==============> Tests: good file, no lines
command:         ./list sample.src
--outpput--     
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
foo.src is not a valid file
usage: list [-n] [#,#-#,#-$,-,$] file_name

4)==============> Tests: good file, show lines
command:         ./list -n sample.src
--outpput--     
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
bogus range for -fii, try enclosing rang in quotes? aborting...
usage: list [-n] [#,#-#,#-$,-,$] file_name

6)==============> Tests: good file, single numb range
command:         ./list 3 sample.src
--outpput--     
line 3

7)==============> Tests: good file, multi range
command:         ./list 3,4-20,5 sample.src
--outpput--     
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
line 5

8)==============> Tests: good file, multi range, last line -
command:         ./list 3,4-20,5- sample.src
--outpput--     
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
line 5
line 25 end

11)==============> Tests: good file, single num range, show lines
command:         ./list -n 3 sample.src
--outpput--     
3 line 3

12)==============> Tests: good file, multi range, show lines
command:         ./list -n 3,4-20,5 sample.src
--outpput--     
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
5 line 5

13)==============> Tests: good file, multi range, last line -, show lines
command:         ./list -n 3,4-20,5- sample.src
--outpput--     
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
5 line 5
25 line 25 end

16)==============> Tests: good file, multi range, gnarly ranges
command:         ./list -n 10,3-,2-4,4-2,-2,$,1-$,-$ sample.src
--outpput--     
10 line 10
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
2 line 2
3 line 3
4 line 4
4 line 4
3 line 3
2 line 2
1 line 1
2 line 2
25 line 25 end
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
Readlines error: Range is greater than last line in file: there are only 25 lines in the file sample.src
usage: list [-n] [#,#-#,#-$,-,$] file_name

18)==============> Tests: good file, multi range, last line $ only, show lines, OOB, max
command:         ./list -n 3,4-40,5 sample.src
--outpput--     
Maxline error: Range is greater than last line in file: there are only 25 lines in the file sample.src
usage: list [-n] [#,#-#,#-$,-,$] file_name

19)==============> Tests: good file, dash line range, full file from dash, show lines
command:         ./list -n - sample.src
--outpput--     
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

20)==============> Tests: good file, dollar, only last line, show lines
command:         ./list -n $ sample.src
--outpput--     
25 line 25 end

21)==============> Tests: good file, dollar and dash, $- no quotes, show lines
command:         ./list -n -,$,$- sample.src
--outpput--     
bogus range for hBc, try enclosing rang in quotes? aborting...
usage: list [-n] [#,#-#,#-$,-,$] file_name

22)==============> Tests: good file, dollar and dash quoting param, show lines
command:         ./list -n '-,$,$-' sample.src
--outpput--     
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
25 line 25 end
0 line 25 end
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

23)==============> Tests: Abbas test: same line multiple times, show lines
command:         ./list -n 5,5,5,5 sample.src
--outpput--     
5 line 5
5 line 5
5 line 5
5 line 5

24)==============> Tests: Abbas test: same range reversed, show lines
command:         ./list -n 6-9,9-6 sample.src
--outpput--     
6 line 6
7 line 7
8 line 8
9 line 9
9 line 9
8 line 8
7 line 7
6 line 6

25)==============> Tests: Abbas test: dash to num, show lines
command:         ./list -n -7 sample.src
--outpput--     
1 line 1
2 line 2
3 line 3
4 line 4
5 line 5
6 line 6
7 line 7

26)==============> Tests: Abbas test: multiple dash to num, show lines
command:         ./list -n -7,-7,-7 sample.src
--outpput--     
1 line 1
2 line 2
3 line 3
4 line 4
5 line 5
6 line 6
7 line 7
1 line 1
2 line 2
3 line 3
4 line 4
5 line 5
6 line 6
7 line 7
1 line 1
2 line 2
3 line 3
4 line 4
5 line 5
6 line 6
7 line 7

27)==============> Tests: Abbas test: dash to num, num to dash, show lines
command:         ./list -n -7,7- sample.src
--outpput--     
1 line 1
2 line 2
3 line 3
4 line 4
5 line 5
6 line 6
7 line 7
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

28)==============> Tests: Abbas test: same num to same num, show lines
command:         ./list -n 9-9 sample.src
--outpput--     
9 line 9

29)==============> Tests: Abbas test: last line to first, show lines
command:         ./list -n '$-1' sample.src
--outpput--     
25 line 25 end
24 line 24
23 line 23
22 line 22
21 line 21
20 line 20
19 line 19
18 line 18
17 line 17
16 line 16
15 line 15
14 line 14
13 line 13
12 line 12
11 line 11
10 line 10
9 line 9
8 line 8
7 line 7
6 line 6
5 line 5
4 line 4
3 line 3
2 line 2
1 line 1


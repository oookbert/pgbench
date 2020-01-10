# pgbench
```
[postgres@localhost pgbench]$ ./pgbench -f ss.sql -T 10 -r -n -P 1 -Msimple --seqread-file /tmp/test.csv#/tmp/login.csv -c 10
progress: 1.0 s, 1151.7 tps, lat 8.438 ms stddev 3.198
progress: 2.0 s, 1093.3 tps, lat 9.166 ms stddev 2.156
progress: 3.0 s, 1071.0 tps, lat 9.321 ms stddev 2.310
progress: 4.0 s, 1101.0 tps, lat 9.078 ms stddev 2.495
progress: 5.0 s, 1025.0 tps, lat 9.771 ms stddev 2.188
progress: 6.0 s, 1137.0 tps, lat 8.775 ms stddev 2.556
progress: 7.0 s, 1059.0 tps, lat 9.449 ms stddev 2.418
progress: 8.0 s, 1061.0 tps, lat 9.420 ms stddev 1.924
progress: 9.0 s, 972.1 tps, lat 10.310 ms stddev 2.373
progress: 10.0 s, 1077.0 tps, lat 9.269 ms stddev 2.402
transaction type: ss.sql
scaling factor: 1
query mode: simple
number of clients: 10
number of threads: 1
duration: 10 s
number of transactions actually processed: 10758
latency average = 9.280 ms
latency stddev = 2.480 ms
tps = 1074.354866 (including connections establishing)
tps = 1074.601425 (excluding connections establishing)
statement latencies in milliseconds:
         0.001  \set aid getnext(0)
         0.000  \set loginId getnext(1)
         6.447  select * from keqiao where flgt_id = ':aid';
         2.832  select * from cg40_rrt where login_name = ':loginId';
```

```
[postgres@localhost pgbench]$ ./pgbench --help
pgbench is a benchmarking tool for PostgreSQL.

Usage:
  pgbench [OPTION]... [DBNAME]

Initialization options:
  -i, --initialize         invokes initialization mode
  -I, --init-steps=[dtgvpf]+ (default "dtgvp")
                           run selected initialization steps
  -F, --fillfactor=NUM     set fill factor
  -n, --no-vacuum          do not run VACUUM during initialization
  -q, --quiet              quiet logging (one message each 5 seconds)
  -s, --scale=NUM          scaling factor
  --foreign-keys           create foreign key constraints between tables
  --index-tablespace=TABLESPACE
                           create indexes in the specified tablespace
  --tablespace=TABLESPACE  create tables in the specified tablespace
  --unlogged-tables        create tables as unlogged tables

Options to select what to run:
  -b, --builtin=NAME[@W]   add builtin script NAME weighted at W (default: 1)
                           (use "-b list" to list available scripts)
  -f, --file=FILENAME[@W]  add script FILENAME weighted at W (default: 1)
  -N, --skip-some-updates  skip updates of pgbench_tellers and pgbench_branches
                           (same as "-b simple-update")
  -S, --select-only        perform SELECT-only transactions
                           (same as "-b select-only")

Benchmarking options:
  -c, --client=NUM         number of concurrent database clients (default: 1)
  -C, --connect            establish new connection for each transaction
  -D, --define=VARNAME=VALUE
                           define variable for use by custom script
  -j, --jobs=NUM           number of threads (default: 1)
  -l, --log                write transaction times to log file
  -L, --latency-limit=NUM  count transactions lasting more than NUM ms as late
  -M, --protocol=simple|extended|prepared
                           protocol for submitting queries (default: simple)
  -n, --no-vacuum          do not run VACUUM before tests
  -P, --progress=NUM       show thread progress report every NUM seconds
  -r, --report-latencies   report average latency per command
  -R, --rate=NUM           target rate in transactions per second
  -s, --scale=NUM          report this scale factor in output
  -t, --transactions=NUM   number of transactions each client runs (default: 10)
  -T, --time=NUM           duration of benchmark test in seconds
  -v, --vacuum-all         vacuum all four standard tables before tests
  --aggregate-interval=NUM aggregate data over NUM seconds
  --log-prefix=PREFIX      prefix for transaction time log file
                           (default: "pgbench_log")
  --seqread-file= FilePath filePath which seqread file by using getnext()
  --progress-timestamp     use Unix epoch timestamps for progress
  --random-seed=SEED       set random seed ("time", "rand", integer)
  --sampling-rate=NUM      fraction of transactions to log (e.g., 0.01 for 1%)

Common options:
  -d, --debug              print debugging output
  -h, --host=HOSTNAME      database server host or socket directory
  -p, --port=PORT          database server port number
  -U, --username=USERNAME  connect as specified database user
  -V, --version            output version information, then exit
  -?, --help               show this help, then exit

Report bugs to <pgsql-bugs@postgresql.org>.
[postgres@localhost pgbench]$ 
```

\set aid getnext(0) --read line from first file.
\set bid getnext(1) --read line from second file
Use # as the delimiter between files

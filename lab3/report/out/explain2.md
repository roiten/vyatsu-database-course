| QUERY PLAN |
| :--- |
| Nested Loop Anti Join  \(cost=0.15..32.62 rows=30 width=444\) \(actual time=0.032..0.034 rows=1.00 loops=1\) |
|   Buffers: shared hit=16 |
|   -&gt;  Seq Scan on trainer t  \(cost=0.00..10.60 rows=60 width=444\) \(actual time=0.014..0.015 rows=8.00 loops=1\) |
|         Buffers: shared hit=1 |
|   -&gt;  Index Only Scan using achievement\_trainer\_id\_idx on achievement a  \(cost=0.15..1.02 rows=4 width=8\) \(actual time=0.002..0.002 rows=0.88 loops=8\) |
|         Index Cond: \(trainer\_id = t.id\) |
|         Heap Fetches: 7 |
|         Index Searches: 8 |
|         Buffers: shared hit=15 |
| Planning Time: 0.111 ms |
| Execution Time: 0.048 ms |

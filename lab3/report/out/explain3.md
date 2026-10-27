| QUERY PLAN |
| :--- |
| Index Only Scan using car\_title\_idx on car  \(cost=0.14..8.16 rows=1 width=218\) \(actual time=0.022..0.022 rows=1.00 loops=1\) |
|   Index Cond: \(title = 'Toyota Supra'::text\) |
|   Heap Fetches: 1 |
|   Index Searches: 1 |
|   Buffers: shared hit=2 |
| Planning Time: 0.054 ms |
| Execution Time: 0.032 ms |

# crystalfiomark
Crystalfiomark is a disk performance meter, which is based on Flexible I/O Tester.
This tool aims to have similar settings and results to CrystalDiskMark.

Unfortunately buty4649's tool is not working and based on the old version of CDM, so I decided to create mine.
The output is a bit ugly yet.

Industrial SATA3 64GB SSD
- DRAM-less JMF controller
- Toshiba A19 NAND

CDM (Windows7 AMD64)

|-----------------|-----Read-----|----Write-----|

| Seq Q32T1 |...  406MiB/s |..  156MiB/s |

|..  4K Q32T1 |.. 38.8MiB/s | 1569KiB/s |

| Seq Q01T1 |...  364MiB/s |..  147MiB/s |

|..  4K Q01T1 |.. 27.5MiB/s | 1360KiB/s |


CFM (Arch Linux 4.10 AMD64)

|-----------------|-----Read-----|----Write-----|

| Seq Q32T1 |...  390MiB/s |..  163MiB/s |

|..  4K Q32T1 |.. 40.3MiB/s | 1457KiB/s |

| Seq Q01T1 |...  341MiB/s |..  159MiB/s |

|..  4K Q01T1 |.. 29.7MiB/s | 1207KiB/s |



# readfx


> A fork of [readfq](https://github.com/andreas-wilm/nimreadfq) for made for future versions of SeqFu.

A Nim wrapper for [Heng Li's kseq/readfq](https://github.com/lh3/readfq/), an efficient and fast parser for FastQ and Fasta files.
nimreadfq supports reading of FastQ and Fasta files from stdin (use "-"), gzipped or flat files and is fast (see benchmark below).

The main function is `readFQ()`, an iterator that yields `FQRecord(s)`. An alternative is `readFQPtr()`, which returns `FQRecordPtr(s)`. The difference is that the latter uses `ptr char` instead of strings and is thus potentially faster but memory is reused during iterations.

See `example.nim` and `tests/tester.nim` for code examples.


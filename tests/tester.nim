import unittest
import zip/zlib
import md5
import strutils

import ../kseq


# FIXME paired end (ptr char!)

# FIXME read from stdin

test "readfq test.fasta.gz":
  let fp = gzopen("./tests/test.fasta.gz", "r")
  var res = ""
  for rec in readfq(fp):
    res = res & $rec & "\n"
  check $toMD5($res) == "21aa45c3b9110a7df328680f8b8753e8"#  gzip -dc tests/test.fasta.gz | md5sum


test "readfq seq.txt":
  let fp = gzopen("./tests/seq.txt", "r")# note: gzopen despite flat file format
  # FIXME mixed fa and fastq and messy input
  var i = 0
  for rec in readfq(fp):
    inc i
    check rec.name == $i
    if i == 1:
      check len(rec.sequence) == 15 and len(rec.quality) == 0
    elif i == 2:
      check len(rec.sequence) == 10 and len(rec.comment) > 0
    elif i == 3:
      check len(rec.quality) == len(rec.sequence)


test "readfq SRR396637_1.seqs1-2.fastq.gz":
  let fp = gzopen("./tests/SRR396637_1.seqs1-2.fastq.gz", "r")
  var res = ""
  for rec in readfq(fp):
    res = res & $rec & "\n"
  check $toMD5($res) == "299882b15a2dc87f496a88173dd485ad"#  gzip -dc SRR396637_1.seqs1-2.fastq.gz | md5sum


test "readFQPtr test.fasta.gz":
  let fp = gzopen("./tests/test.fasta.gz", "r")
  var res = ""
  var recs: seq[string]
  for rec in readFQPtr(fp):
    # ptr char are reused but here we convert to string on the fly
    recs.add($rec)
  res = $recs.join("\n") & "\n"
  check $toMD5($res) == "21aa45c3b9110a7df328680f8b8753e8"#  gzip -dc tests/test.fasta.gz | md5sum
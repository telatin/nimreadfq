# Package

version       = "0.1.0"
author        = "Andreas Wilm and SeqFu team"
description   = "Parse FASTQ and FASTA files, using Heng Li's Klib"
license       = "MIT"

requires "nim >= 1.0, zip >= 0.2.1"

skipDirs = @["tests"]

task test, "run the tests":
  exec "nim c -r tests/tester"

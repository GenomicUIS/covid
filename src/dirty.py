import os
from Bio import SeqIO

Dir = "gamma"

arr = os.listdir(Dir)

for directory in arr:
    dirty_seqs = []
    for file in os.listdir(Dir + "/" + directory):
        path = f"{Dir}/{directory}/{file}"
        if os.path.exists(path):
            with open(path, "r") as handle:
                for record in SeqIO.parse(handle, "fasta"):
                    if "n" in record.seq or "N" in record.seq:
                        dirty_seqs.append(record)
            SeqIO.write(dirty_seqs, f"{Dir}/{directory}/data_dirty.fasta", "fasta")

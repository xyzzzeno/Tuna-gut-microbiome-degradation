#import fastq files
#manifest.tsv includes file path for all fastq files
qiime tools import \
  --type "SampleData[PairedEndSequencesWithQuality]" \
  --input-format PairedEndFastqManifestPhred33V2 \
  --input-path manifest.tsv \ 
  --output-path demux_seqs.qza

#DADA2 denoising
qiime dada2 denoise-paired \
  --i-demultiplexed-seqs paired_seqs.qza \
  --p-trim-left-f 0 \
  --p-trim-left-r 0 \
  --p-trunc-len-f 275 \
  --p-trunc-len-r 225 \
  --o-table table.qza \
  --o-representative-sequences rep-seqs.qza \
  --o-denoising-stats denoising-stats.qza

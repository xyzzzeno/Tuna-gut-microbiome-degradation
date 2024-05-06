#Taxonomic reference training
qiime feature-classifier extract-reads \
  --i-sequences silva-138-99-seqs.qza \
  --p-f-primer CCTACGGGNBGCASCAG \  
  --p-r-primer GACTACNVGGGTATCTAATCC \ 
  --p-trunc-len 464 \
  --p-min-length 200 \
  --p-max-length 500 \
  --o-reads ref-seqs_train.qza
qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads ref-seqs_trained.qza \
  --i-reference-taxonomy silva-138-99-tax.qza \
  --o-classifier trained_classifier.qza


#Taxonomic assignment
qiime feature-classifier classify-sklearn \
  --i-classifier trained_classifier.qza \
  --i-reads rep-seqs.qza \
  --o-classification taxonomy.qza

#Construct phylogenetic tree
qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences rep-seqs.qza \
  --o-alignment aligned-rep-seqs.qza \
  --o-masked-alignment masked-aligned-rep-seqs.qza \
  --o-tree unrooted-tree.qza \
  --o-rooted-tree rooted-tree.qza



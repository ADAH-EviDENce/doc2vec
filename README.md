# doc2vec

This repository contains material relevant to the (exploratory) doc2vec incremental approach. Relevant code and data for the initial exploratory analysis is provided in the d2v_exploration subdirectory.

## Corpus preprocessing and accesibilty

Full documents, i.e. the full transcript of an interview, are not amenable to the goal of identifying reported violence and violent events, not becuase they don't contain such reports, but because, by their nature, they all do. 
For the purposes of the research project it is therefore necessary to consider subsections of the documents, and to identify which of these are concerned with violence.

### Construction of fragments
An prerequisite step in the analysis therefore consists of splitting the corpus of documents into fragments. 
This functionality is provided by the `GV_snippets_preserve_para_sent.ipynb` notebook, which uses the GV documents annotated 
by the NewsReader pipeline and constructs fragments/snippets of a desired target size, whilst preserving sentence and/or
paragraph structure as specified. The construction takes place on the basis of words before any preprocessing is applied.

### Formation of Corpus in gensim doc2vec format
For the doc2vec analysis we make use of the `gensim` pyhton package which provide an impelementation of the doc2vec paragraph embeddings method presented in (insert citation). Access to the corpus using this library is most expedient if the individual fragments are stored as single lines in a large corpus file (this is the case for relatively small corpora such as that of interest to us in this project). The `Preprocess_d2v_make?_corpus_file.ipynb` notebook provides code to construct appropriate corpus files from the previously constructed fragments (see above).

## Exploratory analysis using doc2vec
Having rendered the corpus accessible to the gensim doc2vec import interface. We have begun an initial exploratory analysis of
the feasibility and performance of using gensim doc2vec in deriving feature vectors for the fragments of the corpus. This is
contained and commented upon in the `Exploratory doc2vec.ipynb` notebook.



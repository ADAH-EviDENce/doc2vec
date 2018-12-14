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
For the doc2vec analysis we make use of the `gensim` pyhton package which provide an impelementation of the doc2vec paragraph embeddings method presented in (insert citation). Access to the corpus using this library is most expedient if the individual fragments are stored as single lines in a large corpus file (this is the case for relatively small corpora such as that of interest to us in this project). The `Preprocess_d2v_make_corpus_file.ipynb` notebook provides code to construct appropriate corpus files from the previously constructed fragments (see above).

## Exploratory analysis using doc2vec
Having rendered the corpus accessible to the gensim doc2vec import interface, we have begun an initial exploratory analysis of
the feasibility and performance of using gensim doc2vec in deriving feature vectors for the fragments of the corpus. This is
contained and commented upon in the `Exploratory doc2vec.ipynb` notebook.

Briefly, the analysis proceeds by:

  1) importing the corpus. 
  
    1.1)During the import, each fragment is filtered for dutch stopwords based on the `stopwords-nl-stopwords-iso_expanded.txt` list, punctuation is removed, and all words are cast to lower case.
    
    1.2) A clear text version of the corpus is imported in parallel for human readable comparison.
   
   2) instantiating a doc2vec model.
     Given the samll size of the corpus, weh have chosen for a 50 dimensional model, making use only of words which appear at
     least twice in the corpus. Here we have chosen for a distributed memory approach
     
     2.1) The model is trained for 30 epochs on the full corpus. Longer training is subjectively perceiveed to result in
     overfitting
     
     2.2) Sanity check on similarity-to-self performed 
     
   3) Defining and processing 'seed' fragments to test recovery performance
   
    3.1) self-styled fragments
    
    3.2) corpus fragment 
    
   4) Infering vectors for seed fragments
   
    4.1) significant variance found for inferred vectors
    
    4.2) infer vector for each fragment 100 times and use element wise median
    
   5) Inspecting the recovered most similar fragments in the corpus
   
    5.1) Possible issue, small corpus large varianz in vectors corpus vectors partially based on early epochs. 
    
   6) Reinferring all corpus vectors using stable model
   
    6.1) As for the seed fragment reinfer 100 times and use median 
    
   7) Recovering similar (cosine similarity) corpus fragments for seed fragments
   
    7.1) return 25 most similar and label these as relevant or not
    
    7.2) determing mean vector of relevant fragments and returing 25 most similar fragments, labeling on releavance. Perform 2
    iterations
    
   8) Comparing performance with random selection
   
    8.1) select 25 random fragments and label on relevance. repeat.
    
    
   The above approach represents a fully interasctive incremental search. Given the vector space representation of the corpus we
   also consider classic clusterin approaches on the corpus as documented in `Exploratory_d2v_clustering.ipynb`.
   We intially cosider a `dbscan` clustering using cosine distance/similarity, an epsilon of 0.05, and a minimal cluster size of
   5. This returns no semantic signal (the foreign language interviews, as well as all NIOD intro sections appear clusterd; these
   have been/will be removed in the cleaned corpus)
   We further consider a T-SNE embedding in 3 dimensions, also visualizing the returned relevant fragments over one iteration 
   chain from the previous analysis. No structure or clustering is apparent.
   
   
    
    
    
  


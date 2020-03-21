# Analysis of World Happiness
## Exercise
To find correlation between various factors that contribute to happiness. [Link to exercise.](https://colab.research.google.com/drive/1HVr1d-yg-Z4Dj5x9BLnv-8ja-JdssaLV#scrollTo=-UnwK2nGpciB)

## Data
Downloaded from Kaggle, the dataset is modified and [linked here.](https://github.com/Prashambhuta/my_projects/blob/master/data_analysis/wk1_world_happiness_exercise/data_sets/World_Happiness_2015_2017.csv)

## Task
To find correlation coefficient (R) and (R<sup>2</sup>) between happiness score and other factors such as economy, health, family etc.

## Solution
* Python based: [Jupyter Notebook](https://github.com/Prashambhuta/my_projects/blob/master/data_analysis/wk1_world_happiness_exercise/happiness_score.ipynb) + [Colab](https://colab.research.google.com/drive/1bn7oXAwqrmHsoJo4fLrb5e8XORcXSy3K)
    * packages used: 'pandas', 'numpy', 'matlibplot', 'seahorn'
* R based: [Rmarkdown](/data_analysis/wk1_world_happiness_exercise/happiness_score.Rmd)
    * packages used: 'tidyverse', 'R base-plot'
## Conclusion
The following table will define the dependence of Happiness Score on various factors, where **( )** represents R<sup>2</sup>. 

|Sr_No | Strongly Dependent | Mild Dependent | Weakly Dependent |
|---|----|----|----|
| 1 | Economy (0.62) | Freedom (0.31) | Trust (Government) (0.08)|
| 2 | Health (0.56) | Dystopia Residual (0.24) | Generosity (0.05)|
| 3 | Family (0.41)

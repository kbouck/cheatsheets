# gnuplot snippets


## virtual column

    plot "/dev/stdin" using 0:1 with lines
    
- where 0 is virtual line number, 1 is column number, 

- "with lines" means that continues line instead of just points


## plot from stdin

    plot "/dev/stdin"



## Terminal bar chart

    gnuplot -e 'set terminal dumb; plot "/tmp/bar_data.txt" using 2: xtic(1) with histogram'


    90 +---------------------------------------------------------------------+   
       |    +   +    +    +   +    +    +   +    +    +   **   +    +   +    |   
    80 |-+          ***         "/tmp/bar_data.txt" using ** xtic(1)       +-|   
       |            * *                                   **                 |   
    70 |-+          * *           ***                     **               +-|   
       |            * *           * *                     **                 |   
       |            * *           * *                     **                 |   
    60 |-+      **  * *           * *  **       ***       **               +-|   
       |        **  * *           * *  **       * *       **                 |   
    50 |-+      **  * *           * *  **       * *       **               +-|   
       |        **  * *           * *  **   **  * *       **                 |   
    40 |-+      **  * *           * *  **   **  * *       **            ** +-|   
       |        **  * *           * *  **   **  * *       **            **   |   
    30 |-+      **  * *           * *  **   **  * *       **            ** +-|   
       |        **  * *           * *  **   **  * *       **            **   |   
       |        **  * *       **  * *  **   **  * *  **   **            **   |   
    20 |-+      **  * *       **  * *  **   **  * *  **   **            ** +-|   
       |        **  * *       **  * *  **   **  * *  **   **  ***       **   |   
    10 |-+ **   **  * *       **  * *  **   **  * *  **   **  * *       ** +-|   
       |   **   **  *+*   +   **  *+*  **   **  *+*  **   **  *+*  **   **   |   
     0 +---------------------------------------------------------------------+   
         20192019-2019-20192019-2019-20192019-2019-20192020-2020-20202020-04  


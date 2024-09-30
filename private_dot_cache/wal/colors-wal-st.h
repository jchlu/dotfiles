const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0c0201", /* black   */
  [1] = "#CA9360", /* red     */
  [2] = "#5C7395", /* green   */
  [3] = "#D26096", /* yellow  */
  [4] = "#6E90B8", /* blue    */
  [5] = "#A69D9B", /* magenta */
  [6] = "#CAC1B8", /* cyan    */
  [7] = "#eae9e2", /* white   */

  /* 8 bright colors */
  [8]  = "#a3a39e",  /* black   */
  [9]  = "#CA9360",  /* red     */
  [10] = "#5C7395", /* green   */
  [11] = "#D26096", /* yellow  */
  [12] = "#6E90B8", /* blue    */
  [13] = "#A69D9B", /* magenta */
  [14] = "#CAC1B8", /* cyan    */
  [15] = "#eae9e2", /* white   */

  /* special colors */
  [256] = "#0c0201", /* background */
  [257] = "#eae9e2", /* foreground */
  [258] = "#eae9e2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;

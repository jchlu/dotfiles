static const char norm_fg[] = "#eae9e2";
static const char norm_bg[] = "#0c0201";
static const char norm_border[] = "#a3a39e";

static const char sel_fg[] = "#eae9e2";
static const char sel_bg[] = "#5C7395";
static const char sel_border[] = "#eae9e2";

static const char urg_fg[] = "#eae9e2";
static const char urg_bg[] = "#CA9360";
static const char urg_border[] = "#CA9360";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};

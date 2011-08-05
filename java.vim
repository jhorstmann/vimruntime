inoreab <buffer> Stirng String
inoreab <buffer> Strnig String
inoreab <buffer> Strng  String

inoreab <buffer> psvm public static void main(String[] args) {<CR>}<C-O>O

inoreab <buffer> sout System.out.println();<LEFT><LEFT>
inoreab <buffer> serr System.err.println();<LEFT><LEFT>
inoreab <buffer> sop System.out.println();<LEFT><LEFT>
inoreab <buffer> sep System.err.println();<LEFT><LEFT>

inoreab <buffer> tryf try {<CR>}<cr>finally {<CR>«--finally--»<CR>}<UP><UP><UP><C-O>O
inoreab <buffer> tryc try {<CR>}<cr>catch (Exception e) {<CR>«--catch--»;<CR>}<CR><UP><UP><UP><UP><C-O>O
inoreab <buffer> trycf try {<CR>}<cr>catch (Exception e) {<CR>«--catch--»;<CR>}<CR>finally {<CR>«--finally--»<CR>}<UP><UP><UP><UP><UP><UP><C-O>O
inoreab <buffer> pubv public void () {<CR>}<CR><UP><UP><END><LEFT><LEFT><LEFT>
inoreab <buffer> priv private void () {<CR>}<CR><UP><UP><END><LEFT><LEFT><LEFT>

" copied from JDeveloper
inoreab <buffer> pral private List  = new ArrayList();<C-O>18<LEFT>
inoreab <buffer> prhm private Map  = new HashMap();<C-O>16<LEFT>
inoreab <buffer> prtm private Map  = new TreeMap();<C-O>16<LEFT>
inoreab <buffer> prhs private Set  = new HashSet();<C-O>16<LEFT>

inoreab <buffer> pri private int ;<LEFT>
inoreab <buffer> prb private boolean ;<LEFT>
inoreab <buffer> prs private String ;<LEFT>
inoreab <buffer> psfi public static final int ;<LEFT>
inoreab <buffer> psfb public static final boolean ;<LEFT>
inoreab <buffer> psfs public static final String ;<LEFT>

"inoreab <buffer> cdoc /**<CR><CR>@author Jörn Horstmann, (c) 2005<CR>@version $Revision$<CR><pre><CR>$Log$<CR></pre><CR><BS>/<UP><UP><UP><UP><UP><UP><SPACE>
"inoreab <buffer> jdoc /**<CR><CR>@param<CR>@return<CR>@throws<CR><BS>/<UP><UP><UP><UP><SPACE>
"inoreab <buffer> /** /**<CR><BS>/<UP><SPACE>

"inoreab <buffer> while while () {<CR>}<UP><END><LEFT><LEFT><LEFT>
"inoreab <buffer> dow do {<CR>}<CR>while ();<LEFT><LEFT>
"inoreab <buffer> switch switch () {<CR>case :<CR>break;<CR>default:<CR>break;<CR>}<UP><UP><UP><UP><UP><END><LEFT><LEFT><LEFT>

"inoreab <buffer> iff if () {<CR>}<CR><UP><UP><END><LEFT><LEFT><LEFT>
"inoreab <buffer> ife if () {<CR>}<CR>else {<CR>}<UP><UP><UP><END><LEFT><LEFT><LEFT>

inoreab <buffer> formap for (Iterator it=.entrySet().iterator(); it.hasNext(); ) {<CR>Map.Entry me = (Map.Entry)it.next();<CR>«--keytype--» key = («--keytype--»)me.getKey();<CR>«--valtype--» val = («--valtype--»)me.getValue();<CR>«--body--»<CR>}<UP><UP><UP><UP><UP><END><C-O>40<LEFT>
inoreab <buffer> forkey for (Iterator it=.keySet().iterator(); it.hasNext(); ) {<CR>«--type--» «--name--» = («--type--»)it.next();<CR>«--body--»<CR>}<UP><UP><UP><END><C-O>38<LEFT>
inoreab <buffer> forval for (Iterator it=.values().iterator(); it.hasNext(); ) {<CR>«--type--» «--name--» = («--type--»)it.next();<CR>«--body--»<CR>}<UP><UP><UP><END><C-O>38<LEFT>
inoreab <buffer> forlst for (Iterator it=.iterator(); it.hasNext(); ) {<CR>«--type--» «--name--» = («--type--»)it.next();<CR>«--body--»<CR>}<UP><UP><UP><END><C-O>29<LEFT>
inoreab <buffer> forset for (Iterator it=.iterator(); it.hasNext(); ) {<CR>«--type--» «--name--» = («--type--»)it.next();<CR>«--body--»<CR>}<UP><UP><UP><END><C-O>29<LEFT>
inoreab <buffer> forit for (Iterator it=.iterator(); it.hasNext(); ) {<CR>«--type--» «--name--» = («--type--»)it.next();<CR>«--body--»<CR>}<UP><UP><UP><END><C-O>29<LEFT>
inoreab <buffer> forenum for (Enumeration en=; en.hasMoreElements(); ) {<CR>«--type--» «--name--» = («--type--»)en.nextElement();<CR>«--body--»<CR>}<UP><UP><UP><END><C-O>26<LEFT>

inoreab <buffer> atoi Integer.parseInt()<LEFT>
inoreab <buffer> stoi Integer.parseInt()<LEFT>
inoreab <buffer> itoa Integer.toString()<LEFT>

inoreab <buffer> s2i Integer.parseInt()<LEFT>
inoreab <buffer> s2l Long.parseLong()<LEFT>
inoreab <buffer> s2b Boolean.parseBoolean()<LEFT>
inoreab <buffer> s2f Float.parseFloat()<LEFT>
inoreab <buffer> s2d Double.parseDouble()<LEFT>
inoreab <buffer> i2s Integer.toString()<LEFT>
inoreab <buffer> l2s Long.toString()<LEFT>
inoreab <buffer> b2s Boolean.toString()<LEFT>

inoreab <buffer> toarr ([])«--list--».toArray(new «--type--»[«--list--».size()]);<C-O>56<LEFT>
inoreab <buffer> arrcp System.arraycopy(, 0, «--destination--», 0, «--length--»);<C-O>40<LEFT>

inoreab <buffer> format String.format(java.util.Locale.US, "", new Object[] {})<C-O>18<LEFT>
inoreab <buffer> strtok StringTokenizer tokenizer = new StringTokenizer();<CR>while (tokenizer.hasMoreTokens()) {<CR>String token = tokenizer.nextToken();<CR>«--body--»<CR>}<UP><UP><UP><UP><END><LEFT><LEFT>
inoreab <buffer> matchall Pattern p = Pattern.compile();<CR>Matcher m = p.matcher(«--text--»);<CR>while (m.find()) {<CR>String reg1 = m.group(1);<CR>«--body--»<CR>}<UP><UP><UP><UP><UP><END><LEFT><LEFT>
inoreab <buffer> matches  Pattern p = Pattern.compile();<CR>Matcher m = p.matcher(«--text--»);<CR>if (m.matches()) {<CR>String reg1 = m.group(1);<CR>«--body--»<CR>}<UP><UP><UP><UP><UP><END><LEFT><LEFT>
inoreab <buffer> matchrep Pattern p = Pattern.compile();<CR>Matcher m = p.matcher(«--text--»);<CR>StringBuffer sb = new StringBuffer();<CR>while (m.find()) {<CR>String reg1 = m.group(1);<CR>m.appendReplacement(sb, Matcher.quoteReplacement(«--replacement--»));<CR>}<CR>m.appendTail(sb);<CR><UP><UP><UP><UP><UP><UP><UP><UP><END><LEFT><LEFT>

function! JH_java_getter()
    let type = input("Variable type: ", "")
    if type != ""
        let var  = input("Variable name: ", "")
        if var != ""
            let var2 = substitute(var, "^.", "\\u\\0", "")
            let l   = line(".")-1
            let res = append(l  , "")
            let res = append(l+1, "    public " . type . " get" . var2 . "() {")
            let res = append(l+2, "        return " . var . ";")
            let res = append(l+3, "    }")
        endif
    endif
endfunction

function! JH_java_setter()
    let type = input("Variable type: ", "")
    if type != ""
        let var  = input("Variable name: ", "")
        if var != ""
            let var2 = substitute(var, "^.", "\\u\\0", "")
            let l   = line(".")-1
            let res = append(l  , "")
            let res = append(l+1, "    public void set" . var2 . "(" . type . " " . var . ") {")
            let res = append(l+2, "       this." . var . " = " . var . ";")
            let res = append(l+3, "    }")
        endif
    endif
endfunction

function! JH_java_getset()
    let type = input("Variable type: ", "")
    if type != ""
        let var  = input("Variable name: ", "")
        if var != ""
            let var2 = substitute(var, "^.", "\\u\\0", "")
            let l   = line(".")-1
            let res = append(l  , "")
            let res = append(l+1, "    public " . type . " get" . var2 . "() {")
            let res = append(l+2, "        return " . var . ";")
            let res = append(l+3, "    }")
            let res = append(l+4, "")
            let res = append(l+5, "    public void set" . var2 . "(" . type . " " . var . ") {")
            let res = append(l+6, "       this." . var . " = " . var . ";")
            let res = append(l+7, "    }")
        endif
    endif
endfunction

inoremap <buffer> <F2> <C-O>:call JH_java_getter()<CR>
inoremap <buffer> <F3> <C-O>:call JH_java_setter()<CR>
inoremap <buffer> <F4> <C-O>:call JH_java_getset()<CR>

noremap <buffer> <F2> :call JH_java_getter()<CR>
noremap <buffer> <F3> :call JH_java_setter()<CR>
noremap <buffer> <F4> :call JH_java_getset()<CR>

inoreab <buffer> slen int len = .length();<CR><UP><END><C-O>9<LEFT>
inoreab <buffer> alen int len = .length;<CR><UP><END><C-O>7<LEFT>
inoreab <buffer> imin int min = Integer.MAX_VALUE;<CR>
inoreab <buffer> imax int max = Integer.MIN_VALUE;<CR>
inoreab <buffer> split String[] tmp = .split("\\s+");<CR><UP><END><C-O>14<LEFT>

inoreab <buffer> casecomp new java.util.Comparator() {<CR>public int compare(final Object o1, final Object o2) {<CR>String s1 = ((String)o1);<CR>String s2 = ((String)o2);<CR><CR>return s1.compareToIgnoreCase(s2);<CR>}<CR>}
inoreab <buffer> arraycomp new java.util.Comparator() {<CR>private static final int IDX = 0;<CR><CR>public int compare(final Object o1, final Object o2) {<CR>String[] s1 = ((String)o1).split("\\s+");<CR>String[] s2 = ((String)o2).split("\\s+");<CR><CR>return s1[IDX].compareTo(s2[IDX]);<CR>}<CR>}

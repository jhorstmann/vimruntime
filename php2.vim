inoreab <buffer> ß> ?>
inoreab echo echo

inoreab <buffer> _G $_GET['']<LEFT><LEFT>
inoreab <buffer> _P $_POST['']<LEFT><LEFT>
inoreab <buffer> _R $_REQUEST['']<LEFT><LEFT>
inoreab <buffer> _S $_SESSION['']<LEFT><LEFT>
inoreab <buffer> _E $_SERVER['']<LEFT><LEFT>
inoreab <buffer> _C $_COOKIE['']<LEFT><LEFT>

"inoremap <buffer> $_G $_GET['']<LEFT><LEFT>
"inoremap <buffer> $_P $_POST['']<LEFT><LEFT>
"inoremap <buffer> $_R $_REQUEST['']<LEFT><LEFT>
"inoremap <buffer> $_S $_SESSION['']<LEFT><LEFT>
"inoremap <buffer> $_E $_SERVER['']<LEFT><LEFT>
"inoremap <buffer> $_C $_COOKIE['']<LEFT><LEFT>

inoreab <buffer> thi $this->

inoreab <buffer> req require('');<LEFT><LEFT><LEFT>
inoreab <buffer> reo require_once('');<LEFT><LEFT><LEFT>

inoreab <buffer> inc include('');<LEFT><LEFT><LEFT>
inoreab <buffer> ino include_once('');<LEFT><LEFT><LEFT>

inoreab <buffer> cla class <CR>{<CR>}<CR><UP><UP><UP><END>
inoreab <buffer> fun function ()<CR>{<CR>}<UP><UP><END><LEFT><LEFT>

inoreab <buffer> fori for ($i=0; $i; $i++) {<CR>}<UP><END><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
inoreab <buffer> forj for ($j=0; $j; $j++) {<CR>}<UP><END><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

inoreab <buffer> whi while () {<CR>}<UP><END><LEFT><LEFT><LEFT>
inoreab <buffer> dow do {<CR>}<CR>while ();<LEFT><LEFT>
inoreab <buffer> swi switch () {<CR>case :<CR><C-T>break;<CR><C-D>default:<CR><C-T>break;<CR>}<UP><UP><UP><UP><UP><END><LEFT><LEFT><LEFT>

inoreab <buffer> iff if () {<CR>}<CR><UP><UP><END><LEFT><LEFT><LEFT>
inoreab <buffer> if1 if () {<CR>}<CR><UP><UP><END><LEFT><LEFT><LEFT>
inoreab <buffer> ife if () {<CR>}<CR>else {<CR>}<UP><UP><UP><END><LEFT><LEFT><LEFT>
inoreab <buffer> if2 if () {<CR>}<CR>else {<CR>}<UP><UP><UP><END><LEFT><LEFT><LEFT>
inoreab <buffer> if3 if () {<CR>}<CR>elseif () {<CR>}<CR>else {<CR>}<UP><UP><UP><UP><UP><END><LEFT><LEFT><LEFT>

inoreab <buffer> prr print_r();<LEFT><LEFT>
inoreab <buffer> prp echo "\r\n<pre>";<CR>print_r();<CR>echo "</pre>\r\n";<CR><UP><UP><END><LEFT><LEFT>

"inoreab <buffer> com /**<CR> * <CR>*/<UP><END>
"inoreab <buffer> com /**<CR><CR><bs>/<UP><END><SPACE>

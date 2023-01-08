# EasyVim

简单易用的vim配置，熟练后可大大提高开发效率（VS Code的两倍以上）。

配置还在不断打磨完善，欢迎推荐插件。

## 安装

安装过程需要从github下载很多插件，国内尽量挂VPN

```bash
git clone https://github.com/yuesong-feng/EasyVim
cd EasyVim/
sh ./install.sh 
vim
:PlugInstall
```

## 模式

| 快捷键 | 原指令 | 描述
| ----- | ----- | ----  
||esc|返回到命令模式
||i|在光标位置插入
||a|在光标后一个位置插入
||I|在行首插入
||A|在行尾插入
||o|在下方新建一行并插入
||O|在上方新建一行并插入
||s|删除光标字符并插入
||S|删除光标所在行并插入
||v|进入可视模式
||V|进入可视行模式，此时会整行选中
||control v|进入可视块模式，此时会竖行部分选中

## 光标与搜索(也可在可视模式进行选中)

| 快捷键 | 原指令 | 描述
| ----- | ----- | ----  
||(number) k或j或h或l|上下左右移动光标，前面加数字表示移动多少单位
||f char|光标移动到行内下一个char字符处
||F char|光标移动到行内上一个char字符处
|;h或;l|^或$|光标移动到行首(或行尾)
||gg或G|光标移动到文件首(或文件尾)
||M或H或L|光标移动到屏幕中间一行/第一行/最后一行
||zz或zt或zb|将当前行居中/显示为顶行/显示为第行
||zh或zl|向左(右)滚动一行
||zH或zL|向左(右)滚动半屏
||control e或y|向下(上)滚动一行
|;j或;k|control d或u|向下(上)滚动半屏
||control f或b|向下(上)滚动整屏
||/或?|正向(或反向)搜索，输入回车重复上一次搜索
||n或N|下一个(或上一个)搜索结果
|;/|:noh|取消搜索结果高亮
||control p|模糊搜索文件，需要ctrlp.vim插件

## 编辑

| 快捷键 | 原指令 | 描述
| ----- | ----- | ----  
||u|撤销
||control r|反撤销
||x|删除当前字符
||(number) r char|替换(number个)为char
||(number) dd|剪切number行，没有number表示剪切一行
||视图模式 d|剪切选中区域
||dw/de或db|剪切当前单词到词尾或词首
||D|剪切当前行到行尾
||J|删除当前行尾的换行符
||(number) yy|复制number行，没有number表示复制当前行
||视图模式 y|复制选中区域
||p|在当前位置后粘贴
||P|在当前位置前粘贴
|;w|:w|保存
|;q|:q|退出

## 窗口与跳转

| 快捷键 | 原指令 | 描述
| ----- | ----- | ----  
|;n|:NERDTreeToggle|打开目录
|;m|:TagbarToggle|打开tag列表
|control (h或j或k或l)|control w (hjkl)|在多个窗口跳转
||control w o|仅保留当前窗口
|;[1-9]||转到第n个buffer
|Tab||下一个buffer
|Shift+Tab||上一个buffer
|;b|:bd|关闭当前buffer
||gt|跳转到下一个tab
||gT|跳转到上一个tab
|;t|:shell|打开新终端，退出终端时将返回vim
||control o或i|返回光标上一个/下一个所在位置

## C/C++、LSP、代码提示补全等

| 快捷键 | 原指令 | 描述
| ----- | ----- | ----  
||control ]|跳转到定义，需要ctag文件
|;g|:ALEGoToDefinition|跳转到定义，使用LSP
|;f|:ALEFindReferences|
|;s|:ALESymbolSearch|
|;i|:ALEGoToImplementation|
|;space|:ALEHover|
|;rn|:ALERename|
|完善中|完善中|完善中


:: 设置项目名称
SET ProjectName=Priority_Queue
::设置模块名字
SET ToolName=upm-priorityqueue
::设置模块版本
SET ToolVersion=priorityqueue-0.1.3
::设置模块源路径
SET ToolAssetPath=Assets/Package

:: 进入项目文件夹
cd %ProjectName%

::此命令会创建一个ToolName的分支，并同步ToolAssetPath下的内容
git subtree split -P %ToolAssetPath% --branch %ToolName%

:: 推送到远端
git push origin %ToolName%

:: 进入package分支并进行更新
git checkout -b package
git checkout package
git add -A
git commit -m "%ToolVersion%"

:: 将所有更新提交到ToolName分支
git subtree push --prefix=%ToolAssetPath% origin %ToolName%

:: 进入ToolName并提交tag
git checkout %ToolName%
git tag -a %ToolVersion% -m "%ToolVersion%"

:: 回到main分支并进行最后的提交
git checkout main

git push origin %ToolName% %ToolVersion%
git push origin %ToolName%
pause
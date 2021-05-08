::设置模块名字
SET ToolName=upm-priorityqueue
::设置模块版本
SET ToolVersion=priorityqueue-0.1.3
::设置模块源路径
SET ToolAssetPath=Assets/

::此命令会创建一个ToolVersion的分支，并同步ToolAssetPath下的内容
git subtree split -P %ToolAssetPath% --branch tmp
:: 在ToolVersion分支设置标签ToolVersion节点
git tag %ToolVersion% tmp

:: Checkout到ToolName，把更新的内容merge进来
git branch %ToolName%
git checkout %ToolName%
git merge tmp

git branch -D tmp

:: 推送到远端
git push origin %ToolName% %ToolVersion%
git push origin %ToolName%
pause
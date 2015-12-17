-- get the date string
set theDate to (current date)
set newTag to "#Today"
set {year:y, month:m, day:d} to ((current date) - 1 * days)
set oldTag to "#" & (y * 10000 + m * 100 + d) as string
set theTitle to date string of theDate

tell application "Evernote"
	
	set theNotes to find notes "tag:" & newTag
	if (not (tag named oldTag exists)) then
		make tag with properties {name:oldTag}
	end if
	repeat with eachNote in theNotes
		assign tag oldTag to eachNote
		unassign tag newTag from eachNote
	end repeat
	
	create note notebook "@Life Online" tags {newTag, "@Diary"} title theTitle with html "
<b>日記：</b><div><br/></div><hr />
<b>學習紀錄：</b><div><br/></div><hr />
<b>任務紀錄：</b><div><br/></div><hr />
<b>反省：</b><div><br/></div><hr />
<b>覺得很重要的概念：</b><div><br/></div><hr />
<b>筆記：<div><br/></div></b>
"
end tell
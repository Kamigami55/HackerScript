-- LifeLog
--
-- Author: Yishen Chang
-- Description: 
-- 
-- An AppleScript that save what you do today to Evernote
--
-- This script is assumed to be run every day at 0:05 (or anytime after 0:00).
--
-- This script does the following things:
-- * Replace the Evernote tag "#Today" with "#<yesterday's date>". ex: #Today -> #20151216
-- * Add a new Evernote note in "@Life Online" notebook with title of today's date and with tag of "#Today" and "@Diary" and some default content.
-- * (WIP)Add your iCalender events yesterday to your yesterday's lifelog note. 
-- * (WIP)Add your Todoist to-dos that you done yesterday to your yesterday's lifelog note. 
-- * (WIP)Add your new notes' links yesterday to your yesterday's lifelog note. 



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
<b>Diary:</b><div><br/></div><hr />
<b>Learning Log:</b><div><br/></div><hr />
<b>To-do Log:</b><div><br/></div><hr />
<b>Introspection:</b><div><br/></div><hr />
<b>Important Things:</b><div><br/></div><hr />
<b>Note:<div><br/></div></b>
"
end tell
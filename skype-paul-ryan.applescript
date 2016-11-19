--------------------------------------------------------------------------------------------
--   Use Skype to Call Paul Ryan over and over and vote in favor of Obamacare
--   (the Affordable Care Act).
--
--                   WARNING: Will cost you money for each call.
--------------------------------------------------------------------------------------------
use AppleScript version "2.4"
set script_name to "Call Paul Ryan"
set num_times_to_call to 100 -- Bump this up to as much as you're willing to spend.

repeat num_times_to_call times
	tell application "Skype"
		set call_id to word 2 of (send command "CALL 2022250600" script name script_name)
		log call_id
		-- Wait for the call to connect.
		repeat
			set call_status to word 4 of (send command "GET CALL " & call_id & " STATUS" script name script_name)
			log call_status
			if call_status is "INPROGRESS" then
				exit repeat
			end if
			delay 1
		end repeat
		delay 35 -- The recording can take as long as ~35 secs to start.
		log (send command "SET CALL " & call_id & " DTMF 2" script name script_name)
		delay 5 -- Wait a couple secs for the next recording to play.
		log (send command "SET CALL " & call_id & " DTMF 1" script name script_name)
		delay 2 -- Not sure it's required to wait for them to register your vote, but it can't hurt.
		log (send command "ALTER CALL " & call_id & " HANGUP" script name script_name)
		-- Wait for the call to hang up.
		repeat
			set call_status to word 4 of (send command "GET CALL " & call_id & " STATUS" script name script_name)
			log call_status
			if call_status is "FINISHED" then
				exit repeat
			end if
			delay 1
		end repeat
	end tell
end repeat

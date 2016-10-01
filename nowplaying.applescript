-- Creates a notification with information about the currently playing track

-- Main flow
set currentlyPlayingTrack to getCurrentlyPlayingTrack()
displayTrackName(currentlyPlayingTrack)

-- Method to get the currently playing track
on getCurrentlyPlayingTrack()
	tell application "Spotify"
		set currentID to id of current track as string

		return currentID
	end tell
end getCurrentlyPlayingTrack

-- Method to create a notification
on displayTrackName(trackName)
	set artURL to do shell script "art-fetcher " & trackName
	tell application "Preview" to open "/tmp/album-art.png"

end displayTrackName

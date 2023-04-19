# Music Application

This is a Flutter application made for the assessment round of Pluto App. The aaplication allows users to view a list of tracks, select a track, and view its details, including the lyrics. The application uses three different APIs from musixmatch to get the data for the tracks and their details.


### APIs

1. API-A: https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey={your-API-key}
2. API-B: https://api.musixmatch.com/ws/1.1/track.get?track_id=TRACK_ID&apikey={your-API-key}
3. API-C: https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=TRACK_ID&apikey={your-API-key}



* API-A is used to get a list of tracks available on musixmatch. The API returns a list of tracks with their names, artists, albums, and other details. To use this API, the application sends a GET request to the URL with the API key, and the API returns the list of tracks with their TRACK_IDs.

* API-B is used to get the details of a selected track. When the user selects a track from the list, the TRACK_ID of that track is passed on to the next screen, and the application uses API-B to get the details of the track. The API returns the track name, artist name, album name, track rating, and other details. To use this API, the application sends a GET request to the URL with the TRACK_ID and the API key, and the API returns the details of the track.

* API-C is used to get the lyrics of the selected track. When the user selects a track from the list, the TRACK_ID of that track is passed on to the next screen, and the application uses API-C to get the lyrics of the track. The API returns the lyrics of the track. To use this API, the application sends a GET request to the URL with the TRACK_ID and the API key, and the API returns the lyrics of the track.

The application has two screens. The first screen is the Home Screen, which displays a list of tracks available on musixmatch using API-A. The list of tracks is displayed in a ListView widget, and each track is displayed in a ListTile widget. When the user taps on a track, the TRACK_ID of that track is passed on to the next screen.

The second screen is the Track Screen, which displays the track details and lyrics of the selected track using API-B and API-C, respectively. The track details are displayed in a Card widget, and the lyrics are displayed in a Text widget. The user can go back to the Home Screen by tapping the back button in the AppBar.




## Getting Started

To use this application, you need to follow these steps:

1. Clone this repository: `git clone https://github.com/aadityaagrawal/music-app-flutter.git`

2. Create an account at musixmatch to generate an API key: `https://developer.musixmatch.com/documentation`

3. Add your API key `const String API_KEY = '<your-API-key>';`

4. Get the dependencies using: `flutter pub get`

5. Run the application: `flutter run`


## Future Work:

1. Convert the application into BLoC architecture.
2. Improve the existing UI.

## Contribution

Contributions to this repository are welcome. If you find any bugs or have any suggestions, please create an issue or a pull request.

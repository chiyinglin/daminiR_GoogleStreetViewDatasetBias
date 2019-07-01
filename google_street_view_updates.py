import google_streetview.api
import ge
apiargs = {
  'location': '46.414382,10.013988;40.720032,-73.988354',
    # add your key from Google API
    'key': ''
}

api_list = google_streetview.helpers.api_list(apiargs)

results = google_streetview.api.results(api_list)

results.preview()

results.save_metadata('metadata.json')
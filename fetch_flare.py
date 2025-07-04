import json
import requests
import os.path
import time

past_day_url = 'https://services.swpc.noaa.gov/json/goes/primary/xrays-1-day.json'
flare_url = 'https://services.swpc.noaa.gov/json/goes/primary/xray-flares-7-day.json'

def fetch_json_from_url(url, filename):

    filename = filename + '.json'
    res = requests.get(url)
    data = json.loads(res.text)

    with open(filename, 'w') as f:
        json.dump(data, f)

def get_json_from_file(filename):
    
    filename = filename + '.json'

    with open(filename, 'r') as f:
        data = json.load(f)

    return data

def get_past_day_data(data):

    now = time.time()
    past_day_data = []

    for d in data:
        fl_time = time.strptime(d['time_tag'], "%Y-%m-%dT%H:%M:%SZ")
        fl_time = time.mktime(fl_time)
        
        if now - fl_time < 24 * 60 * 60:
            past_day_data.append(d)
        
    return past_day_data 

def gen_plot_strings(data):
    return "Max class " + data['max_class'] + " flare occured at " + data['begin_time'] + " and ended at " + data["end_time"]
    
def get_sig_flare(data):
    for d in data:
        fl_int = d['max_class']
        if fl_int[0] == 'M' or fl_int[0] == 'X':
            print(gen_plot_strings(d))
            
if __name__ == "__main__":
    
    now = time.time()

    if not os.path.isfile('flare.json') or now - os.path.getmtime('flare.json') > 20 * 60 * 60:
        fetch_json_from_url(flare_url, 'flare')

    if not os.path.isfile('past_day.json') or now - os.path.getmtime('past_day.json') > 20 * 60 * 60:
        fetch_json_from_url(past_day_url, 'past_day')

    flare_json = get_json_from_file('flare')
    pdd = get_past_day_data(flare_json)
    get_sig_flare(pdd)

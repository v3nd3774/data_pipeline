import json
import requests
from datetime import datetime
class Reddit:
  def __init__(self, interval="hour"):
    self.format_str = "%a, %d %b %Y"
    self.supported_intervals = ["hour", "day", "week", "month", "year", "all"]
    if interval in self.supported_intervals:
      self.interval = interval
    else:
      raise ValueError(
        "Please use one of the supported intervals (%s) instead of: %s" \
        % (",".join(self.supported_intervals), interval)
      )
    self.url = "http://www.reddit.com/r/all/top.json"
    self.options = {'t':interval}
    self.headers = {'User-agent':'Simple Bot'}
    self.kwargs = {"headers":self.headers, "data":self.options}

  def poll(self):
    """Method returns the latest top post titles from r/all"""
    response = requests.get(self.url, **self.kwargs)
    def extract_target_data(child):
      data = child['data']
      return json.dumps({
        "title": data['title'],
        "url": data['url'],
        "time": datetime.fromtimestamp(data['created_utc']).strftime(self.format_str)
      })
    return map(
      extract_target_data,
      json.loads(response.text)['data']['children']
    )

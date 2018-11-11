import json
import requests
import time
from datetime import datetime
from random import randint
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

  def poll(self):
    """Method continuously returns the latest top post titles from r/all"""
    while True:
      time.sleep(15)
      num_posts = randint(25,100)
      request_options = self.options.copy()
      request_options.update({'limit':num_posts})
      request_arguments = {"headers":self.headers, "data":request_options}
      response = requests.get(self.url, **request_arguments)
      def extract_target_data(child):
        data = child['data']
        return json.dumps({
          "title": data['title'],
          "url": data['url'],
          "time": datetime.fromtimestamp(data['created_utc']).strftime(self.format_str)
        })
      children = json.loads(response.text)['data']['children']
      print "Producing batch of %s reddit posts..." % len(children)
      yield map(extract_target_data, children)

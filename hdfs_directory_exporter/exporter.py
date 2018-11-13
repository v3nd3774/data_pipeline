import sys
from snakebite.client import Client
from flask import Flask, render_template, Response
app = Flask(__name__)
print __name__
print "ARGS=%s" % str(sys.argv)

@app.route("/")
def index():
  print "Recieved index request..."
  return render_template("index.html")

@app.route("/metrics")
def metrics():
  print "Recieved metrics request..."
  metric_prefix = "hdfs_directory_stats"
  metrics = {"the_number_one":"1"}
  c = Client("namenode",8020)
  filepaths = map(lambda entry: entry['path'], c.ls([sys.argv[1]]))
  lines = reduce(lambda a, b: a + b, [1 for f in c.cat(filepaths) for _ in f])
  metrics['lines_of_text_in_directory'] = lines
  template_kwargs = {
    'metrics': metrics,
    'dir': sys.argv[1],
    'metric_prefix': metric_prefix
  }
  return Response(
    render_template("metrics", **template_kwargs),
    mimetype='text/plain'
  )

if __name__ == "__main__":
  print "Running Flask Application"

  def health_check():
    c = Client("namenode",8020)
    print "Checking for %s directory..." % sys.argv[1]
    for top_level in c.ls([sys.argv[1]]):
      print "DIR CHILD=%s" % top_level['path']
    print "Ok!"
  health_check()

  server_parameters = {
    'host':"0.0.0.0",
    'threaded': True,
    'debug': True,
    'port': 42069
  }
  app.run(**server_parameters)

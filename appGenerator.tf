# This file automatically creates dummy application code and zips it
# so you don't need to manually create files to run this demo.

# --- V1 Application Code ---
resource "local_file" "app_v1_index" {
  content  = <<EOF
const http = require('http');
const port = process.env.PORT || 8080;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Welcome to Version 1.0 - Blue Environment\n');
});

server.listen(port, () => {
  console.log('Server running on port ' + port);
});
EOF
  filename = "${path.module}/app-v1/index.js"
}

data "archive_file" "app_v1_zip" {
  type        = "zip"
  source_dir  = "${path.module}/app-v1"
  output_path = "${path.module}/app-v1.zip"
  depends_on  = [local_file.app_v1_index]
}

# --- V2 Application Code ---
resource "local_file" "app_v2_index" {
  content  = <<EOF
const http = require('http');
const port = process.env.PORT || 8080;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Welcome to Version 2.0 - Green Environment\n');
});

server.listen(port, () => {
  console.log('Server running on port ' + port);
});
EOF
  filename = "${path.module}/app-v2/index.js"
}

data "archive_file" "app_v2_zip" {
  type        = "zip"
  source_dir  = "${path.module}/app-v2"
  output_path = "${path.module}/app-v2.zip"
  depends_on  = [local_file.app_v2_index]
}
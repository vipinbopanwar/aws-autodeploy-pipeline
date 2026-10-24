from flask import Flask, jsonify, render_template_string
import os
from datetime import datetime, timezone

app = Flask(__name__)

HTML_TEMPLATE = """
<!DOCTYPE html>
<html>
<head>
  <title>Production AWS Deployment</title>
  <style>
    body { font-family: Arial, sans-serif; text-align: center; margin-top: 60px; background-color: #f4f6f8; }
    .card { background: white; padding: 40px; border-radius: 10px; display: inline-block; box-shadow: 0 4px 10px rgba(0,0,0,0.1); max-width: 500px; }
    h1 { color: #232f3e; margin-bottom: 10px; }
    p { color: #555; font-size: 16px; }
    .badge { background: #0073bb; color: white; padding: 6px 14px; border-radius: 20px; font-weight: bold; font-size: 14px; }
    .footer { margin-top: 25px; font-size: 12px; color: #888; }
  </style>
</head>
<body>
  <div class="card">
    <h1>🚀 Live Production Deployment</h1>
    <p>Automated via <b>GitHub Actions</b> &amp; <b>AWS CodeDeploy</b></p>
    <p><span class="badge">Stack: Python (Flask) on AWS EC2</span></p>
    <div class="footer">Status: Healthy | Zero-Downtime Rolling Deployment</div>
  </div>
</body>
</html>
"""

@app.route("/")
def home():
    return render_template_string(HTML_TEMPLATE)

@app.route("/health")
def health():
    return jsonify({
        "status": "UP",
        "timestamp": datetime.now(timezone.utc).isoformat()
    }), 200

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)

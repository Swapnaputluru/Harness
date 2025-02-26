from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return """
    <h1>Welcome to My Python Web App</h1>
    <p>This is a simple Flask application.</p>
    <h2>Harness Deployment Info</h2>
    <ul>
        <li>🚀 Harness supports CI/CD for cloud-native applications.</li>
        <li>🛠️ You can implement <strong>chained pipelines</strong> for CI → Infra → CD.</li>
        <li>📦 Supports Docker & Kubernetes deployments with rollback strategies.</li>
        <li>🔄 Blue-Green & Canary deployments are built-in.</li>
        <li>✅ Feature flags can be used for controlled releases.</li>
    </ul>
    <p>Check <a href="https://developer.harness.io">Harness Docs</a> for more details.</p>
    """

@app.route('/health')
def health_check():
    return jsonify({"status": "ok", "message": "App is running successfully on port 80"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)

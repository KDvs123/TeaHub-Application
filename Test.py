import re
from inference_sdk import InferenceHTTPClient
from flask import Flask, request, jsonify
#adding test
app = Flask(__name__)

CLIENT = InferenceHTTPClient(
    api_url="https://detect.roboflow.com",
    api_key="gVEkgrUY1EUbfWvTp6pC"
)

@app.route('/')
def home():
    return 'Tea Leaf Disease Classification ML API is running.'

@app.route('/predict', methods=['POST'])
def predict():
    # Check if 'image' key is present in the JSON request
    if 'image' not in request.json:
        return jsonify({'error': 'No image provided'})

    # Extract base64 image data
    base64_img = request.json['image']
    # Remove the header from the base64 string
    base64_data = re.sub('^data:image/.+;base64,', '', base64_img)

    # Pass the image bytes to the inference SDK
    result = CLIENT.infer(base64_data, model_id="tea-leaf-diiseases/1")

    if 'predictions' in result and len(result['predictions']) > 0:
        first_prediction = result['predictions'][0]
        tea_leaf_class = first_prediction.get('class', None)

        if tea_leaf_class:
            return jsonify({'predicted_class': tea_leaf_class})
        else:
            return jsonify({'error': 'No tea leaf class detected'})
    else:
        return jsonify({'error': 'No predictions found in the result'})

if __name__ == '__main__':
    app.run(debug=True)

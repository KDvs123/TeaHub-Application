from flask import Flask, jsonify
import requests
from bs4 import BeautifulSoup
# import json

url = 'https://ycharts.com/indicators/colombo_tea_price'

headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'}

# Fetch the webpage content
response = requests.get(url, headers=headers)


def extract_values_from_html(html_content, target_texts):
    # Parse HTML content
    soup = BeautifulSoup(html_content, 'html.parser')

    # Initialize an empty dictionary to store extracted values
    result_dict = {}

    # Loop through each target text
    for target_text in target_texts:
        # Find all td tags containing the target text
        td_tags_with_target_text = soup.find_all('td', text=target_text)

        # Initialize an empty list to store extracted values for the current target text
        td_values = []

        # Iterate through td tags containing the target text
        for td_tag in td_tags_with_target_text:
            # Get the parent tr tag
            tr_tag = td_tag.parent  
            if tr_tag:
                # Find all td tags in the same row
                td_tags_in_same_row = tr_tag.find_all('td')  
                if td_tags_in_same_row:
                    # Append text content of td elements to td_values
                    td_values.append([elem.text.strip() for elem in td_tags_in_same_row])  
        
        # Add extracted values to the result dictionary
        result_dict[target_text] = td_values
    
    modified_data = {}

    # Iterate through each key-value pair in the original JSON data
    for key, value in result_dict.items():
        # Extract the second element from the nested array
        modified_value = value[0][1]
        # Assign the modified value to the corresponding key in the new dictionary
        modified_data[key] = modified_value

    # Print the modified JSON
    return modified_data

# List of target td tag values
target_texts = [
    "Last Value", 
    "Latest Period", 
    "Last Updated", 
    "Next Release", 
    "Average Growth Rate", 
    "Value from Last Month", 
    "Change from Last Month", 
    "Value from 1 Year Ago", 
    "Change from 1 Year Ago", 
    "Frequency" ,
    "Unit" 
    ]

json_data = extract_values_from_html(response.content, target_texts)

app = Flask(__name__)

@app.route('/api/tea_stats', methods=['GET'])
def get_json_data():
    return jsonify(json_data)
    # return json.dumps(json_data)

if __name__ == '__main__':
    app.run(debug=True)
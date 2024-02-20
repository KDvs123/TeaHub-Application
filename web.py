from chain import get_chain
import streamlit as st
import speech_recognition as sr

def is_tea_related(answer):
    # Implement a logic to determine if the answer is related to tea topics
    tea_keywords = ['tea cultivation', 'tea diseases', 'treatment suggestions','tea plants','tea','tea plantation','CamelliaSinensis','BioControl'];
    answer_lower = answer.lower()

     # Check if at least one tea-related keyword is present in the entire answer
    return any(keyword in answer_lower for keyword in tea_keywords)



# URL for the logo of the assistant bot
# We need it as a separate variable because it's used in multiple places
bot_logo = 'https://pbs.twimg.com/profile_images/1739538983112048640/4NzIg1h6_400x400.jpg'



chain = get_chain()




def speech_to_text():
    recognizer=sr.Recognizer()
    mic=sr.Microphone()

    with mic as source:
        st.info("Listening.......")
        recognizer.adjust_for_ambient_noise(source)
        audio=recognizer.listen(source,timeout=None)
        try:
            st.info("Processing.....")
            query=recognizer.recognize_google(audio)
            return query
        except sr.UnknownValueError:
            st.error("Sorry, I could not understand what you said.")
            return None
        except sr.RequestError as e:
            st.error("Could not request results from Google Speech Recognition service; {0}".format(e))
            return None
    
# We use st.session_state and fill in the st.session_state.messages list
# It's empty in the beginning, so we add the first message from the bot
if 'messages' not in st.session_state:
    st.session_state['messages'] = [{"role": "bot",
                                     "content": "Hello, how can I help?"}]
    
# Then we show all the chat messages in Markdown format
for message in st.session_state['messages']:
    if message["role"] == 'bot':
        with st.chat_message(message["role"], avatar=bot_logo):
            st.markdown(message["content"])
    else:
        with st.chat_message(message["role"]):
            st.markdown(message["content"])

# We ask for the user's question, append it to the messages and show below
input_type = st.radio("Select input type:", ("Text", "Speech"))
if input_type == "Text":
    query_input = st.text_input("Please ask your question here:")
elif input_type == "Speech":
    query_input = st.button("Speak")
    if query_input:
        query_input = speech_to_text()

if query_input:
    st.session_state.messages.append({"role": "user", "content": query_input})
    with st.chat_message("user"):
        st.markdown(query_input)

    # Generate response from the chatbot
    result = chain({"question": query_input})

    # Create a new chat message and display the result
    with st.chat_message("assistant", avatar=bot_logo):
        message_placeholder = st.empty()

        # Check if the answer is tea-related before displaying
        if is_tea_related(result['answer']):
            message_placeholder.markdown(result['answer'])
        else:
            st.warning("The answer may not be directly related to tea cultivation, diseases, or treatment plans.")



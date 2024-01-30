from chain import get_chain
import sys

chain=get_chain()

 
while True:
    query = input('Prompt (or type "exit" to quit): ')
 
    if query == "exit":
        print('Exiting')
        sys.exit()
 
    response = chain({"question": query})
 
    print("Answer: " + response["answer"])
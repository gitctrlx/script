import argparse
from sys import stdout
from openai import OpenAI

def chat_with_model():
    client = OpenAI(base_url="http://192.168.0.103:3000/v1", api_key="_")

    while True:
        prompt = input("Enter your prompt (or 'exit' to quit): ")
        if prompt.lower() in ["exit", "quit"]:
            print("Exiting the chat.")
            break

        response = client.completions.create(
            model="ensemble",
            temperature=0.5,
            prompt=f"你是一个智能AI助手,旨在帮助用户解决各种问题。这是用户的问题 '{prompt}' 请提供详细、准确和有帮助的回答，并确保回应内容专业且有条理。",
            stream=True,
            max_tokens=1024
        )

        for event in response:
            if not isinstance(event, dict):
                event = event.model_dump()
            event_text = event["choices"][0]["text"]
            stdout.write(event_text)
            stdout.flush()
        
        print("\n")

if __name__ == "__main__":
    chat_with_model()

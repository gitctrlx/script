import argparse
from sys import stdout
from openai import OpenAI

parser = argparse.ArgumentParser(description="Generate text using OpenAI API.")
parser.add_argument("prompt", type=str, help="The prompt to generate text from.")
args = parser.parse_args()

client = OpenAI(base_url="http://192.168.0.103:3000/v1", api_key="_")

response = client.completions.create(
    model="ensemble",
    temperature=0.5,
    prompt=args.prompt,
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

# python chat.py "请你写一个CUDA代码，实现矩阵乘法。"
from flask import Flask, render_template
import random

app = Flask(__name__)

# list of fox images，用来进行页面展示的
images = [
 "https://media0.giphy.com/media/Ko5dZRMv9uJFu/giphy.gif",
 "https://media.tenor.com/images/6461359b4205a95bf1f4374a3aa2acec/tenor.gif",
 "https://i.imgur.com/dUBv79d.gif",
 "https://media2.giphy.com/media/dvBgr7pA6FTJOMOALY/giphy.gif",
 "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/45dfcad0-23ff-4af4-8c3f-b4b68f6edab4/d5hxh3z-aac8f004-e5db-4030-8e0c-62b899b4d0ce.gif"
    ]

@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")

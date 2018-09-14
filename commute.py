import googlemaps
import requests
import sys

#Declarations
token = '' # Enter your Google API Token
start = sys.argv[1]
end = sys.argv[2]
bot_token = '' # Enter your Telegram bot token here
chat_id = '' # Enter your Telegram chat id here

def commute( start, end):
    # Get directions
    client = googlemaps.Client(key=token)
    try:
        directions = client.directions(start,end,alternatives=True)
    # Prepare data
        table = dict()
        for i in range(len(directions)):
            table.setdefault(directions[i]["summary"])
            table[directions[i]["summary"]] = directions[i]["legs"][0]["duration"]["text"]

        result_list = []
        for key,value in table.items():
            result_list.append(' '.join([key,':',value, "\n"]))
    except:
        error = 'Error during processing'
        print( error)
    return result_list

def send_tele( result_list, bot_token = bot_token, chat_id = chat_id):
    try:
        # Get request and send message via bot
        message = ''.join(result_list)

        requests.get('https://api.telegram.org/bot{}/sendMessage?chat_id={}&text={}'.format(
                                        bot_token, chat_id, message))

    except:
        error = 'Error during processing'
        requests.get('https://api.telegram.org/bot{}/sendMessage?chat_id={}&text={}'.format(
                                        bot_token, chat_id, error))

if __name__ == '__main__':
    result_list = commute( start, end)
    send_tele( result_list, bot_token = bot_token, chat_id = chat_id)


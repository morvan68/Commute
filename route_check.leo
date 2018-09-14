<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="martin.20180914202302.2" a="E"><vh>@clean ./commute.py</vh>
<v t="martin.20180914202302.3"><vh>Declarations</vh></v>
<v t="martin.20180914203343.1"><vh>defaults</vh></v>
<v t="martin.20180914202542.1"><vh>commute</vh></v>
<v t="martin.20180914202850.1"><vh>send telegram</vh></v>
<v t="martin.20180914202412.1"><vh>__main__</vh></v>
</v>
<v t="martin.20180914213853.1" a="E"><vh>@clean check_route.py</vh>
<v t="martin.20180914213928.1"><vh>imports</vh></v>
<v t="martin.20180914213945.1"><vh>check route</vh></v>
<v t="martin.20180914214237.1"><vh>results list to list of roads</vh></v>
<v t="martin.20180914213935.1"><vh>__main__</vh></v>
</v>
<v t="martin.20180914214614.1" a="E"><vh>@clean get_roads.py</vh>
<v t="martin.20180914214648.1"><vh>imports</vh></v>
<v t="martin.20180914214749.1"><vh>get_sus_roads</vh></v>
</v>
<v t="martin.20180914202302.5" a="E"><vh>@auto ./README.md</vh></v>
</vnodes>
<tnodes>
<t tx="martin.20180914202302.2">@others
@language python
@tabwidth -4
</t>
<t tx="martin.20180914202302.3">import googlemaps
import requests
import sys

</t>
<t tx="martin.20180914202412.1">if __name__ == '__main__':
    result_list = commute( start, end)
    send_tele( result_list, bot_token = bot_token, chat_id = chat_id)

</t>
<t tx="martin.20180914202542.1">def commute( start, end):
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

</t>
<t tx="martin.20180914202850.1">def send_tele( result_list, bot_token = bot_token, chat_id = chat_id):
    try:
        # Get request and send message via bot
        message = ''.join(result_list)

        requests.get('https://api.telegram.org/bot{}/sendMessage?chat_id={}&amp;text={}'.format(
                                        bot_token, chat_id, message))

    except:
        error = 'Error during processing'
        requests.get('https://api.telegram.org/bot{}/sendMessage?chat_id={}&amp;text={}'.format(
                                        bot_token, chat_id, error))

</t>
<t tx="martin.20180914203343.1">#Declarations
token = '' # Enter your Google API Token
start = sys.argv[1]
end = sys.argv[2]
bot_token = '' # Enter your Telegram bot token here
chat_id = '' # Enter your Telegram chat id here

</t>
<t tx="martin.20180914213853.1">@others
</t>
<t tx="martin.20180914213928.1">import sys

import commute
import get_roads

</t>
<t tx="martin.20180914213935.1">if __name__ == '__main__':

    start = sys.argv[1]
    end = 'curtin university, bentley'
    
    results_list = commute.commute( start, end)
    road_list = res_to_roads( results_list)
    sus_list = get_roads.get_sus_roads()
    v_sus_list = check_route( road_list, sus_list)
    commute.send_tele( v_sus_list)

</t>
<t tx="martin.20180914213945.1">def check_route( road_list, sus_list):
    v_sus_roads = []
    for rd in road_list:
        if rd in sus_list:
            v_sus_roads.append( rd)
    return v_sus_roads

</t>
<t tx="martin.20180914214237.1">def res_to_roads( res_list):
    ...

</t>
<t tx="martin.20180914214614.1">@others
</t>
<t tx="martin.20180914214648.1">import pyPDF

</t>
<t tx="martin.20180914214749.1">def get_sus_roads():
    url = ''
    rd_list = []
    #get pdf
    #parse pdf
    return rd_list

</t>
</tnodes>
</leo_file>

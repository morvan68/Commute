import commute
import get_roads
def check_route( road_list, sus_list):
    v_sus_roads = []
    for rd in road_list:
        if rd in sus_list:
            v_sus_roads.append( rd)
    return v_sus_roads

def res_to_roads( res_list):
    ...

if __name__ == '__main__':

    start = '5 katta pl, gooseberry hill, 6076'
    end = 'curtin university, bentley'
    
    results_list = commute.commute( start, end)
    road_list = res_to_roads( results_list)
    sus_list = get_roads.get_sus_roads()
    v_sus_list = check_route( road_list, sus_list)
    commute.send_tele( v_sus_list)


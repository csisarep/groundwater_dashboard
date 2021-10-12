import plotly.express as px
import plotly.graph_objects as go
import calendar
import pandas as pd
import os

def create_histBankeGraph():
    data = pd.read_csv("./data/historical_wells_tall.csv")
    data['value'] = data['value'].apply(pd.to_numeric, errors='coerce')
    data["monthNum"] = pd.to_datetime(data.month, format='%b', errors='coerce').dt.month
    data["Date"]=data["year"].astype(str)+"-"+data["monthNum"].astype(str)+"-15"
    x = ["#440154" ,"#481B6D" ,"#46337E", "#3F4889" ,"#365C8D", "#2E6E8E", "#277F8E",
                 "#21908C", "#1FA187", "#2DB27D", "#4AC16D", "#71CF57", "#9FDA3A", "#CFE11C", "#FDE725"]

    colors = {}
    years_in_cols = data['year'].unique().tolist()
    for i in range(len(years_in_cols)):
        colors = {i: j for i,j in zip(years_in_cols, x)}
        # print(colors)
    fig = px.line(data, x= 'Date',y = 'value', color = 'location', color_discrete_map= colors)
                  
                # for d in fig['data']:
                #     print(d)
                #     d['line']['color']='grey'
                # fig = go.Figure(data=go.Scatter(x=data["month"], y=data['value'], color = data['year']), 
                # layout = go.Layout(margin = {'l':0, 't': 25, 'r' : 0, 'l' : 0}))
    fig.update_layout(title=f'Groundwater level of Banke (2001-2015)',
    xaxis_title='Months',
    yaxis_title='Groundwater in mbgl',
    yaxis_range=[-1,10]),
    fig.update_yaxes(autorange="reversed")
    fig.update_layout(
    xaxis=dict(
            rangeselector=dict(
                buttons=list([
                    dict(count=1,
                         label="1m",
                         step="month",
                         stepmode="backward"),
                    dict(count=6,
                         label="6m",
                         step="month",
                         stepmode="backward"),
                    dict(count=1,
                         label="YTD",
                         step="year",
                         stepmode="todate"),
                    dict(count=1,
                         label="1y",
                         step="year",
                         stepmode="backward"),
                    dict(step="all")
                ])
            ),
            rangeslider=dict(
                visible=True
            ),
            type="date"
        )
        )
    fig.write_html("template/hist_banke_line_graph.html")    
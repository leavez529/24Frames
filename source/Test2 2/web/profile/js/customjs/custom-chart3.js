'use strict'
//chart page 3 charts settings
var option = {
    title: {
        text: '折线图堆叠'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data: ['邮件营销', '联盟广告', '视频广告', '直接访问', '搜索引擎']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
    },
    yAxis: {
        type: 'value'
    },
    series: [
        {
            name: '邮件营销',
            type: 'line',
            stack: '总量',
            data: [120, 132, 101, 134, 90, 230, 210]
        },
        {
            name: '联盟广告',
            type: 'line',
            stack: '总量',
            data: [220, 182, 191, 234, 290, 330, 310]
        },
        {
            name: '视频广告',
            type: 'line',
            stack: '总量',
            data: [150, 232, 201, 154, 190, 330, 410]
        },
        {
            name: '直接访问',
            type: 'line',
            stack: '总量',
            data: [320, 332, 301, 334, 390, 330, 320]
        },
        {
            name: '搜索引擎',
            type: 'line',
            stack: '总量',
            data: [820, 932, 901, 934, 1290, 1330, 1320]
        }
    ]
};

var colors = ['#5793f3', '#d14a61', '#675bba'];

var x_alias = ['1w', '2w', '3w', '4w', '5w', '6w', '7w', '8w', '9w', '10w',
                '11w', '12w', '13w', '14w', '15w', '16w', '17w', '18w', '19w', '20w',
                '21w', '22w', '23w', '24w', '25w', '26w', '27w', '28w', '29w', '30w',
                '31w', '32w', '33w', '34w', '35w', '36w', '37w', '38w', '39w', '40w',
                '41w', '42w', '43w', '44w', '45w', '46w', '47w', '48w', '49w', '50w',
                '51w', '52w', '53w', '54w', '55w', '56w', '57w', '58w', '59w', '60w',
                '61w', '62w', '63w', '64w', '65w', '66w', '67w', '68w', '69w', '70w'
    ]

var option_axes = {
    title: {
        text: '轮对数据检测'
    },
    color: colors,

    tooltip: {
        trigger: 'none',
        axisPointer: {
            type: 'cross'
        }
    },
    legend: {
        data: ['50%', '60%', '70%', '80%']
    },
    grid: {
        top: 70,
        bottom: 50
    },
    xAxis: [
        {
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            axisLine: {
                onZero: false,
                lineStyle: {
                    color: colors[1]
                }
            },
            // axisPointer: {
            //     label: {
            //         formatter: function (params) {
            //             return '检测值  ' + params.value
            //                 + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
            //         }
            //     }
            // },
            data: x_alias
        },
        {
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            axisLine: {
                onZero: false,
                lineStyle: {
                    color: colors[0]
                }
            },
            // axisPointer: {
            //     label: {
            //         formatter: function (params) {
            //             return '检测值  ' + params.value
            //                 + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
            //         }
            //     }
            // },
            data: x_alias
        },
        {
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            axisLine: {
                onZero: false,
                lineStyle: {
                    color: colors[0]
                }
            },
            // axisPointer: {
            //     label: {
            //         formatter: function (params) {
            //             return '检测值  ' + params.value
            //                 + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
            //         }
            //     }
            // },
            data: x_alias
        },
        {
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            axisLine: {
                onZero: false,
                lineStyle: {
                    color: colors[0]
                }
            },
            // axisPointer: {
            //     label: {
            //         formatter: function (params) {
            //             return '检测值  ' + params.value
            //                 + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
            //         }
            //     }
            // },
            data: x_alias
        },
        {
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            axisLine: {
                onZero: false,
                lineStyle: {
                    color: colors[0]
                }
            },
            // axisPointer: {
            //     label: {
            //         formatter: function (params) {
            //             return '检测值  ' + params.value
            //                 + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
            //         }
            //     }
            // },
            data: x_alias
        }
    ],
    yAxis: [
        {
            type: 'value'
        }
    ],
    series: [
        {
            name: '50%',
            type: 'line',
            xAxisIndex: 0,
            smooth: true,
            data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
        },
        {
            name: '60%',
            type: 'line',
            xAxisIndex: 1,
            smooth: true,
            data: [3.9, 5.9, 11.1, 18.7, 48.3, 69.2, 231.6, 46.6, 55.4, 18.4, 10.3, 0.7]
        },
        {
            name: '70%',
            type: 'line',
            // xAxisIndex: 3,
            smooth: true,
            data: [3.9, 5.9, 11.1, 18.7, 48.3, 69.2, 231.6, 46.6, 55.4, 18.4, 10.3, 0.7]
        },
        {
            name: '80%',
            type: 'line',
            // xAxisIndex: 4,
            smooth: true,
            data: [3.9, 5.9, 11.1, 18.7, 48.3, 69.2, 231.6, 46.6, 55.4, 18.4, 10.3, 0.7]
        },
        {
            name: '90%',
            type: 'line',
            // xAxisIndex: ,
            smooth: true,
            data: [3.9, 5.9, 11.1, 18.7, 48.3, 69.2, 231.6, 46.6, 55.4, 18.4, 10.3, 0.7]
        }
    ]
};


var option_stack = {
    title: {
        text: '堆叠柱状图'
    },
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    legend: {
        data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎','百度','谷歌','必应','其他']
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : ['周一','周二','周三','周四','周五','周六','周日']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'直接访问',
            type:'bar',
            data:[320, 332, 301, 334, 390, 330, 320]
        },
        {
            name:'邮件营销',
            type:'bar',
            stack: '广告',
            data:[120, 132, 101, 134, 90, 230, 210]
        },
        {
            name:'联盟广告',
            type:'bar',
            stack: '广告',
            data:[220, 182, 191, 234, 290, 330, 310]
        },
        {
            name:'视频广告',
            type:'bar',
            stack: '广告',
            data:[150, 232, 201, 154, 190, 330, 410]
        },
        {
            name:'搜索引擎',
            type:'bar',
            data:[862, 1018, 964, 1026, 1679, 1600, 1570],
            markLine : {
                lineStyle: {
                    normal: {
                        type: 'dashed'
                    }
                },
                data : [
                    [{type : 'min'}, {type : 'max'}]
                ]
            }
        },
        {
            name:'百度',
            type:'bar',
            barWidth : 5,
            stack: '搜索引擎',
            data:[620, 732, 701, 734, 1090, 1130, 1120]
        },
        {
            name:'谷歌',
            type:'bar',
            stack: '搜索引擎',
            data:[120, 132, 101, 134, 290, 230, 220]
        },
        {
            name:'必应',
            type:'bar',
            stack: '搜索引擎',
            data:[60, 72, 71, 74, 190, 130, 110]
        },
        {
            name:'其他',
            type:'bar',
            stack: '搜索引擎',
            data:[62, 82, 91, 84, 109, 110, 120]
        }
    ]
};


// 基于准备好的dom，初始化echarts实例
var myChart_axes = echarts.init(document.getElementById('main-line'));

// 使用刚指定的配置项和数据显示图表。
myChart_axes.setOption(option);



// $(".menu .item").tab.settings.onFirstLoad = function (tabPath) {
//     switch (tabPath) {
//         case 'second':
//             // 基于准备好的dom，初始化echarts实例
//             var myChart_axes = echarts.init(document.getElementById('main-axes'));
//
//             // 使用刚指定的配置项和数据显示图表。
//             myChart_axes.setOption(option_axes);
//             break;
//
//         case 'third':
//             // 基于准备好的dom，初始化echarts实例
//             var myChart_third = echarts.init(document.getElementById('main-third'));
//
//             // 使用刚指定的配置项和数据显示图表。
//             myChart_third.setOption(option_stack);
//
//         default:
//
//     }
// };

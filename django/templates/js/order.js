$(function () {
    var order_shipping = {
        count: {
            free: window.shipping.free,
            others: window.shipping.others
        },
        percentage: {
            free: calculate_percentage(window.shipping.free, window.shipping.free + window.shipping.others),
            others: calculate_percentage(window.shipping.others, window.shipping.free + window.shipping.others)
        }
    }

    function calculate_percentage(count, sum) {
        return Math.round(((count / sum) * 100));
    }

    var ctx = document.getElementById('myChart').getContext('2d');
    var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: [`免運 ${order_shipping.percentage.free}%`, `非免運 ${order_shipping.percentage.others}%`],
            datasets: [{
                label: '訂單免運比例圓餅圖',
                data: [order_shipping.count.free, order_shipping.count.others],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                ],
                borderWidth: 1
            }]
    	},
        options: {
            tooltips: {
                callbacks: {
                    label: function (item, data) {
                        let dataset = data.datasets[item.datasetIndex];
                        let sum = order_shipping.count.free + order_shipping.count.others;
                        let curr_val = dataset.data[item.index];

                        return `${data.labels[item.index]}: ${curr_val}`;
                    }
                }
            },
            legend: {
                display: true,
                onClick: function() {
                    return;
                }
            }, 
        }
    });

    var line_ctx = document.getElementById('myLineChart').getContext('2d');
    var myLineChart = new Chart(line_ctx, {
        "type": "line",
        "data": {
            "labels": window.cohort_data.dates,
            "datasets": [{
                "label": "客戶下訂行為",
                "data": window.cohort_data.counts,
                "fill": false,
                "borderColor": "rgb(75, 192, 192)",
                "lineTension": 0
            }]
        },
        "options":{}
    });
});

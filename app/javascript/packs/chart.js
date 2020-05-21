import Chart from 'chart.js';
$(document).on('turbolinks:load', function(){
  let week_chart = $('#week_chart');
  let month_chart = $('#month_chart');
  let year_chart = $('#year_chart');
  let weekChart = new Chart(week_chart, {
    type: 'bar',
    data: {
        labels: gon.this_week,
        datasets: [{
            label: '今週解いた問題数',
            data: gon.count_by_day_week,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255, 99, 132, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
  });
  let yearChart = new Chart(year_chart, {
    type: 'bar',
    data: {
        labels: gon.this_year,
        datasets: [{
            label: '今年解いた問題数',
            data: gon.count_by_month_year,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255, 99, 132, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
  });

  let monthChart = new Chart(month_chart, {
    type: 'bar',
    data: {
        labels: gon.this_month,
        datasets: [{
            label: '今月解いた問題数',
            data: gon.count_by_day_month,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(99, 255, 137, 0.2)',
                'rgba(244, 35, 252, 0.2)',
                'rgba(252, 35, 35, 0.2)',
                'rgba(35, 60, 252, 0.2)',
                'rgba(119, 252, 35, 0.2)',
                'rgba(252, 197, 35, 0.2)',
                'rgba(252, 49, 35, 0.2)',
                'rgba(35, 252, 154, 0.2)',
                'rgba(35, 252, 68, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(99, 255, 137, 0.2)',
                'rgba(244, 35, 252, 0.2)',
                'rgba(252, 35, 35, 0.2)',
                'rgba(35, 60, 252, 0.2)',
                'rgba(119, 252, 35, 0.2)',
                'rgba(252, 197, 35, 0.2)',
                'rgba(252, 49, 35, 0.2)',
                'rgba(35, 252, 154, 0.2)',
                'rgba(35, 252, 68, 0.2)',
                'rgba(253, 99, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(99, 255, 137, 1)',
                'rgba(244, 35, 252, 1)',
                'rgba(252, 35, 35, 1)',
                'rgba(35, 60, 252, 1)',
                'rgba(119, 252, 35, 1)',
                'rgba(252, 197, 35, 1)',
                'rgba(252, 49, 35, 1)',
                'rgba(35, 252, 154, 1)',
                'rgba(35, 252, 68, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(99, 255, 137, 1)',
                'rgba(244, 35, 252, 1)',
                'rgba(252, 35, 35, 1)',
                'rgba(35, 60, 252, 1)',
                'rgba(119, 252, 35, 1)',
                'rgba(252, 197, 35, 1)',
                'rgba(252, 49, 35, 1)',
                'rgba(35, 252, 154, 1)',
                'rgba(35, 252, 68, 1)',
                'rgba(253, 99, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
  });
});

#! /bin/bash
#Read the data from txt into two arrays
getArray() {
    array1=() 
    array2=()
    while  read line1 line2 # Read a line
    do
        array1+=("$line1")
        array2+=("$line2") # Append line to the array
    done < "$1"
}

getArray "22.txt"

# Write the html file
cat > task2.html <<EOF
<html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart);

      google.setOnLoadCallback(drawAnthonyChart);
         
      google.setOnLoadCallback(drawSarahChart);

      google.setOnLoadCallback(drawDataChart);

      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Title');
        data.addColumn('number', 'Value');
        data.addRows([
EOF

index=0
for k in "${array2[@]}"
do
  echo "['${array1[$index]}', $k]," >>task2.html
  let "index++"
done

cat >> task2.html <<EOF
        ]);

        // Set chart options
        var options = {'title':'Task 2 - Percentage of status code',
                       'width':800,
                       'height':600};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('interest'));
        chart.draw(data, options);
      }


      function drawAnthonyChart() {

        // Create the data table for Anthony's pizza.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Status code');
        data.addColumn('number', 'Number');
        data.addRows([
EOF
getArray "11.txt"

index=0
for k in "${array2[@]}"
do
  echo "['${array1[$index]}', $k]," >>task2.html
  let "index++"
done

cat >> task2.html <<EOF
        ]);
        var options = {title:'Task2 - Different kinds of requests ',
                       width:800,
                       height:600,};

        // Instantiate and draw the chart for Anthony's pizza.
        var chart = new google.visualization.PieChart(document.getElementById('Anthony_chart_div'));
        chart.draw(data, options);
      }

    function drawSarahChart() {

        // Create the data table for Sarah's pizza.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
EOF

getArray "12.txt"

index=0
for k in "${array1[@]}"
do
  echo "['Channel ${array2[$index]}', $k]," >>task2.html
  let "index++"
done

cat >> task2.html <<EOF
        ]);

        // Set options for Sarah's pie chart.
        var options = {title:'Task2 - The bytes transfered by images/run/newcss',
                       width:800,
                       height:600};

        // Instantiate and draw the chart for Sarah's pizza.
        var chart = new google.visualization.PieChart(document.getElementById('Sarah_chart_div'));
        chart.draw(data, options);
      }

 

    </script>
  </head>

  <body>
  <table class="columns">
<tr>
    <!--Div that will hold the pie chart-->
   <td> <div  align ="center" id="interest" style="border: 1px solid #ccc"></div></td>
   </tr>
   <tr>
   <td><div id="Sarah_chart_div" style="border: 1px solid #ccc"></div></td>
</tr>
   <tr>
    <td><div id="Anthony_chart_div" style="border: 1px solid #ccc"></div></td>
  </tr>


  </body>
</html>
EOF

# In the end, remove the files generate during the process
rm -rf 1.txt 2.txt 3.txt 11.txt 12.txt 22.txt weblog.txt
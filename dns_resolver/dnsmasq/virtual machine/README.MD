If you choose to install a web interface for monitoring the DNS resolver software, a link to the web interface should be provided to the user:

I Found many ways to monitor this dns server, one coming from Grafana [1], I choose DnsMasq so I am not sure if this pluggin will work for it (I didn't tried).

I tried with Google Stackdriver [2] and exploring the possibilities to take advantage of these metrics. Stackdriver is an imperfect tool for monitoring but works fine for logging. Also despite is original for GCP it's multicloud and works with AWS.
Explored the possibilities for this test to make a PHP script [3] to read from the dnsmasq log file /syslog and the live DNS resolutions.

[1] https://grafana.com/grafana/dashboards/1666
[2] https://cloud.google.com/monitoring/api/metrics_aws#aws-ec2
[3] https://www.php.net/manual/en/function.dns-get-record.php
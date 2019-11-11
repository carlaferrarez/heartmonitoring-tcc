
#!/bin/bash

while true; do

sudo scp -i /home/pi/Desktop/tutorial-key-pair.pem /var/www/html/teste.png ec2-user@ec2-3-133-176-93.us-east-2.compute.amazonaws.com:/var/www/html 2>&1

sudo scp -i /home/pi/Desktop/tutorial-key-pair.pem /var/www/html/teste2.png ec2-user@ec2-3-133-176-93.us-east-2.compute.amazonaws.com:/var/www/html 2>&1

sudo scp -i /home/pi/Desktop/tutorial-key-pair.pem /var/www/html/teste3.png ec2-user@ec2-3-133-176-93.us-east-2.compute.amazonaws.com:/var/www/html 2>&1

sudo scp -i /home/pi/Desktop/tutorial-key-pair.pem /var/www/html/teste4.png ec2-user@ec2-3-133-176-93.us-east-2.compute.amazonaws.com:/var/www/html 2>&1

sleep 11;

done


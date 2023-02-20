# Challenge-1
A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these resources on a cloud environment Azure.

Architecture design:

1. 3 Linux Virtual machines named Web server, Application server, Database server associated with 3 subnets in a single vnet.
2. Web VM should allow traffic from Internet. 
3. Application server shoule allow traffic from web server and reply to it 
4. Application server can connect to Database server and vice versa but, Database server should not have any direct access to/from Web server VM.

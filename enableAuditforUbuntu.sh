sudo apt install auditd -y

# sudo vim /etc/audit/rules.d/command_logging.rules
sudo echo -e "-a exit,always -F arch=b64 -S execve -k  audit-wazuh-c\n-a exit,always -F arch=b32 -S execve -k  audit-wazuh-c" | sudo tee /etc/audit/rules.d/command_logging.rules > /dev/null

auditctl -l

systemctl restart auditd

auditctl -l

nano /var/ossec/etc/ossec.conf

  <!-- Audit logs--->
  <localfile>
    <log_format>audit</log_format>
    <location>/var/log/audit/audit.log</location>
  </localfile>
systemctl restart wazuh-agent

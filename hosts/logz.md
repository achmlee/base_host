# Logz.io Integration

## OSSEC v3.6.0 Setup (@see https://computingforgeeks.com/how-to-install-ossec-hids-on-ubuntu-18-04-16-04-debian-9/)
1. Set up for build and notifications (https://www.ossec.net/docs/docs/manual/installation/installation-requirements.html#ubuntu):
   * `# apt-get update`
   * `# apt-get install build-essential make zlib1g-dev libpcre2-dev`
   * `# apt-get install libevent-dev` - Undocumented...
   * `# apt-get install libssl-dev` - Undocumented...
2. Download install package:
   * Get source code. Download latest @ https://github.com/ossec/ossec-hids/releases
3. Extract and install:
   * `# tar xzvf <file>`
   * cd into new directory
   * `./install.sh`
4. Options:
   * en
   * 1. What kind of installation do you want: local
   * 2. Choose where to install the OSSEC HIDS: Default
   * 3.1 Do you want e-mail notification? n
   * 3.2 Do you want to run the integrity check daemon? y
   * 3.3 Do you want to run the rootkit detection engine? y
   * 3.4a Do you want to enable active response? y
   * 3.4b Do you want to enable the firewall-drop response? y
   * 3.4c Do you want to add more IPs to the white list? n
5. Start OSSEC
   * `/var/ossec/bin/ossec-control start`

### Files
* `/var/ossec/etc/ossec.conf`
* `/var/ossec/logs/ossec.log` - Logs
* `/var/ossec/rules/syslog_rules.xml` - Strings to search logs for

### Commands
* `/var/ossec/bin/ossec-control [start|stop|status|restart]`
* `sudo service ossec restart`

### Customize OSSEC
```
/var/ossec/rules/local_rules.xml

Add:
  <rule id="1003" level="13" maxsize="2000" overwrite="yes">
    <description>Non standard syslog message (size exceeds 2000 chars).</description>
  </rule>
```

## Install Filebeat
* https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-installation.html
  * https://www.elastic.co/guide/en/beats/filebeat/current/setup-repositories.html

### Send OSSEC logs to Logz
* https://app.logz.io/#/dashboard/data-sources/OSSEC
* Modify Filebeat config: `/etc/filebeat/filebeat.yml`
* Verify config: `filebeat test config -c filebeat.yml`
* Restart Filebeat: `sudo service filebeat start`
* Verify by generating a syslog error: `$ logger connection failed`

### filebeat.yml snippits
```
- type: log
  paths:
    - /var/ossec/logs/alerts/alerts.json
  fields:
    logzio_codec: json
    # Your Logz.io account token. You can find your token at
    # https://app.logz.io/#/dashboard/settings/manage-accounts
    token: RDDVXqDCtOewGffSwgVViCGdTcdZSaEr
    type: ossec
  fields_under_root: true
  encoding: utf-8
  ignore_older: 3h

...

#============================== Filebeat 7 Only ===============================
filebeat.registry.path: /var/lib/filebeat
processors:
  - rename:
    fields:
      - from: "agent"
    to: "filebeat_agent"
    ignore_missing: true
  - rename:
    fields:
      - from: "log.file.path"
    to: "source"
    ignore_missing: true

...

#----------------------------- Logstash output --------------------------------
output:
  logstash:
    hosts: ["listener.logz.io:5015"]
    ssl:
      certificate_authorities: ['/etc/pki/tls/certs/COMODORSADomainValidationSecureServerCA.crt']
```

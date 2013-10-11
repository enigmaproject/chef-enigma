Enigma Cookbook
======================
This cookbook uses the frosty rubygem and wraps provides lwrp's for
service discovery using etcd.

WARNING
-------
This cookbook along with the rest of this project is a work in progress
and is subject to major breaking changes.


Requirements
------------

#### rubygems
- `frosty` - etcd_discover uses this gem for etcd querying.

Attributes
----------

#### etcd_discover::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['enigma']['etcd_hosts']</tt></td>
    <td>Array</td>
    <td>a list of etcd servers that should be queried for information</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

Usage
-----
#### enigma::default
You must have the etcd_discover recipe included on the node
before you attempt to use the lwrp's.  This recipe installs frosty.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[enigma]"
  ]
}
```

Resources
---------

#### enigma_service
A resource provider that gives you a nice chef way of registering a service
with etcd.

Actions:

* register - registers the service name with etcd

Attributes:

* service - name of the service
* environment - the environment this service will support (ie: production, staging, etc)
* ip - the ip address of the endpoint (should be the ip of the node registering the service)
* role - master, slave, etc.  It will be a master by default if it is the first endpoint to register the service
* port - port number the endpoint will be listening on for the service
* etcdhosts - an array of etcd hosts to attempt to connect to, the provider will use the first good host
* etcdport - optionally set the port number to use when talking to etcd, defaults to 4001

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Jim Rosser - jarosser06@gmail.com

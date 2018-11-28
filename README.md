# The reclaim client
Reclaim is a novel approach for decentralized, self-sovereign identity management.
Its core features are:

* Self-sovereign: You manage your identities and attributes locally on your computer. No need to trust a third party service with your data.
* Decentralized: You can share your identity attributes securely over a decentralized name system. This allows your friends to access your shared data without the need of a trusted third party.
* Standard-compliant: You can use OpenID Connect to integrate reclaim in your web sites.

## Requirements

* [Firefox](https://firefox.com)
* [docker](https://www.docker.com)
* [docker-compose](https://docs.docker.com/compose/install/)
* certutil (Optional, only needed for auto-import of GNS CA certificates)

**Note:** Only Firefox is supported at this time.
## Installation

Clone this repository.

## Usage


To start reclaim execute:
```
$ ./reclaim start
```

To stop reclaim execute:
```
$ ./reclaim stop
```

You can see the status of reclaim as well as additional commands by omitting all arguments:
```
$ ./reclaim
```


**IMPORTANT:** Upon starting reclaim, you will be prompted to install the GNS proxy certificate. Once the certificate has been generated in the initial run, you can find it in gns/gnscert.pem.

reclaim makes heavy use of the GNU Name System (GNS). To use GNS, you need to configure your browser to use the GNS proxy so that names can be properly resolved.

To configure Firefox to use the GNS proxy:
![Proxy Configuration](https://reclaim-identity.io/assets/proxy_setup.png)

That's it! At this point you might have to restart Firefox.

You can manage your identities by accessing https://ui.reclaim. This web interface is running on your local machine.

To test reclaim, you can go to the demo page https://demo.reclaim in your browser. 
This demo is running on your local machine and must be accessed through the proxy to be usable with a reclaim login.

(c) 2018 Fraunhofer AISEC

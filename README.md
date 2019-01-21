![re:claim](https://avatars2.githubusercontent.com/u/44837876?s=200&v=4)

[![pipeline status](https://gitlab.com/reclaimid/client/badges/master/pipeline.svg)](https://gitlab.com/reclaimid/client/commits/master)

# The client
re:claim is a novel approach for decentralized, self-sovereign identity management.
Its core features are:

* Self-sovereign: You manage your identities and attributes locally on your computer. No need to trust a third party service with your data.
* Decentralized: You can share your identity attributes securely over a decentralized name system. This allows your friends to access your shared data without the need of a trusted third party.
* Standard-compliant: You can use OpenID Connect to integrate re:claim in your web sites.

## Requirements
Every dependency of re:claim is contained and delivered by docker images, which are built on Docker Hub.
It is also possible to build these images yourself.
Other than that, the re:claim client requires just *docker-ce* (versions 17.12.0+) and *docker-compose* (versions 1.23.1+, other versions are untested) to be installed:

* [docker](https://www.docker.com)
* [docker-compose](https://docs.docker.com/compose/install/)

## Installation

Clone this repository.

## For End Users

**Note:** Only Firefox and Chrome are supported at this time.

The re:claim client functionality is bundled in a helper script *./reclaim* in the root directory of this repository.

To get quickly up and running execute:
```
$ ./reclaim start
```

This command will detect whether you've run re:claim before and, if not, generate all the necessary files.
Three containers will be create, one for the re:claim UI, one for the re:claim runtime itself and a nginx proxy.

**IMPORTANT:** Upon starting re:claim, you will be prompted to install the GNS proxy certificate. Once the certificate has been generated in the initial run, you can find it in gns/gnscert.pem.

re:claim makes heavy use of the GNU Name System (GNS). To use GNS, you need to configure your browser to use the GNS proxy so that names can be properly resolved.

To configure Firefox to use the GNS proxy:
![Proxy Configuration](https://gitlab.com/reclaimid/client/raw/master/proxy_setup_firefox.png?inline=false)

That's it! At this point you might have to restart Firefox.

You can manage your identities by accessing https://ui.reclaim. This web interface is running on your local machine.

To test re:claim, you can go to the demo page https://demo.reclaim in your browser to test a re:claim login. This webpage it running on our servers [here](https://demo.reclaim-identity.io/) but must be accessed through GNS to be usable with a re:claim login.

To stop re:claim execute:
```
$ ./reclaim stop
```

## For Website Administrators

**THIS SECTION IS WORK IN PROGRESS**
To add an OpenID Connect client via reclaim, the reclaim client script can be used.
For example, in order to add a client with a callback URI *https://test.mysite/login* issue the following command:
```
$ ./reclaim oidc createClient --uri test.mysite
```
**THIS SECTION IS WORK IN PROGRESS**

## Further Functionality

The script supports the following commands:

| Command  | Description |
| ------------- | ------------- |
| stop  | stop all reclaim containers |
| start  | start reclaim containers |
| restart | restart reclaim containers |
| purge | remove reclaim containers and (optionally) remove persistent data |

The script furthermore supports arguments:

| Flag  | Description |
| ------------- | ------------- |
| --demo (-d) | also startup a demo relying party |
| --compose-file (-f) | supply a custom docker-compose.yml |
| --no-pull | don't pull remote images |

The arguments have to be supplied only with start. The script will track arguments as whether a demo needs to be started or a custom docker-compose.yml for consequent starts.

(c) 2018 Fraunhofer AISEC

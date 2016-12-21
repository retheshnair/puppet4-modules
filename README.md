Module Structure 
Declaring Classess
Creating Custom Resources types
Create puppet modules containing multiple classes

Environments
Modules
Classess
Parameters
Inheritance
Custom Resources

https://forge.puppet.com
Project URL
puppet module install <module name>


Relationship between Environments and Modules

Declaring a class using the include style 

include motd

Declaring a class using the resource style 

class { 'motd':

       motd_message => 'Daily',

       }

       Defining a class with many parameters 

       class_motd {
               $motd_message,
                       $motd_enable,
                               ){....}



                               Environments and Modules  - Puppet modules can be located in either the Environment directory or a common shared directory. Modules that need to be accessed in more than one Environment need to be installed in to a common path
                               Support for Production and Development code
                               Support for isolation of departmental code
                               puppet config print environment
                               puppet config print environmentpath


                               sudo puppet config print
                               sudo puppet config print environment
                               ~   

                               sudo puppet module list
                               sudo puppet module install puppetlabs/ntp
                               sudo puppet module  list
                               sudo puppet module  uninstall puppetlabs/ntp
                               sudo puppet module install puppetlabs/ntp -i /etc/puppetlabs/code/modules                                  
                               [vagrant@centos7 puppet4-modules]$ sudo mkdir -p /etc/puppetlabs/code/environments/dev/{modules,manifests}
                               [vagrant@centos7 puppet4-modules]$ sudo puppet module install puppetlabs/ntp \
                               > --environment dev
                               sudo puppet module uninstall puppetlabs/stdlib
                               sudo puppet module install puppetlabs/stdlib -i /etc/puppetlabs/code/modules
                               sudo puppet module install puppetlabs/stdlib -i /etc/puppetlabs/code/modules
                               sudo puppet module list --environment dev
                               sudo puppet config set environment dev
                               sudo cat /etc/puppetlabs/puppet/puppet.conf [ environment is set in this file ]
                               /etc/puppetlabs/code/modules  
                               /etc/puppetlabs/code/environments


                               Puppet Modules - A puppet module is simply a directory tree with specific and predictable content



                               <environment>/modules

                               ntp/
                                   manifests/init.pp
                                       files/
                                           lib/
                                               facts.d/
                                                   templates/
                                                       examples/


                                                       Manifests - The <module>/mainifests/init.pp must contain a class with the same name as the module
                                                       cd /etc/puppetlabs/code/environments/production/modules/
                                                       sudo mkdir -p motd/{manifests,files,examples}
                                                       sudo vim motd/mainfests/init.pp
                                                       sudo vim motd/files/message
                                                       sudo puppet apply -e 'include motd'


                                                       Modules Metadata

                                                       Especially if modules are going to be longer lived,then we will also need to create metadata for our modules. We can create the files manually but we can use the puppet module generate command

                                                       cd /etc/puppetlabs/code/environments/production/modules/
                                                       sudo puppet module generate rethesh/test
                                                       ~                        

                                                       NTP Manifest

                                                       cd /etc/puppetlabs/code/environments/production/modules/
                                                       sudo mkdir -p ntp/{manifests,files,examples}
                                                       sudo cp ~/puppet/ntpfinal.pp ntp/manifests/init.pp
                                                       sudo vim ntp/manifests/init.pp [:2,$s/^/\t/] . also added the details under the class
                                                       tree ntp/
                                                       sudo vim ntp/manifests/init.pp [:3,6w ntp/files/ntp.conf]
                                                       cat ntp/files/ntp.conf
                                                       sudo rm /etc/ntp.conf
                                                       sudo puppet apply -e 'inculde ntp'


                                                       Sub-Classes

                                                       We can create additional manifests with their own class definitions. These are known as sub-classes. The manifests name must match the class name. The double colon ise used to separate name-spaces


                                                       sudo vim ntp/manifests/init.pp [ set nu, :3,15w ntp/manifests/case, :8,18w ntp/manifests/config.pp, :8,18d, :9,14w ntp/manifests/service.pp,:9,14d ]

                                                       #Managed ntp  on linux
                                                       class ntp {

                                                         package { 'ntp':
                                                                    before => Class['ntp::config'],
                                                                        }
                                                                          include ntp::config
                                                                            include ntp::service
                                                                             }


                                                                             Implementing Parameterized classes


                                                                             Adding Flexibility

                                                                             $motd_message #As no value is set this become a required parameter that we must apply a value for when declaring the class


                                                                             $motd_message = 'Daily' # As we have suppied   a default value the paramter is optional

                                                                             String $motd_message = 'Daily' # We now enforce that the suppied value must be string


                                                                             Input paremeter/value can be made optional choosing to supply a default value or not or Mandatory. More than one parameter can be required and they become comma separated 


                                                                             Include motd

                                                                             We cannot pass parameters directly. We either have to accept the defaults or use external tools such a Hiera to populate the parameters


                                                                             Declaring Classes like Resource 

                                                                             We can also declare classes like we would a resource. This becomes more flexiable but we must make sure each class is declared just once as with a resource


                                                                             Validating input 

                                                                             We can validate the input values usi8ng one of the many validation functions in the puppetlabs/stdlib.Here we check the input against a list of allowed files 


                                                                             Inheritance 

                                                                             We are able to abstract most if not all of our logic into a manifest,usually named params.pp to make variables from params class available where they are needed we use inheritance

                                                                             Inheriting - We can write the case statement just once to the params class and then inherit in to the config and service classes

                                                                             class ntp::config ($admingroup = $ntp::params::admingroup) 
                                                                             inherits ntp::params {...}


                                                                             Custom Resource Types
                                                                             Custom Resource providers
                                                                             Adding Defined Resource Types to the application


                                                                             sudo mkdir -p motd/lib/puppet/{type,provider}
                                                                             tree motd
                                                                             sudo vim motd/lib/puppet/type/myfile.rb




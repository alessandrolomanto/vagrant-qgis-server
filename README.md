
Vagrant recipe for QGIS Server
====================================

This recipe provides a Ubuntu 16.04 VM

Host setup
----------

The following steps assume you are running Ubuntu 16.04 host but it should work on any host where Vagrant and VirtualBox can be installed.

1. Install Vagrant from: https://www.vagrantup.com/docs/installation/
2. clone this repo `git clone https://github.com/alessandrolomanto/vagrant-qgis-server.git`
3. cd in the repo directory
4. `vagrant up`
5. login into the machine with `vagrant ssh`


Usage
-----

After launching the machine with `vagrant up` we can test one of the installed qgis servers with a http request from browser http://localhost:8080/cgi-bin/qgis_mapserv.fcgi which should output:

```
<ServiceExceptionReport version="1.3.0" xmlns="https://www.opengis.net/ogc">
<ServiceException code="Service configuration error">Service unknown or unsupported</ServiceException>
</ServiceExceptionReport>
```
Also, from your web browser you can check from http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities the capabilities of the server which should output:

```
<WMS_Capabilities version="1.3.0" xsi:schemaLocation="http://www.opengis.net/wms http://schemas.opengis.net/wms/1.3.0/capabilities_1_3_0.xsd http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/sld_capabilities.xsd http://www.qgis.org/wms http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&REQUEST=GetSchemaExtension">
    <Service>
        <Name>WMS</Name>
        <!-- Human-readable title for pick lists -->
        <Title>QGIS mapserver</Title>
        <!--
 Narrative description providing additional information 
-->
        <Abstract>A WMS service with QGIS mapserver</Abstract>
        <KeywordList>
            <Keyword>QGIS mapserver</Keyword>
        </KeywordList>
        <!--
 Top-level web address of service or service provider.  See also OnlineResource
		     elements under <DCPType>. 
-->
        <OnlineResource xlink:type="simple" xlink:href="http://www.sourcepole.ch/"/>
        <!-- Contact information -->
        <ContactInformation>
            <ContactPersonPrimary>
                <ContactPerson>Marco Hugentobler</ContactPerson>
                <ContactOrganization>Sourcepole AG</ContactOrganization>
            </ContactPersonPrimary>
            <ContactAddress>
                <AddressType>postal</AddressType>
                <Address>Weberstrasse 5</Address>
                <City>Zürich</City>
                <StateOrProvince>ZH</StateOrProvince>
                <PostCode>8004</PostCode>
                <Country>SWITZERLAND</Country>
            </ContactAddress>
            <ContactVoiceTelephone/>
            <ContactElectronicMailAddress>marco.hugentobler@sourcepole.ch</ContactElectronicMailAddress>
        </ContactInformation>
        <!-- Fees or access constraints imposed. -->
        <Fees>none</Fees>
        <AccessConstraints>none</AccessConstraints>
        <LayerLimit>99</LayerLimit>
    </Service>
    <Capability>
        <Request>
            <GetCapabilities>
                <Format>text/xml</Format>
                <DCPType>
                    <HTTP>
                        <Get>
                            <OnlineResource xlink:type="simple" xlink:href="http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?"/>
                        </Get>
                    </HTTP>
                </DCPType>
            </GetCapabilities>
            <GetMap>
                <Format>image/jpeg</Format>
                <Format>image/png</Format>
                <Format>image/png; mode=16bit</Format>
                <Format>image/png; mode=8bit</Format>
                <Format>image/png; mode=1bit</Format>
                <DCPType>
                    <HTTP>
                        <Get>
                            <OnlineResource xlink:type="simple" xlink:href="http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?"/>
                        </Get>
                    </HTTP>
                </DCPType>
            </GetMap>
            <GetFeatureInfo>
                <Format>text/plain</Format>
                <Format>text/html</Format>
                <Format>text/xml</Format>
                <Format>application/vnd.ogc.gml</Format>
                <Format>application/vnd.ogc.gml/3.1.1</Format>
                <DCPType>
                    <HTTP>
                        <Get>
                            <OnlineResource xlink:type="simple" xlink:href="http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?"/>
                        </Get>
                    </HTTP>
                </DCPType>
            </GetFeatureInfo>
            <sld:GetLegendGraphic>
                <Format>image/jpeg</Format>
                <Format>image/png</Format>
                <DCPType>
                    <HTTP>
                        <Get>
                            <OnlineResource xlink:type="simple" xlink:href="http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?"/>
                        </Get>
                    </HTTP>
                </DCPType>
            </sld:GetLegendGraphic>
            <sld:DescribeLayer>
                <Format>text/xml</Format>
                <DCPType>
                    <HTTP>
                        <Get>
                            <OnlineResource xlink:type="simple" xlink:href="http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?"/>
                        </Get>
                    </HTTP>
                </DCPType>
            </sld:DescribeLayer>
            <qgs:GetStyles>
                <Format>text/xml</Format>
                <DCPType>
                    <HTTP>
                        <Get>
                            <OnlineResource xlink:type="simple" xlink:href="http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?"/>
                        </Get>
                    </HTTP>
                </DCPType>
            </qgs:GetStyles>
        </Request>
        <Exception>
            <Format>text/xml</Format>
        </Exception>
        <sld:UserDefinedSymbolization RemoteWFS="0" RemoteWCS="0" InlineFeature="0" UserStyle="1" SupportSLD="1" UserLayer="0"/>
        <Layer queryable="1">
            <Name>wfslayer</Name>
        </Layer>
    </Capability>
</WMS_Capabilities>
```
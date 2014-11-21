<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="TokensWebCloudService" generation="1" functional="0" release="0" Id="3f30a3b1-f55e-48e9-b320-e273fe82b24e" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="TokensWebCloudServiceGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="TokensWebRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/TokensWebCloudService/TokensWebCloudServiceGroup/LB:TokensWebRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="TokensWebRole:StorageConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/TokensWebCloudService/TokensWebCloudServiceGroup/MapTokensWebRole:StorageConnectionString" />
          </maps>
        </aCS>
        <aCS name="TokensWebRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/TokensWebCloudService/TokensWebCloudServiceGroup/MapTokensWebRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:TokensWebRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/TokensWebCloudService/TokensWebCloudServiceGroup/TokensWebRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapTokensWebRole:StorageConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/TokensWebCloudService/TokensWebCloudServiceGroup/TokensWebRole/StorageConnectionString" />
          </setting>
        </map>
        <map name="MapTokensWebRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/TokensWebCloudService/TokensWebCloudServiceGroup/TokensWebRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="TokensWebRole" generation="1" functional="0" release="0" software="C:\Training\Azure\AzurePOC\TokensWebCloudService\csx\Debug\roles\TokensWebRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="StorageConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;TokensWebRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;TokensWebRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/TokensWebCloudService/TokensWebCloudServiceGroup/TokensWebRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/TokensWebCloudService/TokensWebCloudServiceGroup/TokensWebRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/TokensWebCloudService/TokensWebCloudServiceGroup/TokensWebRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="TokensWebRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="TokensWebRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="TokensWebRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="43413c98-c253-401a-8af2-4d86aa32444c" ref="Microsoft.RedDog.Contract\ServiceContract\TokensWebCloudServiceContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="ab558f35-2a12-4c72-89e6-6e7e751f9aca" ref="Microsoft.RedDog.Contract\Interface\TokensWebRole:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/TokensWebCloudService/TokensWebCloudServiceGroup/TokensWebRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>
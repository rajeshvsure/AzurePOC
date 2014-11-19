<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="TokensStorage" generation="1" functional="0" release="0" Id="d6e84513-bfba-47d7-9d3a-d75e1e7895cc" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="TokensStorageGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="TokenStorageTable:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/TokensStorage/TokensStorageGroup/LB:TokenStorageTable:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="TokenStorageTable:DataConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/TokensStorage/TokensStorageGroup/MapTokenStorageTable:DataConnectionString" />
          </maps>
        </aCS>
        <aCS name="TokenStorageTable:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/TokensStorage/TokensStorageGroup/MapTokenStorageTable:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="TokenStorageTableInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/TokensStorage/TokensStorageGroup/MapTokenStorageTableInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:TokenStorageTable:Endpoint1">
          <toPorts>
            <inPortMoniker name="/TokensStorage/TokensStorageGroup/TokenStorageTable/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapTokenStorageTable:DataConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/TokensStorage/TokensStorageGroup/TokenStorageTable/DataConnectionString" />
          </setting>
        </map>
        <map name="MapTokenStorageTable:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/TokensStorage/TokensStorageGroup/TokenStorageTable/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapTokenStorageTableInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/TokensStorage/TokensStorageGroup/TokenStorageTableInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="TokenStorageTable" generation="1" functional="0" release="0" software="C:\Training\Azure\AzurePOC\TokensStorage\csx\Debug\roles\TokenStorageTable" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="DataConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;TokenStorageTable&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;TokenStorageTable&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/TokensStorage/TokensStorageGroup/TokenStorageTableInstances" />
            <sCSPolicyUpdateDomainMoniker name="/TokensStorage/TokensStorageGroup/TokenStorageTableUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/TokensStorage/TokensStorageGroup/TokenStorageTableFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="TokenStorageTableUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="TokenStorageTableFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="TokenStorageTableInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="43d99d6c-8c71-4ab4-9ea1-315d1bea99be" ref="Microsoft.RedDog.Contract\ServiceContract\TokensStorageContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="06a5d025-b717-4639-8345-0975670f3f38" ref="Microsoft.RedDog.Contract\Interface\TokenStorageTable:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/TokensStorage/TokensStorageGroup/TokenStorageTable:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>
<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="TokensWorkerRole" generation="1" functional="0" release="0" Id="72c520fb-3974-4861-9caf-57b1670ed292" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="TokensWorkerRoleGroup" generation="1" functional="0" release="0">
      <settings>
        <aCS name="ProcessTokensWorkerRole:Microsoft.ServiceBus.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/MapProcessTokensWorkerRole:Microsoft.ServiceBus.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="ProcessTokensWorkerRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/MapProcessTokensWorkerRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="ProcessTokensWorkerRole:StorageConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/MapProcessTokensWorkerRole:StorageConnectionString" />
          </maps>
        </aCS>
        <aCS name="ProcessTokensWorkerRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/MapProcessTokensWorkerRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <maps>
        <map name="MapProcessTokensWorkerRole:Microsoft.ServiceBus.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/ProcessTokensWorkerRole/Microsoft.ServiceBus.ConnectionString" />
          </setting>
        </map>
        <map name="MapProcessTokensWorkerRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/ProcessTokensWorkerRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapProcessTokensWorkerRole:StorageConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/ProcessTokensWorkerRole/StorageConnectionString" />
          </setting>
        </map>
        <map name="MapProcessTokensWorkerRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/ProcessTokensWorkerRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="ProcessTokensWorkerRole" generation="1" functional="0" release="0" software="C:\Training\Azure\AzurePOC\TokensWorkerRole\csx\Debug\roles\ProcessTokensWorkerRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.ServiceBus.ConnectionString" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="StorageConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;ProcessTokensWorkerRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;ProcessTokensWorkerRole&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/ProcessTokensWorkerRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/ProcessTokensWorkerRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/TokensWorkerRole/TokensWorkerRoleGroup/ProcessTokensWorkerRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="ProcessTokensWorkerRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="ProcessTokensWorkerRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="ProcessTokensWorkerRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
</serviceModel>
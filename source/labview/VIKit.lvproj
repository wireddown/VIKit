<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="13008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="VIBuildProject.vi" Type="VI" URL="../VIBuildProject.vi"/>
		<Item Name="VIHost.lvlib" Type="Library" URL="../VIHost/VIHost.lvlib"/>
		<Item Name="VIProject.lvlib" Type="Library" URL="../VIProject/VIProject.lvlib"/>
		<Item Name="VIQueryBuildSpecs.vi" Type="VI" URL="../VIQueryBuildSpecs.vi"/>
		<Item Name="VIQueryVersion.vi" Type="VI" URL="../VIQueryVersion.vi"/>
		<Item Name="VISnipDiagram.vi" Type="VI" URL="../VISnipDiagram.vi"/>
		<Item Name="VIVendor.lvlib" Type="Library" URL="../VIVendor/VIVendor.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Check Color Table Size.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Color Table Size.vi"/>
				<Item Name="Check Data Size.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Data Size.vi"/>
				<Item Name="Check File Permissions.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check File Permissions.vi"/>
				<Item Name="Check Path.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Check Path.vi"/>
				<Item Name="compatCalcOffset.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatCalcOffset.vi"/>
				<Item Name="compatFileDialog.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatFileDialog.vi"/>
				<Item Name="compatOpenFileOperation.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOpenFileOperation.vi"/>
				<Item Name="Directory of Top Level VI.vi" Type="VI" URL="/&lt;vilib&gt;/picture/jpeg.llb/Directory of Top Level VI.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="GetTargetBuildSpecs (project reference).vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/GetTargetBuildSpecs (project reference).vi"/>
				<Item Name="GetTargetBuildSpecs.vi" Type="VI" URL="/&lt;vilib&gt;/AppBuilder/GetTargetBuildSpecs.vi"/>
				<Item Name="imagedata.ctl" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/imagedata.ctl"/>
				<Item Name="NI_App_Builder_API.lvlib" Type="Library" URL="/&lt;vilib&gt;/AppBuilder/AB_API_Simple/NI_App_Builder_API.lvlib"/>
				<Item Name="Open_Create_Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/Open_Create_Replace File.vi"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="Write PNG File.vi" Type="VI" URL="/&lt;vilib&gt;/picture/png.llb/Write PNG File.vi"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="VIKit.dll" Type="DLL">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{8CBE6C8A-C80C-441F-9AB7-612ACA72AF95}</Property>
				<Property Name="App_INI_GUID" Type="Str">{58C0B333-2645-46B6-AF3C-318F0709CEF2}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{5DE75DED-51E4-4E2A-A0E0-7AFC0B1EDAB6}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">VIKit.dll</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/C/repos/NI_AB_PROJECTNAME/builds</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{BF69993C-5FA0-41DC-B9D0-1506F6D15B4A}</Property>
				<Property Name="Bld_userLogFile" Type="Path">/C/repos/VIKit/builds/VIKit_VIKit.dll_log.txt</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Bld_version.patch" Type="Int">3</Property>
				<Property Name="Destination[0].destName" Type="Str">VIKit.dll</Property>
				<Property Name="Destination[0].path" Type="Path">/C/repos/NI_AB_PROJECTNAME/builds/VIKit.dll</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/C/repos/NI_AB_PROJECTNAME/builds/data</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Dll_compatibilityWith2011" Type="Bool">false</Property>
				<Property Name="Dll_delayOSMsg" Type="Bool">true</Property>
				<Property Name="Dll_headerGUID" Type="Str">{EF47F4DC-6753-4168-9839-77CFBFC548C2}</Property>
				<Property Name="Dll_includeHeaders" Type="Bool">true</Property>
				<Property Name="Dll_libGUID" Type="Str">{AE5A2F0D-76AB-4F3B-A689-23B730A04984}</Property>
				<Property Name="Source[0].itemID" Type="Str">{71CB2F8B-DD0C-4ED9-87EB-6EA138EBFFCE}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[0]VIProtoDir" Type="Int">4</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[0]VIProtoInputIdx" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[0]VIProtoLenInput" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[0]VIProtoLenOutput" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[0]VIProtoName" Type="Str">return value</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[0]VIProtoOutputIdx" Type="Int">0</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[0]VIProtoPassBy" Type="Int">1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[1]VIProtoDir" Type="Int">0</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[1]VIProtoInputIdx" Type="Int">11</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[1]VIProtoLenInput" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[1]VIProtoLenOutput" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[1]VIProtoName" Type="Str">VIPath</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[1]VIProtoOutputIdx" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[1]VIProtoPassBy" Type="Int">1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[2]VIProtoDir" Type="Int">1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[2]VIProtoInputIdx" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[2]VIProtoLenInput" Type="Int">3</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[2]VIProtoLenOutput" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[2]VIProtoName" Type="Str">VIVersion</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[2]VIProtoOutputIdx" Type="Int">3</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[2]VIProtoPassBy" Type="Int">1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[3]CallingConv" Type="Int">1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[3]Name" Type="Str">VIQueryVersion</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[3]VIProtoDir" Type="Int">3</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[3]VIProtoInputIdx" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[3]VIProtoLenInput" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[3]VIProtoLenOutput" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[3]VIProtoName" Type="Str">VIVersionLength</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[3]VIProtoOutputIdx" Type="Int">-1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfo[3]VIProtoPassBy" Type="Int">1</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfoCPTM" Type="Bin">%Q#!!!!!!!E!$%!B"H.U982V=Q!!#U!$!!2D&lt;W2F!!!11$$`````"H.P&gt;8*D:1!!&amp;E"1!!-!!!!"!!)*28*S&lt;X)A4X6U!!1!!!!11$$`````"V:F=H.J&lt;WY!&amp;E"1!!-!!!!"!!))28*S&lt;X)A37Y!!""!-0````](6EEA5'&amp;U;!"5!0!!$!!$!!1!"!!&amp;!!1!"!!%!!1!"A!%!!1!"Q-!!(A!!!E!!!!!!!!!!!!!!!E!!!!!!!!!!!!!!!!!!!!!!!!!#A!!!!!!!!!!!!!##!!!!!!"!!A</Property>
				<Property Name="Source[1].ExportedVI.VIProtoInfoVIProtoItemCount" Type="Int">4</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/VIQueryVersion.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">ExportedVI</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/VIQueryBuildSpecs.vi</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[2].type" Type="Str">ExportedVI</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="TgtF_companyName" Type="Str">Joe Friedrichsen</Property>
				<Property Name="TgtF_fileDescription" Type="Str">VIKit.dll</Property>
				<Property Name="TgtF_internalName" Type="Str">VIKit.dll</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2014 Joe Friedrichsen</Property>
				<Property Name="TgtF_productName" Type="Str">VIKit.dll</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{C99CAD56-1251-46DD-A9D1-6C4304518364}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">VIKit.dll</Property>
			</Item>
		</Item>
	</Item>
</Project>

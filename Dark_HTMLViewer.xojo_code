#tag Class
Protected Class Dark_HTMLViewer
Inherits HTMLViewer
	#tag Event
		Sub DocumentComplete(URL as String)
		  
		  //Injecting script to change Appearance
		  Self.ExecuteJavaScript(kAppearanceModeScriptSource)
		  
		  RaiseEvent DocumentComplete(URL)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0, Description = 4368616E6765732074686520617070656172616E6365206175746F6D61746963616C6C7920666F72204461726B206F72204C69676874206D6F6465
		Sub ChangeAppearance()
		  
		  #If XojoVersion >= 2018.03
		    Dim funcName As String
		    
		    If IsDarkMode Then
		      funcName = "switchToDarkMode"
		      
		    Else
		      funcName = "switchToLightMode"
		      
		    End If
		    
		    Dim switchScript As String = "if (typeof " + funcName + " == 'function') { " + funcName + "(); }"
		    
		    Self.ExecuteJavaScript(switchScript)
		    
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4368616E6765732074686520617070656172616E636520746F204461726B206D6F6465
		Sub ChangeAppearanceToDark()
		  
		  Dim funcName As String
		  
		  
		  funcName = "switchToDarkMode"
		  
		  
		  Dim switchScript As String = "if (typeof " + funcName + " == 'function') { " + funcName + "(); }"
		  
		  Self.ExecuteJavaScript(switchScript)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 4368616E6765732074686520617070656172616E636520746F204C69676874206D6F6465
		Sub ChangeAppearanceToLight()
		  
		  Dim funcName As String
		  
		  
		  funcName = "switchToLightMode"
		  
		  
		  
		  Dim switchScript As String = "if (typeof " + funcName + " == 'function') { " + funcName + "(); }"
		  
		  Self.ExecuteJavaScript(switchScript)
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DocumentComplete(URL As String)
	#tag EndHook


	#tag Note, Name = About
		
		Written by Jeremie Leroy
		https://www.jeremieleroy.com
		
		Inspired by Daniel Jalkut
		https://indiestack.com/2018/10/supporting-dark-mode-in-app-web-content/
	#tag EndNote


	#tag Constant, Name = kAppearanceModeScriptSource, Type = String, Dynamic = False, Default = \"var darkModeStylesNodeID \x3D \"darkModeStyles\";\n\n   function addStyleString(str\x2C nodeID) {\n      var node \x3D document.createElement(\'style\');\n      node.id \x3D nodeID;\n      node.innerHTML \x3D str;\n\n      // Insert to HEAD before all others\x2C so it will serve as a default\x2C all other\n      // specificity rules being equal. This allows clients to provide their own\n      // high level body {} rules for example\x2C and supersede ours.\n      document.head.insertBefore(node\x2C document.head.firstElementChild);\n   }\n\n   // For dark mode we impose CSS rules to fine-tune our styles for dark\n   function switchToDarkMode() {\n      var darkModeStyleElement \x3D document.getElementById(darkModeStylesNodeID);\n      if (darkModeStyleElement \x3D\x3D null) {\n         var darkModeStyles \x3D \"body { color: #d2d2d2; background-color: #2d2d2d; } body a:link { color: #4490e2; }\";\n         addStyleString(darkModeStyles\x2C darkModeStylesNodeID);\n      }\n   }\n\n   // For light mode we simply remove the dark mode styles to revert to default colors\n   function switchToLightMode() {\n      var darkModeStyleElement \x3D document.getElementById(darkModeStylesNodeID);\n      if (darkModeStyleElement !\x3D null) {\n         darkModeStyleElement.parentElement.removeChild(darkModeStyleElement);\n      }\n   }", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="200"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="200"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Renderer"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Native"
				"1 - WebKit"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:x="urn:schemas-microsoft-com:office:excel">
	<xsl:template match="/">
		<body xmlns="http://www.w3.org/1999/xhtml">
			<style xmlns="http://www.w3.org/1999/xhtml" id="resumen_20122_Styles">
				&amp;lt;!--table
				{mso-displayed-decimal-separator:"\.";
				mso-displayed-thousand-separator:"\,";}
				.xl1520122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl6520122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:"_-\0022$\0022* \#\,\#\#0\.00_-\;\\-\0022$\0022* \#\,\#\#0\.00_-\;_-\0022$\0022* \0022-\0022??_-\;_-\@_-";
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl6620122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl6720122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				background:#DDEBF6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl6820122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:"_-\0022$\0022* \#\,\#\#0\.00_-\;\\-\0022$\0022* \#\,\#\#0\.00_-\;_-\0022$\0022* \0022-\0022??_-\;_-\@_-";
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				background:#DDEBF6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl6920122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:"_-\0022$\0022* \#\,\#\#0\.00_-\;\\-\0022$\0022* \#\,\#\#0\.00_-\;_-\0022$\0022* \0022-\0022??_-\;_-\@_-";
				text-align:general;
				vertical-align:bottom;
				border-top:.5pt solid windowtext;
				border-right:.5pt solid windowtext;
				border-bottom:.5pt solid windowtext;
				border-left:none;
				background:#DDEBF6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl7020122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				border-top:.5pt solid windowtext;
				border-right:none;
				border-bottom:.5pt solid windowtext;
				border-left:.5pt solid windowtext;
				background:#DDEBF6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl7120122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:"_-\0022$\0022* \#\,\#\#0\.00_-\;\\-\0022$\0022* \#\,\#\#0\.00_-\;_-\0022$\0022* \0022-\0022??_-\;_-\@_-";
				text-align:general;
				vertical-align:bottom;
				border-top:1.5pt solid #E6D2B6;
				border-right:none;
				border-bottom:1.0pt solid windowtext;
				border-left:none;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7220122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7320122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:"_-\0022$\0022* \#\,\#\#0\.00_-\;\\-\0022$\0022* \#\,\#\#0\.00_-\;_-\0022$\0022* \0022-\0022??_-\;_-\@_-";
				text-align:center;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				background:#DDEBF6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl7420122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:"_-\0022$\0022* \#\,\#\#0\.00_-\;\\-\0022$\0022* \#\,\#\#0\.00_-\;_-\0022$\0022* \0022-\0022??_-\;_-\@_-";
				text-align:center;
				vertical-align:middle;
				border:.5pt solid windowtext;
				background:#DDEBF6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl7520122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:10.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7620122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:10.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7720122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:10.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				background:#DDEBF6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl7820122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:10.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				border-top:.5pt solid windowtext;
				border-right:none;
				border-bottom:.5pt solid windowtext;
				border-left:.5pt solid windowtext;
				background:#DDEBF6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl7920122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:10.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl8020122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:"_-\0022$\0022* \#\,\#\#0\.00_-\;\\-\0022$\0022* \#\,\#\#0\.00_-\;_-\0022$\0022* \0022-\0022??_-\;_-\@_-";
				text-align:center;
				vertical-align:middle;
				border:.5pt solid windowtext;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl8120122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:bottom;
				border-top:1.0pt solid windowtext;
				border-right:none;
				border-bottom:1.0pt solid windowtext;
				border-left:1.0pt solid windowtext;
				background:#9CC1E6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl8220122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:bottom;
				border-top:1.0pt solid windowtext;
				border-right:none;
				border-bottom:1.0pt solid windowtext;
				border-left:none;
				background:#9CC1E6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl8320122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:bottom;
				border-top:1.0pt solid windowtext;
				border-right:1.0pt solid windowtext;
				border-bottom:1.0pt solid windowtext;
				border-left:none;
				background:#9CC1E6;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl8420122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:bottom;
				border-top:1.0pt solid windowtext;
				border-right:none;
				border-bottom:1.0pt solid windowtext;
				border-left:1.0pt solid windowtext;
				background:#FEDA64;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl8520122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:bottom;
				border-top:1.0pt solid windowtext;
				border-right:none;
				border-bottom:1.0pt solid windowtext;
				border-left:none;
				background:#FEDA64;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl8620122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:bottom;
				border-top:1.0pt solid windowtext;
				border-right:1.0pt solid windowtext;
				border-bottom:1.0pt solid windowtext;
				border-left:none;
				background:#FEDA64;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl8720122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:"_-\0022$\0022* \#\,\#\#0\.00_-\;\\-\0022$\0022* \#\,\#\#0\.00_-\;_-\0022$\0022* \0022-\0022??_-\;_-\@_-";
				text-align:center;
				vertical-align:bottom;
				border-top:none;
				border-right:none;
				border-bottom:.5pt solid windowtext;
				border-left:none;
				background:#A9D08E;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl8820122
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:"Aptos Narrow", sans-serif;
				mso-font-charset:0;
				mso-number-format:"_-\0022$\0022* \#\,\#\#0\.00_-\;\\-\0022$\0022* \#\,\#\#0\.00_-\;_-\0022$\0022* \0022-\0022??_-\;_-\@_-";
				text-align:center;
				vertical-align:bottom;
				border-top:.5pt solid windowtext;
				border-right:none;
				border-bottom:2.0pt double windowtext;
				border-left:none;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				--&amp;gt;
			</style>

			<div xmlns="http://www.w3.org/1999/xhtml" id="resumen_20122" align="center" x:publishsource="Excel">

				<table border="0" cellpadding="0" cellspacing="0" width="1051" style="border-collapse:&#10; collapse;table-layout:fixed;width:791pt">
					<colgroup>
						<col width="28" style="mso-width-source:userset;mso-width-alt:1024;width:21pt" />
						<col class="xl7520122" width="190" style="mso-width-source:userset;mso-width-alt:&#10; 6948;width:143pt" />
						<col width="138" style="mso-width-source:userset;mso-width-alt:5046;width:104pt" />
						<col class="xl6520122" width="138" style="mso-width-source:userset;mso-width-alt:&#10; 5046;width:104pt" />
						<col width="75" style="mso-width-source:userset;mso-width-alt:2742;width:56pt" />
						<col width="178" style="mso-width-source:userset;mso-width-alt:6509;width:134pt" />
						<col class="xl6520122" width="137" span="2" style="mso-width-source:userset;&#10; mso-width-alt:5010;width:103pt" />
						<col width="30" style="mso-width-source:userset;mso-width-alt:1097;width:23pt" />
					</colgroup>
					<tbody>
						<tr height="19" style="mso-height-source:userset;height:14.25pt">
							<td height="19" class="xl1520122" width="28" style="height:14.25pt;width:21pt"></td>
							<td class="xl7520122" width="190" style="width:143pt"></td>
							<td class="xl1520122" width="138" style="width:104pt"></td>
							<td class="xl6520122" width="138" style="width:104pt"></td>
							<td class="xl1520122" width="75" style="width:56pt"></td>
							<td class="xl1520122" width="178" style="width:134pt"></td>
							<td class="xl6520122" width="137" style="width:103pt"></td>
							<td class="xl7120122" width="137" style="width:103pt"> </td>
							<td class="xl1520122" width="30" style="width:23pt"></td>
						</tr>
						<tr height="19" style="mso-height-source:userset;height:14.25pt">
							<td height="19" class="xl1520122" style="height:14.25pt"></td>
							<td colspan="7" class="xl8420122" style="border-right:1.0pt solid black">
								<span style="mso-spacerun:yes"> </span>{{@mes}}
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="mso-height-source:userset;height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="21" style="height:15.75pt">
							<td height="21" class="xl1520122" style="height:15.75pt"></td>
							<td colspan="3" class="xl8120122" style="border-right:1.0pt solid black">INGRESOS</td>
							<td class="xl1520122"></td>
							<td colspan="3" class="xl8120122" style="border-right:1.0pt solid black">EGRESOS</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7620122"></td>
							<td class="xl6620122"></td>
							<td class="xl6620122"></td>
							<td class="xl1520122"></td>
							<td class="xl6620122"></td>
							<td class="xl6620122"></td>
							<td class="xl6620122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122">BANCO</td>
							<td class="xl6720122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@banco_ingresos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl6720122">BANCOS</td>
							<td class="xl6820122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@banco_egresos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122" style="border-top:none">CAJA</td>
							<td class="xl6720122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@caja_ingresos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">CAJA</td>
							<td class="xl6820122" style="border-top:none;border-left:none"> </td>
							<td class="xl7320122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@caja_egresos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122" style="border-top:none"> </td>
							<td class="xl6720122" style="border-top:none;border-left:none"> </td>
							<td class="xl6820122" style="border-top:none;border-left:none"> </td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">TARJETAS</td>
							<td class="xl6820122" style="border-top:none;border-left:none"> </td>
							<td class="xl7320122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@tarjetas_egresos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122">TOTAL</td>
							<td class="xl6720122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@total_ingresos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl6720122">TOTAL</td>
							<td class="xl6820122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@total_egresos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7820122">(-)OTROS QUE NO GRAVAN</td>
							<td class="xl6720122"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@otros_no_gravan_i}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl7020122">(-)OTROS QUE NO GRAVAN</td>
							<td class="xl6920122"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@otros_no_gravan_e}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">NO DEDUCIBLES</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@no_deducibles}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">SIPARE</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@sipare_egresos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122">(=)INGRESOS GRAVADOS</td>
							<td class="xl6720122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@ingresos_gravados}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">CAJA</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@concepto_caja_e}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">DEP EN GARANTIA</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@dep_en_garantia}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">DEVOLUCIONES</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@devoluciones}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">NOMINA</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@nomina}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122">BASE GRAVABLE C/RETENCION</td>
							<td class="xl6720122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@base_grav_c_ret_i}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">IVA POR PAGAR</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@iva_pagar_e}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7920122" style="border-top:none">BASE GRAVABLE 0%</td>
							<td class="xl7220122" style="border-top:none;border-left:none"> </td>
							<td class="xl8020122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@base_grav_cero_i}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">3% SOBRE NÓMINA</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@tres_sobre_nom}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122" style="border-top:none">BASE GRAVABLE S/RETENCION</td>
							<td class="xl6720122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@base_grav_s_ret_i}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">PAGOS PROVISIONALES</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@pagos_prov}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">RETENCIONES SERVICIOS</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@ret_servicios}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122">BASE GRAVABLE 16%</td>
							<td class="xl6720122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@base_grav_16_i}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">RETENCIONES SUELDOS</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@ret_sueldos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none">FONDOS INVERSIÓN</td>
							<td class="xl7420122" style="border-top:none;border-left:none"> </td>
							<td class="xl7420122" style="border-top:none;border-left:none">
								<span style="mso-spacerun:yes">  </span>{{@fondos_inversion}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122" style="border-top:none"> </td>
							<td class="xl6820122" style="border-top:none;border-left:none"> </td>
							<td class="xl6820122" style="border-top:none;border-left:none"> </td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122">(=)EGRESOS GRAVADOS</td>
							<td class="xl6820122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@egresos_gravados}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122">IVA POR PAGAR</td>
							<td class="xl6720122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@iva_pagar_i}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122">IVA ACREDITABLE</td>
							<td class="xl6820122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@iva_acreditable}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122">IVA RETENIDO COMPRAS</td>
							<td class="xl6720122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@iva_ret_compras_i}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122">IVA RETENIDO</td>
							<td class="xl6820122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@iva_retenido}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7720122">TOTAL</td>
							<td class="xl6720122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@total_final_ingresos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6720122">TOTAL</td>
							<td class="xl6820122" style="border-left:none"> </td>
							<td class="xl7420122" style="border-left:none">
								<span style="mso-spacerun:yes">
									
								</span>{{@total_final_egresos}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl1520122" style="height:15.0pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td colspan="3" class="xl8720122">
								<span style="mso-spacerun:yes"> </span>IVA POR
								PAGAR<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="21" style="height:15.75pt">
							<td height="21" class="xl1520122" style="height:15.75pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td colspan="3" class="xl8820122">
								<span style="mso-spacerun:yes"> </span>{{@iva}}<span style="mso-spacerun:yes"> </span>
							</td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<tr height="21" style="height:15.75pt">
							<td height="21" class="xl1520122" style="height:15.75pt"></td>
							<td class="xl7520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
							<td class="xl1520122"></td>
							<td class="xl6520122"></td>
							<td class="xl6520122"></td>
							<td class="xl1520122"></td>
						</tr>
						<!--[if supportMisalignedColumns]-->
						<tr height="0" style="display:none">
							<td width="28" style="width:21pt"></td>
							<td width="190" style="width:143pt"></td>
							<td width="138" style="width:104pt"></td>
							<td width="138" style="width:104pt"></td>
							<td width="75" style="width:56pt"></td>
							<td width="178" style="width:134pt"></td>
							<td width="137" style="width:103pt"></td>
							<td width="137" style="width:103pt"></td>
							<td width="30" style="width:23pt"></td>
						</tr>
						<!--[endif]-->
					</tbody>
				</table>

			</div>
		</body>
	</xsl:template>
</xsl:stylesheet>
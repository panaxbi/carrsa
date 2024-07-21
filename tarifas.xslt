<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:session="http://panax.io/session"
xmlns:data="http://panax.io/data"
xmlns:state="http://panax.io/state"
xmlns:group="http://panax.io/state/group"
xmlns:filter="http://panax.io/state/filter"
xmlns:visible="http://panax.io/state/visible"
xmlns:env="http://panax.io/state/environment"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:datagrid="http://panaxbi.com/widget/datagrid"
xmlns:xo="http://panax.io/xover"
xmlns:x="urn:schemas-microsoft-com:office:excel"
>
	<xsl:import href="common.xslt"/>
	<xsl:import href="headers.xslt"/>

	<xsl:key name="razon_social" match="razon_social/row/@id" use="'*'"/>
	<xsl:template match="/">
		<body xmlns="http://www.w3.org/1999/xhtml" xo-source="">
			<style id="Cálculos PF (Rafael Alvarado) 2024_12133_Styles">
				&amp;lt;!--table
				{mso-displayed-decimal-separator:"\.";
				mso-displayed-thousand-separator:"\,";}
				.xl1512133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri;
				mso-generic-font-family:auto;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl6312133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:14.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border:.5pt solid black;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:normal;}
				.xl6412133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:14.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border:.5pt solid black;
				background:#BFBFBF;
				mso-pattern:#BFBFBF none;
				white-space:normal;}
				.xl6512133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border:.5pt solid black;
				background:white;
				mso-pattern:white none;
				white-space:normal;}
				.xl6612133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border-top:.5pt solid black;
				border-right:.5pt solid black;
				border-bottom:none;
				border-left:.5pt solid black;
				background:white;
				mso-pattern:white none;
				white-space:normal;}
				.xl6712133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border:.5pt solid black;
				background:#BFBFBF;
				mso-pattern:#BFBFBF none;
				white-space:normal;}
				.xl6812133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border-top:.5pt solid black;
				border-right:.5pt solid black;
				border-bottom:none;
				border-left:.5pt solid black;
				background:#BFBFBF;
				mso-pattern:#BFBFBF none;
				white-space:normal;}
				.xl6912133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border:.5pt solid black;
				background:white;
				mso-pattern:white none;
				white-space:normal;}
				.xl7012133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border-top:.5pt solid black;
				border-right:.5pt solid black;
				border-bottom:none;
				border-left:.5pt solid black;
				background:white;
				mso-pattern:white none;
				white-space:normal;}
				.xl7112133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri;
				mso-generic-font-family:auto;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7212133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri;
				mso-generic-font-family:auto;
				mso-font-charset:0;
				mso-number-format:Standard;
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7312133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri;
				mso-generic-font-family:auto;
				mso-font-charset:0;
				mso-number-format:Fixed;
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7412133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri;
				mso-generic-font-family:auto;
				mso-font-charset:0;
				mso-number-format:Percent;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7512133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri;
				mso-generic-font-family:auto;
				mso-font-charset:0;
				mso-number-format:Percent;
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7612133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri;
				mso-generic-font-family:auto;
				mso-font-charset:0;
				mso-number-format:Percent;
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7712133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border:.5pt solid black;
				background:#BFBFBF;
				mso-pattern:#BFBFBF none;
				white-space:normal;}
				.xl7812133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border:.5pt solid black;
				background:#F7F7F7;
				mso-pattern:#F7F7F7 none;
				white-space:normal;}
				.xl7912133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri;
				mso-generic-font-family:auto;
				mso-font-charset:0;
				mso-number-format:"0\.0%";
				text-align:general;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl8012133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border:.5pt solid black;
				background:white;
				mso-pattern:white none;
				white-space:normal;}
				.xl8112133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri;
				mso-generic-font-family:auto;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:right;
				vertical-align:bottom;
				border:.5pt solid windowtext;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl8212133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:14.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border-top:.5pt solid black;
				border-right:none;
				border-bottom:.5pt solid black;
				border-left:.5pt solid black;
				background:#BFBFBF;
				mso-pattern:#BFBFBF none;
				white-space:normal;}
				.xl8312133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:windowtext;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				border-top:.5pt solid black;
				border-right:none;
				border-bottom:.5pt solid black;
				border-left:none;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl8412133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:windowtext;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				border-top:.5pt solid black;
				border-right:.5pt solid black;
				border-bottom:.5pt solid black;
				border-left:none;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl8512133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:14.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border-top:.5pt solid black;
				border-right:none;
				border-bottom:.5pt solid black;
				border-left:.5pt solid black;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:normal;}
				.xl8612133
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:20.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border-top:.5pt solid black;
				border-right:none;
				border-bottom:.5pt solid black;
				border-left:.5pt solid black;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:normal;}
				--&amp;gt;
			</style>
			<div id="Cálculos PF (Rafael Alvarado) 2024_12133" align="center" x:publishsource="Excel">

				<table border="0" cellpadding="0" cellspacing="0" width="6286" style="border-collapse:&#10; collapse;table-layout:fixed;width:4716pt">
					<colgroup>
						<col width="100" style="mso-width-source:userset;mso-width-alt:3657;width:75pt" />
						<col width="99" span="2" style="mso-width-source:userset;mso-width-alt:3620;&#10; width:74pt" />
						<col width="84" span="2" style="mso-width-source:userset;mso-width-alt:3072;&#10; width:63pt" />
						<col width="86" style="mso-width-source:userset;mso-width-alt:3145;width:65pt" />
						<col width="91" style="mso-width-source:userset;mso-width-alt:3328;width:68pt" />
						<col width="86" style="mso-width-source:userset;mso-width-alt:3145;width:65pt" />
						<col width="84" span="2" style="mso-width-source:userset;mso-width-alt:3072;&#10; width:63pt" />
						<col width="107" style="mso-width-source:userset;mso-width-alt:3913;width:80pt" />
						<col width="91" style="mso-width-source:userset;mso-width-alt:3328;width:68pt" />
						<col width="86" style="mso-width-source:userset;mso-width-alt:3145;width:65pt" />
						<col width="84" span="2" style="mso-width-source:userset;mso-width-alt:3072;&#10; width:63pt" />
						<col width="99" span="2" style="mso-width-source:userset;mso-width-alt:3620;&#10; width:74pt" />
						<col width="86" style="mso-width-source:userset;mso-width-alt:3145;width:65pt" />
						<col width="84" span="2" style="mso-width-source:userset;mso-width-alt:3072;&#10; width:63pt" />
						<col width="99" span="2" style="mso-width-source:userset;mso-width-alt:3620;&#10; width:74pt" />
						<col width="86" style="mso-width-source:userset;mso-width-alt:3145;width:65pt" />
						<col width="84" span="2" style="mso-width-source:userset;mso-width-alt:3072;&#10; width:63pt" />
						<col width="107" style="mso-width-source:userset;mso-width-alt:3913;width:80pt" />
						<col width="116" style="mso-width-source:userset;mso-width-alt:4242;width:87pt" />
						<col width="86" style="mso-width-source:userset;mso-width-alt:3145;width:65pt" />
						<col width="135" span="2" style="mso-width-source:userset;mso-width-alt:4937;&#10; width:101pt" />
						<col width="107" style="mso-width-source:userset;mso-width-alt:3913;width:80pt" />
						<col width="116" style="mso-width-source:userset;mso-width-alt:4242;width:87pt" />
						<col width="86" style="mso-width-source:userset;mso-width-alt:3145;width:65pt" />
						<col width="161" span="2" style="mso-width-source:userset;mso-width-alt:5888;&#10; width:121pt" />
						<col width="107" style="mso-width-source:userset;mso-width-alt:3913;width:80pt" />
						<col width="116" style="mso-width-source:userset;mso-width-alt:4242;width:87pt" />
						<col width="86" style="mso-width-source:userset;mso-width-alt:3145;width:65pt" />
						<col width="141" span="2" style="mso-width-source:userset;mso-width-alt:5156;&#10; width:106pt" />
						<col width="107" style="mso-width-source:userset;mso-width-alt:3913;width:80pt" />
						<col width="116" style="mso-width-source:userset;mso-width-alt:4242;width:87pt" />
						<col width="86" style="mso-width-source:userset;mso-width-alt:3145;width:65pt" />
						<col width="134" span="2" style="mso-width-source:userset;mso-width-alt:4900;&#10; width:101pt" />
						<col width="107" style="mso-width-source:userset;mso-width-alt:3913;width:80pt" />
						<col width="116" style="mso-width-source:userset;mso-width-alt:4242;width:87pt" />
						<col width="99" style="mso-width-source:userset;mso-width-alt:3620;width:74pt" />
						<col width="152" span="2" style="mso-width-source:userset;mso-width-alt:5558;&#10; width:114pt" />
						<col width="107" style="mso-width-source:userset;mso-width-alt:3913;width:80pt" />
						<col width="116" style="mso-width-source:userset;mso-width-alt:4242;width:87pt" />
						<col width="99" style="mso-width-source:userset;mso-width-alt:3620;width:74pt" />
						<col width="125" span="2" style="mso-width-source:userset;mso-width-alt:4571;&#10; width:94pt" />
						<col width="107" style="mso-width-source:userset;mso-width-alt:3913;width:80pt" />
						<col width="116" style="mso-width-source:userset;mso-width-alt:4242;width:87pt" />
						<col width="99" style="mso-width-source:userset;mso-width-alt:3620;width:74pt" />
						<col width="135" style="mso-width-source:userset;mso-width-alt:4937;width:101pt" />
					</colgroup>
					<tbody>
						<tr height="20" style="height:15.0pt">
							<td colspan="59" height="20" class="xl8612133" width="6286" style="border-right:.5pt solid black;&#10;  height:15.0pt;width:4716pt">
								II.- Tarifas mensuales de pagos provisionales de
								ISR para personas físicas con actividad empresarial:
							</td>
						</tr>
						<tr height="24" style="height:18.0pt">
							<td colspan="4" height="24" class="xl8512133" width="382" style="border-right:.5pt solid black;&#10;  height:18.0pt;width:286pt">ENERO</td>
							<td class="xl6312133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt"> </td>
							<td colspan="4" class="xl8212133" width="347" style="border-right:.5pt solid black;&#10;  border-left:none;width:261pt">FEBRERO</td>
							<td class="xl6412133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt"> </td>
							<td colspan="4" class="xl8512133" width="368" style="border-right:.5pt solid black;&#10;  border-left:none;width:276pt">MARZO</td>
							<td class="xl6312133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt"> </td>
							<td colspan="4" class="xl8212133" width="368" style="border-right:.5pt solid black;&#10;  border-left:none;width:276pt">ABRIL</td>
							<td class="xl6412133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt"> </td>
							<td colspan="4" class="xl8512133" width="368" style="border-right:.5pt solid black;&#10;  border-left:none;width:276pt">MAYO</td>
							<td class="xl6312133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt"> </td>
							<td colspan="4" class="xl8212133" width="444" style="border-right:.5pt solid black;&#10;  border-left:none;width:333pt">JUNIO</td>
							<td class="xl6412133" width="135" style="border-top:none;border-left:none;&#10;  width:101pt"> </td>
							<td colspan="4" class="xl8512133" width="470" style="border-right:.5pt solid black;&#10;  border-left:none;width:353pt">JULIO</td>
							<td class="xl6312133" width="161" style="border-top:none;border-left:none;&#10;  width:121pt"> </td>
							<td colspan="4" class="xl8512133" width="450" style="border-right:.5pt solid black;&#10;  border-left:none;width:338pt">AGOSTO</td>
							<td class="xl6312133" width="141" style="border-top:none;border-left:none;&#10;  width:106pt"> </td>
							<td colspan="4" class="xl8512133" width="443" style="border-right:.5pt solid black;&#10;  border-left:none;width:333pt">SEPTIEMBRE</td>
							<td class="xl6312133" width="134" style="border-top:none;border-left:none;&#10;  width:101pt"> </td>
							<td colspan="4" class="xl8212133" width="474" style="border-right:.5pt solid black;&#10;  border-left:none;width:355pt">OCTUBRE</td>
							<td class="xl6412133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td colspan="4" class="xl8512133" width="447" style="border-right:.5pt solid black;&#10;  border-left:none;width:335pt">NOVIEMBRE</td>
							<td class="xl6312133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td colspan="4" class="xl8212133" width="457" style="border-right:.5pt solid black;&#10;  border-left:none;width:342pt">DICIEMBRE</td>
						</tr>
						<tr height="80" style="height:60.0pt">
							<td height="80" class="xl6512133" width="100" style="height:60.0pt;border-top:none;&#10;  width:75pt">Límite inferior</td>
							<td class="xl6512133" width="99" style="border-top:none;border-left:none;&#10;  width:74pt">Límite superior</td>
							<td class="xl6512133" width="99" style="border-top:none;border-left:none;&#10;  width:74pt">Cuota fija</td>
							<td class="xl6612133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt">% Sobre excedente del límite inferior</td>
							<td class="xl6612133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt"> </td>
							<td class="xl6712133" width="86" style="border-top:none;border-left:none;&#10;  width:65pt">Límite inferior</td>
							<td class="xl6712133" width="91" style="border-top:none;border-left:none;&#10;  width:68pt">Límite superior</td>
							<td class="xl6712133" width="86" style="border-top:none;border-left:none;&#10;  width:65pt">Cuota fija</td>
							<td class="xl6812133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt">% Sobre excedente del límite inferior</td>
							<td class="xl6812133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt"> </td>
							<td class="xl6512133" width="107" style="border-top:none;border-left:none;&#10;  width:80pt">Límite inferior</td>
							<td class="xl6512133" width="91" style="border-top:none;border-left:none;&#10;  width:68pt">Límite superior</td>
							<td class="xl6512133" width="86" style="border-top:none;border-left:none;&#10;  width:65pt">Cuota fija</td>
							<td class="xl6612133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt">% Sobre excedente del límite inferior</td>
							<td class="xl6612133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt"> </td>
							<td class="xl6712133" width="99" style="border-top:none;border-left:none;&#10;  width:74pt">Límite inferior</td>
							<td class="xl6712133" width="99" style="border-top:none;border-left:none;&#10;  width:74pt">Límite superior</td>
							<td class="xl6712133" width="86" style="border-top:none;border-left:none;&#10;  width:65pt">Cuota fija</td>
							<td class="xl6812133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt">% Sobre excedente del límite inferior</td>
							<td class="xl6812133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt"> </td>
							<td class="xl6512133" width="99" style="border-top:none;border-left:none;&#10;  width:74pt">Límite inferior</td>
							<td class="xl6512133" width="99" style="border-top:none;border-left:none;&#10;  width:74pt">Límite superior</td>
							<td class="xl6912133" width="86" style="border-top:none;border-left:none;&#10;  width:65pt">Cuota fija</td>
							<td class="xl7012133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt">% Sobre excedente del límite inferior</td>
							<td class="xl7012133" width="84" style="border-top:none;border-left:none;&#10;  width:63pt"> </td>
							<td class="xl6712133" width="107" style="border-top:none;border-left:none;&#10;  width:80pt">Límite inferior</td>
							<td class="xl6712133" width="116" style="border-top:none;border-left:none;&#10;  width:87pt">Límite superior</td>
							<td class="xl6712133" width="86" style="border-top:none;border-left:none;&#10;  width:65pt">Cuota fija</td>
							<td class="xl6712133" width="135" style="border-top:none;border-left:none;&#10;  width:101pt">% Sobre excedente del límite inferior</td>
							<td class="xl6712133" width="135" style="border-top:none;border-left:none;&#10;  width:101pt"> </td>
							<td class="xl6912133" width="107" style="border-top:none;border-left:none;&#10;  width:80pt">Límite inferior</td>
							<td class="xl6912133" width="116" style="border-top:none;border-left:none;&#10;  width:87pt">Límite superior</td>
							<td class="xl6912133" width="86" style="border-top:none;border-left:none;&#10;  width:65pt">Cuota fija</td>
							<td class="xl6912133" width="161" style="border-top:none;border-left:none;&#10;  width:121pt">% Sobre excedente del límite inferior</td>
							<td class="xl6912133" width="161" style="border-top:none;border-left:none;&#10;  width:121pt"> </td>
							<td class="xl6712133" width="107" style="border-top:none;border-left:none;&#10;  width:80pt">Límite inferior</td>
							<td class="xl6712133" width="116" style="border-top:none;border-left:none;&#10;  width:87pt">Límite superior</td>
							<td class="xl6712133" width="86" style="border-top:none;border-left:none;&#10;  width:65pt">Cuota fija</td>
							<td class="xl6712133" width="141" style="border-top:none;border-left:none;&#10;  width:106pt">% Sobre excedente del límite inferior</td>
							<td class="xl6712133" width="141" style="border-top:none;border-left:none;&#10;  width:106pt"> </td>
							<td class="xl6912133" width="107" style="border-top:none;border-left:none;&#10;  width:80pt">Límite inferior</td>
							<td class="xl6512133" width="116" style="border-top:none;border-left:none;&#10;  width:87pt">Límite superior</td>
							<td class="xl6512133" width="86" style="border-top:none;border-left:none;&#10;  width:65pt">Cuota fija</td>
							<td class="xl6912133" width="134" style="border-top:none;border-left:none;&#10;  width:101pt">% Sobre excedente del límite inferior</td>
							<td class="xl6912133" width="134" style="border-top:none;border-left:none;&#10;  width:101pt"> </td>
							<td class="xl6712133" width="107" style="border-top:none;border-left:none;&#10;  width:80pt">Límite inferior</td>
							<td class="xl6712133" width="116" style="border-top:none;border-left:none;&#10;  width:87pt">Límite superior</td>
							<td class="xl6712133" width="99" style="border-top:none;border-left:none;&#10;  width:74pt">Cuota fija</td>
							<td class="xl6712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt">% Sobre excedente del límite inferior</td>
							<td class="xl6712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl6512133" width="107" style="border-top:none;border-left:none;&#10;  width:80pt">Límite inferior</td>
							<td class="xl6512133" width="116" style="border-top:none;border-left:none;&#10;  width:87pt">Límite superior</td>
							<td class="xl6512133" width="99" style="border-top:none;border-left:none;&#10;  width:74pt">Cuota fija</td>
							<td class="xl6912133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt">% Sobre excedente del límite inferior</td>
							<td class="xl6912133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl6712133" width="107" style="border-top:none;border-left:none;&#10;  width:80pt">Límite inferior</td>
							<td class="xl6712133" width="116" style="border-top:none;border-left:none;&#10;  width:87pt">Límite superior</td>
							<td class="xl6712133" width="99" style="border-top:none;border-left:none;&#10;  width:74pt">Cuota fija</td>
							<td class="xl6712133" width="135" style="border-top:none;border-left:none;&#10;  width:101pt">% Sobre excedente del límite inferior</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7112133" align="right" style="height:15.0pt;border-top:&#10;  none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">746.04</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7412133" align="right">1.92%</td>
							<td class="xl7112133"> </td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,492.08</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7412133" align="right">1.92%</td>
							<td class="xl7112133" align="right">1.92</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,238.12</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7512133" align="right" style="border-left:none">1.92%</td>
							<td class="xl7112133" align="right" style="border-left:none">1.92</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,984.16</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7612133" align="right" style="border-left:none">1.92%</td>
							<td class="xl7112133" align="right" style="border-left:none">1.92</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,730.20</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7612133" align="right" style="border-left:none">1.92%</td>
							<td class="xl7112133" align="right" style="border-left:none">1.92</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">4,476.24</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7612133" align="right" style="border-top:none;border-left:none">1.92%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">5,222.28</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7612133" align="right" style="border-top:none;border-left:none">1.92%</td>
							<td class="xl7312133" style="border-top:none;border-left:none"> </td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">5,968.32</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7612133" align="right" style="border-top:none;border-left:none">1.92%</td>
							<td class="xl7112133" style="border-top:none;border-left:none"> </td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">6,714.36</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7612133" align="right" style="border-top:none;border-left:none">1.92%</td>
							<td class="xl7112133" style="border-top:none;border-left:none"> </td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">7,460.40</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7612133" align="right" style="border-top:none;border-left:none">1.92%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">8,206.44</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7612133" align="right" style="border-top:none;border-left:none">1.92%</td>
							<td class="xl7812133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">0.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">8,952.49</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">0.00</td>
							<td class="xl7612133" align="right" style="border-top:none;border-left:none">1.92%</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7212133" align="right" style="height:15.0pt;border-top:&#10;  none">746.05</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">6,332.05</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">14.32</td>
							<td class="xl7412133" align="right">6.40%</td>
							<td class="xl7212133" style="border-top:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,492.09</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">12,664.10</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">28.64</td>
							<td class="xl7412133" align="right">6.40%</td>
							<td class="xl7312133" align="right" style="border-top:none">6.40</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,238.13</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">18,996.15</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">42.96</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">6.40%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">6.40</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,984.17</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">25,328.20</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">57.28</td>
							<td class="xl7912133" align="right" style="border-top:none;border-left:none">6.4%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">6.40</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,730.21</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">31,660.25</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">71.6</td>
							<td class="xl7912133" align="right" style="border-top:none;border-left:none">6.4%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">6.40</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">4,476.25</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">37,992.30</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">85.92</td>
							<td class="xl7912133" align="right" style="border-top:none;border-left:none">6.4%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">5,222.29</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">44,324.35</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">100.24</td>
							<td class="xl7912133" align="right" style="border-top:none;border-left:none">6.4%</td>
							<td class="xl7112133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">5,968.33</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">50,656.40</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">114.56</td>
							<td class="xl7912133" align="right" style="border-top:none;border-left:none">6.4%</td>
							<td class="xl7312133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">6,714.37</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">56,988.45</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">128.88</td>
							<td class="xl7912133" align="right" style="border-top:none;border-left:none">6.4%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">7,460.41</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">63,320.50</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">143.2</td>
							<td class="xl7912133" align="right" style="border-top:none;border-left:none">6.4%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">8,206.45</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">69,652.55</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">157.52</td>
							<td class="xl7912133" align="right" style="border-top:none;border-left:none">6.4%</td>
							<td class="xl8012133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">8,952.50</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">75,984.55</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">171.88</td>
							<td class="xl7912133" align="right" style="border-top:none;border-left:none">6.4%</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7212133" align="right" style="height:15.0pt;border-top:&#10;  none">6,332.06</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">11,128.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">371.83</td>
							<td class="xl7412133" align="right">10.88%</td>
							<td class="xl7212133" style="border-top:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">12,664.11</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">22,256.02</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">743.66</td>
							<td class="xl7412133" align="right">10.88%</td>
							<td class="xl7112133" align="right" style="border-top:none">10.88</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">18,996.16</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">33,384.03</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,115.49</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">10.88%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">10.88</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">25,328.21</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">44,512.04</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,487.32</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">10.88%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">10.88</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">31,660.26</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">55,640.05</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,859.15</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">10.88%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">10.88</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">37,992.31</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">66,768.06</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,230.98</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">10.88%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">44,324.36</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">77,896.07</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,602.81</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">10.88%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">50,656.41</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">89,024.08</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,974.64</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">10.88%</td>
							<td class="xl7112133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">56,988.46</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">100,152.09</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,346.47</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">10.88%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">63,320.51</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">111,280.10</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,718.30</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">10.88%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">69,652.56</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">122,408.11</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">4,090.13</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">10.88%</td>
							<td class="xl7812133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">75,984.56</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">133,536.07</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">4,461.94</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">10.88%</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7212133" align="right" style="height:15.0pt;border-top:&#10;  none">11,128.02</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">12,935.82</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">893.63</td>
							<td class="xl7412133" align="right">16.00%</td>
							<td class="xl7212133" style="border-top:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">22,256.03</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">25,871.64</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">1787.26</td>
							<td class="xl7412133" align="right">16.00%</td>
							<td class="xl7312133" align="right" style="border-top:none">16.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">33,384.04</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">38,807.46</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">2680.89</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">16.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">16.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">44,512.05</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">51,743.28</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">3574.52</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">16.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">16.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">55,640.06</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">64,679.10</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">4468.15</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">16.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">16.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">66,768.07</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">77,614.92</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">5361.78</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">16.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">77,896.08</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">90,550.74</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">6255.41</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">16.00%</td>
							<td class="xl7312133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">89,024.09</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">103,486.56</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">7149.04</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">16.00%</td>
							<td class="xl7312133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">100,152.10</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">116,422.38</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">8042.67</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">16.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">111,280.11</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">129,358.20</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">8936.30</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">16.00%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">122,408.12</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">142,294.02</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">9829.93</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">16.00%</td>
							<td class="xl8012133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">133,536.08</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">155,229.80</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">10723.55</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">16.00%</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7212133" align="right" style="height:15.0pt;border-top:&#10;  none">12,935.83</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">15,487.71</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,182.88</td>
							<td class="xl7412133" align="right">17.92%</td>
							<td class="xl7212133" style="border-top:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">25,871.65</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">30,975.42</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,365.76</td>
							<td class="xl7412133" align="right">17.92%</td>
							<td class="xl7112133" align="right" style="border-top:none">17.92</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">38,807.47</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">46,463.13</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,548.64</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">17.92%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">17.92</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">51,743.29</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">61,950.84</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">4,731.52</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">17.92%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">17.92</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">64,679.11</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">77,438.55</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">5,914.40</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">17.92%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">17.92</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">77,614.93</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">92,926.26</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">7,097.28</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">17.92%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">90,550.75</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">108,413.97</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">8,280.16</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">17.92%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">103,486.57</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">123,901.68</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">9,463.04</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">17.92%</td>
							<td class="xl7112133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">116,422.39</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">139,389.39</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">10,645.92</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">17.92%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">129,358.21</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">154,877.10</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">11,828.80</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">17.92%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">142,294.03</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">170,364.81</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">13,011.68</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">17.92%</td>
							<td class="xl7812133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">155,229.81</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">185,852.57</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">14,194.54</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">17.92%</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7212133" align="right" style="height:15.0pt;border-top:&#10;  none">15,487.72</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">31,236.49</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,640.18</td>
							<td class="xl7412133" align="right">21.36%</td>
							<td class="xl7212133" style="border-top:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">30,975.43</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">62,472.98</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,280.36</td>
							<td class="xl7412133" align="right">21.36%</td>
							<td class="xl7112133" align="right" style="border-top:none">21.36</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">46,463.14</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">93,709.47</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">4,920.54</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">21.36%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">21.36</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">61,950.85</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">124,945.96</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">6,560.72</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">21.36%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">21.36</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">77,438.56</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">156,182.45</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">8,200.90</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">21.36%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">21.36</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">92,926.27</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">187,418.94</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">9,841.08</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">21.36%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">108,413.98</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">218,655.43</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">11,481.26</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">21.36%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">123,901.69</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">249,891.92</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">13,121.44</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">21.36%</td>
							<td class="xl7112133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">139,389.40</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">281,128.41</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">14,761.62</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">21.36%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">154,877.11</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">312,364.90</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">16,401.80</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">21.36%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">170,364.82</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">343,601.39</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">18,041.98</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">21.36%</td>
							<td class="xl8012133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">185,852.58</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">374,837.88</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">19,682.13</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">21.36%</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7212133" align="right" style="height:15.0pt;border-top:&#10;  none">31,236.50</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">49,233.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">5,004.12</td>
							<td class="xl7412133" align="right">23.52%</td>
							<td class="xl7212133" style="border-top:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">62,472.99</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">98,466.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">10,008.24</td>
							<td class="xl7412133" align="right">23.52%</td>
							<td class="xl7112133" align="right" style="border-top:none">23.52</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">93,709.48</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">147,699.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">15,012.36</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">23.52%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">23.52</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">124,945.97</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">196,932.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">20,016.48</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">23.52%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">23.52</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">156,182.46</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">246,165.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">25,020.60</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">23.52%</td>
							<td class="xl7112133" align="right" style="border-top:none;border-left:none">23.52</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">187,418.95</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">295,398.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">30,024.72</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">23.52%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">218,655.44</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">344,631.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">35,028.84</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">23.52%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">249,891.93</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">393,864.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">40,032.96</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">23.52%</td>
							<td class="xl7112133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">281,128.42</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">443,097.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">45,037.08</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">23.52%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">312,364.91</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">492,330.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">50,041.20</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">23.52%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">343,601.40</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">541,563.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">55,045.32</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">23.52%</td>
							<td class="xl7812133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">374,837.89</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">590,795.99</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">60,049.40</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">23.52%</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7212133" align="right" style="height:15.0pt;border-top:&#10;  none">49,233.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">93,993.90</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">9,236.89</td>
							<td class="xl7412133" align="right">30.00%</td>
							<td class="xl7212133" style="border-top:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">98,466.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">187,987.80</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">18,473.78</td>
							<td class="xl7412133" align="right">30.00%</td>
							<td class="xl7312133" align="right" style="border-top:none">30.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">147,699.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">281,981.70</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">27,710.67</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">30.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">30.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">196,932.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">375,975.60</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">36,947.56</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">30.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">30.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">246,165.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">469,969.50</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">46,184.45</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">30.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">30.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">295,398.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">563,963.40</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">55,421.34</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">30.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">344,631.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">657,957.30</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">64,658.23</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">30.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">393,864.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">751,951.20</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">73,895.12</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">30.00%</td>
							<td class="xl7312133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">443,097.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">845,945.10</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">83,132.01</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">30.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">492,330.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">939,939.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">92,368.90</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">30.00%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">541,563.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,033,932.90</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">101,605.79</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">30.00%</td>
							<td class="xl8012133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">590,796.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,127,926.84</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">110,842.74</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">30.00%</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7212133" align="right" style="height:15.0pt;border-top:&#10;  none">93,993.91</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">125,325.20</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">22,665.17</td>
							<td class="xl7412133" align="right">32.00%</td>
							<td class="xl7212133" style="border-top:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">187,987.81</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">250,650.40</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">45,330.34</td>
							<td class="xl7412133" align="right">32.00%</td>
							<td class="xl7312133" align="right" style="border-top:none">32.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">281,981.71</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">375,975.60</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">67,995.51</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">32.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">32.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">375,975.61</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">501,300.80</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">90,660.68</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">32.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">32.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">469,969.51</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">626,626.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">113,325.85</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">32.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">32.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">563,963.41</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">751,951.20</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">135,991.02</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">32.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">657,957.31</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">877,276.40</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">158,656.19</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">32.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">751,951.21</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,002,601.60</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">181,321.36</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">32.00%</td>
							<td class="xl7312133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">845,945.11</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,127,926.80</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">203,986.53</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">32.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">939,939.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,253,252.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">226,651.70</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">32.00%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,033,932.91</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,378,577.20</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">249,316.87</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">32.00%</td>
							<td class="xl7812133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,127,926.85</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,503,902.46</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">271,981.99</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">32.00%</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7212133" align="right" style="height:15.0pt;border-top:&#10;  none">125,325.21</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">375,975.61</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">32,691.18</td>
							<td class="xl7412133" align="right">34.00%</td>
							<td class="xl7212133" style="border-top:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">250,650.41</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">751,951.22</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">65,382.36</td>
							<td class="xl7412133" align="right">34.00%</td>
							<td class="xl7312133" align="right" style="border-top:none">34.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">375,975.61</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,127,926.83</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">98,073.54</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">34.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">34.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">501,300.81</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,503,902.44</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">130,764.72</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">34.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">34.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">626,626.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,879,878.05</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">163,455.90</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">34.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">34.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">751,951.21</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,255,853.66</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">196,147.08</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">34.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">877,276.41</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,631,829.27</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">228,838.26</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">34.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,002,601.61</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,007,804.88</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">261,529.44</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">34.00%</td>
							<td class="xl7312133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,127,926.81</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,383,780.49</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">294,220.62</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">34.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,253,252.01</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,759,756.10</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">326,911.80</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">34.00%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,378,577.21</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">4,135,731.71</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">359,602.98</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">34.00%</td>
							<td class="xl8012133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,503,902.47</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">4,511,707.37</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">392,294.17</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">34.00%</td>
						</tr>
						<tr height="20" style="height:15.0pt">
							<td height="20" class="xl7212133" align="right" style="height:15.0pt;border-top:&#10;  none">375,975.62</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">117,912.32</td>
							<td class="xl7412133" align="right">35.00%</td>
							<td class="xl7212133" style="border-top:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">751,951.23</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">235,824.64</td>
							<td class="xl7412133" align="right">35.00%</td>
							<td class="xl7312133" align="right" style="border-top:none">35.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,127,926.84</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">353,736.96</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">35.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">35.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,503,902.45</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">471,649.28</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">35.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">35.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,879,878.06</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">589,561.60</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">35.00%</td>
							<td class="xl7312133" align="right" style="border-top:none;border-left:none">35.00</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,255,853.67</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">707,473.92</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">35.00%</td>
							<td class="xl8112133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">2,631,829.28</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">825,386.24</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">35.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,007,804.89</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">943,298.56</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">35.00%</td>
							<td class="xl7312133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,383,780.50</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,061,210.88</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">35.00%</td>
							<td class="xl7212133" style="border-top:none;border-left:none"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">3,759,756.11</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,179,123.20</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">35.00%</td>
							<td class="xl7712133" width="152" style="border-top:none;border-left:none;&#10;  width:114pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">4,135,731.72</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,297,035.52</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">35.00%</td>
							<td class="xl7812133" width="125" style="border-top:none;border-left:none;&#10;  width:94pt"> </td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">4,511,707.38</td>
							<td class="xl8112133" style="border-top:none;border-left:none">EN ADELANTE</td>
							<td class="xl7212133" align="right" style="border-top:none;border-left:none">1,414,947.85</td>
							<td class="xl7512133" align="right" style="border-top:none;border-left:none">35.00%</td>
						</tr>
						<!--[if supportMisalignedColumns]-->
						<tr height="0" style="display:none">
							<td width="100" style="width:75pt"></td>
							<td width="99" style="width:74pt"></td>
							<td width="99" style="width:74pt"></td>
							<td width="84" style="width:63pt"></td>
							<td width="84" style="width:63pt"></td>
							<td width="86" style="width:65pt"></td>
							<td width="91" style="width:68pt"></td>
							<td width="86" style="width:65pt"></td>
							<td width="84" style="width:63pt"></td>
							<td width="84" style="width:63pt"></td>
							<td width="107" style="width:80pt"></td>
							<td width="91" style="width:68pt"></td>
							<td width="86" style="width:65pt"></td>
							<td width="84" style="width:63pt"></td>
							<td width="84" style="width:63pt"></td>
							<td width="99" style="width:74pt"></td>
							<td width="99" style="width:74pt"></td>
							<td width="86" style="width:65pt"></td>
							<td width="84" style="width:63pt"></td>
							<td width="84" style="width:63pt"></td>
							<td width="99" style="width:74pt"></td>
							<td width="99" style="width:74pt"></td>
							<td width="86" style="width:65pt"></td>
							<td width="84" style="width:63pt"></td>
							<td width="84" style="width:63pt"></td>
							<td width="107" style="width:80pt"></td>
							<td width="116" style="width:87pt"></td>
							<td width="86" style="width:65pt"></td>
							<td width="135" style="width:101pt"></td>
							<td width="135" style="width:101pt"></td>
							<td width="107" style="width:80pt"></td>
							<td width="116" style="width:87pt"></td>
							<td width="86" style="width:65pt"></td>
							<td width="161" style="width:121pt"></td>
							<td width="161" style="width:121pt"></td>
							<td width="107" style="width:80pt"></td>
							<td width="116" style="width:87pt"></td>
							<td width="86" style="width:65pt"></td>
							<td width="141" style="width:106pt"></td>
							<td width="141" style="width:106pt"></td>
							<td width="107" style="width:80pt"></td>
							<td width="116" style="width:87pt"></td>
							<td width="86" style="width:65pt"></td>
							<td width="134" style="width:101pt"></td>
							<td width="134" style="width:101pt"></td>
							<td width="107" style="width:80pt"></td>
							<td width="116" style="width:87pt"></td>
							<td width="99" style="width:74pt"></td>
							<td width="152" style="width:114pt"></td>
							<td width="152" style="width:114pt"></td>
							<td width="107" style="width:80pt"></td>
							<td width="116" style="width:87pt"></td>
							<td width="99" style="width:74pt"></td>
							<td width="125" style="width:94pt"></td>
							<td width="125" style="width:94pt"></td>
							<td width="107" style="width:80pt"></td>
							<td width="116" style="width:87pt"></td>
							<td width="99" style="width:74pt"></td>
							<td width="135" style="width:101pt"></td>
						</tr>
						<!--[endif]-->
					</tbody>
				</table>
			</div>
		</body>
	</xsl:template>
</xsl:stylesheet>
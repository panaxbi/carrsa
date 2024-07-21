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

	<xsl:key name="razon_social" match="razon_social[not(@state:selected)]/row/@id" use="'*'"/>
	<xsl:key name="razon_social" match="razon_social/row[@id=../@state:selected]/@id" use="'*'"/>
	<xsl:key name="amt" match="polizas/row/@amt" use="concat(../@src,'::',../@mt,'::',../@cl)"/>
	<xsl:template match="/">
		<body>
			<style id="Cálculos PF (Rafael Alvarado) 2024_16857_Styles">
				&amp;lt;!--table
				{mso-displayed-decimal-separator:"\.";
				mso-displayed-thousand-separator:"\,";}
				.xl1516857
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
				.xl6316857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl6416857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				border-top:none;
				border-right:none;
				border-bottom:2.0pt double black;
				border-left:none;
				background:#BDD6EE;
				mso-pattern:#BDD6EE none;
				white-space:nowrap;}
				.xl6516857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:Standard;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl6616857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:Standard;
				text-align:general;
				vertical-align:bottom;
				border-top:.5pt solid black;
				border-right:none;
				border-bottom:none;
				border-left:none;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl6716857
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
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl6816857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:22.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl6916857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7016857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:16.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7116857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7216857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				background:#BDD6EE;
				mso-pattern:#BDD6EE none;
				white-space:nowrap;}
				.xl7316857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:Standard;
				text-align:general;
				vertical-align:bottom;
				background:#BDD6EE;
				mso-pattern:#BDD6EE none;
				white-space:nowrap;}
				.xl7416857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:18.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7516857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7616857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:Fixed;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7716857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:red;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:"\#\,\#\#0\.00_ \;\[Red\]\\-\#\,\#\#0\.00\\ ";
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7816857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:"\#\,\#\#0\.00_ \;\[Red\]\\-\#\,\#\#0\.00\\ ";
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl7916857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:Standard;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl8016857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:12.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:Standard;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:normal;}
				.xl8116857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:#333333;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:Standard;
				text-align:general;
				vertical-align:top;
				background:#BDD6EE;
				mso-pattern:#BDD6EE none;
				white-space:normal;}
				.xl8216857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:#333333;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:top;
				background:white;
				mso-pattern:white none;
				white-space:normal;}
				.xl8316857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:#333333;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:Percent;
				text-align:general;
				vertical-align:top;
				background:#BDD6EE;
				mso-pattern:#BDD6EE none;
				white-space:normal;}
				.xl8416857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:Percent;
				text-align:general;
				vertical-align:bottom;
				background:#BDD6EE;
				mso-pattern:#BDD6EE none;
				white-space:nowrap;}
				.xl8516857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:Percent;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl8616857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:#333333;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:top;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:normal;}
				.xl8716857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:#333333;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:top;
				background:#BDD6EE;
				mso-pattern:#BDD6EE none;
				white-space:normal;}
				.xl8816857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:#333333;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:Standard;
				text-align:general;
				vertical-align:top;
				background:white;
				mso-pattern:white none;
				white-space:normal;}
				.xl8916857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:#333333;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:Standard;
				text-align:general;
				vertical-align:top;
				background:white;
				mso-pattern:white none;
				white-space:normal;}
				.xl9016857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				background:yellow;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl9116857
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
				background:yellow;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl9216857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:11.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				background:yellow;
				mso-pattern:black none;
				white-space:nowrap;}
				.xl9316857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:16.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl9416857
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:16.0pt;
				font-weight:700;
				font-style:normal;
				text-decoration:none;
				font-family:Calibri, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:center;
				vertical-align:middle;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				--&amp;gt;
			</style>
			<style>
				table.calculos td, table.calculos [scope=row]  {
					padding-inline: .5rem !important;
				}
			</style>
			<div id="Cálculos PF (Rafael Alvarado) 2024_16857" align="center" x:publishsource="Excel" class="selection-enabled validation-enabled">
				<table class="calculos bg-white" border="0" cellpadding="0" cellspacing="0" width="1243" style="border-collapse:&#10; collapse;table-layout:fixed;width:930pt">
					<colgroup>
						<col width="364" style="mso-width-source:userset;mso-width-alt:13312;width:273pt" />
						<col width="71" span="12" style="mso-width-source:userset; mso-width-alt:2596; width: 73pt;"/>
					</colgroup>
					<xsl:for-each select="key('razon_social','*')">
						<xsl:variable name="rs" select="."/>
						<tbody>
							<tr height="38" style="height:28.5pt">
								<td height="38" class="xl6816857" width="364" style="height:28.5pt;width:273pt">
									<xsl:apply-templates select="../@desc"/>
								</td>
								<td class="xl1516857" width="71" style="width:53pt"></td>
								<td class="xl1516857" width="71" style="width:53pt"></td>
								<td class="xl1516857" width="71" style="width:53pt"></td>
								<td class="xl1516857" width="71" style="width:53pt"></td>
								<td class="xl1516857" width="71" style="width:53pt"></td>
								<td class="xl1516857" width="74" style="width:56pt"></td>
								<td class="xl1516857" width="75" style="width:56pt"></td>
								<td class="xl1516857" width="75" style="width:56pt"></td>
								<td class="xl1516857" width="75" style="width:56pt"></td>
								<td class="xl1516857" width="75" style="width:56pt"></td>
								<td class="xl1516857" width="75" style="width:56pt"></td>
								<td class="xl1516857" width="75" style="width:56pt"></td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl6916857" style="height:15.0pt">AAJR711027D16</td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="34" style="mso-height-source:userset;height:25.5pt">
								<td colspan="7" height="34" class="xl9316857" style="height:25.5pt">
									Cálculo de IVA
									Ejercicio 2024
								</td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="29" style="height:21.75pt">
								<td height="29" class="xl7016857" style="height:21.75pt">INGRESOS</td>
								<td class="xl6416857">ENERO</td>
								<td class="xl6416857">FEBRERO</td>
								<td class="xl6416857">MARZO</td>
								<td class="xl6416857">ABRIL</td>
								<td class="xl6416857">MAYO</td>
								<td class="xl6416857">JUNIO</td>
								<td class="xl6416857">
									JULIO<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6416857">AGOSTO</td>
								<td class="xl6416857">SEPTIEMBRE</td>
								<td class="xl6416857">OCTUBRE</td>
								<td class="xl6416857">NOVIEMBRE</td>
								<td class="xl6416857">DICIEMBRE</td>
							</tr>
							<xsl:for-each select="//clasificacion/row/@id">
								<xsl:variable name="cl" select="."/>
								<tr height="21" style="height:15.75pt">
									<th scope="row" height="21" class="xl7116857" style="height:15.75pt; text-transform: uppercase; ">
										<xsl:apply-templates select="../@desc"/>
										<span style="mso-spacerun:yes"> </span>
									</th>
									<xsl:for-each select="//fechas/row/@key">
										<td class="xl6516857 cell money" align="right">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="key('amt',concat($rs,'::',.,'::',$cl))"/>
											</xsl:call-template>
										</td>
									</xsl:for-each>
								</tr>
							</xsl:for-each>
							<!--<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7116857" style="height:15.0pt">CAJA</td>
								<td class="xl6516857" align="right">3,791.02</td>
								<td class="xl6516857" align="right">2,000.00</td>
								<td class="xl6516857" align="right">5,050.00</td>
								<td class="xl6516857" align="right">0.01</td>
								<td class="xl6516857" align="right">1,400.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7116857" style="height:15.0pt">DEVOLUCIONES</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7116857" style="height:15.0pt">
									TRASPASOS ENTRE
									CUENTAS<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6516857" align="right">9,900.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">2,160.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7116857" style="height:15.0pt">
									PRESTAMOS<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">30,000.00</td>
								<td class="xl6516857" align="right">110,247.67</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7116857" style="height:15.0pt">
									OTROS QUE NO GRAVAN<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">6,000.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>-->
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7116857" style="height:15.0pt">
									INGRESOS GRAVADOS<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6516857" align="right">131,595.74</td>
								<td class="xl6516857" align="right">189,257.27</td>
								<td class="xl6516857" align="right">154,785.13</td>
								<td class="xl6516857" align="right">143,861.57</td>
								<td class="xl6516857" align="right">143,861.50</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl1516857" style="height:15.0pt"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7116857" style="height:15.0pt">BASE GRAVABLE 16%</td>
								<td class="xl6516857" align="right">113,444.60</td>
								<td class="xl6516857" align="right">163,152.82</td>
								<td class="xl6516857" align="right">133,435.46</td>
								<td class="xl6516857" align="right">124,018.59</td>
								<td class="xl6516857" align="right">124,018.53</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl1516857" style="height:15.0pt"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7216857" style="height:15.0pt">IVA POR PAGAR 16%</td>
								<td class="xl7316857" align="right">18,151.14</td>
								<td class="xl7316857" align="right">26,104.45</td>
								<td class="xl7316857" align="right">21,349.67</td>
								<td class="xl7316857" align="right">19,842.98</td>
								<td class="xl7316857" align="right">19,842.97</td>
								<td class="xl7316857" align="right">0.00</td>
								<td class="xl7316857" align="right">0.00</td>
								<td class="xl7316857" align="right">0.00</td>
								<td class="xl7316857" align="right">0.00</td>
								<td class="xl7316857" align="right">0.00</td>
								<td class="xl7316857" align="right">0.00</td>
								<td class="xl7316857" align="right">0.00</td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl1516857" style="height:15.0pt"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl1516857" style="height:15.0pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="31" style="height:23.25pt">
								<td height="31" class="xl7416857" style="height:23.25pt">Deducciones</td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7116857" style="height:15.0pt">
									Importe de IVA
									Acreditable 16%
								</td>
								<td class="xl6516857" align="right">14,915.85</td>
								<td class="xl6516857" align="right">21,662.65</td>
								<td class="xl6516857" align="right">16,281.23</td>
								<td class="xl6516857" align="right">398.47</td>
								<td class="xl6516857" align="right">24,740.64</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7116857" style="height:15.0pt">
									Importe de IVA
									Acreditable 8%
								</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7516857" style="height:15.75pt">Total IVA Acreditable</td>
								<td class="xl6616857" align="right">14,915.85</td>
								<td class="xl6616857" align="right">21,662.65</td>
								<td class="xl6616857" align="right">16,281.23</td>
								<td class="xl6616857" align="right">398.47</td>
								<td class="xl6616857" align="right">24,740.64</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6516857" style="height:15.75pt">IVA Retenciones</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
								<td class="xl7616857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7716857" style="height:15.75pt">
									IVA Por Pagar o a Favor
									-1,127.06
								</td>
								<td class="xl7816857" align="right">3,235.29 </td>
								<td class="xl7816857" align="right">4,441.80 </td>
								<td class="xl7816857" align="right">5,068.44 </td>
								<td class="xl7816857" align="right">19,444.51 </td>
								<td class="xl7816857" align="right">
									<font color="#FF0000" style="mso-ignore:color">
										-4,897.67
									</font>
								</td>
								<td class="xl7816857" align="right">0.00 </td>
								<td class="xl7816857" align="right">0.00 </td>
								<td class="xl7816857" align="right">0.00 </td>
								<td class="xl7816857" align="right">0.00 </td>
								<td class="xl7816857" align="right">0.00 </td>
								<td class="xl7816857" align="right">0.00 </td>
								<td class="xl7816857" align="right">0.00 </td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr class="xl6716857" height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6516857" style="height:15.75pt">
									IVA Acreditable de
									Periodos Anteriores
								</td>
								<td class="xl7916857" align="right">1,127.06</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8016857" width="364" style="height:15.75pt;width:273pt">
									IVA
									por Pagar despues de Acreditaciones
								</td>
								<td class="xl6516857" align="right">2,108.23</td>
								<td class="xl6516857" align="right">4,441.80</td>
								<td class="xl6516857" align="right">5,068.44</td>
								<td class="xl6516857" align="right">19,444.51</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl9016857" style="height:15.75pt">PRESENTADA</td>
								<td class="xl9016857">SI</td>
								<td class="xl9016857"> </td>
								<td class="xl9016857"> </td>
								<td class="xl9016857"> </td>
								<td class="xl9016857"> </td>
								<td class="xl9016857"> </td>
								<td class="xl9216857"> </td>
								<td class="xl9216857"> </td>
								<td class="xl9216857"> </td>
								<td class="xl9216857"> </td>
								<td class="xl9216857"> </td>
								<td class="xl9216857"> </td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
							</tr>
							<tr height="28" style="mso-height-source:userset;height:21.0pt">
								<td colspan="7" height="28" class="xl9416857" style="height:21.0pt">
									<a name="RANGE!A35:G79">Cálculo de ISR Ejercicio 2024</a>
								</td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7016857" style="height:15.75pt">INGRESOS</td>
								<td class="xl6416857">ENERO</td>
								<td class="xl6416857">FEBRERO</td>
								<td class="xl6416857">MARZO</td>
								<td class="xl6416857">ABRIL</td>
								<td class="xl6416857">MAYO</td>
								<td class="xl6416857">JUNIO</td>
								<td class="xl6416857">JULIO</td>
								<td class="xl6416857">AGOSTO</td>
								<td class="xl6416857">SEPTIEMBRE</td>
								<td class="xl6416857">OCTUBRE</td>
								<td class="xl6416857">NOVIEMBRE</td>
								<td class="xl6416857">DICIEMBRE</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									INGRESOS DEL
									PERIODO<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6516857" align="right">113,444.60</td>
								<td class="xl6516857" align="right">163,152.82</td>
								<td class="xl6516857" align="right">133,435.46</td>
								<td class="xl6516857" align="right">124,018.59</td>
								<td class="xl6516857" align="right">124,018.53</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									INGRESOS DE PERIODOS
									ANTERIORES
								</td>
								<td class="xl6316857" align="right">0</td>
								<td class="xl6516857" align="right">113,444.60</td>
								<td class="xl6516857" align="right">276,597.42</td>
								<td class="xl6516857" align="right">410,032.88</td>
								<td class="xl6516857" align="right">534,051.47</td>
								<td class="xl6516857" align="right">658,070.01</td>
								<td class="xl6516857" align="right">658,070.01</td>
								<td class="xl6516857" align="right">658,070.01</td>
								<td class="xl6516857" align="right">658,070.01</td>
								<td class="xl6516857" align="right">658,070.01</td>
								<td class="xl6516857" align="right">658,070.01</td>
								<td class="xl6516857" align="right">658,070.01</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7216857" style="height:15.75pt">
									INGRESOS ACUMULADOS<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl7316857" align="right">113,444.60</td>
								<td class="xl7316857" align="right">276,597.42</td>
								<td class="xl7316857" align="right">410,032.88</td>
								<td class="xl7316857" align="right">534,051.47</td>
								<td class="xl7316857" align="right">658,070.01</td>
								<td class="xl7316857" align="right">658,070.01</td>
								<td class="xl7316857" align="right">658,070.01</td>
								<td class="xl7316857" align="right">658,070.01</td>
								<td class="xl7316857" align="right">658,070.01</td>
								<td class="xl7316857" align="right">658,070.01</td>
								<td class="xl7316857" align="right">658,070.01</td>
								<td class="xl7316857" align="right">658,070.01</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7416857" style="height:15.75pt">Deducciones</td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7116857" style="height:15.75pt">Base Gravable 16%</td>
								<td class="xl6516857" align="right">93,224.06</td>
								<td class="xl6516857" align="right">135,391.56</td>
								<td class="xl6516857" align="right">101,757.69</td>
								<td class="xl6516857" align="right">2,490.44</td>
								<td class="xl6516857" align="right">154,629.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">Base Gravable 8%</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">Base Gravable 0%</td>
								<td class="xl6516857" align="right">2,404.69</td>
								<td class="xl6516857" align="right">2,371.65</td>
								<td class="xl6516857" align="right">2,338.22</td>
								<td class="xl6516857" align="right">2,304.40</td>
								<td class="xl6516857" align="right">2,304.40</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">Base Gravable Exenta</td>
								<td class="xl6516857" align="right">11,700.34</td>
								<td class="xl6516857" align="right">11,178.39</td>
								<td class="xl6516857" align="right">10,633.81</td>
								<td class="xl6516857" align="right">10,065.64</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">Depreciaciones</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									Sueldos Y salarios<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7516857" style="height:15.75pt">
									DEDUCCIONES DEL
									PERIODO<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6616857" align="right">107,329.09</td>
								<td class="xl6616857" align="right">148,941.60</td>
								<td class="xl6616857" align="right">114,729.72</td>
								<td class="xl6616857" align="right">14,860.48</td>
								<td class="xl6616857" align="right">156,933.40</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
								<td class="xl6616857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6516857" style="height:15.75pt">
									DEDUCCIONES DE PERIODOS
									ANTERIORES
								</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">107,329.09</td>
								<td class="xl6516857" align="right">256,270.70</td>
								<td class="xl6516857" align="right">371,000.41</td>
								<td class="xl6516857" align="right">385,860.89</td>
								<td class="xl6516857" align="right">542,794.29</td>
								<td class="xl6516857" align="right">542,794.29</td>
								<td class="xl6516857" align="right">542,794.29</td>
								<td class="xl6516857" align="right">542,794.29</td>
								<td class="xl6516857" align="right">542,794.29</td>
								<td class="xl6516857" align="right">542,794.29</td>
								<td class="xl6516857" align="right">542,794.29</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7216857" style="height:15.75pt">
									DEDUCCIONES
									ACUMULADOS<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl7316857" align="right">107,329.09</td>
								<td class="xl7316857" align="right">256,270.70</td>
								<td class="xl7316857" align="right">371,000.41</td>
								<td class="xl7316857" align="right">385,860.89</td>
								<td class="xl7316857" align="right">542,794.29</td>
								<td class="xl7316857" align="right">542,794.29</td>
								<td class="xl7316857" align="right">542,794.29</td>
								<td class="xl7316857" align="right">542,794.29</td>
								<td class="xl7316857" align="right">542,794.29</td>
								<td class="xl7316857" align="right">542,794.29</td>
								<td class="xl7316857" align="right">542,794.29</td>
								<td class="xl7316857" align="right">542,794.29</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6516857" style="height:15.75pt">
									Base gravable para
									cálculo de ISR
								</td>
								<td class="xl6516857" align="right">6,115.51</td>
								<td class="xl6516857" align="right">20,326.73</td>
								<td class="xl6516857" align="right">39,032.47</td>
								<td class="xl6516857" align="right">148,190.58</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8116857" width="364" style="height:15.75pt;width:273pt">
									LÍMITE
									INFERIOR
								</td>
								<td class="xl7316857" align="right">746.05</td>
								<td class="xl7316857" align="right">12,664.11</td>
								<td class="xl7316857" align="right">38,807.47</td>
								<td class="xl7316857" align="right">124,945.97</td>
								<td class="xl7316857" align="right">77,438.56</td>
								<td class="xl7316857" align="right">92,926.27</td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8216857" width="364" style="height:15.75pt;width:273pt">
									EXCEDENTE
									DEL LÍMITE INFERIOR
								</td>
								<td class="xl6516857" align="right">5,369.46</td>
								<td class="xl6516857" align="right">7,662.62</td>
								<td class="xl6516857" align="right">225.00</td>
								<td class="xl6516857" align="right">23,244.61</td>
								<td class="xl6516857" align="right">37,837.16</td>
								<td class="xl6516857" align="right">22,349.45</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
								<td class="xl6516857" align="right">115,275.72</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8216857" width="364" style="height:15.75pt;width:273pt"> </td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl6516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8316857" width="364" style="height:15.75pt;width:273pt">
									PORCENTAJE
									APLICABLE SOBRE EL EXCEDENTE DEL LÍMITE INFERIOR
								</td>
								<td class="xl8416857" align="right">6.40%</td>
								<td class="xl8416857" align="right">10.88%</td>
								<td class="xl8416857" align="right">17.92%</td>
								<td class="xl8416857" align="right">23.52%</td>
								<td class="xl8416857" align="right">21.36%</td>
								<td class="xl8416857" align="right">21.36%</td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl8516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8216857" width="364" style="height:15.75pt;width:273pt">
									IMPUESTO
									MARGINAL
								</td>
								<td class="xl6516857" align="right">343.65</td>
								<td class="xl6516857" align="right">833.69</td>
								<td class="xl6516857" align="right">40.32</td>
								<td class="xl6516857" align="right">5,467.13</td>
								<td class="xl6516857" align="right">8,082.02</td>
								<td class="xl6516857" align="right">4,773.84</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8616857" width="364" style="height:15.75pt;width:273pt"></td>
								<td class="xl6516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8716857" width="364" style="height:15.75pt;width:273pt">
									CUOTA
									FIJA
								</td>
								<td class="xl7316857" align="right">14.32</td>
								<td class="xl7316857" align="right">743.66</td>
								<td class="xl7316857" align="right">3,548.64</td>
								<td class="xl7316857" align="right">20,016.48</td>
								<td class="xl7316857" align="right">8,200.90</td>
								<td class="xl7316857" align="right">9,841.08</td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									Impuesto Causado<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl8816857" align="right" width="71" style="width:53pt">357.97</td>
								<td class="xl8816857" align="right" width="71" style="width:53pt">1,577.35</td>
								<td class="xl8816857" align="right" width="71" style="width:53pt">3,588.96</td>
								<td class="xl8816857" align="right" width="71" style="width:53pt">25,483.61</td>
								<td class="xl8816857" align="right" width="71" style="width:53pt">16,282.92</td>
								<td class="xl8816857" align="right" width="74" style="width:56pt">14,614.92</td>
								<td class="xl8816857" align="right" width="75" style="width:56pt">0.00</td>
								<td class="xl8816857" align="right" width="75" style="width:56pt">0.00</td>
								<td class="xl8816857" align="right" width="75" style="width:56pt">0.00</td>
								<td class="xl8816857" align="right" width="75" style="width:56pt">0.00</td>
								<td class="xl8816857" align="right" width="75" style="width:56pt">0.00</td>
								<td class="xl8816857" align="right" width="75" style="width:56pt">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl8916857" width="71" style="width:53pt"> </td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									ISR Retenido<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
								<td class="xl7916857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									Impuesto Causado Antes
									de Pagos Prov
								</td>
								<td class="xl6516857" align="right">357.97</td>
								<td class="xl6516857" align="right">1,577.35</td>
								<td class="xl6516857" align="right">3,588.96</td>
								<td class="xl6516857" align="right">25,483.61</td>
								<td class="xl6516857" align="right">16,282.92</td>
								<td class="xl6516857" align="right">14,614.92</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6516857"></td>
								<td class="xl1516857"></td>
								<td class="xl6316857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									ISR pagos
									Provisionales<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">357.97</td>
								<td class="xl6516857" align="right">1,577.35</td>
								<td class="xl6516857" align="right">3,588.96</td>
								<td class="xl6516857" align="right">25,483.61</td>
								<td class="xl6516857" align="right">25,483.61</td>
								<td class="xl6516857" align="right">25,483.61</td>
								<td class="xl6516857" align="right">25,483.61</td>
								<td class="xl6516857" align="right">25,483.61</td>
								<td class="xl6516857" align="right">25,483.61</td>
								<td class="xl6516857" align="right">25,483.61</td>
								<td class="xl6516857" align="right">25,483.61</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<td class="xl6516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									Impuesto Causado<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6516857" align="right">357.97</td>
								<td class="xl6516857" align="right">1,219.39</td>
								<td class="xl6516857" align="right">2,011.61</td>
								<td class="xl6516857" align="right">21,894.65</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
								<td class="xl6516857" align="right">0.00</td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl9016857" style="height:15.75pt">PRESENTADA</td>
								<td class="xl9016857">SI</td>
								<td class="xl9016857"> </td>
								<td class="xl9016857"> </td>
								<td class="xl9016857"> </td>
								<td class="xl9016857"> </td>
								<td class="xl9016857"> </td>
								<td class="xl9116857"> </td>
								<td class="xl9116857"> </td>
								<td class="xl9116857"> </td>
								<td class="xl9116857"> </td>
								<td class="xl9116857"> </td>
								<td class="xl9116857"> </td>
							</tr>
							<!--[if supportMisalignedColumns]-->
							<tr height="0" style="display:none">
								<td width="364" style="width:273pt"></td>
								<td width="71" style="width:53pt"></td>
								<td width="71" style="width:53pt"></td>
								<td width="71" style="width:53pt"></td>
								<td width="71" style="width:53pt"></td>
								<td width="71" style="width:53pt"></td>
								<td width="74" style="width:56pt"></td>
								<td width="75" style="width:56pt"></td>
								<td width="75" style="width:56pt"></td>
								<td width="75" style="width:56pt"></td>
								<td width="75" style="width:56pt"></td>
								<td width="75" style="width:56pt"></td>
								<td width="75" style="width:56pt"></td>
							</tr>
							<!--[endif]-->
						</tbody>
					</xsl:for-each>
				</table>
			</div>
		</body>
	</xsl:template>
</xsl:stylesheet>
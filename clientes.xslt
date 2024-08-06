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
xmlns:xo="http://panax.io/xover"
xmlns:x="urn:schemas-microsoft-com:office:excel"
>
	<xsl:import href="common.xslt"/>
	<xsl:import href="headers.xslt"/>

	<!--<xsl:key name="razon_social" match="razon_social[not(@state:selected)]/row/@id" use="'*'"/>-->
	<xsl:key name="razon_social" match="razon_social/row[@id=../@state:selected]/@id" use="'*'"/>
	<xsl:key name="polizas" match="polizas/row/@amt" use="concat(../@rs,'::',../@mth,'::',../@cl)"/>

	<xsl:key name="meses" match="meses/row/@key" use="'active'"/>

	<xsl:key name="clasificaciones" match="clasificacion/row[not(starts-with(@cve,'15'))]/@cve" use="substring(.,1,1)"/>

	<xsl:template mode="xo:scope" match="@*">
		<xsl:apply-templates mode="xo:scope" select=".."/>
		<xsl:attribute name="xo-slot">
			<xsl:value-of select="name()"/>
		</xsl:attribute>
	</xsl:template>

	<xsl:template mode="xo:scope" match="*">
		<xsl:attribute name="xo-scope">
			<xsl:value-of select="@xo:id"/>
		</xsl:attribute>
	</xsl:template>

	<xsl:template match="/">
		<xsl:variable name="x-dimension" select="key('meses','active')"/>
		<xsl:variable name="y-dimension" select="key('razon_social','*')"/>
		<script src="./widgets/datagrid/datagrid.js" fetchpriority="high"/>
		<body xmlns="http://www.w3.org/1999/xhtml">
			<style id="Cálculos PF (Rafael Alvarado) 2024_22598_Styles">
				&amp;lt;!--table
				{mso-displayed-decimal-separator:"\.";
				mso-displayed-thousand-separator:"\,";}
				.xl1522598
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
				.xl6522598
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
				.xl6622598
				{padding-top:1px;
				padding-right:1px;
				padding-left:1px;
				mso-ignore:padding;
				color:black;
				font-size:10.0pt;
				font-weight:400;
				font-style:normal;
				text-decoration:none;
				font-family:Arial, sans-serif;
				mso-font-charset:0;
				mso-number-format:General;
				text-align:general;
				vertical-align:bottom;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				.xl6722598
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
				.xl6822598
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
				.xl6922598
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
				mso-number-format:Standard;
				text-align:center;
				vertical-align:middle;
				border-top:none;
				border-right:none;
				border-bottom:2.0pt double windowtext;
				border-left:none;
				mso-background-source:auto;
				mso-pattern:auto;
				white-space:nowrap;}
				--&amp;gt;
			</style>
			<style>
				<![CDATA[
				table.calculos td, table.calculos [scope=row]  {
					padding-inline: .5rem !important;
				}
				
				table a {
					text-decoration: none;
					color: inherit;
					cursor: pointer !important;
				}
		
				.sticky {
					position: sticky;
					top: var(--sticky-top, 45px);
					background-color: var(--sticky-bg-color, white);
				}
		
				.sticky.header-level-2 {
					top: calc(var(--sticky-top, 45px)* 2);
				}
		
				.sticky.header-level-3 {
					top: calc(var(--sticky-top, 45px)* 3);
				}
		
				.sticky.header-level-4 {
					top: calc(var(--sticky-top, 45px)* 4);
				}
		
				.sticky.header-level-5 {
					top: calc(var(--sticky-top, 45px)* 5);
				}
		
				.header-level-2 th {
					background-color: var(--datagrid-tr-header-bg-level-2, silver) !important;
				}
		
				.header-level-3 th {
					background-color: var(--datagrid-tr-header-bg-level-3, silver) !important;
				}
		
				.header-level-4 th {
					background-color: var(--datagrid-tr-header-bg-level-4, silver) !important;
				}
		
				.header-level-5 th {
					background-color: var(--datagrid-tr-header-bg-level-5, silver) !important;
				}
				
				table {
					background-color: white;
				}
				]]>
			</style>
			<div id="Cálculos PF (Rafael Alvarado) 2024_22598" align="center" x:publishsource="Excel">
				<table border="0" cellpadding="0" cellspacing="0" width="1113" style="border-collapse:&#10; collapse;table-layout:fixed;width:836pt">
					<colgroup>
						<col width="160" style="mso-width-source:userset;mso-width-alt:5851;width:120pt" />
						<col width="140" style="mso-width-source:userset;mso-width-alt:4022;width:70pt" span="12" />
					</colgroup>
					<xsl:for-each select="$y-dimension">
						<xsl:variable name="rs" select="."/>
						<tbody>
							<tr height="26" style="mso-height-source:userset;height:19.5pt">
								<td height="26" class="xl1522598" width="160" style="height:19.5pt;width:120pt"></td>
								<td class="xl6522598" width="110" style="width:83pt">ENERO</td>
								<td class="xl6522598" width="76" style="width:57pt">FEBRERO</td>
								<td class="xl6522598" width="93" style="width:70pt">MARZO</td>
								<td class="xl6522598" width="76" style="width:57pt">ABRIL</td>
								<td class="xl6522598" width="76" style="width:57pt">MAYO</td>
								<td class="xl6522598" width="71" style="width:53pt">JUNIO</td>
								<td class="xl6522598" width="71" style="width:53pt">JULIO</td>
								<td class="xl6522598" width="71" style="width:53pt">AGOSTO</td>
								<td class="xl6522598" width="82" style="width:62pt">SEPTIEMBRE</td>
								<td class="xl6522598" width="71" style="width:53pt">OCTUBRE</td>
								<td class="xl6522598" width="82" style="width:62pt">NOVIEMBRE</td>
								<td class="xl6522598" width="74" style="width:56pt">DICIEMBRE</td>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl6622598" style="height:18.0pt">CLIENTES</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('polizas',concat($rs,'::',.,'::','clientes'))"/>
									<td class="xl6722598" align="right">
										<!--<xsl:apply-templates mode="xo-scope" select="$amt"/>-->
										<a class="link" href="?total={sum($amt)}#clientes?@razon_social={$rs}&amp;@fecha={.}&amp;@clasificacion=15&amp;&amp;@view=polizas">
											<xsl:apply-templates mode="xo:scope" select="$amt"/>
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl6622598" style="height:18.0pt">BANCOS</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('polizas',concat($rs,'::',.,'::','bancos'))|key('polizas',concat($rs,'::',.,'::','caja'))"/>
									<td class="xl6722598" align="right">
										<!--<xsl:apply-templates mode="xo-scope" select="$amt"/>-->
										<a class="link" href="?total={sum($amt)}#clientes?@razon_social={$rs}&amp;@fecha={.}&amp;@clasificacion=11,12&amp;@view=polizas">
											<xsl:apply-templates mode="xo:scope" select="$amt"/>
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl6622598" style="height:18.0pt"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl6622598" style="height:18.0pt">DIFERENCIAS</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="clientes" select="key('polizas',concat($rs,'::',.,'::','clientes'))"/>
									<xsl:variable name="bancos" select="key('polizas',concat($rs,'::',.,'::','bancos'))|key('polizas',concat($rs,'::',.,'::','caja'))"/>
									<td class="xl6822598" align="right">
										<xsl:apply-templates mode="xo:scope" select="$bancos"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($clientes)-sum($bancos)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl1522598" style="height:18.0pt"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl6622598" style="height:18.0pt">
									ANTICIPO DE CLIENTES<span style="mso-spacerun:yes"> </span>
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('polizas',concat($rs,'::',.,'::','anticipo de cliente'))"/>
									<td class="xl6722598" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={sum($amt)}#clientes?@razon_social={$rs}&amp;@fecha={.}&amp;@clasificacion=261&amp;@view=polizas">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl6622598" style="height:18.0pt"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl6622598" style="height:18.0pt">
									OTROS INGRESOS<span style="mso-spacerun:yes"> </span>
								</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
								<td class="xl6722598" align="right">??</td>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl6622598" style="height:18.0pt"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl6622598" style="height:18.0pt">DIF</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
								<td class="xl6922598">??</td>
							</tr>
							<tr height="24" style="mso-height-source:userset;height:18.0pt">
								<td height="24" class="xl6622598" style="height:18.0pt"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
								<td class="xl6722598"></td>
							</tr>
							<!--[if supportMisalignedColumns]-->
							<tr height="0" style="display:none">
								<td width="160" style="width:120pt"></td>
								<td width="110" style="width:83pt"></td>
								<td width="76" style="width:57pt"></td>
								<td width="93" style="width:70pt"></td>
								<td width="76" style="width:57pt"></td>
								<td width="76" style="width:57pt"></td>
								<td width="71" style="width:53pt"></td>
								<td width="71" style="width:53pt"></td>
								<td width="71" style="width:53pt"></td>
								<td width="82" style="width:62pt"></td>
								<td width="71" style="width:53pt"></td>
								<td width="82" style="width:62pt"></td>
								<td width="74" style="width:56pt"></td>
							</tr>
							<!--[endif]-->
						</tbody>
					</xsl:for-each>
				</table>
			</div>
		</body>
	</xsl:template>

	<xsl:template match="declaraciones/row/@file">
		SI
	</xsl:template>
</xsl:stylesheet>
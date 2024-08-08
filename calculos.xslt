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
	<xsl:key name="amt" match="polizas/row/@amt" use="concat(../@rs,'::',../@mth,'::',../@cl)"/>
	<xsl:key name="amt" match="polizas/row/@amt" use="concat(../@rs,'::',../@mth,'::',substring(../@cl,1,2))"/>

	<xsl:key name="ing_grav" match="polizas/row/@iva_b" use="concat(../@rs,'::',../@mth)"/>
	<xsl:key name="ing_grav" match="polizas/row/@iva_b" use="concat(../@rs,'::',../@mth,'::',../@iva_t)"/>

	<xsl:key name="iva_retenciones" match="acumulados_limites/row/@iva_r" use="concat(../@rs,'::',../@mth)"/>
	<xsl:key name="ing_grav_ant" match="acumulados_limites/row/@amt_ant_i" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="ing_grav_acum" match="acumulados_limites/row/@amt_acum_i" use="concat(../@rs,'::',../@mth)"/>
	<xsl:key name="ing_grav_acum" match="acumulados_limites/row/@amt_acum_i" use="concat(../@rs,'::',../@mth,'::',../@iva_t)"/>

	<xsl:key name="impuestos" match="polizas/row[@iva_t]/@iva" use="concat(../@rs,'::',../@mth)"/>
	<xsl:key name="impuestos" match="polizas/row[@iva_t]/@iva" use="concat(../@rs,'::',../@mth,'::',../@iva_t)"/>

	<xsl:key name="iva_acred" match="deducciones/row[@iva_t]/@amt_iva" use="concat(../@rs,'::',../@mth,'::',../@iva_t)"/>
	<xsl:key name="iva_acred" match="deducciones/row[@iva_t]/@amt_iva" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="iva_base_gravable" match="deducciones/row[@iva_t]/@amt" use="concat(../@rs,'::',../@mth,'::',../@iva_t)"/>
	<xsl:key name="iva_base_gravable" match="deducciones/row[@iva_t]/@amt" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="iva_base_gravable_ant" match="acumulados_limites/row/@amt_ant_d" use="concat(../@rs,'::',../@mth,'::',../@iva_t)"/>
	<xsl:key name="iva_base_gravable_ant" match="acumulados_limites/row/@amt_ant_d" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="iva_base_gravable_acum" match="acumulados_limites/row/@amt_acum_d" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="iva_base_gravable_isr" match="acumulados_limites/row/@amt_b" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="limite_inferior" match="acumulados_limites/row/@li" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="excedente_limite_inferior" match="acumulados_limites/row/@exc_li" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="porcentaje_excedente" match="acumulados_limites/row/@pct" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="imp_marg" match="acumulados_limites/row/@imp_marg" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="cuota" match="acumulados_limites/row/@ct" use="concat(../@rs,'::',../@mth)"/>
	<xsl:key name="imp_causado" match="acumulados_limites/row/@imp_c" use="concat(../@rs,'::',../@mth)"/>
	<xsl:key name="isr_retenido" match="acumulados_limites/row/@isr_r" use="concat(../@rs,'::',../@mth)"/>
	<xsl:key name="imp_causado_ant_pagos_prov" match="acumulados_limites/row/@imp_cap" use="concat(../@rs,'::',../@mth)"/>
	<xsl:key name="isr_pagos_provisionales" match="acumulados_limites/row/@isr_prov" use="concat(../@rs,'::',../@mth)"/>
	<xsl:key name="imp_causado_2" match="acumulados_limites/row/@imp_c2" use="concat(../@rs,'::',../@mth)"/>

	<xsl:key name="declaracion" match="declaraciones/row/@file" use="concat(../@rs,'::',../@mth)"/>

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
				]]>
			</style>
			<div id="Cálculos" align="center" x:publishsource="Excel" class="selection-enabled validation-enabled">
				<table class="calculos bg-white" border="0" cellpadding="0" cellspacing="0" width="1243" style="border-collapse:&#10; collapse;table-layout:fixed;width:930pt">
					<colgroup>
						<col width="364" style="mso-width-source:userset;mso-width-alt:13312;width:273pt" />
						<col width="71" span="12" style="mso-width-source:userset; mso-width-alt:2596; width: 73pt;"/>
					</colgroup>
					<xsl:for-each select="$y-dimension">
						<xsl:variable name="rs" select="."/>
						<thead class="freeze">
							<tr height="38" style="height:28.5pt; background-color: white;">
								<td height="38" class="xl6816857" width="364" style="height:28.5pt;width:273pt" colspan="3">
									<xsl:apply-templates select="../@desc"/>
								</td>
								<td class="xl1516857" width="71" style="width:53pt">
									<xsl:apply-templates select="../@key"/>
								</td>
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
						</thead>
						<tbody>
							<tr height="34" style="mso-height-source:userset;height:45px" class="header sticky">
								<td colspan="7" height="34" class="xl9316857" style="height:25.5pt">
									Cálculo de IVA Ejercicio <xsl:value-of select="//ejercicio/@state:selected"/>
								</td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
								<td class="xl1516857"></td>
							</tr>
							<tr height="29" style="height:21.75pt" class="header sticky header-level-2">
								<td height="29" class="xl6416857" style="height:21.75pt"></td>
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
							<tr height="29" style="height:21.75pt">
								<td height="29" class="xl7016857" style="height:21.75pt">INGRESOS </td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
							</tr>
							<xsl:for-each select="key('clasificaciones','1')">
								<xsl:variable name="cl" select="."/>
								<tr height="21" style="height:15.75pt">
									<th scope="row" height="21" class="xl7116857" style="height:15.75pt; text-transform: uppercase; ">
										<xsl:apply-templates select="../@desc"/>
										<span style="mso-spacerun:yes"> </span>
									</th>
									<xsl:for-each select="$x-dimension">
										<xsl:variable name="amt" select="key('amt',concat($rs,'::',.,'::',$cl))"/>
										<td class="xl6516857 money" align="right">
											<a class="link" href="?total={$amt}#polizas?@razon_social={$rs}&amp;@clasificacion={$cl}&amp;@fecha={.}">
												<xsl:apply-templates mode="xo:scope" select="$amt"/>
												<xsl:call-template name="format">
													<xsl:with-param name="value" select="sum($amt)"/>
												</xsl:call-template>
											</a>
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
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('ing_grav',concat($rs,'::',.))/../@amt"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
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
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('ing_grav',concat($rs,'::',.,'::','16'))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
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
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('ing_grav',concat($rs,'::',.,'::','16'))"/>
									<td class="xl7316857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt) * 0.16"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
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
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_acred',concat($rs,'::',.,'::','16'))"/>
									<td class="xl6516857" align="right">
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}&amp;@tasa=16">
											<xsl:apply-templates mode="xo:scope" select="$amt"/>
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="20" style="height:15.0pt">
								<td height="20" class="xl7116857" style="height:15.0pt">
									Importe de IVA
									Acreditable 8%
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_acred',concat($rs,'::',.,'::','8'))"/>
									<td class="xl6516857" align="right">
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}&amp;@tasa=8">
											<xsl:apply-templates mode="xo:scope" select="$amt"/>
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7516857" style="height:15.75pt">Total IVA Acreditable</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_acred',concat($rs,'::',.,'::','16'))|key('iva_acred',concat($rs,'::',.,'::','8'))"/>
									<td class="xl6616857" align="right">
										<!--<xsl:apply-templates mode="xo-scope" select="$amt"/>-->
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}&amp;@tasa=8,16">
											<xsl:apply-templates mode="xo:scope" select="$amt"/>
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
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
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_retenciones',concat($rs,'::',.))"/>
									<td class="xl7616857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
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
									??
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="ing_grav" select="key('impuestos',concat($rs,'::',.))"/>
									<xsl:variable name="iva_acred" select="key('iva_acred',concat($rs,'::',.))"/>
									<td class="xl7816857" align="right">
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($ing_grav) - sum($iva_acred)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
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
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('impuestos',concat($rs,'::',.,'::','16'))"/>
									<td class="xl7916857" align="right">
										??
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl1516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8016857" width="364" style="height:15.75pt;width:273pt">
									IVA por Pagar despues de Aplicaciones
								</td>
								<xsl:for-each select="$x-dimension">
									<td class="xl6516857" align="right">??</td>
								</xsl:for-each>
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
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="declaracion" select="key('declaracion', concat($rs,'::',.))"/>
									<td class="xl9016857" align="right">
										<xsl:apply-templates select="$declaracion"/>
									</td>
								</xsl:for-each>
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
							<tr height="28" style="mso-height-source:userset;height:45px" class="header sticky">
								<td colspan="7" height="28" class="xl9416857" style="height:21.0pt">
									<a name="RANGE!A35:G79">
										Cálculo de ISR Ejercicio <xsl:value-of select="//ejercicio/@state:selected"/>
									</a>
								</td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
								<td class="xl6316857"></td>
							</tr>
							<tr height="29" style="height:21.75pt" class="header sticky header-level-2">
								<td height="29" class="xl6416857" style="height:21.75pt"></td>
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
							<tr height="29" style="height:21.75pt">
								<td height="29" class="xl7016857" style="height:21.75pt">INGRESOS </td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
								<td class="xl7016857"></td>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									INGRESOS DEL PERIODO<span style="mso-spacerun:yes"> </span>
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('ing_grav',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
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
									INGRESOS DE PERIODOS ANTERIORES
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('ing_grav_ant',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
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
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('ing_grav_acum',concat($rs,'::',.))"/>
									<td class="xl7316857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
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
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_base_gravable',concat($rs,'::',.,'::','16'))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}&amp;@tasa=16">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">Base Gravable 8%</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_base_gravable',concat($rs,'::',.,'::','8'))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}&amp;@tasa=8">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">Base Gravable 0%</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_base_gravable',concat($rs,'::',.,'::','0'))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}&amp;@tasa=0">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">Base Gravable Exenta</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_base_gravable',concat($rs,'::',.,'::','x'))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}&amp;@tasa='exenta'">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">Depreciaciones</td>
								<xsl:for-each select="$x-dimension">
									<td class="xl6516857" align="right">
										??
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									Sueldos Y salarios<span style="mso-spacerun:yes"> </span>
								</td>
								<xsl:for-each select="$x-dimension">
									<td class="xl6516857" align="right">
										??
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7516857" style="height:15.75pt">
									DEDUCCIONES DEL
									PERIODO<span style="mso-spacerun:yes"> </span>
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_base_gravable',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_base_gravable',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6516857" style="height:15.75pt">
									DEDUCCIONES DE PERIODOS ANTERIORES
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_base_gravable_ant',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_base_gravable',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl7216857" style="height:15.75pt">
									DEDUCCIONES ACUMULADOS<span style="mso-spacerun:yes"> </span>
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_base_gravable_acum',concat($rs,'::',.))"/>
									<td class="xl7316857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl1516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6516857" style="height:15.75pt">
									Base gravable para cálculo de ISR
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('iva_base_gravable_isr',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl1516857" align="right">
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8116857" width="364" style="height:15.75pt;width:273pt">
									LÍMITE INFERIOR
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('limite_inferior',concat($rs,'::',.))"/>
									<td class="xl7316857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl6316857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8216857" width="364" style="height:15.75pt;width:273pt">
									EXCEDENTE DEL LÍMITE INFERIOR
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('excedente_limite_inferior',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6516857" width="364" style="height:15.75pt;width:273pt"> </td>
								<xsl:for-each select="$x-dimension">
									<td class="xl6516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8316857" width="364" style="height:15.75pt;width:273pt">
									PORCENTAJE APLICABLE SOBRE EL EXCEDENTE DEL LÍMITE INFERIOR
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('porcentaje_excedente',concat($rs,'::',.))"/>
									<td class="xl8416857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}">
											<xsl:call-template name="format-percent">
												<xsl:with-param name="value" select="sum($amt) div 100"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl8516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8216857" width="364" style="height:15.75pt;width:273pt">
									IMPUESTO MARGINAL
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('imp_marg',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8616857" width="364" style="height:15.75pt;width:273pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl6516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl8716857" width="364" style="height:15.75pt;width:273pt">
									CUOTA FIJA
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('cuota',concat($rs,'::',.))"/>
									<td class="xl7316857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<a class="link" href="?total={$amt}#diot?@razon_social={$rs}&amp;@fecha={.}">
											<xsl:call-template name="format">
												<xsl:with-param name="value" select="sum($amt)"/>
											</xsl:call-template>
										</a>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl6516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									Impuesto Causado<span style="mso-spacerun:yes"> </span>
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('imp_causado',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl6316857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									ISR Retenido<span style="mso-spacerun:yes"> </span>
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('isr_retenido',concat($rs,'::',.))"/>
									<td class="xl7916857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl1516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									Impuesto Causado Antes de Pagos Prov
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('imp_causado_ant_pagos_prov',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl1516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									ISR pagos Provisionales<span style="mso-spacerun:yes"> </span>
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('isr_pagos_provisionales',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl1516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl6316857" style="height:15.75pt">
									Impuesto Causado<span style="mso-spacerun:yes"> </span>
								</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="amt" select="key('imp_causado_2',concat($rs,'::',.))"/>
									<td class="xl6516857" align="right">
										<xsl:apply-templates mode="xo:scope" select="$amt"/>
										<xsl:call-template name="format">
											<xsl:with-param name="value" select="sum($amt)"/>
										</xsl:call-template>
									</td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl1516857" style="height:15.75pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="xl1516857" align="right"></td>
								</xsl:for-each>
							</tr>
							<tr height="21" style="mso-height-source:userset;height:15.75pt">
								<td height="21" class="xl9016857" style="height:15.75pt">PRESENTADA</td>
								<xsl:for-each select="$x-dimension">
									<xsl:variable name="declaracion" select="key('declaracion', concat($rs,'::',.))"/>
									<td class="xl9016857" align="right">
										<xsl:apply-templates select="$declaracion"/>
									</td>
								</xsl:for-each>
							</tr>
							<!--[if supportMisalignedColumns]-->
							<tr height="0" style="display:none">
								<td width="364" style="width:273pt"></td>
								<xsl:for-each select="$x-dimension">
									<td class="" align="right"></td>
								</xsl:for-each>
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
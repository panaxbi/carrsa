<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:xo="http://panax.io/xover"
xmlns:px="http://panax.io/entity"
xmlns:state="http://panax.io/state"
xmlns:initial="http://panax.io/state/initial"
xmlns:search="http://panax.io/state/search"
xmlns:env="http://panax.io/state/environment"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:widget="http://panax.io/widget"
xmlns:combobox="http://panax.io/widget/combobox"
>
	<xsl:import href="headers.xslt"/>
	<xsl:import href="common.xslt"/>
	<xsl:import href="widgets/page_navbar.xslt"/>
	<xsl:import href="widgets/combobox.xslt"/>

	<xsl:param name="state:filterBy"></xsl:param>

	<xsl:key name="data" match="model/movimientos" use="'*'"/>
	<xsl:key name="data" match="model/ventas" use="'*'"/>
	<xsl:key name="data" match="model/trouble" use="'*'"/>

	<xsl:key name="changed" match="@initial:*" use="concat(../@xo:id,'::',local-name())"/>
	<xsl:template match="/">
		<span class="page-menu">
			<style>
				<![CDATA[
.page-menu nav {
    padding-right: 80px !important;
}

.page-menu {
    transition: 0.5s;
    height: var(--sections-filter-height, 0px);
	width: 100vw;
    /*display: flex;
    overflow-x: auto;
    overflow-y: hidden;*/
}

/* Works on Chrome, Edge, and Safari */
/*
.page-menu::-webkit-scrollbar {
  width: 12px;
}

.page-menu::-webkit-scrollbar-track {
  background: rgba(50, 62, 72, 0.9);
}

.page-menu::-webkit-scrollbar-thumb {
  background-color: orange;
  border-radius: 20px;
  border: 3px solid rgba(50, 62, 72, 0.9);
}*/
			
.navbar form {
    display: flex;
    flex-direction: row;
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
    margin-left: 23px;
}
			]]>
			</style>
			<style>
				:root { --sections-filter-height: 16px; }
			</style>
			<nav class="navbar navbar-expand-md">
				<form action="javascript:void(0);" onsubmit="section.source.fetch()">
					<xsl:apply-templates mode="widget" select="model/@xo:id"/>
					<!--<xsl:apply-templates mode="button" select="key('data','*')[not(*)]/@state:record_count[.&gt;0]"/>-->
				</form>
				<ul id="shell_buttons" class="nav col-md justify-content-end list-unstyled d-flex">
					<xsl:apply-templates mode="buttons"/>
				</ul>
			</nav>
		</span>
	</xsl:template>

	<xsl:key name="year" match="fechas/fecha/@mes" use="substring(.,1,4)"/>
	<xsl:template mode="buttons" match="*"/>

	<xsl:template mode="headerText" match="model/*[self::semanas|self::fechas]">
		<select class="form-select" onchange="xo.state.filterBy=this.value">
			<option value="weeks">
				<xsl:if test="$state:filterBy='weeks'">
					<xsl:attribute name="selected"/>
				</xsl:if> Mes
			</option>
			<option value="dates">
				<xsl:if test="$state:filterBy='dates'">
					<xsl:attribute name="selected"/>
				</xsl:if> Fechas
			</option>
		</select>
	</xsl:template>

	<xsl:template mode="headerText" match="model/*[self::semanas|self::fechas]">
		<xsl:text>Fechas</xsl:text>
	</xsl:template>

	<xsl:template mode="widget" match="model/semanas">
		<xsl:variable name="default_date">
			<xsl:choose>
				<xsl:when test="@state:current_date_er">
					<xsl:value-of select="@state:current_date_er"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="@key">
						<xsl:sort order="descending" select="."/>
						<xsl:if test="position()=1">
							<xsl:value-of select="."/>
						</xsl:if>/
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="curr_month" select="row[@mes=$default_date]/@mes"/>
		<xsl:variable name="start_week" select="@state:start_week"/>
		<xsl:variable name="end_week" select="@state:end_week"/>

		<style>
			:root { --sections-filter-height: 86px; }
		</style>

		<fieldset>
			<legend style="text-transform:capitalize">
				<xsl:apply-templates mode="headerText" select="."/>
			</legend>
			<div class="input-group">
				<select class="form-select" xo-scope="{@xo:id}" xo-slot="state:start_week">
					<option value=""></option>
					<xsl:variable name="inactive-dates" select="row[@desc=../@state:end_week]/following-sibling::*/@desc"/>
					<xsl:for-each select="row/@desc[count($inactive-dates|.)!=count($inactive-dates)]">
						<xsl:sort select="." data-type="number" order="descending"/>
						<xsl:variable name="value" select="."/>
						<option value="{.}">
							<xsl:if test=".=$start_week">
								<xsl:attribute name="selected"/>
							</xsl:if>
							<xsl:value-of select="$value"/>
						</option>
					</xsl:for-each>
				</select>
				<select class="form-select" xo-scope="{@xo:id}" xo-slot="state:end_week">
					<option value=""></option>
					<xsl:variable name="inactive-dates" select="row[@desc=../@state:start_week]/preceding-sibling::*/@desc"/>
					<xsl:for-each select="row/@desc[count($inactive-dates|.)!=count($inactive-dates)]">
						<xsl:sort select="." data-type="number" order="descending"/>
						<xsl:variable name="value" select="."/>
						<option value="{.}">
							<xsl:if test=".=$end_week">
								<xsl:attribute name="selected"/>
							</xsl:if>
							<xsl:value-of select="$value"/>
							<!--- <xsl:for-each select="$inactive-dates"><xsl:value-of select="."/>
				</xsl:for-each>-->
						</option>
					</xsl:for-each>
				</select>
			</div>
		</fieldset>
	</xsl:template>

	<xsl:template mode="widget" match="*">
		<xsl:apply-templates mode="combobox:widget" select=".">
			<xsl:with-param name="dataset" select="row/@desc"/>
			<xsl:with-param name="xo-slot">state:selected</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
</xsl:stylesheet>
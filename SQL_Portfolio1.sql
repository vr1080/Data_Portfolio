--Select *
--from PortfolioProject..CovidDeaths$
--order by 3,4

--Select *
--from PortfolioProject..['covid-vaccinations$']
--order by 3,4

--Select Location, date, total_cases, new_cases, total_deaths, population
--From PortfolioProject..CovidDeaths$
--Where continent is not null 
--order by 1,2

--Look at Total Cases vs Total Deaths
-- Shows Likelihood of dying if you contract covid in your country
--Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
--From PortfolioProject..CovidDeaths$
--where location like '%states%'
--order by 1,2

-- Looking at Total Cases vs Population
-- Shows what percentage of Population got Covid

--Select Location, date, Population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
--From PortfolioProject..CovidDeaths$
--where location like '%states%'
--order by 1,2

---- Looking at Countries with Highest Infection Rate compared to Population
--Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
--From PortfolioProject..CovidDeaths$
----Where location like '%states%'
--Group by Location, Population
--order by PercentPopulationInfected desc

---- Showing Countries with Highest Death Count per Population
--Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
--From PortfolioProject..CovidDeaths$
--Where continent is not null
----Where location like '%states%'
--Group by Location, Population
--order by TotalDeathCount desc

---- Showing Countries with Highest Death Count per Population
--Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
--From PortfolioProject..CovidDeaths$
----Where location like '%states%'
--Where continent is not null
--Group by continent
--order by TotalDeathCount desc


--GLOBAL NUMBERS

--Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
--From PortfolioProject..CovidDeaths$
--Where location like '%states%'
--Where continent is not null
--Group by date
--order by 1,2


--Select *
--From PortfolioProject..['covid-vaccinations$']

---- Total Population vs Vaccinations
---- Shows Percentage of Population that has recieved at least one Covid Vaccine

--Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
--, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
----, (RollingPeopleVaccinated/population)*100
--From PortfolioProject..CovidDeaths$ dea
--Join PortfolioProject..['covid-vaccinations$'] vac
--	On dea.location = vac.location
--	and dea.date = vac.date
--where dea.continent is not null 
--order by 2,3

--Create View SampleView3 as
--Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
--From PortfolioProject..CovidDeaths$
--where location like '%states%'

Select *
from SampleView3
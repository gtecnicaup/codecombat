utils = require 'core/utils'
RootView = require 'views/core/RootView'

module.exports = class OutcomesReportResult extends RootView
  id: 'admin-outcomes-report-result-view'
  template: require 'templates/admin/outcome-report-results'

  initialize: ->
    return super() unless me.isAdmin()
    @options =
      teacher:
        name: 'Mr.Teacher'
        email: 'teacher@school.gov'
      ae:
        name: 'Max Winter'
        email: 'liz@codecombat.com'
    @fetchData()
    super()

  fetchData: ->
    # Fetch playtime data for released courses
    # Makes a bunch of small fetches per course and per day to avoid gateway timeouts
    @minSessionCount = 50
    @maxDays = 20
    @loadingMessage = "Loading.."
    courseLevelPlaytimesMap = {}
    courseLevelTotalPlaytimeMap = {}
    levelPracticeMap = {}
    @courses = [
      {
        name: "Introduction to Computer Science"
      }
      {
        name: "Computer Science 2"
      }
      {
        name: "Web Development 1"
      }
    ]

    @classes = [
      {
        name: "6th Grade Computers"
      }
      {
        name: "Robotics Club"
      }
    ]
    
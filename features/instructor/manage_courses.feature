Feature: Manage the courses in Expertiza
  In order for Expertiza to function
  An instructor
  Should be able to manage courses.
    
  Background:
    Given an instructor named "instructor1"
      And I am logged in as "instructor1"
      And I follow the "Manage..." link as an "instructor"

  @instructor
  @manage_courses
  Scenario: Expertiza will allow an instructor to create a public course
    When I follow "Create Public Course"
      And I fill in "Course1" for "Course Name"
      And I fill in "Course1Directory" for "Course Directory"
      And I fill in "A very informational course about information" for "Course Information"
      And I press "Create"
    And I follow "Manage Courses"
    Then I should see "Course1"
    
  @instructor
  @manage_courses
  Scenario: Expertiza will allow an instructor to create a private course
      When I follow "Create Private Course"
      And I fill in "Course1" for "Course Name"
      And I fill in "Course1Directory" for "Course Directory"
      And I fill in "A very informational course about information" for "Course Information"
      And I press "Create"
      And I follow "Manage Courses"
    Then I should see "Course1"
      And I should see "private"

    
  @instructor
  @manage_courses
  @wip
  Scenario: Expertiza will allow an instructor to copy a course
    Given I have a public course named "Course1"
      And I follow "Copy course"
      And I press "Update"
    Then I should see "Copy of Course1"
    
  @instructor
  @manage_courses
  @wip
  Scenario: Expertiza will allow an instructor to delete a course
    Given I have a public course named "Course1"
    And I follow "Delete course"
    Then I should not see "Course1"
    
  @instructor
  @manage_courses
  @wip
  Scenario: Expertiza will allow an instructor to edit a course
    Given I have a public course named "Course1"
      And I follow "Edit course"
      And I fill in "Updated Course1" for "Course Name"
      And I press "Update"
    Then I should see "Updated Course1"
    
  @instructor
  @manage_courses
  @wip
  Scenario: Expertiza will allow an instructor to make a course private
    Given I have a public course named "Course1"
      And I follow "Make private"
    Then I should see "Course1" 
      And I should see "private"
    
  @instructor
  @manage_courses
  Scenario: Expertiza will allow an instructor to view their courses
    Given I have a public course named "Course1"
    And I have a private course named "Course2"
    When I follow "Courses"
    Then I should see "Course1"
      And I should see "Course2"
      And I should see "Directory: Course1-directory"
      And I should see "Directory: Course2-directory"

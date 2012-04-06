module ProjectsHelper
  def followed?(project)
    current_researcher.projects.find_by_id(project.id)
  end
end

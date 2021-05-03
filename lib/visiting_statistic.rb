class VisitingStatistic
  def initialize
    @pages = {}
  end

  def add(visit)
    visit.each do |page, ips|
      @pages[page] ||= []
      @pages[page] += Array(ips)
    end
  end

  def uniq_views
    @pages.map { |page, visits| [page, visits.uniq.size] }
          .sort_by { |page, visits| visits }.reverse
  end

  def total_visits
    @pages.map { |page, visits| [page, visits.size] }
          .sort_by { |page, visits| visits }.reverse
  end
end

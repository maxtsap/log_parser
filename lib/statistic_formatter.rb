class StatisticFormatter
  def initialize(statistic)
    @statistic = statistic
  end

  def output
    (total_visits + unique_views).join("\n")
  end

  private

  def unique_views
    @statistic.uniq_views.map { |key, value| "#{key} #{value} unique views" }
  end

  def total_visits
    @statistic.total_visits.map { |key, value| "#{key} #{value} total visits" }
  end
end

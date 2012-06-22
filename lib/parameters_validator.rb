class ParametersValidator #< ActiveModel::Validator


  def title? string
    return false if string.nil? || string.empty?
    return false if string.size > 20
    true
  end

  def dim? string
    valid_sizes = %w( 17 33 65 129 257 ) 
    x, y = string.split(':')
    valid_sizes.include?(x) && valid_sizes.include?(y)
  end

  def seed? string
    !(string.nil? || string.empty?) && (string.size <= 20)
  end

  def embark_points? string
    return false if string.nil? || string.empty?
    x = string.to_i
    x >=0 && x <= 10_000
  end

  def end_year? string
    return false if string.nil? || string.empty?
    x = string.to_i
    x >= 2 && x <= 10_000
  end

  def total_civ_population? string
    return false if string.nil? || string.empty?
    x = string.to_i
    x >= -1 && x <= 100_000
  end

  def site_cap? string
    return false if string.nil? || string.empty?
    x = string.to_i
    x >= -1 && x <= 100_000
  end

  def beast_end_year? string
    return false if string.nil? || string.empty?
    year, percentage = string.split(':').map { |x| x.to_i }
    return false if year < 2
    percentage >= -1 && percentage <= 100
  end

  def cull_historical_figures? string
    return false if string.nil? || string.empty?
    %w(0 1).include? string
  end
end

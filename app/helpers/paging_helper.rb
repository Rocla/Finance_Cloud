module PagingHelper

  def left_arrow_paging(page_nb, route)
    if page_nb > 1
      html = "<a href='#{route}?page=#{page_nb - 1}'><-</a>"
      html.html_safe
    end
  end

  def rigth_arrow_paging(page_nb, route)
    if page_nb < @nb_max_pages
      html = "<a href='#{route}?page=#{page_nb + 1}'> -></a>".html_safe
      html.html_safe
    end
  end

  def paging(page_nb, route, nb_max_pages,
  nb_max_left_right_links_middle_pages, nb_of_pages_in_pagination)

    if page_nb < nb_of_pages_in_pagination
      paginf_first_pages(page_nb, route, nb_of_pages_in_pagination)

    elsif page_nb >= nb_of_pages_in_pagination and
            page_nb <= nb_max_pages - nb_of_pages_in_pagination
      paging_middle_pages(page_nb, route,
        nb_of_pages_in_pagination, nb_max_left_right_links_middle_pages)
    else
      paging_last_pages(page_nb, route,
        nb_of_pages_in_pagination,nb_max_pages)
    end
  end

  def paginf_first_pages(page_nb, route, nb_of_pages_in_pagination)
    html = ""
    nb_of_pages_in_pagination.times do |n|
      html += "<a "
      if n + 1 == page_nb
        html += "class='actual_page' "
      end
      html +="href='#{route}?page=#{n + 1}'> #{n + 1}</a>"
    end
    html.html_safe
  end

  def paging_middle_pages(page_nb, route,
    nb_of_pages_in_pagination, nb_max_left_right_links_middle_pages)
    html = ""
    nb_of_pages_in_pagination.times do |n|
      page_to_link = page_nb - nb_max_left_right_links_middle_pages + n
      html += "<a "
      if page_to_link == page_nb
        html += "class='actual_page' "
      end
      html += "href='#{route}?page=#{page_to_link}'> #{page_to_link}</a>"
    end
    html.html_safe
  end

  def paging_last_pages(page_nb, route,
    nb_of_pages_in_pagination,nb_max_pages)
    html = ""
    nb_of_pages_in_pagination.times do |n|
      page_to_link = nb_max_pages - nb_of_pages_in_pagination + n +1
      html += "<a "
      if page_to_link == page_nb
        html += "class='actual_page' "
      end
      html += "href='#{route}?page=#{page_to_link}'> #{page_to_link}</a>"
    end
    html.html_safe
  end
end

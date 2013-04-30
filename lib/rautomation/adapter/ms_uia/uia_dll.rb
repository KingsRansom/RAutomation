#todo - move this file up to the same level as the others
#todo - organize the methods better

module RAutomation
  module Adapter
    module MsUia
      module UiaDll
        extend FFI::Library

        ffi_lib File.dirname(__FILE__) + '/../../../../ext/UiaDll/Release/UiaDll.dll'
        ffi_convention :stdcall

        attach_function :find_window, :RA_FindWindow,
                        [:string], :pointer
        attach_function :is_offscreen, :RA_IsOffscreen,
                        [:pointer], :bool
        attach_function :element_from_handle, :RA_ElementFromHandle,
                        [:long], :pointer
        attach_function :element_from_point, :RA_ElementFromPoint,
                        [:int, :int], :pointer
        attach_function :get_focused_element, :RA_GetFocusedElement,
                        [], :pointer
        attach_function :find_child_by_id, :RA_FindChildById,
                        [:pointer, :string], :pointer
        attach_function :find_child_by_name, :RA_FindChildByName,
                        [:pointer, :string], :pointer
        attach_function :current_native_window_handle, :RA_CurrentNativeWindowHandle,
                        [:pointer], :long
        attach_function :set_focus, :RA_SetFocus,
                        [:pointer], :bool
        attach_function :current_control_type, :RA_GetCurrentControlType,
                        [:pointer], :int
        attach_function :desktop_handle, :RA_GetDesktopHandle,
                        [], :long
        attach_function :move_mouse, :RA_MoveMouse,
                        [:int,:int], :long
        attach_function :click_mouse, :RA_ClickMouse,
                        [], :long
        attach_function :bounding_rectangle, :RA_CurrentBoundingRectangle,
                        [:pointer, :pointer], :int
        attach_function :is_offscreen, :RA_CurrentIsOffscreen,
                        [:pointer, :pointer], :int
        attach_function :find_children, :RA_FindChildren,
                        [:pointer, :pointer], :int
        attach_function :get_name, :RA_GetName,
                        [:pointer, :pointer], :int
        attach_function :get_class_name, :RA_GetClassName,
                        [:pointer, :pointer], :int
        attach_function :get_is_selected, :RA_GetIsSelected,
                        [:pointer], :bool
        attach_function :get_is_set, :RA_GetIsSet,
                        [:pointer], :bool
        attach_function :select, :RA_Select,
                        [:pointer], :int
        attach_function :find_window_by_pid, :RA_FindWindowByPID,
                        [:int], :pointer
        attach_function :current_process_id, :RA_GetCurrentProcessId,
                        [:pointer], :int
        attach_function :select_combo_by_index, :RA_SelectComboByIndex,
                        [:long, :int], :bool
        attach_function :set_value, :RA_SelectComboByValue,
                        [:pointer, :pointer], :int
        attach_function :select_menu_item, :RA_SelectMenuItem,
                        [:long, :pointer, :int, :varargs], :void
        attach_function :menu_item_exists, :RA_MenuItemExists,
                        [:long, :varargs], :bool
        attach_function :get_combobox_count, :RA_GetComboOptionsCount,
                        [:long], :int
        attach_function :get_combobox_value, :RA_GetComboValueByIndex,
                        [:long, :int, :pointer, :int], :bool
        attach_function :get_combobox_selected_index, :RA_GetSelectedComboIndex,
                        [:long], :int
        attach_function :get_data_item_count, :RA_GetDataItemCount,
                        [:long], :int
        attach_function :select_data_item, :RA_SelectDataItem,
                        [:long, :int], :void
        attach_function :expand_by_value, :RA_ExpandItemByValue,
                        [:long, :string], :void
        attach_function :expand_by_index, :RA_ExpandItemByIndex,
                        [:long, :int], :void
        attach_function :collapse_by_value, :RA_CollapseItemByValue,
                        [:long, :string], :void
        attach_function :collapse_by_index, :RA_CollapseItemByIndex,
                        [:long, :int], :void
        attach_function :data_item_exists_by_value, :RA_DataItemExistsByValue,
                        [:long, :string], :bool
        attach_function :RA_DataItemExists,
                        [:long, :int, :int], :bool
                        
        attach_function :RA_CellValueAt,
                        [:long, :int, :int, :pointer, :int], :void

        attach_function :control_click, :RA_Click,
                        [:long, :pointer, :int], :void
        attach_function :control_mouse_click, :RA_PointAndClick,
                        [:long, :pointer, :int], :void

        def self.cell_value_at(hwnd, row, column=0)
          string = FFI::MemoryPointer.new :char, 1024
          RA_CellValueAt hwnd, row, column, string, 1024
          string.read_string
        end

        def self.data_item_exists(hwnd, row, column=0)
          RA_DataItemExists hwnd, row, column
        end
      end
    end
  end
end

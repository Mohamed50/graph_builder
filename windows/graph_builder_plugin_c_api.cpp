#include "include/graph_builder/graph_builder_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "graph_builder_plugin.h"

void GraphBuilderPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  graph_builder::GraphBuilderPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}

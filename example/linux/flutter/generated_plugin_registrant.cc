//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <graph_builder/graph_builder_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) graph_builder_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "GraphBuilderPlugin");
  graph_builder_plugin_register_with_registrar(graph_builder_registrar);
}

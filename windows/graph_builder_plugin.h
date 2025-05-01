#ifndef FLUTTER_PLUGIN_GRAPH_BUILDER_PLUGIN_H_
#define FLUTTER_PLUGIN_GRAPH_BUILDER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace graph_builder {

class GraphBuilderPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  GraphBuilderPlugin();

  virtual ~GraphBuilderPlugin();

  // Disallow copy and assign.
  GraphBuilderPlugin(const GraphBuilderPlugin&) = delete;
  GraphBuilderPlugin& operator=(const GraphBuilderPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace graph_builder

#endif  // FLUTTER_PLUGIN_GRAPH_BUILDER_PLUGIN_H_

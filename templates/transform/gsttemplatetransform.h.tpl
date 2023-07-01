#ifndef __GST_${ELEMENT_NAME_SNAKE_CASE_UPPER}_H__
#define __GST_${ELEMENT_NAME_SNAKE_CASE_UPPER}_H__

#include <gst/gst.h>
#include <gst/base/gstbasetransform.h>

G_BEGIN_DECLS

#define GST_TYPE_${ELEMENT_NAME_SNAKE_CASE_UPPER} ${ELEMENT_FUNCTION_PREFIX}_get_type ()
G_DECLARE_FINAL_TYPE (${ELEMENT_OBJECT_NAME}, ${ELEMENT_FUNCTION_PREFIX}, GST, ${ELEMENT_NAME_SNAKE_CASE_UPPER}, GstBaseTransform)

struct ${ELEMENT_CLASS_NAME} {
  GstBaseTransformClass parent_class;
};

G_END_DECLS

#endif
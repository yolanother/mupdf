LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(TARGET_ARCH), x86)
LOCAL_CFLAGS := -O3
else
LOCAL_CFLAGS += -DARCH_ARM -DARCH_THUMB -DARCH_ARM_CAN_LOAD_UNALIGNED
LOCAL_ARM_MODE = arm
endif

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
  LOCAL_CFLAGS += -DJDCT_FASTEST=JDCT_FLOAT
endif

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/thirdparty/jbig2dec \
	$(LOCAL_PATH)/thirdparty/openjpeg-1.5.0/libopenjpeg \
	$(LOCAL_PATH)/thirdparty/jpeg-8d \
	$(LOCAL_PATH)/thirdparty/zlib-1.2.5 \
	$(LOCAL_PATH)/thirdparty/freetype-2.4.8/include \
    $(LOCAL_PATH)/thirdparty/freetype-2.4.8/include/freetype \
	$(LOCAL_PATH)/draw \
	$(LOCAL_PATH)/fitz \
	$(LOCAL_PATH)/pdf \
	$(LOCAL_PATH)/xps \
	$(LOCAL_PATH)/cbz \
	$(LOCAL_PATH)/scripts \

LOCAL_MODULE    := mupdfcore
LOCAL_SRC_FILES := \
	fitz/base_context.c \
	fitz/base_error.c \
	fitz/base_geometry.c \
	fitz/base_getopt.c \
	fitz/base_hash.c \
	fitz/base_memory.c \
	fitz/base_string.c \
	fitz/base_time.c \
	fitz/crypt_aes.c \
	fitz/crypt_arc4.c \
	fitz/crypt_md5.c \
	fitz/crypt_sha2.c \
	fitz/dev_bbox.c \
	fitz/dev_list.c \
	fitz/dev_null.c \
	fitz/dev_text.c \
	fitz/dev_trace.c \
	fitz/doc_document.c \
	fitz/doc_link.c \
	fitz/doc_outline.c \
	fitz/filt_basic.c \
	fitz/filt_dctd.c \
	fitz/filt_faxd.c \
	fitz/filt_flate.c \
	fitz/filt_jbig2d.c \
	fitz/filt_lzwd.c \
	fitz/filt_predict.c \
	fitz/image_jpx.c \
	fitz/image_jpeg.c \
	fitz/image_png.c \
	fitz/image_tiff.c \
	fitz/res_colorspace.c \
	fitz/res_font.c \
	fitz/res_path.c \
	fitz/res_pixmap.c \
	fitz/res_shade.c \
	fitz/res_store.c \
	fitz/res_text.c \
	fitz/stm_buffer.c \
	fitz/stm_open.c \
	fitz/stm_read.c \
	draw/draw_affine.c \
	draw/draw_blend.c \
	draw/draw_device.c \
	draw/draw_edge.c \
	draw/draw_glyph.c \
	draw/draw_mesh.c \
	draw/draw_paint.c \
	draw/draw_path.c \
	draw/draw_simple_scale.c \
	draw/draw_unpack.c \
	pdf/base_object.c \
	pdf/pdf_annot.c \
	pdf/pdf_cmap.c \
	pdf/pdf_cmap_load.c \
	pdf/pdf_cmap_parse.c \
	pdf/pdf_cmap_table.c \
	pdf/pdf_colorspace.c \
	pdf/pdf_crypt.c \
	pdf/pdf_encoding.c \
	pdf/pdf_font.c \
	pdf/pdf_fontfile.c \
	pdf/pdf_function.c \
	pdf/pdf_image.c \
	pdf/pdf_interpret.c \
	pdf/pdf_lex.c \
	pdf/pdf_metrics.c \
	pdf/pdf_nametree.c \
	pdf/pdf_outline.c \
	pdf/pdf_page.c \
	pdf/pdf_parse.c \
	pdf/pdf_pattern.c \
	pdf/pdf_repair.c \
	pdf/pdf_shade.c \
	pdf/pdf_stream.c \
	pdf/pdf_store.c \
	pdf/pdf_type3.c \
	pdf/pdf_unicode.c \
	pdf/pdf_xobject.c \
	pdf/pdf_xref.c \
	xps/xps_common.c \
	xps/xps_doc.c \
	xps/xps_glyphs.c \
	xps/xps_gradient.c \
	xps/xps_image.c \
	xps/xps_outline.c \
	xps/xps_path.c \
	xps/xps_resource.c \
	xps/xps_tile.c \
	xps/xps_util.c \
	xps/xps_xml.c \
	xps/xps_zip.c \
	cbz/mucbz.c

LOCAL_LDLIBS    := -lm -llog -ljnigraphics

include $(BUILD_STATIC_LIBRARY)

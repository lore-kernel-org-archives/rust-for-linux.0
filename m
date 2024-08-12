Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D917B406
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Aug 2024 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465967; cv=none; b=sSjb632LbSks7pwq5gsULJv6QdeHkPi9c1RA2pOe30qa18KkhQiNFfFjjy1GjsKIaYrzbJVNYc21eqNZeTQZXycwxFv+DJ4KgLb6JxAwNplgS+iDNsBIa/6BKKLr6QN3IAuKxUqk9EQB8wywtX7P2+pvH24XHe2f3f4DhULxBIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465967; c=relaxed/simple;
	bh=LN/5/xOFLT/3GfZH+V4wNx5jF2OlkWThCduzVlFKeHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uyj3dqEbnycUTPg14BoOEOK5V7luYuiyVfR7PMQcyhRHBA61+WYLaYs9L0A56OwP3s+Wdt3rP50XJVdtXnhKbK2ukCtetJyxyy0AWHotQMeWi6c62zV1b54UYHvUcOGJAFpOPmMRDejfMcZYihDyHdS3G0STItjWTCUyI9OUWHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ISyaZau8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ISyaZau8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723465964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFdtMpyoluZDIf8+YBntleODDii1i8IV6WVFQmjpatk=;
	b=ISyaZau849FDnwOajpoSivAFhPUh8amU3UaH9dosZAd8EZDP/PQ57Ar7cmTANf9MuTkJOt
	mam0XaZn2XtSnBddduPswtU/2kMsj3PfkZQzQJ9nh+CXXgysAD0s4UwpBv4o0j/3/OxF13
	c3T4xy1v6MJggNynPAG6ZNnQz6rti4M=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-6CeaoBF_ORSfKTIMox7dag-1; Mon,
 12 Aug 2024 08:32:41 -0400
X-MC-Unique: 6CeaoBF_ORSfKTIMox7dag-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 15BE2190ECC4;
	Mon, 12 Aug 2024 12:32:39 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.28])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AC2C430001A1;
	Mon, 12 Aug 2024 12:32:33 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	"Bjorn Roy Baron" <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v6 3/4] drm/panic: Simplify logo handling
Date: Mon, 12 Aug 2024 14:24:20 +0200
Message-ID: <20240812123147.81356-4-jfalempe@redhat.com>
In-Reply-To: <20240812123147.81356-1-jfalempe@redhat.com>
References: <20240812123147.81356-1-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Move logo rectangle initialisation, and logo drawing in separate
functions, so they can be re-used by different panic screens.
It prepares the introduction of the QR code panic screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---

v6:
 * rebase, and handle conflict with 5d45c01dea6f ("drm/panic: Add panic description")

 drivers/gpu/drm/drm_panic.c | 58 +++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 59fba23e5fd7a..473db5fafb617 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -85,7 +85,7 @@ static struct drm_panic_line panic_msg[] = {
 	PANIC_LINE(""), /* will be replaced by the panic description */
 };
 
-#define PANIC_MSG_LINES ARRAY_SIZE(panic_msg)
+static const int panic_msg_lines = ARRAY_SIZE(panic_msg);
 
 static const struct drm_panic_line logo_ascii[] = {
 	PANIC_LINE("     .--.        _"),
@@ -97,7 +97,7 @@ static const struct drm_panic_line logo_ascii[] = {
 	PANIC_LINE(" \\___)=(___/"),
 };
 
-#define PANIC_LOGO_LINES ARRAY_SIZE(logo_ascii)
+static const int logo_ascii_lines = ARRAY_SIZE(logo_ascii);
 
 #if defined(CONFIG_LOGO) && !defined(MODULE)
 static const struct linux_logo *logo_mono;
@@ -496,31 +496,44 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
 	}
 }
 
+static void drm_panic_logo_rect(struct drm_rect *rect, const struct font_desc *font)
+{
+	if (logo_mono)
+		drm_rect_init(rect, 0, 0, logo_mono->width, logo_mono->height);
+	else {
+		int logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
+
+		drm_rect_init(rect, 0, 0, logo_width, logo_ascii_lines * font->height);
+	}
+}
+
+static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *rect,
+				const struct font_desc *font, u32 fg_color)
+{
+	if (logo_mono)
+		drm_panic_blit(sb, rect, logo_mono->data,
+			       DIV_ROUND_UP(drm_rect_width(rect), 8), 1, fg_color);
+	else
+		draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, rect,
+				   fg_color);
+}
+
 static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 {
 	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
 	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen, r_logo, r_msg;
-	unsigned int logo_width, logo_height;
 	unsigned int msg_width, msg_height;
 
 	if (!font)
 		return;
 
 	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
+	drm_panic_logo_rect(&r_logo, font);
 
-	if (logo_mono) {
-		logo_width = logo_mono->width;
-		logo_height = logo_mono->height;
-	} else {
-		logo_width = get_max_line_len(logo_ascii, PANIC_LOGO_LINES) * font->width;
-		logo_height = PANIC_LOGO_LINES * font->height;
-	}
-	r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
-
-	msg_width = min(get_max_line_len(panic_msg, PANIC_MSG_LINES) * font->width, sb->width);
-	msg_height = min(PANIC_MSG_LINES * font->height, sb->height);
+	msg_width = min(get_max_line_len(panic_msg, panic_msg_lines) * font->width, sb->width);
+	msg_height = min(panic_msg_lines * font->height, sb->height);
 	r_msg = DRM_RECT_INIT(0, 0, msg_width, msg_height);
 
 	/* Center the panic message */
@@ -529,15 +542,10 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
 	/* Fill with the background color, and draw text on top */
 	drm_panic_fill(sb, &r_screen, bg_color);
 
-	if (!drm_rect_overlap(&r_logo, &r_msg)) {
-		if (logo_mono)
-			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
-				       fg_color);
-		else
-			draw_txt_rectangle(sb, font, logo_ascii, PANIC_LOGO_LINES, false, &r_logo,
-					   fg_color);
-	}
-	draw_txt_rectangle(sb, font, panic_msg, PANIC_MSG_LINES, true, &r_msg, fg_color);
+	if (!drm_rect_overlap(&r_logo, &r_msg))
+		drm_panic_logo_draw(sb, &r_logo, font, fg_color);
+
+	draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, &r_msg, fg_color);
 }
 
 /*
@@ -647,7 +655,7 @@ static void drm_panic_set_description(const char *description)
 	u32 len;
 
 	if (description) {
-		struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES - 1];
+		struct drm_panic_line *desc_line = &panic_msg[panic_msg_lines - 1];
 
 		desc_line->txt = description;
 		len = strlen(description);
@@ -660,7 +668,7 @@ static void drm_panic_set_description(const char *description)
 
 static void drm_panic_clear_description(void)
 {
-	struct drm_panic_line *desc_line = &panic_msg[PANIC_MSG_LINES - 1];
+	struct drm_panic_line *desc_line = &panic_msg[panic_msg_lines - 1];
 
 	desc_line->len = 0;
 	desc_line->txt = NULL;
-- 
2.46.0


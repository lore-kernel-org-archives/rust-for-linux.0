Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C91DF73A
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jul 2026 00:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785111393; cv=none; b=hzwpJsotXWYD4EObume3WCUa7+8VBSkpLKgwK4OcPWkwKb+yIO5gv/ckwbK5vT0NVUaJ31MJHyjYzRt2BIYcKEMemYsL086EcBqLj3tti4O0FjnFegZNN1GvI7EJ19S3cHUfyQ4DvLRE2AI1y6NC+S48rpC7U/iUDCOpRIbqDmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785111393; c=relaxed/simple;
	bh=pmxL9+hOehI9g0heQQ26Ixv9tv6ssgP2T5QpyiPRXYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHkFhzLQ5wLgvbNnJYu0WjMxiQ11WUvZ6469BqbqOvUrCYen4kt/2oUF/PoEyFofIWqxSvBz4wrtNHT6IUxwUoLuJv84nYxey4WCev2pxuXvNvciWvGZXtDobxOSKErq+UyA3NCNEKeKRWtbaFv3lQ/RMnR12Mbu1QkL0H242zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfSH/aU4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfSH/aU4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954d29264cso10610615e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Jul 2026 17:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785111390; x=1785716190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xh/3Pl721PFhB4JhF2fGID/z/BCCds8YijN/rARhrb8=;
        b=GfSH/aU4LzxwCqpka7VS3O/jomlXidZhUZZ5XBaFNsq8/Bzklsf+iJ52Do+0RLroLG
         3WYHkpZ6omHwzwUmn1xNP82jX/2ja1tV9J1GLF8qgl2GIFIJojaJzrQdCeblJa92cc90
         xWzxkFck1Sk04dcXCCrEFHKcG6HwI3QvUoHOIvOCfzh4/zIkUhFxbBj86wFoNlizK04w
         1MBiojYC+8MSbqKufiK6JD7bgUUZ88OzCGHH2GujHYrpTnmgpEvzOU0vRGdb540kehD4
         Umd8X6y/JoLCg0DsjrZb5h4YT0ZHzFFXEduZUSRCQHrVotcxngDeVjASJpdkqflJXcIE
         G2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785111390; x=1785716190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xh/3Pl721PFhB4JhF2fGID/z/BCCds8YijN/rARhrb8=;
        b=sV0QRLY+j6q6/9r6HTRJraurgByMyc/BVFFbYwOAL7m7v+UO2Zy87hwOvEGtQLRYwU
         Gex5EdP2cOf5et/R8fvWUTGxasycLNehlqc2qFgEI/L6NzREodFXkVO5Uxl8RBVs4FNG
         sUdQGoeRSkr56eqf2dBWJjadwSFTMgBm8DrTz6apQfb4W9ai83n+RKRh/ng+YqlOCA6y
         IufGcWHLQZft5VIX8d/5QzzD4kvBEItbL8v8OXNVRDGctgcIeOaWOqFpRiTaVjpfTUNx
         ST7mjGypkC2M+ShloY0SOZ2pItcIZTAz6v+RoWKg818S9Ne5CsEVa/oWdac92VKNK1Im
         KURQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+3IqWVc7h9Pdq0OENdxT2xKaIARLG/zRVBdxac45IBfvpcYzV5AQk3TifFwa3SB5JreHuh3OqnowbBYGxnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG30ayIVmtas/YT7FSLfl+O1qHYNymfEUFu1d86hFgxq1kdHlW
	AdZ4T4gzWf/ULH0IKYN/5et1dlMHeCfFlO2LEurINXMrpugk3LMa8si5
X-Gm-Gg: AR+sD12UNsIhEvq8brwJFvoBCkWYyKKD7lF/M67q7WSWU+A2T0M5OIq0EHRQbpLigH7
	W6Zhtxl1Td/zsbtM5Ddzhj7AHb8zFFbfGE1Kbf71qKRCWzzoqzVKsxCFAJ9l5Vqmf7o0hbj93Pl
	hK51hK5wpxVnx9YAbI+40vd2bLVWUS3tI/oGof3DWpQ2In6MRNvNbFo21vMKUsA6nRXwdtr/2rE
	vudnICDb4Y6D6dPM2DCNJe033MmxfQo3KzM3xLFCJ8djvgbTb8lWwkAAQ22pBKLToXYA6XdvU0G
	XtKqcVA1bBGr47Yesh3VepDR18aF3sz/caG+18y8db4oXlr/W7HiW5oFMMkNTX0U+gujZKqs58f
	ByiQDcPSJsUUIHWpLITEeTKK95M+5DAtdXIPnGxHyUE4Q0sV/VpOn11t6BSXO+u8+sdPlJNG9eN
	v3owmnXntvIPL3Y0AV/pWQRjEnX033oKQgaTqa+/mSnzzv2j784nvXcv91HWvqstEtsw==
X-Received: by 2002:a05:600c:6296:b0:494:282:106c with SMTP id 5b1f17b1804b1-496b56fb438mr74540935e9.16.1785111390266;
        Sun, 26 Jul 2026 17:16:30 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485f65csm176403555e9.5.2026.07.26.17.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 17:16:29 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: ojeda@kernel.org,
	akpm@linux-foundation.org,
	jani.nikula@linux.intel.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ljs@kernel.org,
	andrew.jones@linux.dev,
	masahiroy@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 1/5] kconfig: add add another callback to the parser to view raw parse tree
Date: Mon, 27 Jul 2026 01:16:19 +0100
Message-ID: <20260727001623.2794156-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727001623.2794156-1-julianbraha@gmail.com>
References: <20260727001623.2794156-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The final step of the Kconfig parser is to call menu_finalize(), which
will evaluate the dead code that static code analyzers like kconfirm need
to be able to view.

This patch adds another callback to the parser just before this call to
menu_finalize(), making the raw parse tree viewable as necessary to
callers of conf_set_pre_finalize_callback().

Assisted-by: Claude:claude-fable-5
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/lkc_proto.h |  2 ++
 scripts/kconfig/parser.y    | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 8914b4e8f2a8..f03bcef7b270 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -6,6 +6,8 @@
 
 /* confdata.c */
 void conf_parse(const char *name);
+void conf_set_pre_finalize_callback(void (*fn)(const struct menu *root, void *data),
+				    void *data);
 int conf_read(const char *name);
 int conf_read_simple(const char *name, int);
 int conf_write_defconfig(const char *name);
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 5fb6f07b6ad2..365ed450e855 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -28,6 +28,9 @@ static void zconf_error(const char *err, ...);
 static bool zconf_endtoken(const char *tokenname,
 			   const char *expected_tokenname);
 
+static void (*conf_pre_finalize_callback)(const struct menu *root, void *data);
+static void *conf_pre_finalize_callback_data;
+
 struct menu *current_menu, *current_entry, *current_choice;
 
 %}
@@ -551,6 +554,20 @@ static int choice_check_sanity(const struct menu *menu)
 	return ret;
 }
 
+/*
+ * Register a callback to be invoked by conf_parse() once parsing has finished,
+ * but before menu_finalize() propagates dependencies and simplifies
+ * expressions. This hands the callback the menu tree as it was written in the
+ * Kconfig source files, which is what static analysis tools like kconfirm
+ * need. Passing NULL unregisters the callback.
+ */
+void conf_set_pre_finalize_callback(void (*fn)(const struct menu *root, void *data),
+				    void *data)
+{
+	conf_pre_finalize_callback = fn;
+	conf_pre_finalize_callback_data = fn ? data : NULL;
+}
+
 void conf_parse(const char *name)
 {
 	struct menu *menu;
@@ -587,6 +604,10 @@ void conf_parse(const char *name)
 		menu_add_prompt(P_MENU, "Main menu", NULL);
 	}
 
+	if (conf_pre_finalize_callback)
+		conf_pre_finalize_callback(&rootmenu,
+					   conf_pre_finalize_callback_data);
+
 	menu_finalize();
 
 	menu_for_each_entry(menu) {
-- 
2.54.0


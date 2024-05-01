Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B3F9D6
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714567094; cv=none; b=d4JoodUKgKwEJdJh8e+iOUknjWXQejkDFc0+TIk7RY7zIZJA2A+KFdgN8MFukT9mzY2crqlEl271YUIi+shQiAbVccy0t5ez3Y9UaMXcyn41pPC7I4e2V5RFJa7ev72+YTDx4KbPMheg02QRODNOkQ5u6QO1ZzVZhqu2Z7mKALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714567094; c=relaxed/simple;
	bh=lGzbIuZJxh74JtjWjqnKVFM8EoGYo6GFPnFb3RyyMlc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nzvs7UoTHPlePhhyoR9NZoWHkuuc47bhXFS91r+jxiXPoV/YTCDFiGE39jMU/ABaK1yZ/jDSTMXLflnziZXtxP9HMFPSlCU+Jgx6UOCQpxZd0hkra9opMT+awStL6erjH8ywYcNfTeWAzXL/+BJf126z4Qj6PN/4e+8793u5hNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDFU0xkQ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDFU0xkQ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ed4a80c19eso25293b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 05:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714567092; x=1715171892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPscfXL6SS7dWE9To+93AyCYfibXRFraBXLDFY2q6Wk=;
        b=jDFU0xkQAJRks0NgoDQ8U6x0iHx1ofY0/yhxl2LeJmjScpTkm+7ZRhVg+Xoy75/WBl
         CncO8dCmqMZcwSzKkF4MIM3QWV844U4ueODNw77FxMvY69Q8T0Fz78ccw2mOlXvLwHHw
         kXA6frd3lLq+NrGKpja5WVYfgKFYcGtnXJ49ElovYkAcOBAsHZ4lJ8LOZbt9BYhppOJg
         wUnJ7xLpmKJb0ZVsW4IdYVKgzFvOad5xK9KDPRXI/o+qUGGcLTYuRvEmXiOQoxXDUiin
         vBvYNfQQRb02h6m79QwP95RJ8d3LTIBGndUzVvz1TroGK6ElpCix4O80cFpcgcHcwXa7
         wFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714567092; x=1715171892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPscfXL6SS7dWE9To+93AyCYfibXRFraBXLDFY2q6Wk=;
        b=KBzLTTgb88rCXdu9AV+m2aBS/X3IPXV/2x30TlIlBDHAXYFgr4nk8kg1YvlH3UzTtH
         EUpggwrb1tDu4KiN+h62riYGls78gL2qTfyO2XbitpHYM+oltHiWPMPrBfTObt5JAp7Z
         SipvZxSXPzoppr/iDh2GwOw2DRAnPzFGGt8qtl3hc3qkmbyBobzgVxHDTzLNfGsTzXUZ
         fvkXHxkyinP0tIn3Ei4F05zljgaZG18gt50KQPKxsq/SElCe6MJZxEH3LwKebVuy8aZh
         R8bLL5BupMxTkdTkPKN2hszGABiaMfTQfG6ibqKsqYZdyKfqH2A1Rfzn6JOaC98WSeQF
         p19g==
X-Gm-Message-State: AOJu0Yw+6fcvgreVGjKYIZzVZ4VFRypqTFNtwyjaxgXh1SSbNYlkSAw6
	HJOMkR6zryWxBlL1Ij17WB4Cr4cfu8VW+IunqafxRZetdwo9p8QjdWxgobPI
X-Google-Smtp-Source: AGHT+IEE38RNgJJEn4dfMpdNp1KxuQjcVOEoaGmWoOd/Sx4rRu3DmjtqqXRPw7RU7kJ/e0vM9p9ZhQ==
X-Received: by 2002:a05:6a20:320b:b0:1ae:433a:d5b6 with SMTP id hl11-20020a056a20320b00b001ae433ad5b6mr2591184pzc.1.1714567091641;
        Wed, 01 May 2024 05:38:11 -0700 (PDT)
Received: from rpi.. (p4300206-ipxg22801hodogaya.kanagawa.ocn.ne.jp. [153.172.224.206])
        by smtp.gmail.com with ESMTPSA id z7-20020a633307000000b005f7fce71a78sm20690997pgz.6.2024.05.01.05.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:38:11 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: miguel.ojeda.sandonis@gmail.com,
	benno.lossin@proton.me
Subject: [PATCH v2] rust: add 'firmware' field support to module! macro
Date: Wed,  1 May 2024 21:35:48 +0900
Message-Id: <20240501123548.51769-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds 'firmware' field support to module! macro, corresponds to
MODULE_FIRMWARE macro. You can specify the file names of binary
firmware that the kernel module requires. The information is embedded
in the modinfo section of the kernel module. For example, a tool to
build an initramfs uses this information to put the firmware files
into the initramfs image.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/macros/lib.rs    | 32 ++++++++++++++++++++++++++++++++
 rust/macros/module.rs | 18 ++++++++++++++++--
 2 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index f489f3157383..6420ebc22219 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -67,6 +67,36 @@
 /// }
 /// ```
 ///
+/// ## Firmware
+///
+/// The following example shows how to declare a kernel module that needs
+/// to load binary firmware files. You need to specify the file names of
+/// the firmware in the `firmware` field. The information is embedded
+/// in the `modinfo` section of the kernel module. For example, a tool to
+/// build an initramfs uses this information to put the firmware files into
+/// the initramfs image.
+///
+/// ```ignore
+/// use kernel::prelude::*;
+///
+/// module!{
+///     type: MyDeviceDriverModule,
+///     name: "my_device_driver_module",
+///     author: "Rust for Linux Contributors",
+///     description: "My device driver requires firmware",
+///     license: "GPL",
+///     firmware: ["my_device_firmware1.bin", "my_device_firmware2.bin"],
+/// }
+///
+/// struct MyDeviceDriverModule;
+///
+/// impl kernel::Module for MyDeviceDriverModule {
+///     fn init() -> Result<Self> {
+///         Ok(Self)
+///     }
+/// }
+/// ```
+///
 /// # Supported argument types
 ///   - `type`: type which implements the [`Module`] trait (required).
 ///   - `name`: byte array of the name of the kernel module (required).
@@ -74,6 +104,8 @@
 ///   - `description`: byte array of the description of the kernel module.
 ///   - `license`: byte array of the license of the kernel module (required).
 ///   - `alias`: byte array of alias name of the kernel module.
+///   - `firmware`: array of ASCII string literals of the firmware files of
+/// the kernel module.
 #[proc_macro]
 pub fn module(ts: TokenStream) -> TokenStream {
     module::module(ts)
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 27979e582e4b..5fdaac17a733 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -97,14 +97,22 @@ struct ModuleInfo {
     author: Option<String>,
     description: Option<String>,
     alias: Option<Vec<String>>,
+    firmware: Option<Vec<String>>,
 }
 
 impl ModuleInfo {
     fn parse(it: &mut token_stream::IntoIter) -> Self {
         let mut info = ModuleInfo::default();
 
-        const EXPECTED_KEYS: &[&str] =
-            &["type", "name", "author", "description", "license", "alias"];
+        const EXPECTED_KEYS: &[&str] = &[
+            "type",
+            "name",
+            "author",
+            "description",
+            "license",
+            "alias",
+            "firmware",
+        ];
         const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
         let mut seen_keys = Vec::new();
 
@@ -131,6 +139,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
                 "description" => info.description = Some(expect_string(it)),
                 "license" => info.license = expect_string_ascii(it),
                 "alias" => info.alias = Some(expect_string_array(it)),
+                "firmware" => info.firmware = Some(expect_string_array(it)),
                 _ => panic!(
                     "Unknown key \"{}\". Valid keys are: {:?}.",
                     key, EXPECTED_KEYS
@@ -186,6 +195,11 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             modinfo.emit("alias", &alias);
         }
     }
+    if let Some(firmware) = info.firmware {
+        for fw in firmware {
+            modinfo.emit("firmware", &fw);
+        }
+    }
 
     // Built-in modules also export the `file` modinfo string.
     let file =
-- 
2.34.1


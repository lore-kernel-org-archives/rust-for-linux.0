Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FD313FD78
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Apr 2024 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125402; cv=none; b=q1sMvGeUD1FE0QefjwXMh304Qgsb0nZD5t3rhymIlF1ozxPwyPEPa2HGphg/QgH6lTexJ+Wh/OWf/hiPPVM9lRm977R7T8ELE+Bfl1MhrRvBq+/JQxKg7ycxHAu68oUIiLXTF22i4So208KqA7uxXNOZXZKLCqu/S0QveGVbQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125402; c=relaxed/simple;
	bh=0b9FEEWAVGQCjlkAJg5I68CiWqa7TeAlxJ/b77QbNZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N2atW0dIAtlLOF3ij5Q+hFWjvgAe77sg6fIg4PD1XvbWSdPaAQsc+9CIgh5IPdRJG+jmIPbHZVoDROa9pDyTSEnkL1x4gj8nMm7k0dqRNP0RDLGx6qL+c8MyiSNho2A+zNU8/YxhUGm0NNQQQ+WaPIHGVldQgGYyskfAeOYFCwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/II2rYk; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/II2rYk"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ab48c11534so478977a91.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Apr 2024 02:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714125400; x=1714730200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4cFmrea+xy/W5cY1M+/g7lMwnM88R4OYAycDsEgtaXM=;
        b=V/II2rYkZLXZJTxKXR70AlhrVHAAC+aibkZFtWND9tnmBB9fjeW9XQRJQHYq//aJ/3
         kua29yKxL23Kibex/pJXL7tF1GBsnq9b7YjkKJFudjGJde/Sf4Iz9eJDRg4HT7zxSv5i
         sToz8L5XrDk0pRZ0oo4WsE5YRRRhlzcwdhU8/0mZAA8J2ho18lfdQZDDW1XIqk1xlHA1
         bZGdOaZoAq9joT3nLi/d0cMp4Mr4ukxVdhW/P8aQ9P5Bdh+uVxATPLhJrvVsPmFHB2ib
         hpqbX+Ep4iwHyp6nS9UPwyXdFGIJDwweozXK2ch4H4qnzVmFzJIHa9EFep8LYm9OHWtf
         iWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714125400; x=1714730200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cFmrea+xy/W5cY1M+/g7lMwnM88R4OYAycDsEgtaXM=;
        b=lzfnJi2myMz79684/pa8IedPmMlQdDEA3K5OUQ7eDYLS8PcMVxLvZKjuVTsHNc6b7D
         8X5fpceU4zYzUORBbjX/rmS30zG0DDAWWSJGmhABTS82ejF+0GQPnnocGS0DPyMxF+E/
         8VwH5Yj2ZunDBmhf7RlKXXqQ9BhKobySNJTni/qu4WinTXl4WCIek6R+xv9vfMJU2Ipn
         VS4b9P9+l5j7WkNDlS/7hzSRFzmFugW8550bfoUottiFxgaUJXoOz3wUswL82L1RoNkf
         /un9USgpvz3qjJQYBxQLZYF7o2Ct4lKjhsdfYEhj1Oe37QNwl/9NmkARMaufrFHNYmo7
         qSTA==
X-Gm-Message-State: AOJu0Yx2K1EDu1tX1QdsWgvDOKFiQhPCjo0/BNVCmMPd8sfQ9tWn/VM6
	sia2hjndag3QrT0y5WB5zE7QSslx7oiZEge7hV1EU6ysPMsUJtkHC9xN+Cam
X-Google-Smtp-Source: AGHT+IFj2djAM8ZvVSbHyw0gyx1O0tBWMoXna6cDrnJ2YHhTj5nmSpCFhXdRXTGDoMUlZ/h68b+6eg==
X-Received: by 2002:a17:902:e88a:b0:1e5:1138:e299 with SMTP id w10-20020a170902e88a00b001e51138e299mr2268985plg.1.1714125400142;
        Fri, 26 Apr 2024 02:56:40 -0700 (PDT)
Received: from rpi.. (p4300206-ipxg22801hodogaya.kanagawa.ocn.ne.jp. [153.172.224.206])
        by smtp.gmail.com with ESMTPSA id t10-20020a170902e84a00b001e5a5ea5287sm15095258plg.208.2024.04.26.02.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 02:56:39 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: miguel.ojeda.sandonis@gmail.com,
	benno.lossin@proton.me
Subject: [PATCH v1] rust: add 'firmware' field support to module! macro
Date: Fri, 26 Apr 2024 18:56:27 +0900
Message-Id: <20240426095627.37333-1-fujita.tomonori@gmail.com>
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
---
 rust/macros/lib.rs    | 31 +++++++++++++++++++++++++++++++
 rust/macros/module.rs | 18 ++++++++++++++++--
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index f489f3157383..73fa768fce64 100644
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
@@ -74,6 +104,7 @@
 ///   - `description`: byte array of the description of the kernel module.
 ///   - `license`: byte array of the license of the kernel module (required).
 ///   - `alias`: byte array of alias name of the kernel module.
+///   - `firmware`: array of the file names of firmware required by the kernel module.
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


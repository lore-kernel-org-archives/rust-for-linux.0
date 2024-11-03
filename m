Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A37633F9
	for <rust-for-linux@vger.kernel.org>; Sun,  3 Nov 2024 03:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730603158; cv=none; b=HkybuH8vdFKZQATnSc+2O/yclnLQqWde3Cc3vd3SAjDyu6pL2V4oJ18lgMHt+aNM1maGwYj0MR6Cw/7SUEBDjaf9sa5DtDxBZ6a1FgDBJ4FJuZ90aF4fmv2VK8Gq+NBeBLPFFfBVx1DSd3a1G1hCBQynDKoKwTCej5NxPbKY2Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730603158; c=relaxed/simple;
	bh=4toWlWgJq0ayCCYa53gCderZ7YOSxADiU9nyxxVseUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NJsg6lhUQcbupdsky5YlP2C7NeMVNhr2Z3HHNBrx0UX91004rgpp3xTvN2BetnGjNy6fgmSSmT9GYRogB39GMyvQn4JKj3oMD2HOrFO9gq4XKP5LDOUhve6DC/oUCIsaBeReDFMyuGV+BKqEIn/OIS4Fqp8E3FOxYRkq4sY+ssM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Inf+RG3K; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Inf+RG3K"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2e88cb0bbso2449313a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 02 Nov 2024 20:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730603156; x=1731207956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wyj1YstXFsCCM9cVKcEjdaLKrcdGRM47+1CPpU1xF4c=;
        b=Inf+RG3KIZ1w9QtBElV10+zkcZ22px03IlfsOXqQH+6rcQ/GPJD34t58lAkr7DfasS
         G0dNpksu0kNFlvflak2l/Dm15TBd/s7S5UtHZU+2HwdEBpbB4ba0j2QvN0aOehDLar2s
         Jkz9BT8CuYs7Z0QrSZo2iz6Ev436McCys/Luiyv89TSpepO4RkkT1jxjEyvkKcv/CA4D
         Y82jjTA2iDduurzLY/jYMDIzeQTn4NlV/4/CE+Rjv9VGETPo+fPafmniZbeslnOmpoAB
         kiQ3fHo1zCYZT9vsqDXQVWi9OG5b8l7JOA09RWzJmvo+2vJCfol8f+CA11SqliaC2Xlj
         RxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730603156; x=1731207956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyj1YstXFsCCM9cVKcEjdaLKrcdGRM47+1CPpU1xF4c=;
        b=e7SrplK0Glz/cBlYSbbQm316b2suR3uEniZ5kViBNjJTd9zxdIxBwL1+NzfTIH+/B1
         mdIdGKC+NGK4he4PovOcypV0PN5So9B7E65e4NLoH720Voz8advgJcgc6yOq3+ruf/8s
         G7B+iUfw6e1J+wODT5FJocrK6bQ7UuCIGDQ3w3G62cLiQ/li606iv/VsKJ3nqpRLLiyR
         5qDJ4ID3U3qTfa171+e6uJEwinMfKhDSXPOv9+tDBfvb+QeWBhKXEUdekaR3Exl9OSNz
         zaSIUeTvWEyZ5m3pofImV/1zRMJ9fx7tormNmU08Si9iyUoWYoLDUuVz9uFU46+qjXDR
         Xi6g==
X-Gm-Message-State: AOJu0YxiRhV7+EaITRVY2rYO7Hlqydd46lWUvw3Xmyr1Z27dQjM0ocpi
	Zyv/FGJoK2pfql9KQhIe1UrLKVOzTPKlJdyAYqseJ0Ua4MzyToyDWhI0th2p
X-Google-Smtp-Source: AGHT+IHZZNVPbjpOIpq1VGb9n3iMxjRgUCChDcRmrF5+G9Xb4zyEdy0W1O41NbG73RynQFhaQbKU5w==
X-Received: by 2002:a17:90a:d807:b0:2e2:ac13:6f7 with SMTP id 98e67ed59e1d1-2e8f104f11cmr31304761a91.4.1730603155999;
        Sat, 02 Nov 2024 20:05:55 -0700 (PDT)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fc0084asm7313600a91.51.2024.11.02.20.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 20:05:55 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v1] rust: Add pr_*_once macros
Date: Sun,  3 Nov 2024 12:05:30 +0900
Message-ID: <20241103030530.76756-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
functions, which print a message only once.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/print.rs | 92 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index a28077a7cb30..57dbb45ba5c0 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -414,3 +414,95 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+
+/// Executes code only once if the condition is true.
+///
+/// Public but hidden since it should only be used from public macros.
+#[doc(hidden)]
+#[macro_export]
+macro_rules! do_once_lite_if (
+    ($condition:expr, $e:expr) => (
+        {
+            #[link_section = ".data.once"]
+            static ALREADY_DONE: core::sync::atomic::AtomicBool =
+                core::sync::atomic::AtomicBool::new(false);
+            let mut ret = false;
+
+            if $condition && !ALREADY_DONE.swap(true, core::sync::atomic::Ordering::Relaxed) {
+                $e;
+                ret = true;
+            }
+            ret
+        }
+    )
+);
+
+/// Prints an emergency-level message (level 0) only once.
+///
+/// Equivalent to the kernel's [`pr_emerg_once`] macro.
+#[macro_export]
+macro_rules! pr_emerg_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite_if!(true, $crate::pr_emerg!($($arg)*))
+    )
+);
+
+/// Prints an alert-level message (level 1) only once.
+///
+/// Equivalent to the kernel's [`pr_alert_once`] macro.
+#[macro_export]
+macro_rules! pr_alert_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite_if!(true, $crate::pr_alert!($($arg)*))
+    )
+);
+
+/// Prints a critical-level message (level 2) only once.
+///
+/// Equivalent to the kernel's [`pr_crit_once`] macro.
+#[macro_export]
+macro_rules! pr_crit_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite_if!(true, $crate::pr_crit!($($arg)*))
+    )
+);
+
+/// Prints an error-level message (level 3) only once.
+///
+/// Equivalent to the kernel's [`pr_err_once`] macro.
+#[macro_export]
+macro_rules! pr_err_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite_if!(true, $crate::pr_err!($($arg)*))
+    )
+);
+
+/// Prints a warning-level message (level 4) only once.
+///
+/// Equivalent to the kernel's [`pr_warn_once`] macro.
+#[macro_export]
+macro_rules! pr_warn_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite_if!(true, $crate::pr_warn!($($arg)*))
+    )
+);
+
+/// Prints a notice-level message (level 5) only once.
+///
+/// Equivalent to the kernel's [`pr_notice_once`] macro.
+#[macro_export]
+macro_rules! pr_notice_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite_if!(true, $crate::pr_notice!($($arg)*))
+    )
+);
+
+/// Prints an info-level message (level 6) only once.
+///
+/// Equivalent to the kernel's [`pr_info_once`] macro.
+#[macro_export]
+macro_rules! pr_info_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite_if!(true, $crate::pr_info!($($arg)*))
+    )
+);

base-commit: ae7851c29747fa3765ecb722fe722117a346f988
-- 
2.43.0


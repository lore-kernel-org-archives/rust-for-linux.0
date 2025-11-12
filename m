Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291B5338586
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762953404; cv=none; b=AMDniSKt4tp6K9EU/sjuH7wXaOm3OTS4VgTloVFwo7t75599DcJ3qCI2hmc8hlWgiv2stz5kyAlfK1eML4kRxkiMtj8DSmSm0RM5eW6vyj0FUdZqaOJFrm5rPRwDvKyWa/11btE5wggi+WjmcGFP5xYr9e4JjiYfPvW9LSD3sts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762953404; c=relaxed/simple;
	bh=ksyMQbngJffoQvTQmQioGTotGgHvOab7rjtFt6FEpT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUXgrBhUsXfvZULntGdkQBQ9VAs5J79ozesdAx4iiyD7W7W7VhFKckAw3II1oAq0aKWvgX6VyptwVZVyJ4pmuQSgjIsKibnfjwDa1ifOWXjRoNKOPwBJVX/CxLA72ZxneqF25aF56+PN3vsjL6al2LR5Kps4bEfmtM16h6Xpo4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfUErRu0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfUErRu0"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29555415c5fso8795495ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 05:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762953402; x=1763558202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6XscxXNlJGHPFGIXeucHQLuWHeCNL33GdKzcj9dMsk=;
        b=mfUErRu06IMWJWrBZYvidYVTn5ZrG8DEao9F7dOY84Rk3V0w1xGeV6plO+eTx5K0Fp
         THD+yfSQTzaoFJa5F//Y1GLPkBvVH4o+adHVMr5Z50gV7dteT0L0rM+r0GmaAVD33rVh
         tcyDJr+9nZQeiNhAclsEwNh/wlOlfupjqQ8KjgI9jXEQfeCaRn0yp4X2TSWRCESvepoU
         eyDqia2ZvWwQ3bZu7VJWWKE3q8TR355IyEZWhJC2dEDx0X1noGLQ4JTnnJh8Mp0gVcqt
         iHZC+vFbyKHKDZar88Rewvmq5F8Py58pogmFgqd8d32Zs1d2eKX0pcrtTE447ZWqR+xV
         HuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762953402; x=1763558202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W6XscxXNlJGHPFGIXeucHQLuWHeCNL33GdKzcj9dMsk=;
        b=q5ilX12y1wRbYx+NG96fR/DIDjMQJntFaiIZp+uV3g4Xa8SGgmFNoS8RVXWYvtVWSR
         rXRvcNULMQwxHR9NVJcbzEoukb0dXGVgHDpkS2NCBEHB9tvCZITzJPosWofjJLssjQIA
         zRgoyMahqPQEw8IbYuTo9qo9S3twwuGpEtyuiW2XefFTwLIWA5Xcr3C5CoYBCZHjYpJd
         jsB0sieFvQQHWxdphE56oNRZmQk7UR1+ZQ6Ceu4WFrFaPyA+f7LyZKcOnH63u5+WSakc
         6GEkIOMMAYzfrDxyR8KFFGWgdxJR6PU8N2cAb5VtBFHgkQj/PU56huMBdoM5Rnccmn0V
         VG0w==
X-Forwarded-Encrypted: i=1; AJvYcCXtdd90Tj1pw2/eAPQ8mzdXeMZQIpa3rPSVwpwxKBTQ8Odb634Cinb894jxdkJd1mD6KhK9CgsPu3Ly8H/tmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1D3SQODR3re9Z7JVXtSQtgkkIMZkikmEfL1Q80g0n2KgwvjLG
	crGWigOeLC7XfabTx5+TKcT1gU81OERAwo+8SOd5MogrqBdb7+LOw6Ze
X-Gm-Gg: ASbGnct72E2Qaz0DG0bmJpTP1savz/o02kRLJs1sIgtjAJTWlXK60PojA0O+VXTrAtn
	NEi0JqRqvnVNB2HkG2Npq+pEV5opK4PKHFwalaj1dyxlPc8Uh6NSkDqoyFfWCBqNio+J/6m/XbX
	sGuAgtrGndUSfZgfxe6Hx7P2Mmy4u0bB6q6mlCipgUGHcUVts4Aryk08lrFdFUkfRob03ak5zYl
	vJPMEXMpMaHVbkpyFF2FjdcpQuR5W/cUfrTY3gycivRzVYTY2remAKySC85VDExb8r9gYHUXw8s
	dclzCTK7Cyf1yFrs5KfpZ+k22/AuhY39+YAE3onsV5mq3+Hiq1FP6bp1Wo0j5/vXxWu2fHREE6O
	YY5KJauOK399TJ6PsK79KDJlUkRTyNVDzmVi8ld2gb03Oati/VSz3wPkzZ2pNMbFvL/+drT0Rt3
	cstAbtq+Ua8LGRIrV+MiP+0fz1QC8yxEbkInHhV85V4r9EbJ3N
X-Google-Smtp-Source: AGHT+IGvREUyb+VEUjiGF1m0DAydwdHij+3OCKLWn8yd1ib/+czKB23Par5fKuaJ8OqSldsrpyrd1g==
X-Received: by 2002:a17:903:1a30:b0:295:fe17:841 with SMTP id d9443c01a7336-2984ed341b6mr40080905ad.10.1762953402400;
        Wed, 12 Nov 2025 05:16:42 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbd93c0sm31732485ad.6.2025.11.12.05.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:16:42 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v2 2/2] rust: Add pr_*_once macros
Date: Wed, 12 Nov 2025 22:16:19 +0900
Message-ID: <20251112131619.3585510-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112131619.3585510-1-fujita.tomonori@gmail.com>
References: <20251112131619.3585510-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
macros, which print a message only once.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/print.rs | 70 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 2d743d78d220..d66fd8e90be2 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -423,3 +423,73 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+
+/// Prints an emergency-level message (level 0) only once.
+///
+/// Equivalent to the kernel's `pr_emerg_once` macro.
+#[macro_export]
+macro_rules! pr_emerg_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite! { $crate::pr_emerg!($($arg)*) }
+    )
+);
+
+/// Prints an alert-level message (level 1) only once.
+///
+/// Equivalent to the kernel's `pr_alert_once` macro.
+#[macro_export]
+macro_rules! pr_alert_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite! { $crate::pr_alert!($($arg)*) }
+    )
+);
+
+/// Prints a critical-level message (level 2) only once.
+///
+/// Equivalent to the kernel's `pr_crit_once` macro.
+#[macro_export]
+macro_rules! pr_crit_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite! { $crate::pr_crit!($($arg)*) }
+    )
+);
+
+/// Prints an error-level message (level 3) only once.
+///
+/// Equivalent to the kernel's `pr_err_once` macro.
+#[macro_export]
+macro_rules! pr_err_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite! { $crate::pr_err!($($arg)*) }
+    )
+);
+
+/// Prints a warning-level message (level 4) only once.
+///
+/// Equivalent to the kernel's `pr_warn_once` macro.
+#[macro_export]
+macro_rules! pr_warn_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite! { $crate::pr_warn!($($arg)*) }
+    )
+);
+
+/// Prints a notice-level message (level 5) only once.
+///
+/// Equivalent to the kernel's `pr_notice_once` macro.
+#[macro_export]
+macro_rules! pr_notice_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite! { $crate::pr_notice!($($arg)*) }
+    )
+);
+
+/// Prints an info-level message (level 6) only once.
+///
+/// Equivalent to the kernel's `pr_info_once` macro.
+#[macro_export]
+macro_rules! pr_info_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite! { $crate::pr_info!($($arg)*) }
+    )
+);
-- 
2.43.0


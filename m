Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15AD27470
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 00:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763339131; cv=none; b=K0iDYLZyxn+kz5BAt1Sg8HrlPhwLxmGnQKM75ATmOE1OBDA9zKxvCUrPacdU98NSLUFJcGSiQPFrJDiVqE+YU3HY7ZoW/wQp2qspsH3mxvIcqE9qVRj4AXLg+H5By9xjqQtP/F31FpiY3BQpKen/p9ImUlyZpK11sBoAvqbSkTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763339131; c=relaxed/simple;
	bh=h+PoLi9kz3ws/10HL0fV6TCcnr/+WvRPMqtcmtZAaig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/FDONttLMoyXZoqYdNnHz1OTV5l9S91NN+APY+pzUIG5KqnddbVy1tp/j7Sp7rvcX7h74hKcm0A6SCso7zYFjTSce2F7uAhXFk1j7eG3XSDXFH/BLEnHz9Iwyi/n9ZUd9PawrPCF3xvQ3dZPPjtQguM55NVlpVXAM2o6/VgqFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSlN87ue; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSlN87ue"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29568d93e87so33078325ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763339129; x=1763943929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNy038UJThsuJbKqsjTJhimnog/iLFcjJtZS0kn4M5M=;
        b=lSlN87ueH8TNcqCzMZ6GzvhKd87aZIzWBSBcMXX2cBVZGAQjrcVPse1bRHN/CUaXcg
         1bnrhG3pHokN8xfYhm4i8gtBC+evfpJVqlJ+mCcjTwISZ6Jo5a8PxKXq7EKS51KCKon5
         RLdss+qXcY6Hkopp/4khYBrU5fLUfjUvaQVAuo4/qJGuJTOT8xDBIgq3DVSaEMn589Xw
         ilrKaw6k0FfR/fI2zXM3eHpvyWX+eD+wvYXY4nHdsqVhrfmyWZmVkaWDmjBhOq+3KCyx
         4wiwqCxug9KFs+uAZoCJMdSGqimff0aS8s8d1J8RGiesUo29MYeEiMjCPYrcs92kAqst
         X5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763339129; x=1763943929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TNy038UJThsuJbKqsjTJhimnog/iLFcjJtZS0kn4M5M=;
        b=KhXLR6+yvmMXCqzNvsq32H+LbQcqI/YwZWSd+RgVAxS2LL9d7/K64H65p29Hl0WPoV
         8e1b2vC+r1UNhkddJEa5KyolQGIoC+hroPHhUx9T607WcrfKR6c9T5mEL6RvuP6RHLxk
         EeqVvp3PrksSEwx4yeQdDdVjdU2aHv4nQxJJGaeMKPuKqJfYeCFWUxyRlt+3WQM0JLs/
         3ljsAeEK9uJR7D3Famjm/vIE4TTgI75GEDLOoiJMcsWXebsowsMaKBIF/U7qU8SONGoR
         vmG3IlrMfsWIzjf3P0Zd1dknNhi3mg3HWkVkf+Vd3WCWAXddNGdKITyP/BYCfpLjgHDl
         CiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Jmkj/X7F6sToaPsdcvjUp94/x5JeAYovesQz1aOKn44Gw0yIMmCzmW6eb9xT5/LRmjypLsxRN/SJOFz18A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWUV6fAmZ4YAmkqquBL2wtJc5eYukiJtNNoSvgawCb5uu3XRLn
	zBXIlN85KkeXnLOI6K6mmIxQO6wZ2xwpzc5fkeDfAqMIs6woqgZkf8wW
X-Gm-Gg: ASbGncuISKoHXfbl9GwC7ZixeJxPctfrM+ERyJFdkJa2OsuY3fcTDDju3H34p6ZGvpE
	D8yJvdvJYxRFzlcTwymH1DCM2IDTLGga+VJThRb10WmG8ZYdyW6i8OEjvfGzODuoNaQMktj8jQe
	ycXlkkugNS2Ro6qVz/ITbWTRA5mS1dAi6vhNNdIMBH20LQSUCZF1AERg3OuPMfjLi6Sdouzlo8z
	5DdiklthewdiRns7ouhxxbQembpu//Bxi+sLvXRnzEqY4sqozpcr6yYWmOPHYSpkSbZq/7Yj72j
	jUnH03H/HXV02iLqcQ5/aLlU2NbTHhsw/6ybSCIkcQUyQece2xtIS8Yt1HfYDBrYHBcU0vuoRHY
	rantiF9cPqIpYP6DGnTRwYpe6or5tOHzFnBMB0EanpowrkUwkkX8Mh7gV1b5ITaF3zYKaNqjBGL
	gOqp74f28Dv7kvdKc5qZJfv9CYauhpK4xRH+OpzLXYQlhHqZO0
X-Google-Smtp-Source: AGHT+IFf3aAQSZMvqlTSAM+A/JRtyAFcWHsb2TTDiMJVEOMMEQcR2U8WabdhK5qECoU7h4OdsRGFKg==
X-Received: by 2002:a17:902:f609:b0:295:1a63:57b0 with SMTP id d9443c01a7336-2986a6ceb4cmr117779145ad.23.1763339128713;
        Sun, 16 Nov 2025 16:25:28 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c249908sm118263105ad.45.2025.11.16.16.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 16:25:28 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	ojeda@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	boqun.feng@gmail.com
Cc: bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v3 2/2] rust: Add pr_*_once macros
Date: Mon, 17 Nov 2025 09:24:52 +0900
Message-ID: <20251117002452.4068692-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
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
index af32054be5a2..6fd84389a858 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -506,3 +506,73 @@ macro_rules! do_once_lite {
         ONCE.call_once(|| { $($e)* });
     }};
 }
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


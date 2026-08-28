Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0B518C02E
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 01:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881943; cv=none; b=r9YU1FMghaEILHvmdN5e68mNuufaNSjTzh+w1zI0eSSibyKkoVEBZKi0KC5KMNRJR9bEmFYmlPudG2Pejd6NnwVqsK5tymFeF0gSB3z/mqKO+SI9VAuohO8kA7J+m6Q/x4RCoBLUCU6JBiNorzAGRnXdBvop1iomV0h319Ltjpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881943; c=relaxed/simple;
	bh=WXS6vakLdU7L83PfcH4phfkIOBuzvYI+wtSQFxoREIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9q31KezS5FaiHDSZr5Gc1i0Hx9ttVrNrTw73KJqPG0L93FoVckNhgqihIVhdrgOylaYvxh4jiX7kNON9zHNFHuyk6I7aFaekrMcTQS882vXt4cF3rkq1We9ZQSfCOtn3gdhfkvsxS77ih6wJP+DLEEJ0BYj8xccyMOyaOBUrfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKNg1r/e; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKNg1r/e"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9aea40d799so296035a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 18:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881940; x=1788486740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4C77kmToqjwj4xCnglFajcSc9AFnruzbKFWTqw9sUw=;
        b=PKNg1r/eippCTUc3wVCGegxU6+X75Vv2kPLek7o0HE4P2GhFQItj0kV3CY70UZXFpr
         eTZ3/YtLMxdO0Jd4IGLK/PTq/Azd4Zr055bKsB/AOjZNFvR1u43yePGTkCS2DWtJo/Tn
         E+6z+cvCoSHKkrnn47Mtt1GP2Q82wsqSVP5TvkVRtki1riGfsT9d9Ujx8fzQ6M0DjNyi
         bMAQpON+YsP1JIgU0cJl0tetsP+xWUORaCTdZmrOfl+6B0ejNlPkY7KRcJn0KWkKDthW
         sTmV1PdA68zsLSJeIsbFWc2FkBS9udnR+Ah5toP8Y1zJpvy8rbmcFYKiZTzHSXZywIuf
         iKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881940; x=1788486740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+4C77kmToqjwj4xCnglFajcSc9AFnruzbKFWTqw9sUw=;
        b=SPK62ElYtP9KM6Yi7rnb8LPhbe3sBFE7USmxOWG7pj16dgseXDcKxmHMbTzpnHfl3A
         sPbYkYdRjHBRnbmcp3my5coeks4gxL4dfqPcXnxegDvx+jw3abgI2ZF3qulSJrUc0/Ki
         mnsVr3q41ZxGxzABMBtsOUsN29d9ajDe2AmMkZ7o1f6/BT5n0WacBwEV7criPPeE1hrX
         5SPKNkc5MrrdQOBAstQEuAInUN6QjMkLKI3l4SDUMpZ8lXUe2j95GKvHVQsZaSc/0MUi
         J/MakC1HxUjRaoqgtvdtJtXVWIFdeiQ4dtCznkXtkFjyriZO2d2bmBl8v0Xy3HU1wMJG
         M4LQ==
X-Gm-Message-State: AFuF++nwKDAfFc9vuPuUafUUvTb5au6ESxxeGhbHqfqRVsWy5EUTb+3S
	MIf5h6Xk93nDehxV5/eXpBfddqaypFERVNh7bfcB+KsLj8QAaDNRhmed
X-Gm-Gg: AR+sD12HnSfd+glwMg952xgNa6Bl53O4L9QC8FccJRnIFPvElRbgdkx0o2i/L8fPHZC
	hG85jhUgC535s0221wOWGoXGy3cxAYcNvAmW1M0BUyZ/s+yjq6t09EKJWNpH41x03SzNEuAafyq
	VgU1vcmbJ8V02wXx83Eyf9p2zOQvVKots3zG93HCgCl4eIzpRoHHJIkO4pi8hqp3Sz868w2cSjD
	lz2U6ML6f8+8wVieMYDwSelBnwgM6rUx/b+6v2OahysiIn+u1lMnwZ+7Cy3AM4xYJnwXixpIZ9i
	RLF9FiUpoXry/ApbyhYhkO7ueOS9aA9I9z9WarRtmcJfU7ZGf3j/cMvwqxBX7DO14VeQp57AQ07
	iPW4+28TX6wM2KLvgLCQ+/o0gHO/Vv/IWQmbX3jPowZph21UWwmmC4eVg1TUIHM7SbxDNMgbBml
	LL/RWdcmQX8sivd8kaX6Mk4A4wA42+hQR9sUoCXS9hquCPhVh1VfRt3pEvgbpxGTRuaQmlYYnwA
	WMFkw==
X-Received: by 2002:a17:90b:2cc6:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-396d0d92cffmr7286955a91.2.1787881939600;
        Thu, 27 Aug 2026 18:52:19 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:18 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 1/3] rust: samples: add missing newlines in rust_print_main
Date: Fri, 28 Aug 2026 04:50:20 +0300
Message-ID: <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calls to `pr_info!` in `arc_print` are missing trailing newlines, which
causes consecutive messages to not be properly line-terminated.

Add the missing `\n` to all four formatting strings.

Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc printing")
Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >= 1.84.0")
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 samples/rust/rust_print_main.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 682207c81fc2..01729e87d6b5 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -23,10 +23,10 @@ fn arc_print() -> Result {
     let b = UniqueArc::new("hello, world", GFP_KERNEL)?;
 
     // Prints the value of data in `a`.
-    pr_info!("{}", a);
+    pr_info!("{}\n", a);
 
     // Uses ":?" to print debug fmt of `b`.
-    pr_info!("{:?}", b);
+    pr_info!("{:?}\n", b);
 
     let a: Arc<&str> = b.into();
     let c = a.clone();
@@ -42,7 +42,7 @@ fn arc_print() -> Result {
 
         use kernel::fmt::Display;
         fn arc_dyn_print(arc: &Arc<dyn Display>) {
-            pr_info!("Arc<dyn Display> says {arc}");
+            pr_info!("Arc<dyn Display> says {arc}\n");
         }
 
         let a_i32_display: Arc<dyn Display> = Arc::new(42i32, GFP_KERNEL)?;
@@ -53,7 +53,7 @@ fn arc_dyn_print(arc: &Arc<dyn Display>) {
     }
 
     // Pretty-prints the debug formatting with lower-case hexadecimal integers.
-    pr_info!("{:#x?}", a);
+    pr_info!("{:#x?}\n", a);
 
     Ok(())
 }
-- 
2.55.0


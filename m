Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C112E36EE
	for <rust-for-linux@vger.kernel.org>; Sun, 13 Jul 2025 19:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752433290; cv=none; b=kZL04HPOIoITh3yTsZRqTsIT2oa5n+g1K/ENeZ5l25a+OhaOu4IlPrR0V8GXLHQjXjYzQWBUCDsysUyuIqipmldc7TgXBMxd8oZSymXHXDBeqCS1uBmwSVAIkjjf3Wpsp3atifclhzzT8bCQ7LBH86P8Aebu9pIWGZSfJYkP9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752433290; c=relaxed/simple;
	bh=soZYI8x/OulPNZ0wBeqmYdJ7M9nNU1gSJljaeYXMt8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jv9AdZ1No3PVv4ulVXqgDRN0mo/7xpuzNJ6bLneMWDNwAzm1pzWOMnVb2t3uu8n2WSrcMW1pRzEHnAb9y2d2DjfxGoBii4w6idwgb9S2BWI3uYqYYx0g4TLBP+PB/uEKCdQ/GkjiQBlnVTvT+UXC5MzsZAyJQ+u6OPc5iaw3vNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkGggzoG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkGggzoG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74b54cead6cso2420095b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Jul 2025 12:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752433288; x=1753038088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K54ke/f5TirTfWoVWS5NQMxTmbB7TVpxTRnwy6DLjeY=;
        b=TkGggzoGw7YWIFf4xtkh1KheyKJmbVsB0PySHX6w7ULZ5cNVVgjQnY8gNnbZt+AKc3
         cVdEVaq7+w7sKNnrXV6u0+9lr2u/IqLhYcZOWioGXeDboaZh7d3yK+9OHCzQQHo5XiJE
         kq4/GGqch/BqHmIZqIq1Aar0tLaVKJT5202+f6bcA8nwfhZHrl+A+6S46L+ljwAmVHSK
         9k30GSYByh/tVms+YqgqR6qEI4qOrVYzpkETmCCGz0+VMBWDs+sUEpqwPddtk71EVj0s
         nmdUnRQQO3rED3xmrpFp/EdxQxlhTBG6PXCBt2TvWvjqyusUMv/Xy1qpSfjJzvm8/V7s
         SQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752433288; x=1753038088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K54ke/f5TirTfWoVWS5NQMxTmbB7TVpxTRnwy6DLjeY=;
        b=sVAOdxhUTb+c+0ch94iGYvzoyP9Wz8o2X0SkEos7ox05ux65q9XkoVOejXErVpiNPP
         qLHAMOLiKTJYZlEQmUrosbF9pVIuzWrQ9yZjTrC9g5y0dwDLDVofYgukfHBOmJC0ZUVI
         cKMgXn1KPG9voMobeu6T9ZThMg76PD7v8PN9WSQQTxdZOH1++AwbzDUmQeOrrizcCW60
         9ycK8qrm5lcQZtgrWMZF8sbMJrNi0fHBohM71c8e+q7uO+QFeZfNzLqr1mh5+Qfz8mpe
         GGP3+CrTL7pPSU8v/Ke/F2gOMCFZ5OeuUJlqiFhU1IsP9GkEgDhDXjwOS9HasOcPliDw
         9HWg==
X-Gm-Message-State: AOJu0YwgwuOPg4486UAe42jzf+4uI6S0sH1cPVL7f3QYSynEy2D5beMC
	05C59dogPvBqeqd5r/C6FnELF7x1Rb8veCgrfmo7hhTh0ZHV1dTvgNu3
X-Gm-Gg: ASbGnct4Xb+DRnGo17pZF3xlwJQIOW2BcV4IihKpbuIar+E16TLTIvaPdr3qGZ/8XTB
	3EYxjRB0jynE2XHosOePjfhZTkN+SlemJc6Po+Y5txgJ8xcotHfge4pro0d7m9meGh3C+KXC/oG
	1Sn0FeMhKNjVT1p/LVHahpYJcemSNb/chuEQZJyKbPHk9GIKxUKB0RszqyMS+hDaaNLPHq0zc1Q
	KETse4wZCwcC8l4AVIcU7oJT+NXmtH9re4Px381J8TXNYtSz77sgXkCI8J7WM0ZDQPLLe32ToC1
	o33vZN+Y43yVXqDh7yafOe6PoXZdoswpzV9tTtLo5OOgczgTVcQS49TFPZebk22DVuy8aeqv3fZ
	FPoWfJcSjjsTnF+Kj9gI=
X-Google-Smtp-Source: AGHT+IFRJ1CY/dj/X52qy7IHtUz+brIDTTA8+3HkFDV3TuRqqTyU1G1nIu8Xdylac9raeZpSWAVWLg==
X-Received: by 2002:a05:6a00:ace:b0:748:2eb7:8cc7 with SMTP id d2e1a72fcca58-74ee3629862mr16191823b3a.21.1752433287769;
        Sun, 13 Jul 2025 12:01:27 -0700 (PDT)
Received: from fedora ([2405:201:5501:4085:eece:e0ff:6b68:de2e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06c72sm9332346b3a.66.2025.07.13.12.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 12:01:27 -0700 (PDT)
From: Ritvik Gupta <ritvikfoss@gmail.com>
To: viresh.kumar@linaro.org,
	yury.norov@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	skhan@linuxfoundation.org,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v2] rust: cpumask: Replace `MaybeUninit` and `mem::zeroed` with `Opaque` APIs
Date: Mon, 14 Jul 2025 00:32:44 +0530
Message-ID: <20250713190244.143286-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the following unsafe initializations:
1. `MaybeUninit::uninit().assume_init()` with `Opaque::uninit()`
2. `core::mem::zeroed()` with `Opaque::zeroed()`

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1178
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/rust-for-linux/CAH5fLgj0OoCn56OkNUmiPQ=RAVa_VmS-yMZ4TNBSpGPNtZ5D0A@mail.gmail.com/
Reviewed-by: Benno Lossin <lossin@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---

Carried forward 'Reviewed-by' tags from v1 since there're no substantial changes, just added suggested changes :)
(reviewers from v1 cc'd)

Changes in v2:
 - Replaced `core::mem::zeroed()` with `Opaque::zeroed()` in `CpumaskVar::new_zero()` (thanks, Alice!)

Link to v1: https://lore.kernel.org/rust-for-linux/20250710123836.146825-1-ritvikfoss@gmail.com/

---
 rust/kernel/cpumask.rs | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index 4bce230a73b6..3fcbff438670 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -14,9 +14,6 @@
 #[cfg(CONFIG_CPUMASK_OFFSTACK)]
 use core::ptr::{self, NonNull};
 
-#[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
-use core::mem::MaybeUninit;
-
 use core::ops::{Deref, DerefMut};
 
 /// A CPU Mask.
@@ -239,10 +236,7 @@ pub fn new_zero(_flags: Flags) -> Result<Self, AllocError> {
             },
 
             #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
-            // SAFETY: FFI type is valid to be zero-initialized.
-            //
-            // INVARIANT: The associated memory is freed when the `CpumaskVar` goes out of scope.
-            mask: unsafe { core::mem::zeroed() },
+            mask: Cpumask(Opaque::zeroed()),
         })
     }
 
@@ -266,10 +260,7 @@ pub unsafe fn new(_flags: Flags) -> Result<Self, AllocError> {
                 NonNull::new(ptr.cast()).ok_or(AllocError)?
             },
             #[cfg(not(CONFIG_CPUMASK_OFFSTACK))]
-            // SAFETY: Guaranteed by the safety requirements of the function.
-            //
-            // INVARIANT: The associated memory is freed when the `CpumaskVar` goes out of scope.
-            mask: unsafe { MaybeUninit::uninit().assume_init() },
+            mask: Cpumask(Opaque::uninit()),
         })
     }
 

base-commit: 2009a2d5696944d85c34d75e691a6f3884e787c0
-- 
2.50.1


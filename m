Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A5F2594B7
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 05:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762321669; cv=none; b=gZwPV2PXr2hnWb0s4y4Nlk9dywISBi76M2NE+dTul4QLsEEl4FZA0RflD46LyIIPwl7mH3l3Etf/D08lAbkHz0+/WkbEc8K/A+Q2wHeXvLGSxUBukdjJy1QJ0UDHIbgh7KNdBMMWLm1uT0rfGAY0sBb9o/d3zz4OzK8BYZuyodM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762321669; c=relaxed/simple;
	bh=qZZ1bYE5Cegw461qPeb4FEwC1v+jUsAPEuLlbelhxK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blQzTTN0gmCL1hxN4oHkGa9zG1HMBFlDrRsQnxDISWmkTwR2oC/YY1vz8/adYlhFuzbqg7YHdBcYwlaaElG8hpyQB5997KqfQ6XRaMdqL0ECskW8mvTBo2/gPdVE42KauzonBKGfSemCXZPLLtz/Ix4dBLiu+JuH25fjH0vYHdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4UFzt5h; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4UFzt5h"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so4448070b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 21:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762321667; x=1762926467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLLmjREI0f2kLeQaEvegegklB5G/1AiYJ22waClPNVw=;
        b=m4UFzt5hmpToGn5QLiPBIx7/lqRUWI3FfXMWIp9rpZVolAZT7ViyDkrNSxPgkG7fRq
         zlgdXTrjiTKxQ8BO2egIyMa9goG5C9K1ZyYaVIVk8Xq4o7yv59EguNxO6iZPOsohxB55
         zfyTy33Tdqs8OUiowBbjnkRdw9fw4VW6BVxrnfGkEZyEdBoMbg4e7QQybgnxJR1mkT5E
         dChOTjyI9z+FtOKP2AgGKPykPXv7TVOJ/kY/BKfuQ12Hm9mRkCLIOUfidsjbBokwmUUO
         Hu6QcEaxqWmeYld7Uagg+EeAYs2PNklHUz/10mJjY08pYxlX91DPLG42DMGebhtsEfv0
         pEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762321667; x=1762926467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLLmjREI0f2kLeQaEvegegklB5G/1AiYJ22waClPNVw=;
        b=irpvPR2487ohid4yuppt1QJ7w7NoShCigwBfef9rSFf+1bzwmyVrOUJWdkt0PD2b5N
         LdSNRKyBLWxfeYOPlXK2Ac2ZaqvgGFwidRg5iKj7Fql7/IM9wB0YeVlfe5HwP2hPZTHe
         sKaWAefmiMdKyan3JcZscYl/NT73Eo/+18pFIjy89b1IGoczEc5l2hwL0HQVVl4xqj/j
         St+JUAOkcXYp10MWPHcubFHrcW+KYN/tRQTNjISTYirm4rray2OdyMd5IneH2tQjmQB1
         gUfP8cSOGelfIe5P+JbuB9CTp1ch4MM0yGRepzwHQupZ9gjumbpO/sbymI/R6SyCVGWv
         PBYA==
X-Forwarded-Encrypted: i=1; AJvYcCUZnezqJd3n+0ObmPxygC5YctD5/LH74OXAeZxr+ARpEEh3LXhYksszbQ409JwyzfjpCKwOlmtUgkny3pvyrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0i4p56ajnHS4iIz+fkiVyPbrx0s4fys1AooYwmiTrejx56Ks
	5qPsh7qXR4qeLCTRig3Y/rsnBPdKa85m2Ii/q4/utA4n7uwvDkNEdCZB
X-Gm-Gg: ASbGnct+mrmClIFJOj+kltbChRjWgKc+sCfhiMmm+1Ogq0G0XdNN7wKdUTjnAtFbqkZ
	96DrS77b/itLpZ8RaisQbAGm4Gjc5EQp3wv8ZUqoS6JELFd+Bj0cpmYHR9H9VN4j/WJG0i/pk53
	nYxnNwr36bRDjc4xS9oyZHaNyA9avGS11b3WyR+XU5C5pjBqjhLcap2uUN5rwsNPOMfTF5mVvB8
	b3tXUl6hH1wGBEa96rAVjwy9udHyqjKPOUfJP7CSeTSjNLnLf7P9AZfQ5b2NKGoOtSAlQe72wOn
	sHo6nM4Fa/vtCoc20WIcvDLPkD7O1Xjwiw2PrepuwQe/9UIn1rlsYgSyU17nL4f2VV/+S5JRcSr
	p2SRbaJKjgn4XvjB0LYDnN2C5qZx1g3v6xJ/ZP/gMp+dwv4Iq8L7jR+BkSPTtKOcaCVeFL3GPrk
	SnfOkHLEuiTBTDyiz1LZ1hqpsFpC+X1eeLDUmwJmLPG1M3ypGNbNFE4BzFA8c=
X-Google-Smtp-Source: AGHT+IELsiUE4OJ3elOAvStLypaZkbFeCF2V1bXVE2w4GBDgHEcXUG1HEovFmA99gL4m36i1C8zfkQ==
X-Received: by 2002:a05:6a00:ccf:b0:78c:994a:fc87 with SMTP id d2e1a72fcca58-7ae1cd5a03bmr2588279b3a.6.1762321667441;
        Tue, 04 Nov 2025 21:47:47 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6824811sm4913219b3a.64.2025.11.04.21.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 21:47:46 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	jens.korinth.tuta.io@kernel.org
Subject: [PATCH v1 2/2] rust: Add pr_*_once macros
Date: Wed,  5 Nov 2025 14:47:31 +0900
Message-ID: <20251105054731.3194118-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
macros, which print a message only once.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/print.rs | 70 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 2d743d78d220..77e2208f222e 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -423,3 +423,73 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+
+/// Prints an emergency-level message (level 0) only once.
+///
+/// Equivalent to the kernel's [`pr_emerg_once`] macro.
+#[macro_export]
+macro_rules! pr_emerg_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!(|| $crate::pr_emerg!($($arg)*))
+    )
+);
+
+/// Prints an alert-level message (level 1) only once.
+///
+/// Equivalent to the kernel's [`pr_alert_once`] macro.
+#[macro_export]
+macro_rules! pr_alert_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!(|| $crate::pr_alert!($($arg)*))
+    )
+);
+
+/// Prints a critical-level message (level 2) only once.
+///
+/// Equivalent to the kernel's [`pr_crit_once`] macro.
+#[macro_export]
+macro_rules! pr_crit_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!(|| $crate::pr_crit!($($arg)*))
+    )
+);
+
+/// Prints an error-level message (level 3) only once.
+///
+/// Equivalent to the kernel's [`pr_err_once`] macro.
+#[macro_export]
+macro_rules! pr_err_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!(|| $crate::pr_err!($($arg)*))
+    )
+);
+
+/// Prints a warning-level message (level 4) only once.
+///
+/// Equivalent to the kernel's [`pr_warn_once`] macro.
+#[macro_export]
+macro_rules! pr_warn_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!(|| $crate::pr_warn!($($arg)*))
+    )
+);
+
+/// Prints a notice-level message (level 5) only once.
+///
+/// Equivalent to the kernel's [`pr_notice_once`] macro.
+#[macro_export]
+macro_rules! pr_notice_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!(|| $crate::pr_notice!($($arg)*))
+    )
+);
+
+/// Prints an info-level message (level 6) only once.
+///
+/// Equivalent to the kernel's [`pr_info_once`] macro.
+#[macro_export]
+macro_rules! pr_info_once (
+    ($($arg:tt)*) => (
+        $crate::do_once_lite!(|| $crate::pr_info!($($arg)*))
+    )
+);
-- 
2.43.0


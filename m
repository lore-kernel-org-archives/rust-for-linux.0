Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E016B2FFDEE
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766470940; cv=none; b=i1sbJoq7CjGVWYwv1LRscCd5sjpeam6E9Ol3bGSRLUIsNDkEWWnTFIFfIzY6F70rZLMcGGMc1m8LS96aei1oPNpA1UQO+5yFa3xR5WRx4ZJ0NztaPD2hs0wGITxfnJk/3BdEW+jZKZ5fOeKOOGSYINOnWneBeZBmuM3pLeoCxVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766470940; c=relaxed/simple;
	bh=OvsQthW770yxENUXStYMksug7LfpS2AgweNaEp49SqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdyIw4gLion/eSESYp5STk2pvlUGtSPc4IRk3p7BV/cvRdnk+Pz/xZkOSKCUOU+3ejt0xFrrCLqBEE6kwTIA/RtURwiPg1ps/VqCN7dJHcT/vIk62uW7BgjsPKm2+MTKwdTyUnkIaXMZZDvQlWzixHjWsiD+iybeq4DYMY0h2q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asXweOHP; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asXweOHP"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7f0da2dfeaeso4827865b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 22:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766470938; x=1767075738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3w5zbPApeRzvnGzxav5MDuWlnN3SbnXqPeI7CxYT+M=;
        b=asXweOHPw4oFGbcv+NyvgyJB0TUroa1PrbO4M3uvIFgtqGIO4b2dmHUKQdPUmGAB7U
         ygvWO7AbcST7svNgwUOe6RIUK97fLASeK0zIACXG2Vikk1YHW9wWbki4CMsj0VzU6BoF
         dr3KxoD7NSNN1mnnEfUPowDzbgK1BkoV5MRmwdyJSYKtyna47gmVyXoJN65weGQGo8VS
         PMql3AIaPIc4oLjP1PyzSjmf/BDb5qMuWAqQ6PAI+6fAl0B7XEYPWKa26QPZ+2XHMx8n
         UVbMmXw6Prh43bObMLGp+ZmrCJMFZC0cGEUoBt8Z0sUX60223JgkNdyTAgDRgyIEnpMb
         XlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766470938; x=1767075738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y3w5zbPApeRzvnGzxav5MDuWlnN3SbnXqPeI7CxYT+M=;
        b=QTH7p+slGdPyZL2+b6BMy8eURy79Oqo0mqVkk2gNCiVbP8sO3oFCcnrWR05xp4jTv9
         T7T0vEbN4fnSsazLVhRAWMMDH2bGs3O/0WXkuiwH2gWAyATR1+PwuwncbWPI5bmETgqF
         F3kjTkXCjYtQHa2eNm4l/VJmQsVNmujQAMt0WZEoS97Kn5QVzF1OkTnMEBLVyyi79GIR
         80yVbMKe8LmC0w3HU4dtLV3pWOeRVQNaLUR6ZGF4sgVyA2hv/5LzhuU99wFgAPOWexMK
         UUJokzHU9l/mHqEFx5gLmyJYLCmjxOW3F+Fl4wyLDe3P7E7z7GtJIuLlQEuV2PbOjSXF
         IhkA==
X-Forwarded-Encrypted: i=1; AJvYcCXPJreIT16GkKHuzSK3R6ugdaWR5m2P/U/majv65UsJTeY6A34pe8iMKKmvBdhQoZDh+5i0MIEJf02lOoTrJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpV/DtLf4TTwFtR0iw/qi3XXwo9DLdIADd6X4NGFeTLv7TL3uw
	AU4B1IEvvXaQ8gAFRZpo87UaWQsbDvBFF8hYAoHmMBn2dEyGxPYPh2Cr
X-Gm-Gg: AY/fxX6LI4iG0h4BxTxIMtfjyjAh1imb0ND3jml68yUbwt8QgnS6bRexKs0Pq2DfEOQ
	qPiN4V0C4lgmAxQSO3m3f7uaa2Tx2NUYzewPHSg1ZD2KSzRURVDAiekY875VEAFJ/FrJG3EGZ9T
	ingDZXm0O3Zga6Or/yHHEVvfVnN9whRm9Qx4GgHeo25FPIfSsXqANZ6RK6fckDngdCRcP6/+/eb
	cCuIdtub/P37qEWr42EMNs2Bu7XqCJ9WYGusDP+LdEfwy5eARidMZLW0/F/HxgGWQyIeSK1sHd6
	y69W5bTlTHUTfziooue0YspTr8jki74/zPgVQUzBVMW+LAsism9XWwlsTz/2g2vyp1BEGfxOqvc
	855NCwb3S7P0lIdieYuDsq6OeyxMOfrAo99YW460Gh+gVrlSB9N3qkd1X1db2b2/PoxBwSdh7st
	Elp0jBFKads8lfuYKgbCW/fUFV9CqSGLEyKZlmkvjHOckx9phmISeckQ3mdxjZQA==
X-Google-Smtp-Source: AGHT+IEhvmpcoeiUAZvA5rhSi6UGGcejl2p2zgmpoBbNe1/2AFX9Poh5cZH1/+Tjrv6xlF5XlHIyHA==
X-Received: by 2002:a05:6a00:4298:b0:7a2:8529:259 with SMTP id d2e1a72fcca58-7ff650c7d8dmr11403476b3a.9.1766470938078;
        Mon, 22 Dec 2025 22:22:18 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfab841sm12395362b3a.35.2025.12.22.22.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:22:17 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 1/4] rust: helpers: Add i8/i16 atomic xchg helpers
Date: Tue, 23 Dec 2025 15:21:37 +0900
Message-ID: <20251223062140.938325-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223062140.938325-1-fujita.tomonori@gmail.com>
References: <20251223062140.938325-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add i8/i16 atomic xchg helpers that call raw_xchg() macro implementing
atomic xchg using architecture-specific instructions.

x86_64, loongarch, arm64, and riscv implement xchg with full ordering.

arm v7 only supports relaxed-ordering xchg; __atomic_op_fence() macro
is used to add barriers before and after the relaxed xchg.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index fedf808383e0..b1ce7c038ac4 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -2,6 +2,7 @@
 
 #include <asm/barrier.h>
 #include <asm/rwonce.h>
+#include <linux/atomic.h>
 
 __rust_helper s8 rust_helper_atomic_i8_load(s8 *ptr)
 {
@@ -42,3 +43,20 @@ __rust_helper void rust_helper_atomic_i16_store_release(s16 *ptr, s16 val)
 {
 	smp_store_release(ptr, val);
 }
+
+/*
+ * xchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
+ * architecture provding xchg() support for i8 and i16.
+ *
+ * The architectures that currently support Rust (x86_64, armv7,
+ * arm64, riscv, and loongarch) satisfy these requirements.
+ */
+__rust_helper s8 rust_helper_atomic_i8_xchg(s8 *ptr, s8 new)
+{
+	return raw_xchg(ptr, new);
+}
+
+__rust_helper s16 rust_helper_atomic_i16_xchg(s16 *ptr, s16 new)
+{
+	return raw_xchg(ptr, new);
+}
-- 
2.43.0


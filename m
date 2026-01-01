Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423E8CA5A
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 05:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767246455; cv=none; b=fLiTJ1zzmK0MOX6on9mhrNmWF6SWpBlQVdaXQpWgO3hso/IahYzLLfdDwDyBvQNAaTN5p8Xul0/YTcCNjcyB76t/AkPcet5JlYajAIXh4nGSiOMN3PT3H2w9A/DLgtyb/2hJDP6Ei4JmQi98Z10DN6jt4FlqGK2cRouso76PZGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767246455; c=relaxed/simple;
	bh=U/2E5GAtl0oNkf5HxUW9QvEBIlT1L87ssDSpWmoqdGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J68Kgica5I80WjvRGmN3Bv8hAKzWFv7EqtZHkbksu99eDu1lM/aJNk0q7UTT/cBFHeL973BJU4KgyxMLRfQGxHLF+WdjksKs0ER/iiiJDT7Fw59aAEE9fZvIPuKKaZ0kdvyI/aTMeOlicKBXaZo4cDO/uCRgbD9Edt4PMFKl0ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQjnWYVD; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQjnWYVD"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso7993344137.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 21:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767246453; x=1767851253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZUb8hdR1MjA8tGqWbXzEvPck7ntlz9IljAIWpnnPqY=;
        b=MQjnWYVDAHSSNzEfaJ3d8QK/E2nZr8+agD6Gy2WzrNAoXvsmk1+byXhmecWHSGf1cn
         dmkJUOnFXrvUjM6C5CYb0sSQpAIFAY8fndBtRT7FHA42g5VQdgn9UWcr2FmanVW3PQqn
         GtrfrbemIKYuZnHKlumXDHMT2XuSjA8kyxbyQpyzM+CmT1TwP50VFERo4XrVFvXMhMcx
         h1ffaAoWOl6cvMDL8rNvT8RQV2OK1KLDw+1aLrG2pjSPD0lpIeDVTCNKHobOQT0j+DrU
         TaoxUs61YWhu6tPC9CqeO4g1Wsc7isjP/N1Z/oBbXDZ86bYjZw53n79E7Qa118/EmwEB
         eNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767246453; x=1767851253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ZUb8hdR1MjA8tGqWbXzEvPck7ntlz9IljAIWpnnPqY=;
        b=pgZDQhM2sPsWpf0eNRmdV546UzVfzgt0L7MW9jRkSgIKe8fnnhtJdcvjg6FI84HrkT
         taGCBVRCU+75Z40f9gDlJt1mccra7f9HOqqKUzLtdMJyG6qJxgmlZ2mSd5nzp65PbwbZ
         xaNJqeEghF48Jr3pYUjlV9Ra42ZZm9s1AugN+R3R5oPv0u42QTwyvNfK/u2FDJ3p5lCf
         Q7gu3A7kTWMwpOFUFRpHMdeH3uV+a2K0CAHEhFATCFIMVeLWWkEFKM3qozy0DLJsb6lH
         ZFrVQOK/Odbs9CxVKmoyNIuGiAXWy4Mrn/UGUuG5hG8LZzO1hkV0CuDJ26QnJQzsEIMM
         J1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCX5JpwY/Zp/xXRIOwkbwChe8VRvMINRt35Tf5lvsb9CHCq5LgVg/ozZwT8RDNZOF2mVHy1C3KugTZnuLb+xtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwClhedpBn0OsoyhTU7oDF6kG6mWPZDOZybwapJmhYw2S1L1lUv
	IjwIKYMiQ6LZENFleiNS21hX1tDxDeKxIOLk2fCambzTPRL/ICwWsiDutmWh/w==
X-Gm-Gg: AY/fxX4h/0EQR7SoZI+otfmSbctBShwxe8SAZwxZc03b54hprNHGI5IbtmH5BakrdGt
	eMEln+GLDwLoJNRLSsb1DSANpEndtf97OJUTjC82mm0JJVHl7A648Q7Xv/olnv5246j6xHwExYL
	M0iNZDhtaM7zNTK3gbyIdVX6WpbOQYi2uxQcmbR9jvWwIDziy4tA/KAW42RU5CbG917FQWK7k/7
	6d0Meu4O5bQQg/ya9kdsaeMWyQo0Dzq61o4eM4zNCsz+GNwxH+dZ0WA4UMwRtLHTEJaQkRZAVST
	lH5e2RC2ygubUnJkXhOOQQAVa1ypLtT925xWY2UedMr2tBWNqAbOCHWpB037m3nOyT5TnG/839s
	EbbCmuyCMnzAgkbQyFIuDTGCzE96M2tgR/tjNSua8wpWxCiAHRrRB1NhEBFNyfedebJXK2nuVhh
	E/+ZuOyFizLoMCD6NC+DbQ7rgqjTez+8Bf25/OpyHX1LUW1QDNfIfEQ3EbLF9KOg==
X-Google-Smtp-Source: AGHT+IEjXyvhUStbq4NbgwuhfHvz74nxQrKyNxHcNj94GYGjT6NKWEYz062187dzjz2wsor2aKW0LQ==
X-Received: by 2002:a17:903:22c3:b0:2a0:d05c:7dde with SMTP id d9443c01a7336-2a2f283b5e4mr322433005ad.44.1767239432629;
        Wed, 31 Dec 2025 19:50:32 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm341874445ad.34.2025.12.31.19.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:50:32 -0800 (PST)
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
Subject: [PATCH v2 1/2] rust: sync: atomic: Add atomic bool support via i8 representation
Date: Thu,  1 Jan 2026 12:49:21 +0900
Message-ID: <20260101034922.2020334-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101034922.2020334-1-fujita.tomonori@gmail.com>
References: <20260101034922.2020334-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add `bool` support, `Atomic<bool>` by using `i8` as its underlying
representation.

Rust specifies that `bool` has size 1 and alignment 1 [1], so it
matches `i8` on layout; keep `static_assert!()` checks to enforce this
assumption at build time.

Link: https://doc.rust-lang.org/reference/types/boolean.html [1]
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic/internal.rs  |  1 +
 rust/kernel/sync/atomic/predefine.rs | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 0dac58bca2b3..31ac4c83b1a5 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -16,6 +16,7 @@ pub trait Sealed {}
 // The C side supports atomic primitives only for `i32` and `i64` (`atomic_t` and `atomic64_t`),
 // while the Rust side also layers provides atomic support for `i8` and `i16`
 // on top of lower-level C primitives.
+impl private::Sealed for bool {}
 impl private::Sealed for i8 {}
 impl private::Sealed for i16 {}
 impl private::Sealed for i32 {}
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 248d26555ccf..3fc99174b086 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -5,6 +5,17 @@
 use crate::static_assert;
 use core::mem::{align_of, size_of};
 
+// Ensure size and alignment requirements are checked.
+static_assert!(size_of::<bool>() == size_of::<i8>());
+static_assert!(align_of::<bool>() == align_of::<i8>());
+
+// SAFETY: `bool` has the same size and alignment as `i8`, and Rust guarantees that `bool` has
+// only two valid bit patterns: 0 (false) and 1 (true). Those are valid `i8` values, so `bool` is
+// round-trip transmutable to `i8`.
+unsafe impl super::AtomicType for bool {
+    type Repr = i8;
+}
+
 // SAFETY: `i8` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl super::AtomicType for i8 {
-- 
2.43.0


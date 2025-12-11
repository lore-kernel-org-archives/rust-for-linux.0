Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7201E2F0C64
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765453141; cv=none; b=YLn7DQIZIcOOkL8+8itKcTOWQBAtailMKXybSiUP3nDZgl6SZtSOgnWiZbH8TUJBUOsKgKmCS2G62u0H6ZRgXYIgPkj6dB18IqdiDFxC0++mKJ2pf5d3vyb2NzlrBbcRt+2fZTm4KaeQg/6YGY5iqtxoMJsIkU34YicjiRtqTbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765453141; c=relaxed/simple;
	bh=tObBLf9EF7m5fz3LKxkyDo5P5Q6mw6YzoFFxlovPxak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXnrgygX0QzL4yFTCyGac7RGQaFLpJuUcNmgmbzR97kYPAGyxZw1Di3ey4tJpQRS5ZvKHFrSgLw2GCO7EyZB2VG6m/dDWCGAAk2MnFjJcGYyD8HvHiG6J3sW6HAOcnD1z6FpGvf9kQ304dhjzZO0IDC9Ely+X4emQzqAT8N78GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBYCCl8w; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBYCCl8w"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-349b711d106so732938a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 03:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765453140; x=1766057940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/gUwqWfAEKST4Bd9ZU8LIwsQ1NRDfKLJFhdrWS8320=;
        b=SBYCCl8wOhGeUe/1kWFX4WwixscjEe3BnpRbZI6XxUBKd1pPkYR9nO3DolGIkRpcyd
         Ahb+oevdlpVZhQX0fvmb0nZCgJxjlqKmhpkbD/GW0SwYDYYvOqq4ozy6Iywp7pGlv1Qe
         XuK7icSIS1OO57aV26CjKNA7M9hiuUDeAGgla+T+VaIoqechJ/W6tWjrUTNkuLnSCL+Q
         hyq7te6goacyCKpRhf5xhg9161vTxAu+/u0d8fm1cVm2JworV0saBew31QNwjDOU/Hhx
         fLQsifSi0Hqrn4OewBdWsdzRX6KV2EmalwwUH9b5hjPYvxCKgORShXv2cOVHQ1eSctO/
         D5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453140; x=1766057940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1/gUwqWfAEKST4Bd9ZU8LIwsQ1NRDfKLJFhdrWS8320=;
        b=oLXZMycbY/BP+qlZ8lfW6iDnNMXq8ph9HpLYjhUf+8AJONrkoq12NS22oqP2xmk/cw
         6FGL3TBgwln/04jdlJlRpxETSLz0mFQUAwf66ziVCgqUY6GMEzTesOpMxUxjwFmNynQO
         YwULPja4x6Is4jrTRnsQ/jpaqGGf8cwN9ybmoNiOevcv+nWIcaVKF7pirbzn9uSI2EbS
         A2WwRCqiS1r+oqbmTo6r/6p4+epSBJpkjti3w+1nPkdoTluc8aT5Fa/pSRVpveu89FO5
         s8jPKfnaxi72LeDVD+zqyB45e1jrqOfkBCAQ1uS5nTJBiiM2eRJ1Of7ND7FmngAZ9gRV
         oXeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbqL7HU5bCxx+TkoO0Fm/PVB5/ekpJJBoIKsTgAKPxE3ei13RM7TwgYFSd7vz2KWR1fnT00QDZ1uF1n5+5DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsoYKRZKf9XoHRWHpdGrfvc4EvsKeuXIxzrPvl2ChRWYFevf2
	QXJMN9ZX63aDBQao8kU6dqThi7lPOPWdqx8keFyvJime1F6shz9VMk0z
X-Gm-Gg: AY/fxX6LaRl61liiy5KbqmGhusffOfPJsrdTyRUl+7/7apmYoVaRXFgJ70jMaDU0DIU
	5qkd3ntvxKQXNqWsa9Bb6kSMe258clmOpFOzy1+2uFEgN+G6GvngDgKyT/nwbFqSlXeZ231MPnd
	CrdjGWhsg+4oJr52M8B7od2U/WYA0r4agqF5ruJ/i08NY0dxuRJ0FEkLZUxmLgscLdMdCASoPLG
	fahgnhKPyrlRg/te8f5Ww9Waqe8TXPbkcVc4/KmMfvncSZYleYHCtqgX6pbOLI4+5+UCGeMtLm6
	fIQJZbB+cuDnoH8ZjS7juahQC939apnN+eraQ7vmgebqPTQGdDh5ozHn/A1KHMJwQ9hi9+sJmtQ
	e6aChf21zefm1ozKRbCNk7gFfpdMDGhahjhQyEwDcQdiGmIENez+4OEqfrpK37wNH/pDhot/j0z
	kRIcBNwjy6q/UNpaY1sqtsz4TFF2Ry8a1PiOPjvjQiwMhMLeE/AgYAxkLaG0oJ9A==
X-Google-Smtp-Source: AGHT+IHdOJGTefCJuQKVoLQFMXAo31s2HM+VLXVOsE8y2lmRyBJaQ/azb9qiroKMnPnAFjXYJ67F/Q==
X-Received: by 2002:a17:90b:1e51:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-34a72879dcdmr5928677a91.24.1765453139666;
        Thu, 11 Dec 2025 03:38:59 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9264e4f6sm1780337a91.2.2025.12.11.03.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 03:38:59 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: acourbot@nvidia.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 2/4] rust: helpers: Add i8/i16 relaxed atomic helpers
Date: Thu, 11 Dec 2025 20:38:24 +0900
Message-ID: <20251211113826.1299077-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
References: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add READ_ONCE/WRITE_ONCE based helpers for i8 and i16 types to support
relaxed atomic operations in Rust.

While relaxed operations could be implemented purely in Rust using
read_volatile() and write_volatile(), using C's READ_ONCE() and
WRITE_ONCE() macros ensures complete consistency with the kernel
memory model.

These helpers expose different symbol names than their C counterparts
so they are split into atomic_ext.c instead of atomic.c. The symbol
names; the names make the interface Rust/C clear, consistent with
i32/i64.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index a10c723ab224..fedf808383e0 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -1,22 +1,43 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <asm/barrier.h>
+#include <asm/rwonce.h>
+
+__rust_helper s8 rust_helper_atomic_i8_load(s8 *ptr)
+{
+	return READ_ONCE(*ptr);
+}
 
 __rust_helper s8 rust_helper_atomic_i8_load_acquire(s8 *ptr)
 {
 	return smp_load_acquire(ptr);
 }
 
+__rust_helper s16 rust_helper_atomic_i16_load(s16 *ptr)
+{
+	return READ_ONCE(*ptr);
+}
+
 __rust_helper s16 rust_helper_atomic_i16_load_acquire(s16 *ptr)
 {
 	return smp_load_acquire(ptr);
 }
 
+__rust_helper void rust_helper_atomic_i8_store(s8 *ptr, s8 val)
+{
+	WRITE_ONCE(*ptr, val);
+}
+
 __rust_helper void rust_helper_atomic_i8_store_release(s8 *ptr, s8 val)
 {
 	smp_store_release(ptr, val);
 }
 
+__rust_helper void rust_helper_atomic_i16_store(s16 *ptr, s16 val)
+{
+	WRITE_ONCE(*ptr, val);
+}
+
 __rust_helper void rust_helper_atomic_i16_store_release(s16 *ptr, s16 val)
 {
 	smp_store_release(ptr, val);
-- 
2.43.0


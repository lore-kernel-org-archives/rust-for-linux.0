Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD64CA5A
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767263273; cv=none; b=JMOkO+DjT0O9cyoe7Oa9hnn4NnhNLT/5CGfnsZ+W4vDu1suPhXJqZjXzY3hLsQ1ECS12fpI3v7ufM4APDtPix+eyurgKgoChMflxDyH5mmnS0FwnVek2037Xr95yGATBPBVQoA5/+PUElO6TkUEFWEwMZcpC6ySRlMuD9oDSb+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767263273; c=relaxed/simple;
	bh=b3MERlCpO5eAUyfKNi4xBSlLhTgFwdITcPb0+tRPkSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s96bDvUOZu6tcXjdR6/AFIHvKaaQc7AnEU1HpvFn2NZv4f+Jptl+fkL+Yze7+rUnBc5M32HMvxdPOYtUchEXToh3On27JK7h+NHiwrhz8BzDwyoJ/RJZ2rnI/lTcrOgwfvRYDgfjT04rC2aYnnqdUGmYuEKxGlhyIEs93w8g7YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB/5dDKO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB/5dDKO"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0d67f1877so147533465ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 02:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767263272; x=1767868072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G7k7k/M77RuhptL7oTBpXsHBZ5bueLiRVQID5HaGWlw=;
        b=dB/5dDKOYd0+6IiJkFchU4icLplv6yWAxvhYjSHPwT2VX6u1IN63s4amVgtWAXv57D
         nLBWoU+RMetdjnFhBAkalX8HSwdY0540sw5eZzqvc7mvDCrmnLOCL2nzCIMAalL97mDl
         CWr/r6gkkdJiIjaRlngE3INjhTQgV1ktsZWrqZZdxb25a1E1psSh0ut92o86Gfgleo8y
         z1wEEn+tUKEl8dpwvyCyKkQxNzXoGXPtC/B2vcoWNp8wXlinZqWjmy45+Ay3eEMZUwxk
         GBd6Ywm8nfjjD8slkCUcXoTlrwikf4H4rURN0xD3zmyVuiO9lVNZy6mXqNwco8pZ/1Yr
         sFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767263272; x=1767868072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7k7k/M77RuhptL7oTBpXsHBZ5bueLiRVQID5HaGWlw=;
        b=YN3kK72ThL5QwYiLrv38Oe/G+ZKtdU9lW2jKUqL2iu9quAzSFTOR685NSS2j6ieRH7
         NObyRdrvCKM1ezhcixbm8MhJs2zF8vFn5jQLnvw/gEdb/WHaBTiVAQH1zBtMAK12Dap2
         vvB//PoqpJnRmaVh562+eB+YsKOsL+vaVVpsWzyAjXu+uy5bnXfTbS8VSDTI4tfj+J/B
         mUQ8f/TtpyjYU/wkuRV74LSWDA1cZnjgxRea4ioUiuTizydInR3/0Ph0tXAkocDZLpdL
         X44sfU4XG8jCZABIlFEitXfWqDbnu1Z9MXPsMGHveWSFvIP5pbO37x8qmyLqDL7GenE9
         aWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/PyV+iYJIKauDgZ9xpgeFAyui1F5NzjlQMbrbEpYmdU1ix70H9KXc3D0T1Mcbqn4wSkfavjVQ8Szp7+d54A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt/1vLhPA7Nm05YI9yJDX2Kk3L5+/F+ejrSu0GF1cJlYvjur8r
	2V89wbfBsnghv/27qh6+ey/ry2mmHQCk5H/57KDPBxUjO6GOLxfSIs3z
X-Gm-Gg: AY/fxX6z+XOV6S7yhOf/AWYD0W7rSDRNF4i2IYwEK56VJlLI8MEW/RaI3C0M54goRL/
	ZlYikQsCMVlEdJgIPFKIPcGftkhKnnBLLokoNVDcHx8dJT5tqy3qjRDkG/WISIewR6R/iZQZwrY
	S04PhSbygGDT/yVrkSI+8fipFRUMPraL0wB0MgBHMyJfLx9sOGs38OSkcHiE9Oc1OHkCR2tLFjC
	oARUprVBWkC6QtfEj6yL25PtlvLLqeGVlbApTmU5nOu5FOEZYRxUaXxMwKMBTqpV95rHqYr/ZZK
	shtFnoIvI6eNwryo5w1GjgBcxMHm2RjrE2qM2yQlWhdXzhfAqshQ7h8ZYpN3C3mBbIn89vD/hQa
	2nSK6rdVtkSH/HjShIfFPGOwxtKlBv+n2GXmxz1qDXPmhF3FhsL4KCAIyOYdeJidHPmFaUe3t/A
	cGo3obNZCqhdOaowWcbqWi53SolzyGUvWSRwAECk6Jl/4dugHPcF8sU+IDspnG1g==
X-Google-Smtp-Source: AGHT+IE/pdvl/cmdFbtdsBCOIe3D3Xg1Gg2/JxQofyxtmGbShO8YYJBnBmbCAA4S5IUpoye7TaH79Q==
X-Received: by 2002:a17:903:2301:b0:294:f6b4:9a42 with SMTP id d9443c01a7336-2a2f21fad06mr303748775ad.9.1767263271638;
        Thu, 01 Jan 2026 02:27:51 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34ef44e0b24sm11006734a91.0.2026.01.01.02.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 02:27:51 -0800 (PST)
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
Subject: [PATCH v1] rust: sync: atomic: Add i32-backed Flag for atomic booleans
Date: Thu,  1 Jan 2026 19:27:18 +0900
Message-ID: <20260101102718.2073674-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add a new Flag enum (Clear/Set) with #[repr(i32)] and implement
AtomicType for it, so users can use Atomic<Flag> for boolean flags.

Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
particular, when RMW operations such as xchg()/cmpxchg() may be used
and minimizing memory usage is not the top priority. On some
architectures without byte-sized RMW instructions, Atomic<bool> can be
slower for RMW operations.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic.rs | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a..d98ab51ae4fc 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -560,3 +560,38 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
         unsafe { from_repr(ret) }
     }
 }
+
+/// An atomic flag type backed by `i32`.
+///
+/// `Atomic<Flag>` is generally preferable when you need an atomic boolean and you may use
+/// read-modify-write operations (e.g. `xchg()`/`cmpxchg()`), and when minimizing memory usage is
+/// not the top priority.
+///
+/// `Atomic<bool>` is backed by `u8`. On some architectures that do not support byte-sized RMW
+/// instructions, this can make RMW operations slower.
+///
+/// If you only use `load()`/`store()`, either `Atomic<bool>` or `Atomic<Flag>` is fine.
+///
+/// ## Examples
+///
+/// ```
+/// use kernel::sync::atomic::{Atomic, Flag, Relaxed};
+/// let flag = Atomic::new(Flag::Clear);
+/// assert_eq!(Flag::Clear, flag.load(Relaxed));
+/// flag.store(Flag::Set, Relaxed);
+/// assert_eq!(Flag::Set, flag.load(Relaxed));
+/// ```
+#[derive(Clone, Copy, PartialEq, Eq)]
+#[repr(i32)]
+pub enum Flag {
+    /// The flag is clear.
+    Clear = 0,
+    /// The flag is set.
+    Set = 1,
+}
+
+// SAFETY: `Flag` and `i32` has the same size and alignment, and it's round-trip
+// transmutable to `i32`.
+unsafe impl AtomicType for Flag {
+    type Repr = i32;
+}

base-commit: dafb6d4cabd044ccd7e49cea29363e8526edc071
-- 
2.43.0


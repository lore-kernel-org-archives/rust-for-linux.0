Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D491A9FA8
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 02:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768443186; cv=none; b=RuTYfwk9wIW+6cWocV5kDU+9r3CdCva+9FhGhoOxNty1e250ry0k24eCxYks7ZWaVjNzLixYZpGqC81wCH7YQHY4QfGLvtg54iUvem2XWgpHjX/B3emyJD6Ps8KcZ9rsRNxyyN4r/a3NuCYQ1BTknpumF32W698rdgVXSIvzbuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768443186; c=relaxed/simple;
	bh=3T1/evFGrxnmhjxPAtNSK2AdsbYh+2j2r3HYnQAYdec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yi2rZNyXa/vUzdZJyWRNhjQLSyEMleQglr5sewV69JupeVBsm3lczvRE+Acagm4pHHLSpYwK3EHdXc2G+mg4Ko38PqCuew69qIxLIK/6wbzLBDCAQ3+17SbXP+465ZFQtiEyyskqga/TtvJZCpKK+xq0IV0XFYjwio/IE2I4Mqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdINAoJC; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdINAoJC"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b98983bae80so178677a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 18:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768443184; x=1769047984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zin1X3P4DIksv3UN5L6WfgF+iGf5PrE4hwsrnF5yzEE=;
        b=XdINAoJC9iZCsvKF1dkAIXWLMkprllo+e/uAPILPFsJfCpnGoNPSXJvMyU53FZldQQ
         0/e6TJLVY4Np0yJfiZnfQCklgcu2SPHLiPnlfJTkKefpEJcJuMG0r1Rbrdm2M9XRhv3Z
         767pwALLmzaCxD5ZFb4ftww1q1HuOeOQHwEvWGXdkKvv7e5tl3yta/WOVpfYdvU9BX5N
         KXBMNkbKYNssvFfmpDLN5IJBVs3WS+FO2ryx5t1EKL5kA7GtzvcIZQOlL0SiWVv+MJF2
         Uh/axArNkJwTJ8azv2Snegrd9IA9KDyUZxQ2YAvTYrjnZK2YXxLhzlg3rXUeKtFYUrW2
         bHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768443184; x=1769047984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zin1X3P4DIksv3UN5L6WfgF+iGf5PrE4hwsrnF5yzEE=;
        b=BdNtXMSQy7gCwE3L+vF+Vel6pHNDrE2jpWNwyjj7olMNyb21s6LCjgx9eSAJgmywlS
         J+LIPeoE7xEkeu5sXMtn/oS1GiWdvRBQ9FFRztn8saiqP1sW77cVncLsFr7vXY1AHM7T
         vR8IW5QEB6IDSdFFWJJ7aWmRMowyvqyrjCmQ/sjvTjHWCT7ajRigvM3RhLlBm5KDPs80
         faWR0kIE1hKHVY7SEAGVNScKfZeUHnsXiwlFrU8kgEreb1jtD2YKLmTS533n1OK+VBEw
         3yeB6Yc3547HN+ytjtbXB+WYGd9Q4mKnGirM+l6hJhqr9McjhdEjU9crmhz3Ffa3Vhak
         CopQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgx4OX86sUeWYUwVctvOMvrDXSQ3FeQKJM2FTvHItOX8LlXfE1K1iIcUnmsINjcLiKOBshEJKJCVVJaOyF+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Atw8OUJ9/eJhKMUba4y+klOQvg34F5tHymQ1LyUsOabx0PT4
	q1uTVe6YqHluHpRyj9GiC5d8a42TApiozAhxK0AwEamOul6OSa83u/RW
X-Gm-Gg: AY/fxX5Ll5CW+Z3WB5r+8Ue93Zg0aNDC0IPKQnkWfw8/xGjds5zv5eMcElgBUYRyM4v
	189xIkmMXe2bDXX7UwGL0JDP+MfnXBZklRBW50PgJ+XbC87VbHRXz6wfi/yHniVQ3ef08omGRJD
	aT0SFb+LvASIcPzV2eQMRAuANExfqUFBD1iiWiqmBzGPpajAgSSUKF0oyndG7sl5UyIYtve661s
	ZjCvKLbxmD3oxcPbd7d4BBsCFw2OKHQJkF65IGuEEfAWabAdCJtG01moA2UEcmW6Vrit6Gtac6c
	tNf+aGlByGYrSVJL1urt6xUEVWJyzEyHhdlvHCbbnT5TvUR2pUBMVAMziOcHBMQKZR6T1UKilQA
	uFYhHjb+ZAOBXtMuLDJPoubxLWhBjkaYDl8LL2WxFrPqlqo9GQ+KiDarGx04RHIHlXxbpggq+zH
	p4t0+lN+qVQYoWAmZa5EBkew6Zy4RNybX5sZ4hfs5iWS5VdFRBo2VKCTpzAStszg==
X-Received: by 2002:a17:90b:4a05:b0:343:6611:f21 with SMTP id 98e67ed59e1d1-35109091a77mr3853244a91.1.1768443184181;
        Wed, 14 Jan 2026 18:13:04 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35106940894sm1868863a91.2.2026.01.14.18.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 18:13:03 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 1/2] rust: sync: atomic: Add performance-optimal-integer-backed Flag for atomic booleans
Date: Thu, 15 Jan 2026 11:12:29 +0900
Message-ID: <20260115021230.3297420-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
References: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
users can use Atomic<Flag> for boolean flags.

The backing integer type is an implementation detail; it may vary by
architecture and change in the future.

Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
particular, when RMW operations such as xchg()/cmpxchg() may be used
and minimizing memory usage is not the top priority. On some
architectures without byte-sized RMW instructions, Atomic<bool> can be
slower for RMW operations.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic.rs | 71 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index ca9cab77abf0..58f57903460f 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -566,3 +566,74 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
         unsafe { from_repr(ret) }
     }
 }
+
+/// An atomic flag type intended to be backed by a performance-optimal integer type.
+///
+/// The backing integer type is an implementation detail; it may vary by architecture and change
+/// in the future.
+///
+/// [`Atomic<Flag>`] is generally preferable to [`Atomic<bool>`] when you need read-modify-write
+/// (RMW) operations (e.g. [`Atomic::xchg()`]/[`Atomic::cmpxchg()`]) or when [`Atomic<bool>`] does
+/// not save memory due to padding. On some architectures that do not support byte-sized atomic
+/// RMW operations, RMW operations on [`Atomic<bool>`] are slower.
+///
+/// If you only use [`Atomic::load()`]/[`Atomic::store()`], either [`Atomic<bool>`] or
+/// [`Atomic<Flag>`] is fine.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::atomic::{Atomic, Flag, Relaxed};
+///
+/// let flag = Atomic::new(Flag::Clear);
+/// assert_eq!(Flag::Clear, flag.load(Relaxed));
+/// flag.store(Flag::Set, Relaxed);
+/// assert_eq!(Flag::Set, flag.load(Relaxed));
+/// ```
+#[derive(Clone, Copy, PartialEq, Eq)]
+#[cfg_attr(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64), repr(i8))]
+#[cfg_attr(
+    not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)),
+    repr(i32)
+)]
+pub enum Flag {
+    /// The flag is clear.
+    Clear = 0,
+    /// The flag is set.
+    Set = 1,
+}
+
+// SAFETY: `Flag` and `FlagRepr` have the same size and alignment, and `Flag` is
+// round-trip transmutable to the selected representation (`i8` or `i32`).
+unsafe impl AtomicType for Flag {
+    #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
+    type Repr = i8;
+    #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
+    type Repr = i32;
+}
+
+impl Flag {
+    /// Creates a new [`Flag`] from a [`bool`].
+    #[inline(always)]
+    pub const fn new(b: bool) -> Self {
+        if b {
+            Flag::Set
+        } else {
+            Flag::Clear
+        }
+    }
+}
+
+impl From<Flag> for bool {
+    #[inline(always)]
+    fn from(f: Flag) -> Self {
+        f == Flag::Set
+    }
+}
+
+impl From<bool> for Flag {
+    #[inline(always)]
+    fn from(b: bool) -> Self {
+        Flag::new(b)
+    }
+}
-- 
2.43.0


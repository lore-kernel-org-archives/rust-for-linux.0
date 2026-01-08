Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A28396B7A
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 12:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876620; cv=none; b=HjO7o13WBb1bn6IxYOl/G18vn1Mczi/NKsnxMfrI3zre0Dul76SFndqMPTY2p7qXUWJGMtM/qWjRiPZ4B7f2nu/qhnTFVfXfKI5ePzI2XLw//bhQrnUaa8DXr/MOySwPvraHMxUXbVQAKB0PLJft3XTdYaB+/zgRp3CWP+jbNHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876620; c=relaxed/simple;
	bh=d7G3781igHzGqrzGfPZolYJ+Xik9fcDKNRx2CBYv4E4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RfrdHXVkNQDfZCSB4RgTMN4pJQqH2UErqo5DcJtyycRk0PoaGDxR7sukvU709/bgAZzE8sj3hpJtF6L87GC/cMuosjdpRIWMSUfrz+BgWMo9F+48pMZ65Jf164gpzYJkjTVwaDsr9/p7EHPVT9WxiawlnR5OWH5atmF2modihRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSEhY8Bq; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSEhY8Bq"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so2081020a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 04:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767876618; x=1768481418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IkBBSV7GvoGfHkCTZL1mOD6rG4KE7w38xLBT5Tvdaxk=;
        b=WSEhY8Bq39vVFCsdylBUXby9uhnAlGUP6IPbcPkm6xf57ETUdjrg1dAvanRvOupi0G
         iubr3f5RZLpD5airNsrqrY+kXlS1UWm1xEC18rd+WhmlDLpMImNRN52SUq4eSNFtVJKj
         wb5ynPUjPOg9kzHAIX2JuerIAGpb5TD71tAd8cggp4dmvMNoOVdiFOcRxkt2xh9g6bjt
         0BzeIvqB/seINOWsIjXKoPPcQCpxvHpDrJ+g2QXz8rL+x5WE4N3OQRgWgchSYPcDwtiw
         YTOu8YRnnOz6GdLtkbrT3JKt7Id/Ls2092l4Ihd+mVrFKQzTXZM77pPHooQBQ/apCWaw
         1a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876618; x=1768481418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkBBSV7GvoGfHkCTZL1mOD6rG4KE7w38xLBT5Tvdaxk=;
        b=GwiVliozb2MXhk4hSmmj9h5rme0w1t2RieZTCSaLKe8vf6WXxCfoHo+ueQSBJ+RSRV
         HP0ldvgItt4X23sF4mGBKwIUDqW57Bsa77x83nMCfNJYXXFcXuw6N5+a2pE92XTPBb/z
         TdtHWIEnzKqv6DZh+3PB3G+TA0Pb4b5jVIgahYbckK74kMLjvs5FLddNtivTn+KncgG7
         bDmMTC0P8C411UOmETIHDcghTBoSPcbu1972UkqESgLLcWJd4m2vG32HFK7ccw29kMjK
         IDOhfdNwnqdFTlrZZkDPUDM4uTtqauwEgIWQTVN4v49MKjMPj9cOllw4pXwH7HiXIWej
         MKGA==
X-Forwarded-Encrypted: i=1; AJvYcCXXuT8ufyQlohFbZldld2y1R8C1sQOqWFoNFvFhYw8A5UtmgyGD8yogpMzwRYRytECtXcJmTfBnXwz2rxAhhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/d8ma8yCp5bPpdhFWSVuSbFIOOwo3MddiMMNnVriENI1hbgmp
	0fR+ZI9MDFPHFQtYx3T2kdClfdOaQhc+g8stzWzTrzGx+eYqaM348RjU57o33g==
X-Gm-Gg: AY/fxX6M6b/W+lKf6mpm6lBAqH2w35cAix0YBNRTUui80MuIz51yGCiZiG+2tx1FpQy
	/3dxcDvmtoaUXgvA+ZjmDsCvXTAgDA7KQWJbNyhFH1b1Crm9R1MTX46JmBQjK6NYDzQjRk261v+
	oNGnWc9NzYxxCVta/yJDcP2Mu8mAHQZUGp6RzX3qQljRNySgagOlD+NaJvb6C/JMkOzKVGX+OYt
	WVB6T7GK54U8Mqhm6R5MmcMVaOIW2WjQpIhcax41Ojsr+SZgqqdS8pekb23emIoDQ2ZC3AOawPX
	oCOy4be6Wz9czS0t1Pm/E6Z/ajIlHResDh4e0x183Uk8hl3szpy8Jv8S4SNRHb+JdppGEXMbTQ2
	Kv97WZEtWsubX5fBYUkRee1zkFWWzJLkHBdmciTAiew569EM5FQq5lUlLH+PaWs6JRACb+z+t9/
	3dU9F9aDnGdQEg5PpvBUw3pmZzAWMS1xDFtCIep+Mt1bGWR7zvwn9wLqUTW+Edl9CdIwMQm4Cg
X-Google-Smtp-Source: AGHT+IHcPv4xVCPeQ/kvoWxOODbS+gTX5ftkAGeaaZDQZrkUPSzSOWmdA9rWr+pB9LXADT89N3bLDg==
X-Received: by 2002:a05:6a20:6a21:b0:35d:cc9a:8bc2 with SMTP id adf61e73a8af0-3898f90732emr6311269637.31.1767876618011;
        Thu, 08 Jan 2026 04:50:18 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c50347bc321sm5704186a12.18.2026.01.08.04.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:50:17 -0800 (PST)
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
Subject: [PATCH v2] rust: sync: atomic: Add i32-backed Flag for atomic booleans
Date: Thu,  8 Jan 2026 21:50:05 +0900
Message-ID: <20260108125005.2945800-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
users can use Atomic<Flag> for boolean flags.

The backing integer type is an implementation detail; it is currently
i32 but may change in the future.

Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
particular, when RMW operations such as xchg()/cmpxchg() may be used
and minimizing memory usage is not the top priority. On some
architectures without byte-sized RMW instructions, Atomic<bool> can be
slower for RMW operations.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v2:
- Update the description
- Add bidirectional From conversions between Flag and bool
- Use intra-doc links
- Fix level header for Examples
- Fix a typo
- Add a newline after the `use`s block in examples
v1: https://lore.kernel.org/rust-for-linux/20260101102718.2073674-1-fujita.tomonori@gmail.com/

rust/kernel/sync/atomic.rs | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index ca9cab77abf0..473d3c07e234 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -566,3 +566,59 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
         unsafe { from_repr(ret) }
     }
 }
+
+/// An atomic flag type intended to be backed by a performance-optimal integer type.
+///
+/// The backing integer type is an implementation detail; it is currently [`i32`] but may change
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
+#[repr(i32)]
+pub enum Flag {
+    /// The flag is clear.
+    Clear = 0,
+    /// The flag is set.
+    Set = 1,
+}
+
+// SAFETY: `Flag` and `i32` have the same size and alignment, and it is round-trip
+// transmutable to `i32`.
+unsafe impl AtomicType for Flag {
+    type Repr = i32;
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
+        if b {
+            Flag::Set
+        } else {
+            Flag::Clear
+        }
+    }
+}

base-commit: ae14778fbe11e7d36a616485e3148a1ca8fdc893
-- 
2.43.0


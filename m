Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B62C125A0
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 05:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768107986; cv=none; b=tArBWbv/Sj18ESAjf6Tkq5Bl6Wwx+PPYX1ifr3ex53SALaUruDxU9uAZc2M0/8eCObXIs5ZMmOXbfcP9JLPR0RWdtvsySUm/LhghTS0+tdRwzOKRhYsMsX/PPHoTOXLDgxV+ps3WvN8vL2sw6oWGgwFgdaaVlDwcKAj8QYLBTu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768107986; c=relaxed/simple;
	bh=v+M/uW59AWv/yaEWe0VYABooA6xQng4suoSBLli1NMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkr+JZzYYJHIoVqQDxw1EM64/C/5zdRF82xMKwfj4QK54v3Zzh9iEFo9N6QzgE8LoSUoQnA8YMgWMa+9ZhraNFewHnip9NExT4hb3fRB+iYrtD5lPhNFIzp3dSJ/epeiK4LdntMmuLdtpWaZsHgWQ74ATqZzagrtYtOfuhOBTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPx/06O+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPx/06O+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34cf1e31f85so3325739a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 21:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768107985; x=1768712785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttDempTehocJF2rqTCXez1Irk9tZiQz/uNJNhaEV/6U=;
        b=LPx/06O+E6e0ViitUY4zQajBJYbATb5UlqebkFmZBmNxvrSUds6BrVw/+cI5vMVffF
         S9MTGbOvbQeT+OMJ0sKTMGxQK+d+uJz1gFd9WBVlhOla1o/NDfjLFQ3dEiLj/0istXwq
         cJ5eBORSucpWW7b11mDSyNjds6fKKLtNQa+BFT2gPTPKQfMag9Wz2nCJ51nEwMYdtiHf
         v1z5JCieZFSI4K8hsYfpaxHT4axJ4BVSy/iZ6Oad19wsGqnRrTcErUjY22GP9JXSiJwk
         He03vnjOJLCpvszgmE+qqNp8dmb/3gj98BEAG8UMWbJU8pXS6SMcHVw7JxBJRJcCE/Af
         yqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768107985; x=1768712785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ttDempTehocJF2rqTCXez1Irk9tZiQz/uNJNhaEV/6U=;
        b=AAlHo1LsvP21PeRZhMF1TxymRZ42RdUuXaGjBuMyIxvMQmD0O9VNjQbFr06o9g7fwu
         GCp4RhOApr3tbQPxvDUOjvmhov4vQKNgpZ8EthgU0r/h5850mBzhOaV/s/DRPEnk4zJ1
         8EY7Aqn+pTb8NeTztfFQ2YnlvSNqy+zxjdqwLWV+1gqqNi0k1cLKnlKKR2OyKK81+7wX
         BDzogdOKKz6dV613RVU5DYvAOILpm8e+NtXOuWVglStEm5SQZ8bisWbh8R55tHiVcDYU
         09fTmSLVWyvEGx0WqAGQ4FDzTJhEwNNM8PucUrIAK5mKDRzF3JuQCWCXJBp2rUdr6XIO
         wXdg==
X-Forwarded-Encrypted: i=1; AJvYcCXHVfdT7j/LS57qnY4gd7OGryYpDn/YsfRFJXjD4gx8MywnR54txYGueDEMs32YUKrSWmfYKsvR/Qz5UUmODQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJxiIKUt0oEMhkUr9GC2We9pQOUkAs60a+zBXD0UVO/6akjbo1
	tjjLwydXVT84qU3kef0UxqP2U2yr2VvEaaohknw0vJR2B7qyJQQP6ESJ
X-Gm-Gg: AY/fxX6deoskd8FrtbJn8WWNQRD26pdcEWZv6eoN1XByYfNXNxy9KxtUD6b3HZMg7lA
	dreXugpsvR/I1QzzkMTvtMxVwfturBWoEoTdf5kbLR53bfb8SuYxQA9uK8Bg0vMyMUdaKKE74hX
	VxSfvBdAbnBqlzMjtkRVAet+MkxJEq8Qhnd1op9MP8G/bYRXXbNTVpFRmJUHJEnsSJdlovsUX4E
	06PEFiPm5nBDX7ugdb8yLxZK4umsIOYUd7mS7DeixEvPPc3KebW8LPLAlb74sKfDmbRKgQ+KQD6
	vqpqKO+qbnCp5iykDrl5C26vZ9BfWwWIl7so6gTZmhnGm9IVWLmmZBvRk1q4E4AGYwomdrOVoJq
	Diu0yl00TIyWZlfQDJvS88pW9gDv+swTUriuLC6g3CWmDaRvzsFQeKYA3yx1reeV0NtLyy0Tf92
	RgmZyp8EclaliFVjZVTAvT8Z+82XIQfdps4FMZkJ07LjzGlqm/vi/ZAtQh7bkiRw==
X-Google-Smtp-Source: AGHT+IFZoqqGr83nppR3MOccf1CW1cx1DdEjj5iV3+zcW3E52XvckybEW0zOfPADm9AaOofQnY7txQ==
X-Received: by 2002:a17:90a:5c86:b0:34c:6108:bf32 with SMTP id 98e67ed59e1d1-34f68c47f7bmr9354348a91.34.1768107984567;
        Sat, 10 Jan 2026 21:06:24 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfd27953sm13965818a12.11.2026.01.10.21.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 21:06:24 -0800 (PST)
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
Subject: [PATCH v3 1/2] rust: sync: atomic: Add i32-backed Flag for atomic booleans
Date: Sun, 11 Jan 2026 14:05:57 +0900
Message-ID: <20260111050558.3147975-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260111050558.3147975-1-fujita.tomonori@gmail.com>
References: <20260111050558.3147975-1-fujita.tomonori@gmail.com>
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
-- 
2.43.0


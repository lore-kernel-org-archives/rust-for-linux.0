Received: from mail-lf1-f74.google.com (mail-lf1-f74.google.com [209.85.167.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0063BBE3
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Mar 2024 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710929334; cv=none; b=OeDtpsuw7qoDyzYsNDBBpQfZ5BKUpnjFQBVB2KWCkq8ePu26mc/A9VSnFyljOnta7wJe9PdaVnzwW/JQguJemG4bTWbKPxJa217ygCxgQ+IiGZnuoNG49CcT77Jpepx87RUEM37DWPRvj6R7aLj6yYGN7akrR09ciCYBLmRpO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710929334; c=relaxed/simple;
	bh=dsikV6HHaefXhxzLYHXv5UeUFSgszQgEUBeMyO6ZNdQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aNPkcZu6tWPQ5NlFx4GCqe17kkt2VMJQuMFAAZd/hj+CYQHQ/15zhbue+UL+LgPRarP9QmUlYvD+/6/TyIVNpBgKCQxzuHXm16NBaIfsZCRgt0LxMzGMvIMkgx3lGmvUcGFoJLPHLKway9KzzqHzNgUk5UWhvzGPr6BBPLIaJso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TSNvI2A6; arc=none smtp.client-ip=209.85.167.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TSNvI2A6"
Received: by mail-lf1-f74.google.com with SMTP id 2adb3069b0e04-513d4bcca5eso4269800e87.2
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Mar 2024 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710929331; x=1711534131; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8FtFKTpG+fJZqrpFDR60HPuFRsB2Dp3iCYSe7eAKvzg=;
        b=TSNvI2A6AUVh1y3ESB0Fj24Gu2gZsayRWXU7Xi2WRWPLpn30UN3bWCeJ5in8x5pYH7
         rS+Bw8H/56iyDuaBVEVpG+jKBvJh5hJQ37/fskG9Nm75TgMymr3Vz2vqxHzyiuob5auH
         SNjMTuRmOyHmTwSddtw70/Np7JZrosEeFzZn8O/ywJt+V/qrAZE5k3y8tFTUxSAFEeKr
         rwnKetjFjLseIZvYpb+YVB7YVLw/CoCYEUXJH9bQOhTYamppgfLpThMoxqyO8EvC8vyY
         pSyNoQrp5NB8bj6H/mVke7HqSpB5F6rucW4lncPWGxzchm2E1i9Rxvy4cSToyM1yvdE4
         SrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710929331; x=1711534131;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8FtFKTpG+fJZqrpFDR60HPuFRsB2Dp3iCYSe7eAKvzg=;
        b=fSYIiGalG133ntxQOGrD3z9MU4Eti5TChovQeaZ0cRBOB0ghZmkHHr+hUP08+V00gc
         EWg5RLU8BRKn+J55p6/qzBolmQiGEBcQFAOtyR9IvZ3IES8RTgjj0tw0I2dUA+6h0N3B
         0OX1LB61AJ+u0EKG7t9nEHu6XI1/QOrZ3q9AQxDwjg/3Ry9VMEL6WjPA5JHmK5YOLty1
         HbilTFE2qMuHiMLo8mR4FvDdR2m/hjKFIDKB/KwCjkLbaqo2uT8ljv/kPFEJtZFC6CfI
         uTlUIcWGLYkWotpCxw5Q/rRweLXRgrF4qqfAtHXaLcCVkYw3jJQ8Z8XabkgBo+Gn0R7r
         sLJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkeSd/l5zB2INqUKM58gnY3821Lst6GixpocFetuuZvAAHkTHs2htX0tqxR+XO1GMnCJQKBpoe33yQRqhfGD1RVrUP/0M7KZelPbLo/GQ=
X-Gm-Message-State: AOJu0YxbyBGS8GHlh1z5Tk6qF9YaNIFwNi30kGinQv3Rc3xEypx62P1V
	/ZnNr6+Zs/JfjtvKi+1VWZpwjCEKj8rTtp6XIpxpTze83Wc7aecQW5BahxluSeyvU0/YygJQl3v
	HGYhho6QNr5YNTA==
X-Google-Smtp-Source: AGHT+IEw+6fkLpG9/sHjTwt0dVYYUXys5WdUg2chf3xXBucDE7JuRZYpka2H9ZWYkbxdIIUsrZewbA4OIecFIto=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:3c8e:b0:515:8856:121 with SMTP
 id h14-20020a0565123c8e00b0051588560121mr2109lfv.9.1710929330802; Wed, 20 Mar
 2024 03:08:50 -0700 (PDT)
Date: Wed, 20 Mar 2024 10:08:45 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKy1+mUC/x3MSQqAMAxA0atI1hZiFRyuIlKqRg2ONFUE8e4Wl
 2/x/wNCjkmgih5wdLHwvgUkcQTdZLeRFPfBoFFnmGpU7hSvZs8rmVVMT4u3Ks9axK60bZFrCOX haOD7v9bN+36sRy7NZQAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2952; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=dsikV6HHaefXhxzLYHXv5UeUFSgszQgEUBeMyO6ZNdQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBl+rWvsv3i51cmcXwxFaAJMqx26XB5MxEAJRqIm
 CFdHV9AhwWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZfq1rwAKCRAEWL7uWMY5
 RvZED/9sOln6QF5b9/9VtU9m4v51vVAyULZtziciiZryljVVj9tzSGN6cGylE8hM82k81887ggu
 hQSGjlzgFYudz/rTX4AXnkxLo7A2RUpF43cRcJm9KDZMlV0c15rgKK38Q/woYOeKQxQfGH5dMvB
 yIRs2u8FXDGvquY7ouLUQjBrTe3pINWrKVeMkSAbYJrSt+ziUxTY0HJ69Md5vTXhNbWiNwI2yRw
 wYxeci83RIrYd1HEOQC0m6m3n1EFyL6/M6V87zzlegkLn5WQkWzDPUUwuGB7fGxxrSVdpUlBZ1C
 zvqw1D0EirGX7KHYFg/9LzsKr8YxZQp1EBpPcYiyhSQFvs599F72xeST5orVQ7kwhKzTRitRvtc
 Q2h5dg0y0wzHLqrf39IIXDaKsfhoeDVO8u2GIaf1PwMQ/phHcD+GVCM25P8A0PyrXMnNxgMbFCb
 ki4Ch44dsEKF/63yjAZBANXR5SR8/C8MC3j5hknR1Hi9P+be4KjE4AaxggHdrDaQd9LvTB5Eu0X
 KqbgiT8nzZY4OCPfjoMQ8c0No0ZP1Po8p88KraYv1q6EqhxCIlwL9LHQduNOpkLqzzxaosP2Dg8
 Inp+mTHs24mzeDf7NUg5nVVMAfZ9T7vBNqm2ltGGNLPQy6SUZUUUbtPSsWRq+VP7uyPu7r08v9e I0aunXke90cEBww==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240320-rust-ktime_ms_delta-v1-1-ccb8672a0941@google.com>
Subject: [PATCH] rust: time: add Ktime
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Introduce a wrapper around `ktime_t` with a few different useful
methods.

Rust Binder will use these bindings to compute how many milliseconds a
transaction has been active for when dumping the current state of the
Binder driver. This replicates the logic in C Binder [1].

For a usage example, see [2].

Link: https://lore.kernel.org/lkml/5ac8c0d09392290be789423f0dd78a520b830fab.1682333709.git.zhangchuang3@xiaomi.com/ [1]
Link: https://r.android.com/3004103
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/time.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 25a896eed468..ac8b35f662af 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -5,6 +5,9 @@
 //! This module contains the kernel APIs related to time and timers that
 //! have been ported or wrapped for usage by Rust code in the kernel.
 
+/// The number of nanoseconds per millisecond.
+pub const NSEC_PER_MSEC: i64 = bindings::NSEC_PER_MSEC as i64;
+
 /// The time unit of Linux kernel. One jiffy equals (1/HZ) second.
 pub type Jiffies = core::ffi::c_ulong;
 
@@ -18,3 +21,60 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
     // matter what the argument is.
     unsafe { bindings::__msecs_to_jiffies(msecs) }
 }
+
+/// A Rust wrapper around a `ktime_t`.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct Ktime {
+    inner: bindings::ktime_t,
+}
+
+impl Ktime {
+    /// Create a `Ktime` from a raw `ktime_t`.
+    #[inline]
+    pub fn from_raw(inner: bindings::ktime_t) -> Self {
+        Self { inner }
+    }
+
+    /// Get the current time using `CLOCK_MONOTONIC`.
+    #[inline]
+    pub fn ktime_get() -> Self {
+        // SAFETY: It is always safe to call `ktime_get`.
+        Self::from_raw(unsafe { bindings::ktime_get() })
+    }
+
+    /// Divide the number of nanoseconds by a compile-time constant.
+    #[inline]
+    fn divns_constant<const DIV: i64>(self) -> i64 {
+        self.to_ns() / DIV
+    }
+
+    /// Returns the number of nanoseconds.
+    #[inline]
+    pub fn to_ns(self) -> i64 {
+        self.inner
+    }
+
+    /// Returns the number of milliseconds.
+    #[inline]
+    pub fn to_ms(self) -> i64 {
+        self.divns_constant::<NSEC_PER_MSEC>()
+    }
+}
+
+/// Returns the number of milliseconds between two ktimes.
+#[inline]
+pub fn ktime_ms_delta(later: Ktime, earlier: Ktime) -> i64 {
+    (later - earlier).to_ms()
+}
+
+impl core::ops::Sub for Ktime {
+    type Output = Ktime;
+
+    #[inline]
+    fn sub(self, other: Ktime) -> Ktime {
+        Self {
+            inner: self.inner - other.inner,
+        }
+    }
+}

---
base-commit: 768409cff6cc89fe1194da880537a09857b6e4db
change-id: 20240320-rust-ktime_ms_delta-74b00c9ab872

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


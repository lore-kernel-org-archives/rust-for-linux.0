Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45533214A8B
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 00:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399894; cv=none; b=sHrYXGvH1wNGxZVbzg8hjgNhF6cLFO0TJA623ioFSXRsedI7mm9mQ1sJqEyDipom8ZBWZV7FjCBFtkeOfIUSsTcdfg6q7LrMeahBj1wmD8T+ZSa++ITuoKka1OaVXGfO6K1QhVSg8N2/4Kpi9AP9xkzLs0RhG4Bsw8xuPkCfeNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399894; c=relaxed/simple;
	bh=XRVIgwc58JkWpAPH7KqwqozlTeVA5dZQ28Y/5SMWRuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y2zpk8Gtx8PIUOIxKpDdFDWApnp8YPdyXEIuPDsH4j/9VBeFsVRea8Rotmf5x3x8OmgfsqsrNSx/03Hnssw6xD0dRVHvbYi+al+KFYCSUPlq+XiMssfKleTfA7Uqz537yj3+TU4DA+M5CJUsfCyJOeWM7gFGJb+zjDoPv9+bw4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvoRR+5w; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvoRR+5w"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso2531335a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 17:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774399891; x=1775004691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFuNadNUZFgtF+sP4Pga3iBRmMtaHmf3b1Z1WRL7Is8=;
        b=pvoRR+5wUAWmFRMJ6fCoaV4KyrEYSHElv6QRNBxP+qsSg/scmi00y6eDgQztsQrFb9
         zxpEDXMPdCd2SMB108nlsR6vA/hFvAFkIUJtJ6Uv9x0PfDUTeIBoC889EoF1NJHPUzQm
         5YWeGNsS5BxOLQjBi1wLBA9Ej4NyLgy+m7G2zPXr6Ai0U6+NyoElqYEnN3S3aHgrKRvu
         whkoK0tzAJA8w17fEuDX0ZTmYwbRuhrsHXJ4NBTe0iCMnaujpYxgDFR0H7psLM4vIFha
         PiuBWbvaP2gOmxXcAZASozFD3a2JLbRwQlO1T0/mcVBWuO9DUcTnrqxi862vOn7AaOlv
         aimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774399891; x=1775004691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFuNadNUZFgtF+sP4Pga3iBRmMtaHmf3b1Z1WRL7Is8=;
        b=alcx0zvNpwtK3FrS0oDzkO+sa7xWrFzAwR3LltDmZVZfjHca4PuRZUaomnxfXy/C8g
         72+KT+XC14hjftJvzHA6+9e9XCsOlCOG8sMnNbFZnm4OXjqTb9RG9I/7zVIQeUbYuDV0
         l4ryGLoIVNWPVefksxCJwiIfjLT/sx+7BnIJW7bIXJPdH2mR41dL3GGt13hFc1mSPznl
         VKg0Ml3L/73KL/Zb1mnK2BV7Ov0lmeZTZUgTbYqKmAzRKFVa5qlcjKuB+SM5bV+Z6Qyh
         hKdDeA9XCQhiyUkC05RwpMlYVSXgOod0sLr2kApanNGtqi1dFnM3anAycu/ipukGLyBT
         vjgw==
X-Forwarded-Encrypted: i=1; AJvYcCWcjuv0W1VqkMtfvuWTs/aomfI6fPKqxuOZ6P5zyOZwUs6yuV3zxBGQTRjXFu7QX7Or2SsdSKy0kqkInAJKhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Pxsxp1IOpKJ9S7MrLGRGhRcwr0d8urH6Hch/DoXv3cXoADNo
	6hUUj7DigVmUH69xR8+p9eQPtN06xVo2O0cx4I0uM8k+Z1Dy3sJwu9YK
X-Gm-Gg: ATEYQzwp3bF0ifhSdt8sJHMmf6VL8eCEZt+5nwTLBFIGiq464boFWUQV8TliX8CxIiD
	bMHko5k0D0uZo49T0wi4ntxsmiAtAc0SVf6E1+0hA9gvPuOyo1ltJX9qRKePaNq2+9CaZ89IHkj
	jilctgHdxej2zV0vaagWYI0y1/z/IRQYvPykUMlHZGwinBDXuhFCVWU8yLxMmP7qy7DJE07MEM4
	XZIbYXrh0V2oDOtGKnyP49I8J1Ci/Lo4C+3Fm/mc1DdZnQvHwl0BmuCzixi2DJEA1NsKQoIgGHb
	4KV7W5sAKi9GDCTiUhXeioLdV+LWH9fFOyKLJgQKajYvrG91zDTBLt9KOJixFQWCk7dzHkMJQ6u
	SB36MCwfT7L+1BZICVDOx8bSzOgWDDw3gXW3j5HVluMwXyk6G1DL4Mc9Mtnafnt8d2bKOk7+MvS
	36vBmrA1hEArAO5qkilIemyeTpmR1SNPpxsr3Hw5nE
X-Received: by 2002:a17:90b:3ecc:b0:353:356c:6821 with SMTP id 98e67ed59e1d1-35c0dcfc99fmr1179122a91.8.1774399891485;
        Tue, 24 Mar 2026 17:51:31 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03211351sm3770972a91.15.2026.03.24.17.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 17:51:30 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: dakr@kernel.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] rust: Mark all from() for Error functions inline
Date: Wed, 25 Mar 2026 10:51:18 +1000
Message-ID: <20260325005118.168814-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Mark all of the existing

impl From<...> for Error {
    fn from(err: ...) -> Self {
        ...
    }
}

functions as `#[inline]`

There was a recent request [1] to inline the simple from() Error
functions to avoid the function call overhead.

This patch inlines all of the functions (except for the pin-init) and
converts one existing `inline(always)` to `inline` to match the styles.

1: https://lkml.org/lkml/2026/3/13/962

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
The pin-init changes have been submitted here instead:
https://github.com/Rust-for-Linux/pin-init/pull/126

 rust/kernel/alloc/kvec/errors.rs | 3 +++
 rust/kernel/error.rs             | 6 ++++++
 rust/kernel/ptr/projection.rs    | 2 +-
 rust/kernel/xarray.rs            | 1 +
 rust/syn/error.rs                | 1 +
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index e7de5049ee47..985c5f2c3962 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -15,6 +15,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl<T> From<PushError<T>> for Error {
+    #[inline]
     fn from(_: PushError<T>) -> Error {
         // Returning ENOMEM isn't appropriate because the system is not out of memory. The vector
         // is just full and we are refusing to resize it.
@@ -32,6 +33,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl From<RemoveError> for Error {
+    #[inline]
     fn from(_: RemoveError) -> Error {
         EINVAL
     }
@@ -55,6 +57,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl<T> From<InsertError<T>> for Error {
+    #[inline]
     fn from(_: InsertError<T>) -> Error {
         EINVAL
     }
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..935787c2a91c 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -216,36 +216,42 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl From<AllocError> for Error {
+    #[inline]
     fn from(_: AllocError) -> Error {
         code::ENOMEM
     }
 }
 
 impl From<TryFromIntError> for Error {
+    #[inline]
     fn from(_: TryFromIntError) -> Error {
         code::EINVAL
     }
 }
 
 impl From<Utf8Error> for Error {
+    #[inline]
     fn from(_: Utf8Error) -> Error {
         code::EINVAL
     }
 }
 
 impl From<LayoutError> for Error {
+    #[inline]
     fn from(_: LayoutError) -> Error {
         code::ENOMEM
     }
 }
 
 impl From<fmt::Error> for Error {
+    #[inline]
     fn from(_: fmt::Error) -> Error {
         code::EINVAL
     }
 }
 
 impl From<core::convert::Infallible> for Error {
+    #[inline]
     fn from(e: core::convert::Infallible) -> Error {
         match e {}
     }
diff --git a/rust/kernel/ptr/projection.rs b/rust/kernel/ptr/projection.rs
index 140ea8e21617..7e37390da6c6 100644
--- a/rust/kernel/ptr/projection.rs
+++ b/rust/kernel/ptr/projection.rs
@@ -13,7 +13,7 @@
 pub struct OutOfBound;
 
 impl From<OutOfBound> for Error {
-    #[inline(always)]
+    #[inline]
     fn from(_: OutOfBound) -> Self {
         ERANGE
     }
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index a49d6db28845..46e5f43223fe 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -172,6 +172,7 @@ pub struct StoreError<T> {
 }
 
 impl<T> From<StoreError<T>> for Error {
+    #[inline]
     fn from(value: StoreError<T>) -> Self {
         value.error
     }
diff --git a/rust/syn/error.rs b/rust/syn/error.rs
index 6fa0faf7f4e4..636f07d56d05 100644
--- a/rust/syn/error.rs
+++ b/rust/syn/error.rs
@@ -405,6 +405,7 @@ impl Copy for SpanRange {}
 impl std::error::Error for Error {}
 
 impl From<LexError> for Error {
+    #[inline]
     fn from(err: LexError) -> Self {
         Error::new(err.span(), err)
     }
-- 
2.53.0


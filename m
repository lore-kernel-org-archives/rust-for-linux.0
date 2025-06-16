Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8CE285CB8
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750077730; cv=none; b=aUP+PYqZei56zCozV5CKD2N2cUR2xx87e5z5XBPvG8+gsQ+dLTqlyUfarcWKov20Tjtf+yYF42Sgcfl7YFH9UE5cioL3SYvkhpp8C3eccAzO0UN0YvnwSC6GixcMN2BQp7EGnaVwzU3mgcWgfNOaJvOiZcz2+We6aIs88GXnUq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750077730; c=relaxed/simple;
	bh=eisJelsbzbgz5PauR9t6Qqmq85k3CBf47pI1tIcqyIU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VVrr6TW9eGgkMeerNF20paV5ioWKr0LVJmGvv1CrN0GwwriO5+2Soxogpw7OLj1bayg5NmgUtmR6agphEOpkL9+RAYGg2wE257+0zVBhsZlNhSos0TJMlWiTj1SI5+eKfyCN+skb86CjX0Jwq2QiBmtE1p09u3LideBmQZ7Mqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ly1dA9TS; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ly1dA9TS"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d50eacafso27234355e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750077727; x=1750682527; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4iPsvC3FNImEIyla9KrHgTvmi5udSzFWrqAjBfWFnic=;
        b=Ly1dA9TSaM/5sY/uCnMQQwNN1IeJfaBdXzrL1MtpL0eDfd1MgN3OhFVx6nFbwvHZfA
         G81o9Ush3IJRhQDXzUAepcJXv+r953sx+z+k7SiKU+pb8w4vo8owxio5lnT7mCwZJYbi
         ljMgBaRdV3UP7OYTvGJbsNWdSWZ6KppjsU7Ih9Z5y5pn+wnaxyNhM8Vk+jwGGc50fHd+
         dZ//rHDSFN0t/FNbaiOJgDCjaetrOeWwarQt89+i+JM9jVRaPTcn7LtdtG8fAyANsC6k
         vSSzmTvQ37pm7l24gMn1kvUXx3gjCNEvkPQkZxCDTT4V0t5oz+MSKP5iQelVAsMDZBG3
         hZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750077727; x=1750682527;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4iPsvC3FNImEIyla9KrHgTvmi5udSzFWrqAjBfWFnic=;
        b=fwXhiV5pwSI9dHQpD6oDx1WvRydLvB8vCfHz1rrKb00RiiBPZfs54dhK1FxJu7DTIf
         pVUHwFMtbyjSCCdFL/OasHoqUZHDCz8XkmNVnAiait4x1QT9xPNQjWzo6/yG7M52SdDO
         Z/9X6DEWz7GGLLFBfVdD9E6x4jzufQfRSp3GDJpNsXu6Ctg7JXBJNF0Jh4YlmRVzIx2s
         7c+uum2cLpdpzA5ag0tIPmsFSCjNFplO7uywaP7RK9Jsvfxuo5xxHP8DjM+pPYMoUwdc
         0sO6JwFm/5+OHf074B5v6SUxUGzJIixf71ciDQI3HQs9n243UyG4AyQL1qKdpOUH854l
         sh4w==
X-Forwarded-Encrypted: i=1; AJvYcCWbL9mLWDjQ4UE1IpwqgGrha0M40da3Rjw45TO+Yoq73AM+GPSa6UvwC8/2Q8SmmejlMpNkvzXJQ/Mb0VYt/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRxNF78IIrG3RNIwZHFa9aWCqFmUD9trFTZ0MqLPa0S1bxxT7
	grqvS8J/4b8dzVUa9c1BL2ICNzbrUPdxAe96MIoLdYfgGsm67nLu+TwJN3JsgUCjssscXl1d4da
	Xl2HCuiGCN/xmXxrI8g==
X-Google-Smtp-Source: AGHT+IFFEgIkgx+6TKashi0el2hVGOtC2gAVnRdLv6IfE63TCVZAam6vLTu09ppRDIqAw3h1TDUJsf/jVtAg1X0=
X-Received: from wmth13.prod.google.com ([2002:a05:600c:8b6d:b0:451:edc8:7816])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3584:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-4533cac908fmr84778685e9.30.1750077727306;
 Mon, 16 Jun 2025 05:42:07 -0700 (PDT)
Date: Mon, 16 Jun 2025 12:41:47 +0000
In-Reply-To: <20250616-strncpy-from-user-v5-0-2d3fb0e1f5af@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250616-strncpy-from-user-v5-0-2d3fb0e1f5af@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2881; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=eisJelsbzbgz5PauR9t6Qqmq85k3CBf47pI1tIcqyIU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoUBEawPXeuRCgQ5wZKLaXtuHVvRNKHSlpd0hBk
 5Vk8HVeBKeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaFARGgAKCRAEWL7uWMY5
 RlmRD/4q1ndgbZsarygiYRaLLFiGWz2nYIpLwtNtRb7vaFqFiEI/KP/W6NZx+yWhdfc9qshRXeE
 WjvBOCwBkezCJ9SBY+wRcl7EzEcTHBp2vXxFVRXP5h+8dY+lolSZqcoGWMUKfBtpB0NoNvFlrw6
 9i5zdHF5cjt8KiXVHn1qXxB90QyYcvVMZQ4CE6HaQFYmXczn/w3OSYPrLKKaRUJSD8nSk6yoa/i
 nv8t29nKfTp0CD3k2AvoY1PvF3ykQHK7qcaB0n5liFITOApLSb0VFrkKvyuZ1Y4eaaC07Y9C2SJ
 ByMc1Kjb/thT6fcsodupNIFryztcYhauKvnGL1dvdnexrzO+plvxDTij1aV77R1UoEqmDfLUoco
 r3/fohtiNTJ5RpdRnxgbJ6r6AbSJWv4oYQQ8Re02eW5yhEU1eHdB+/TgPni9wi5pvVW9buYDi8P
 RYkzvgyhdNsffkUqv+eEHCAfoRk6n/8rQK1Qzf5ElVTSKL5fynOBl6iMI5XNGiCbSxKT3c13L1B
 0oBB6nc5h4Hnte76G3pV/TeK7Jhzlu/pJbEhvb6SeVEpSHm+kouvOjadWpypYVteq1xY64EVAUW
 /NQE95Rje3CtXs0HOnlFybvvw84R+tjggZu9QXKQMaQXNkofAs8vZw3kY/sl4wlwL5scRn4tKI2 DILR09TojH2ZqOg==
X-Mailer: b4 0.14.2
Message-ID: <20250616-strncpy-from-user-v5-1-2d3fb0e1f5af@google.com>
Subject: [PATCH v5 1/2] uaccess: rust: add strncpy_from_user
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This patch adds a direct wrapper around the C function of the same name.
It's not really intended for direct use by Rust code since
strncpy_from_user has a somewhat unfortunate API where it only
nul-terminates the buffer if there's space for the nul-terminator. This
means that a direct Rust wrapper around it could not return a &CStr
since the buffer may not be a cstring. However, we still add the method
to build more convenient APIs on top of it, which will happen in
subsequent patches.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/uaccess.rs | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 6d70edd8086a9f1ce38f78d312d6a7cfc03141a1..635a03e0989f3fe99be80987aa47763782de1d3f 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -8,7 +8,7 @@
     alloc::{Allocator, Flags},
     bindings,
     error::Result,
-    ffi::c_void,
+    ffi::{c_char, c_void},
     prelude::*,
     transmute::{AsBytes, FromBytes},
 };
@@ -367,3 +367,37 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
         Ok(())
     }
 }
+
+/// Reads a nul-terminated string into `dst` and returns the length.
+///
+/// This reads from userspace until a NUL byte is encountered, or until `dst.len()` bytes have been
+/// read. Fails with [`EFAULT`] if a read happens on a bad address (some data may have been
+/// copied). When the end of the buffer is encountered, no NUL byte is added, so the string is
+/// *not* guaranteed to be NUL-terminated when `Ok(dst.len())` is returned.
+///
+/// # Guarantees
+///
+/// When this function returns `Ok(len)`, it is guaranteed that the first `len` bytes of `dst` are
+/// initialized and non-zero. Furthermore, if `len < dst.len()`, then `dst[len]` is a NUL byte.
+#[inline]
+#[expect(dead_code)]
+fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<usize> {
+    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
+    let len = dst.len() as isize;
+
+    // SAFETY: `dst` is valid for writing `dst.len()` bytes.
+    let res = unsafe {
+        bindings::strncpy_from_user(dst.as_mut_ptr().cast::<c_char>(), src as *const c_char, len)
+    };
+
+    if res < 0 {
+        return Err(Error::from_errno(res as i32));
+    }
+
+    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
+    assert!(res <= len);
+
+    // GUARANTEES: `strncpy_from_user` was successful, so `dst` has contents in accordance with the
+    // guarantees of this function.
+    Ok(res as usize)
+}

-- 
2.50.0.rc2.692.g299adb8693-goog


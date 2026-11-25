Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606375;
	b=QiohUKjN+f1/AuSzoHzalngyX2dUXm+bXMpKcWayTVgh5CBu9Ut1f+KCthUrI9/Zzh5V
	 61guWsEmJVFzn1uq4K0imtaQ6e9CytwBmmWBQW+Mh/th5EQIcrzdKfb5Tt/S3VZa1Dnrf
	 CPQDF+Wnzn0GvcYQ56WOpvDQhL2mxV2q1C1+fyXb4aJCaKKncqdmAu6bdte7cSjUMWmxt
	 AK1yeS2PxafrQXNS5B8VXfwlTqz6/Wk0ZtyjX9QR1xO9tQG116yHRd5GYNmmLtAUIRjem
	 ccqAwF0VODn/eK0WYNmbdkjc6z8E4P9WYr/lCK9R92HFe2XLETwyOqm15MyOfRK0BSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0Ztqk1bUDfuyPpndK9/UTj54cfBTPHQbBgiNZHB+ShU=;
	b=uzNN0dK0JTdfg6iJ7Gcfclghb4/uQzhwbhwSljYfUiWQa+fNRIEELLzWjaZ8mH8ZP76a
	 WEneyD7C/lQpozW6o6dPhExeTUbVr3aa6ZSDCJqTY+yiXgas3GTqdhPx+grfJhmoSh7wr
	 3KB1JwpgphJFo4Vbtod1LSPb7jdUhED9BjwLrjIIXTzylB+nGMH1wI7SMIqy7A7KT5dPH
	 u1hgKxlZvKmYBNWKZqv80JpqCeG/09x44onp/nIoI4GGyBos6BLan0pLgVNSVKzWdDegY
	 8RS3ZE3HAmwAKOkwUxeM1+qK/M8UStGAmkWvusl4eubnysuIm2Go4SUaljM6GIRpPhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edMisqIr;
	arc=none smtp.remote-ip=74.125.227.196
Received: from mail-pi2-f4.google.com (mail-pi2-f4.google.com [74.125.227.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A195606A683
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 11:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A195606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edMisqIr
Received: by mail-pi2-f4.google.com with SMTP id 41be03b00d2f7-cdd8c1fdf4aso1048202a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 03:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606374; x=1796211174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Ztqk1bUDfuyPpndK9/UTj54cfBTPHQbBgiNZHB+ShU=;
        b=edMisqIrFvkK/FmEnxqLBC6zVti5XPetRG6uHlDQ5FsPb8xrGAjU/IMNJ4log8PdIt
         gUFzVaP14XHAWJT8/t7bvXIdFUe51kdqQjGDyJUFlDapUycz4j+5EKKEu/OF4edKjUsj
         iQ3TSxZkj+128es0Y6/7yTzxzKJqZ72VwlpLRBTpCwPJKtM6M5Rm1HhxzsyYcY3otU/h
         6MB4Nb7HG8bapPIzK/uBKsbKss4qqcV9kVWT516OwibpFkwIblDvNvSRK4cR6EU1OvOY
         FuhkR0SEyi6im9+taEy6UoSHTRMzP/RvBuQanr9KBJUtNbxSipLcbpyjNNZ8vL+UdAr7
         WZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606374; x=1796211174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ztqk1bUDfuyPpndK9/UTj54cfBTPHQbBgiNZHB+ShU=;
        b=cZyIwG8UeGA2B1wwwdDQ0aX6vbPmVGbs62c8q98jnNWZZwIugaRZGrjvpZSYQmmlwN
         DGx6cvhfXNQYqK5AvWEWgYXq3i8hLfl2pefo0AxPEli23ahLZOf3aG6Sq4pWMrt4uWnw
         wBjwD1uztEfZYkP2tyQ4GPyoDRMg6cFkGN3CkmTvBQDYET3SA4grwuPdZp+o0e/E+z0k
         ks/EY6ajqP8dovmYbICjLyz2D8YQLNbK+ZZwsZOqdtpyROT8qk8TsbUhSXTKZHkvC/lg
         ZqcVeg4YbHmh2RYX7Ai4yf6OJxiH5Zicp69cPlezGHBDYoRTMTDajQvO+gu/8Y81qKX3
         Sa0Q==
X-Forwarded-Encrypted: i=1; AL+hErHYXYA7zOZDVGL8gxkZdH4FETg+i9jHg20QSWHwup9q+UaWvc0iT9gfkFyJFu/s4bSjv/gRkpUb0QEXp3DYAQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YJMAw0eIS4bChVN7kkAmQsc5feiOjQADcjQp3YsfQCRbTAWhp
	0vX/avjLburiDdk1/0kbT/iXYzkzKLlMSJ6H45qLc1OqruZ5fg9c6oqF0DvQoUZDmhelW+3A
X-Gm-Gg: AZFdTZcBFx6c8gg8tdg+hUFjT4l3nWiDiY5TQWr58AZwS+Y7xVWKlJqiMPfxs9kFS59
	w/rBQDH1cEdWU4IFt3qz5RgZogiWSjwapY2jUrfKaG1TONGu7G+trzH66eRcSWfXsdaQ7ZjWrXD
	2qMixmqTcTxXNKoFx5XfnF9uVFYHSYf7M7dfpCk+G7tRSte/BaHiINBn1u02e4Ae/BrKkrcXuu3
	FjRxZ1LCWOQLY+WP+gPOr2AuCwnYbuxMTCItn+U5uPYHo8TFSzjk+hUCjtScUf7QVwHoFbxZQGx
	BhA+2yOvuDVaVEfVBDVfZBSgip7CjJJSLNJMJ2qY9IcofGkAXjXislFSu1gJl2G0Xw/KMVAQpKo
	k7GNCn/b7ChXMovwU5vVqgfb21jeDV6GRlygY3c5KmjTd4iq/zChTcz+OClfDuGAyvP7prGGS/b
	SnJ5hfwW/tuytH3H2SZZ2pm+fVxE5edsR7wO6st2QeO6UvMmA0Ulm70k32C3NJs45PY6SPY0O1g
	OmKsMzXmjoUn062lJdhvKRsvaT+NUDEDidKym/F+kU93oV7jygg72oyJJTE51xrLhTn99ZSdruF
	71JF5bxh1d60UjMMU7BourXPjA==
X-Received: by 2002:a05:6a00:3992:b0:8c4:b3d2:f2b5 with SMTP id d2e1a72fcca58-8c87cc42226mr14407718b3a.42.1795606374417;
        Wed, 25 Nov 2026 03:32:54 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3645:b698:a929:4bcd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm8862243b3a.46.2026.11.25.03.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:32:53 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH] rust: error: add KUnit tests for errno conversions
Date: Wed, 25 Nov 2026 11:32:32 +0000
Message-ID: <20261125113232.203878-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit tests for the `error` module covering the conversions
between `Error` and the C error codes:

- Round-trips between the `code` constants, `Error::from_errno()`
  and `Error::to_errno()`.
- The bounds accepted and rejected by `try_from_errno()`.
- The success and error cases of `to_result()`.
- The `to_ptr()` / `from_err_ptr()` round-trip, including `NULL`
  and regular pointers.
- The `From` conversions from the standard error types.
- `name()` reporting the errno name.

The tests are gated behind the new `CONFIG_RUST_ERROR_KUNIT_TEST`
option.

All six tests pass when booting the kernel under QEMU with
`kunit.filter_glob=rust_kernel_error*`.

Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
 rust/kernel/Kconfig.test |  10 ++++
 rust/kernel/error.rs     | 101 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 111 insertions(+)

diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index 3bf4194f28c7..54c8bfa66afa 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -104,4 +104,14 @@ config RUST_TIME_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_ERROR_KUNIT_TEST
+	bool "KUnit tests for the Rust error API" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust error API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
 endif
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 9003a1b86da8..e2726939d0f5 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -666,3 +666,104 @@ pub fn from_result<T, F>(f: F) -> T
 /// Error message for calling a default function of a [`#[vtable]`](macros::vtable) trait.
 pub const VTABLE_DEFAULT_ERROR: &str =
     "This function must not be called, see the #[vtable] documentation.";
+
+#[cfg(CONFIG_RUST_ERROR_KUNIT_TEST)]
+#[macros::kunit_tests(rust_kernel_error)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn code_constants_round_trip() {
+        macro_rules! check {
+            ($($errno:ident),* $(,)?) => {
+                $(
+                    assert_eq!(code::$errno.to_errno(), -(crate::bindings::$errno as i32));
+                    assert_eq!(
+                        Error::from_errno(-(crate::bindings::$errno as i32)),
+                        code::$errno
+                    );
+                )*
+            };
+        }
+
+        check!(
+            EPERM, ENOENT, EINTR, EIO, ENOMEM, EACCES, EFAULT, EBUSY, EEXIST, EINVAL, ENOSPC,
+            EPIPE, ERANGE, EOPNOTSUPP, ETIMEDOUT,
+        );
+    }
+
+    #[test]
+    fn try_from_errno_bounds() {
+        let max_errno = crate::bindings::MAX_ERRNO as i32;
+
+        // In-range values round-trip.
+        assert_eq!(Error::try_from_errno(-1).map(Error::to_errno), Some(-1));
+        assert_eq!(
+            Error::try_from_errno(-max_errno).map(Error::to_errno),
+            Some(-max_errno)
+        );
+
+        // Out-of-range values are rejected.
+        assert_eq!(Error::try_from_errno(0), None);
+        assert_eq!(Error::try_from_errno(1), None);
+        assert_eq!(Error::try_from_errno(-max_errno - 1), None);
+        assert_eq!(Error::try_from_errno(i32::MIN), None);
+    }
+
+    #[test]
+    fn to_result_converts() {
+        // Zero and positive values signal success.
+        assert_eq!(to_result(0), Ok(()));
+        assert_eq!(to_result(1), Ok(()));
+
+        // In-range negative values are errors.
+        assert_eq!(
+            to_result(-(crate::bindings::EINVAL as i32)),
+            Err(code::EINVAL)
+        );
+        let max_errno = crate::bindings::MAX_ERRNO as i32;
+        assert_eq!(
+            to_result(-max_errno).map_err(Error::to_errno),
+            Err(-max_errno)
+        );
+    }
+
+    #[test]
+    fn err_ptr_round_trip() {
+        // An error pointer is converted back to the same error.
+        let err = code::ENOMEM;
+        assert_eq!(from_err_ptr(err.to_ptr::<crate::ffi::c_void>()), Err(err));
+
+        // `NULL` and regular pointers are not errors.
+        let null = core::ptr::null_mut::<crate::ffi::c_void>();
+        assert_eq!(from_err_ptr(null), Ok(null));
+
+        let ptr = 0x1234 as *mut crate::ffi::c_void;
+        assert_eq!(from_err_ptr(ptr), Ok(ptr));
+    }
+
+    #[test]
+    fn conversions_from_error_types() {
+        // Allocation errors map to `ENOMEM`.
+        assert_eq!(Error::from(crate::alloc::AllocError), code::ENOMEM);
+        assert_eq!(Error::from(crate::alloc::layout::LayoutError), code::ENOMEM);
+
+        // Conversion, UTF-8 and formatting errors map to `EINVAL`.
+        assert_eq!(
+            Error::from(u8::try_from(u32::MAX).unwrap_err()),
+            code::EINVAL
+        );
+        // Deliberately invalid UTF-8 to exercise the error conversion.
+        #[expect(invalid_from_utf8)]
+        let utf8_err = core::str::from_utf8(&[0xff]).unwrap_err();
+        assert_eq!(Error::from(utf8_err), code::EINVAL);
+        assert_eq!(Error::from(crate::fmt::Error), code::EINVAL);
+    }
+
+    #[test]
+    fn name_reports_errno_name() {
+        assert_eq!(code::EPERM.name().unwrap().to_bytes(), b"EPERM");
+        assert_eq!(code::EINVAL.name().unwrap().to_bytes(), b"EINVAL");
+        assert_eq!(code::ENOMEM.name().unwrap().to_bytes(), b"ENOMEM");
+    }
+}
-- 
2.54.0


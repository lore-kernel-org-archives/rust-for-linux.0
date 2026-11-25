Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608620;
	b=N6Xx6vs1BIkplfrBZm9wsy5F1Nerg0N3kHCMrzhbctMcqo3SVb5c+LQYh0/axRRVUvj1
	 5AsNVaeq078Ewhvbqdn17pV7nmSPEL14j1Ck1VQELxAT6hHuhtrgFQEv+RL1sFXsIoC85
	 aRTP+o/2+LsHtSxRAO9lxNWuphIm8olaELay6+OnD8ihNIbJw2C0N6Ok4IkWhnNdlJz2r
	 rTPu+12XPzg7eRnNZjfMqqbmk9LLFw5YbkgkcB4GqHbjlh6jp4vgEieSsvgQ1NhFi1Raq
	 ZJP5MSHdRVW5pkVjX9W/O8GpqhXRX83KXWXHUwFjWf2fAErxWlBFFJIggGTnhFcWUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9HdiKRljQhMfzH2P+MN0o+HlYTvzOpTJlx2GSf/0rpg=;
	b=TyvF27DWj/EeErkekW6ytSnK5WYsnvdI8qTusRuS51jDk01oQgsEHCkd84RxQ+hK61q+
	 3mDm9OtdgvzWFddLAd8pnNRdQY1uJth+pDTkEsduIkTKBJGHKj4hIxEtyHSRUmq9NTg9n
	 04QPPdyMR8SKrwGVh49uqV7XxOtNxOxaBSbL7FQCrm/BqizYjlEFaQpKzs/F0xrX7Hx7C
	 7/wKbctcp5yKHY5OG1IYho4AIHFuI18aVzvXfto1Eks2LUy0g8dThtdm+ZpcutqaL6sP8
	 jZkv590SbU+8U7kMVcVUKdHDic2pNWYfrfgoJlMTxwirYVx5x97+lBDw83yjvePZDFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NNbZ7RM4;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7891606A31E
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 12:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7891606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NNbZ7RM4
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2f066a193bbso28435575ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 04:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608619; x=1796213419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HdiKRljQhMfzH2P+MN0o+HlYTvzOpTJlx2GSf/0rpg=;
        b=NNbZ7RM4yPcPZgPT2DgI2AWzdijznZjTQQE2vzadEfNLfJUiCuE6U6udlJ+zbtLY+9
         /L+GmVgHmCewCjV+mMNJG4Ipv9/nWAUySAE9v3kOWq/DepZ1RB1qXXAqFPrKkKEx/doz
         av1LSerZPQZFPd9Kp89CGeKDEVvDk8N2f+9CJ0ybMwZbOvI4MoqhaVK1utYG52J+zfO1
         J11fFLQlKn4quLAGk2GbdMIritNekoomLegzuc9FG4bk728EzxMm45n8b7bI65CwXHjX
         0ihVfoPIB7WHO8pjco3A32RtOjqTc2zv/T9jA4u2NnamOJbUwTJj+fTckFEB1pHFMEnf
         50zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608619; x=1796213419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HdiKRljQhMfzH2P+MN0o+HlYTvzOpTJlx2GSf/0rpg=;
        b=v19sj+8OA2n9RlKqLrzQl6ApVBVYJ5Z3MNwcFVzoI3tk9LapRPZMi8YbWVrlcEDVvF
         HKb0XwX/5p8Il1NDZsa0XeILtTuaG1tISWbcxWa72sqrkOXrAJIXLh+FLoVerpLaHscR
         J0s21yuTbKTYuOGF0Q/ftkcVfEXfX51u8hWXSizoXnXw8Eah52mJ67GOgw5gYC8S+l2h
         6oW+XdM/EHUsc4Jp7ity9mX/e9wTg4NpgySrDMlt4JBT+rP1zW7wfdhNvYmCtc4//V+g
         fLA6ahNjxGCLztirnbMhO2xNpFHWLoakkcp65CPeEJIyCTgzvFCM0OaQVAeVudkylYN2
         p0qQ==
X-Forwarded-Encrypted: i=1; AL+hErFjLt7TdBuU+tOJj8raLlutqPb+EeHXSkUq10U6SRUZ3on1+zF1nYK1b0KgDbsWOYmuSvrJ/mM/c0Dn93uejQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9F17PuegzBBiDiDFjqWqH7PssgJxL8VFkCFVm4byyudQARjIDG
	+20upbd/OOG6hPcMSr3vboCfWoWAG4tpL9eVvADDXx7BHfVwcZmf9RmV
X-Gm-Gg: AZFdTZfBVqWZAqd9YXZGgPHw7Ml4EqdhtL1xfoutEnF1FKOAAm9xn7tKA8NkL8OPfvI
	wz/8sYHWuHUHPxfmSIX5/xN0V1cjfPL+DU8Vnd+zudJwzjDkArB0UZVcwegxM155+t5RCgf0xhO
	5zoOPUInDeLxuUgbbsNL8ocnrPf6ztPjDB3ZWF9S1GeUPCt2IkenQeS1q3YCzDCM70PkFTiPG1C
	mDoxTRjBvskYAlPxP5jW56q74y/k7OJgXS4Wv3dRAtDGKh9XRNf8hvGpI0O9ryasacKbpgmxNjD
	/7TWWfTJrG4IvvmDYbZt6lPGMG2u7xghJS0EE7Wq3xieaKGXoM51gw7cF+L56QCFm6NPpHSxDTF
	eTULJRQ3Jo/NTcwqdMUHWofBatm9AsOMPCJbXYi+gY0AD0EDn1A9NDC7MMKWaCu1FRZkT7/WRLa
	ui6iZoLtf+gZQG9gw52DdSN1F2/uj8Jtcua/CbbZRXaFPYbL/2Qn5X/U4WbdrP0QYtbJD21z0eY
	pTsI0CiSpWGYNOhJpHxicmdDmbzZ3uXz6I/G1dQoam9AV2RfrU8kdc/+LgSo7Y4FvZl5lkGIaB7
	h8wHoKjFc50jeZ0C3cz3OHRJdw==
X-Received: by 2002:a17:903:1b68:b0:2f0:dbe8:bb7d with SMTP id d9443c01a7336-2f0dbe8bcdbmr13328345ad.53.1795608618839;
        Wed, 25 Nov 2026 04:10:18 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3645:b698:a929:4bcd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0bc695f31sm27657245ad.49.2026.11.25.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:10:18 -0800 (PST)
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
Subject: [PATCH v2] rust: error: add KUnit tests for errno conversions
Date: Wed, 25 Nov 2026 12:09:59 +0000
Message-ID: <20261125120959.244175-1-w1355457260@gmail.com>
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
- `name()` reporting the errno name, when `CONFIG_SYMBOLIC_ERRNAME`
  is enabled.

The tests are gated behind the new `CONFIG_RUST_ERROR_KUNIT_TEST`
option.

The suite passes when booting the kernel under QEMU with
`kunit.filter_glob=rust_kernel_error*`, with and without
`CONFIG_SYMBOLIC_ERRNAME` (the latter reports 5 passed, 1 skipped).

Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
Changes in v2:
- Gate `name_reports_errno_name` on `CONFIG_SYMBOLIC_ERRNAME`: when the
  option is disabled, `errname()` is a stub returning `NULL`, so
  `Error::name()` returns `None` and the test would fail (reported by
  Sashiko).

 rust/kernel/Kconfig.test |  10 ++++
 rust/kernel/error.rs     | 102 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

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
index 9003a1b86da8..7b82e60b87b0 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -666,3 +666,105 @@ pub fn from_result<T, F>(f: F) -> T
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
+    #[cfg(CONFIG_SYMBOLIC_ERRNAME)]
+    fn name_reports_errno_name() {
+        assert_eq!(code::EPERM.name().unwrap().to_bytes(), b"EPERM");
+        assert_eq!(code::EINVAL.name().unwrap().to_bytes(), b"EINVAL");
+        assert_eq!(code::ENOMEM.name().unwrap().to_bytes(), b"ENOMEM");
+    }
+}
-- 
2.54.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612193;
	b=O4PYYDecOY5MgdUg4xXL7jXGcTSHG9Pz5MarR9GagoYi04j/aOzr/r6pDfPlNe3E5Kkb
	 b28+eesKcO9HS9UTJ37GZdLj1W/bMzOWRFZ0Lf7PWi4YYo7U5WT1ClaYssHm5sT+vKHuc
	 ZBjiFWzrmsu4OMZNX+HV1ttW0MTjodiDm7ElvJkZlVtE9ZQNP7vtUS+ytepGeGCB5SgwI
	 7cRceO4jTHrcVffRq3TE0ju42R1hAG144LGPMy+soiFcbbW0AbDr5gj4eDilmAnD3yC33
	 c93D1zyH/U/JCXKvq6RkGOdASyKrA1jYMxIsR9cY4CtwL2xcK8uM9fbVIUto79k6yaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WSVKWf+6oLilXaO52zaN0623A+7yy4sCr5Af2u/k/ls=;
	b=D/0Pz2BKIjrcXkwvNOjGSi/m2wfMSFNoqDNrQf6XuTEuCEEHNREgTWTa5Dv5wabA43bx
	 YosjUZt4/soqBWrlxzNYC4HRY2IcPl98zpBsMFFPObv0t0cNiSQcyZE5w2g35lWqzo5YA
	 3YFWiflAgwlKjV+44V4kgybaF6TefUNdUlR7kTbyYltfsf34FBiiSpgXg2puuu+5y9nMr
	 Daj8H48RIV+JRDOqp7gI64kuh7JZqK5t9kO3uj0oildqkBclKm55bui4wIUFc2bp6Woq8
	 EijAbplCcte1yIFpdJ2KwEhwYj0MhMpi8fcX/t/G1PJ4F5HrT8/o55gBDATRsth93kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=npVkjMrg;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA7606A321
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 13:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDAA7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=npVkjMrg
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3b497279c25so1532317a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 05:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612192; x=1796216992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSVKWf+6oLilXaO52zaN0623A+7yy4sCr5Af2u/k/ls=;
        b=npVkjMrgbJwGY8wzFw0+1L0te7a4teFJ3bsItjVvPelkthf6dx/2nT+lXvaVPqJVV5
         01whmup+7Xd4P/YKv+Egpya4EavvMEst/o63SjeR0w6doUaI7WGy3+7ylZg99GRMnUrl
         KvaVA6Sdbncs2sY9+C3m7sWGJ+7R+ujWfdxzjn84m2p37k5YKcdy2eJ5+7tx779LVsXT
         mxHd4soLLczZGWqPUpOUWHJk0UbMqYLhEVT2z1RxyYYk8Hv6PZNy9j1nHbXbkxMvFF+O
         VcsabY1uo/lf2EjbUgJcSiiaitK7cgtaZa10cdBwkHoQwGBkF6O6hm1WeoiamouenBBb
         9UMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612192; x=1796216992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSVKWf+6oLilXaO52zaN0623A+7yy4sCr5Af2u/k/ls=;
        b=U9ZfBthPhY0na/vgKqppE6ozJNHw8bxjdGk65x1r1Wk3g832WqHosshnoGklid/7h2
         mOd7H7v0Bao4LxQWz/p9UHevSk5kjFSb5yLxGH9kW9N8s2l0dd/NZmoUzB9ntCOEJa+k
         FW+vctK10SwGHPmUw9g3pXBbJNF6ercy8Ka0IZD3zg9XHpyk84mV+Nk69QI+theoB2a3
         KN5GGQ575wolNqGLk2+mx7YvmsK3G0AuAQDG2zDv5Zkw6R+rUqB2MZuCxNQm6gee5NPl
         VonM+aeD0C+5zVLSCvj5jEjt5CsvsFVUwOM/Ga2SuTNSKsYe7kKCeNR4JZXhSjfkeO9D
         ZNBQ==
X-Forwarded-Encrypted: i=1; AL+hErFMtEiRSE3YnTOOOprT6mPClabde+kIrqdx2HaZf4fVl4p9mdt5tjv2m1aIX9imeKyeISA15zJxUTBLK4ag0A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9S9jGTaVartiDuqXNAgJJrZeUKEGukJLUJuuXKikxKZUST+Em1
	Mc72WQEgCNX5KJYzlE4OikZn54LdBQANmQXp2Nna8HJ3XRai5wTGMKFN
X-Gm-Gg: AZFdTZcB+ss7tzSjVHLi5O0Pugg0v4+Qgea6kZq0WPSYHzhSp04iF4LWGcA9Ijd0ieD
	Mo29AzgflcIDMfGtR2nKUxR04JypK8mZ6OMZ0DZTfzeZM0Lx5QUHoAwf77Sw88e+X/rqkLCp1RR
	yYmKnn2oQR1BjSpzeRGNxL3QK9prePlt6MRDrxp2e/KAKaATpt4mj6+AgmNd7prnnaF61GgjYLj
	5nvJ/G7690D6xwXHq2/SUBU2b0DKJpVK+bf8zu52I0kyEOSKcZJKXpyg5hHfpr3gZo56J8i9mxw
	p5e9ITnbR63P1u60rmFTsXUVBQST3psKztdQaYXHOgK2EY9JC7KNn9p1jXMO83yhAlnjQZ7jZly
	xSQQc9bzmMGOxZkl8ujrXIGi5nyhx5JL2R5TWIrvJHJEiEfXaNKUbU0VOgKXD8wCcqmIhVs6WKa
	22GT/W6oQCemME1aLXN1vrjgqPE6dchIJG0RnmiVmqPxdX1vWmDHi1+Uauf96u2I5L9vVhM+njJ
	nyzGyaE3f+eXpxoKmratPOp15ReVWOj6ePqhWUnRwTPMrO/o8I0yJ20fpy8B2SbXsZmhncWvbnX
	go41xyf937elFvwp5t39pOc6PZ8=
X-Received: by 2002:a17:90b:2c87:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b41c94df73mr17211306a91.49.1795612191963;
        Wed, 25 Nov 2026 05:09:51 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3645:b698:a929:4bcd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm28182285a91.2.2026.11.25.05.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:51 -0800 (PST)
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
Subject: [PATCH v3] rust: error: add KUnit tests for errno conversions
Date: Wed, 25 Nov 2026 13:09:30 +0000
Message-ID: <20261125130930.288234-1-w1355457260@gmail.com>
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
- `name()` reporting the errno name when `CONFIG_SYMBOLIC_ERRNAME`
  is enabled, and returning `None` otherwise.

The tests are gated behind the new `CONFIG_RUST_ERROR_KUNIT_TEST`
option.

The suite passes when booting the kernel under QEMU with
`kunit.filter_glob=rust_kernel_error*`, both with and without
`CONFIG_SYMBOLIC_ERRNAME` (all six tests pass in both cases).

Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
Thanks Miguel for the review.

Changes in v3:
- Keep `name_reports_errno_name` running in both configurations, with
  `cfg`-gated assertions for the `CONFIG_SYMBOLIC_ERRNAME` disabled case,
  as suggested by Miguel. Both configurations now run all six tests.

Changes in v2:
- Gate `name_reports_errno_name` on `CONFIG_SYMBOLIC_ERRNAME`: when the
  option is disabled, `errname()` is a stub returning `NULL`, so
  `Error::name()` returns `None` and the test would fail (reported by
  Sashiko).

 rust/kernel/Kconfig.test |  10 ++++
 rust/kernel/error.rs     | 113 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 123 insertions(+)

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
index 9003a1b86da8..6969864a75b7 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -666,3 +666,116 @@ pub fn from_result<T, F>(f: F) -> T
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
+        // `Error::name()` relies on `errname()`, which is a stub returning `NULL` when
+        // `CONFIG_SYMBOLIC_ERRNAME` is disabled.
+        #[cfg(CONFIG_SYMBOLIC_ERRNAME)]
+        {
+            assert_eq!(code::EPERM.name().unwrap().to_bytes(), b"EPERM");
+            assert_eq!(code::EINVAL.name().unwrap().to_bytes(), b"EINVAL");
+            assert_eq!(code::ENOMEM.name().unwrap().to_bytes(), b"ENOMEM");
+        }
+
+        #[cfg(not(CONFIG_SYMBOLIC_ERRNAME))]
+        {
+            assert_eq!(code::EPERM.name(), None);
+            assert_eq!(code::EINVAL.name(), None);
+            assert_eq!(code::ENOMEM.name(), None);
+        }
+    }
+}
-- 
2.54.0


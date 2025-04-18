Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FA81DF72E
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 01:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940538; cv=none; b=IIxMUkLRNBEVFdxK4wOzcRUNYDZCTG3craXfe5tksKBDIMprRPSqDbqSv18MM2k9FOX8E2k/y/1WCz8M/ZlxZS0MItjmOnhisBrlMCESiLWCfbiqD99yygarg01D30//1p5OK+4/cH6C62Q+T+TbdNrQ+nL0Z3RdslSmbLTHry0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940538; c=relaxed/simple;
	bh=AsXerO6M3JJeGimaY8r23ZEYRge1XS9d6tD5VYo6WLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrnbsjCx/P/jwEyik3GGLe6hDBGA+c1TisT+Ub7dXKd6RAVi0PHOjLoEjTWBSk6waWc3UbHpzl1z+r3IPiQ9dJtBxnLynB9BH12IOUlxOuWl2ALSGjWNAhXuv74SzyjtxCIcj3GA6wcT/fnIQdltG+bqsBRBbzCfrG/XbQNsvVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=tZHOk7Pz; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="tZHOk7Pz"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-700b17551cdso11837147b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 18:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940535; x=1745545335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KVr9YoaGaQgWb5xariEP7OGZvSaNc2U9G9atBahdE8=;
        b=tZHOk7PzZ5hFQbMPVsYyOaQUAZ3JAJ1orsikVgKRG9OEAyR4jScQ7Yr4ElW5hRnL21
         OmFOuol0VAqCdbX+Jh/8qGV1MR8S4q+xt5Bb46XcVYPolCbXYZEoXPr3vcyJzXci5ZKt
         XaYILBnoIimuWv1t21Cql7K6U6bLLLYpePG6ZIGqIPqaAE7KdCmTUs0aNWhyR+hGBD+h
         ibiSxKauIUoACs7eJ2BAOTUm+wvSY2mfS/pElIV6o2q7HOFO7QlrBy99M+4U4YvZODG9
         bhn/m5/jbQ+CPBlhcKGIg4lFz2j4Oz3ITZujljPXixUGDSnnZJ/d8tvBySuCI5rPzrhM
         3/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940535; x=1745545335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KVr9YoaGaQgWb5xariEP7OGZvSaNc2U9G9atBahdE8=;
        b=QZraU3lT3if/u6iJAcQPVNLBWRYWSb3/63b1ApQGLAV4nKXeIeerXZjpISFhiMsnym
         p46mDhm6qgcj6cSA8XuLpvup7QPnCw6G8I4NWX4GnHgQeNLYFtl9MlnHkIfmu1qaQtPs
         tUNL4Q5W8mz3JDwsRnnz1waC7Y8gAU8gn3nnxu7n14wK5cXt4DyAwzT/5jbd0jhq7yUC
         Lnhlahjg2h+xysLtSH/Vr16SoZjMHUzQHSE13SPmECGxYiJUPw42tvDQFBvnI49SlDlF
         91A0GqvqP0SmujUcL6Qm6xJe1kTwwQ746YT8p9aWJmDnvv1M/HrGHm5t3BJR8tExdd71
         jQEA==
X-Forwarded-Encrypted: i=1; AJvYcCU1M+OnkuWYLMEsmtCuWw0F9zOUt/V3LI+MCz73H86ljp5Ld++xPcIWCOck34m0CVEwNd+Xg1Drj4AdtsqBQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoBB7M4lsbvu+IH+jmGJ0VAGjsMqqQ0kzqkSZVrc+PEF+CWoop
	1dSiGb3EuTO/u61i30CjkxPpV67+0oHwOzvm/BL7E5wPehhBuqC1FqKb1F87O24=
X-Gm-Gg: ASbGncs1oh/gRlQ0a23GGaC4B7tkZ6LUDdggTWJSHjg2P4yO8N46H+pWP25+aOJrMMP
	Agk3pQ3HXHYp56CQEcJuoGfUEbSxpPuotiMK4gpGjdQnmBnVh/5idVpSUZMxk/vkhstjfF6BVuY
	mSnGbZB9b5/gvcCKdDLZ8dAR4rx5k0dKyPQVmaZaZANsuWmTZqiXTUg4/mlUaDVVHBe9QTXNeGs
	zQwIC6joLCHKUsjBSlywPPcUNX5nlwdmZvzRKhxyZHFT6i92x37EWb5gw2U7lNsqrC++8wCBwEX
	2v/C2F1kmgNnd6FyOV//umJpLZl6wnX+oqgbWXydFsJObmWXJNRjs4lHBS8Iou7AqtvOcJqaonL
	KZSOim3Hyihb1QFaoV9bTtY0SLMqa6N1zFA4V
X-Google-Smtp-Source: AGHT+IE/O6gWkQMozzU/sZ0vQ7iAMIJZ80Gw3gnlvoeuFzX09jFzx3stefvWq4XPYCQQb119QbF5Vg==
X-Received: by 2002:a05:690c:670b:b0:6fb:9c08:4980 with SMTP id 00721157ae682-706cce0e007mr15660347b3.27.1744940535286;
        Thu, 17 Apr 2025 18:42:15 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:14 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/18] rust: kunit: refactor to use `&raw [const|mut]`
Date: Thu, 17 Apr 2025 21:41:26 -0400
Message-ID: <20250418014143.888022-6-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/kunit.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 1604fb6a5b1b..9f8165b15a37 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -130,9 +130,9 @@ unsafe impl Sync for UnaryAssert {}
             unsafe {
                 $crate::bindings::__kunit_do_failed_assertion(
                     kunit_test,
-                    core::ptr::addr_of!(LOCATION.0),
+                    &raw const LOCATION.0,
                     $crate::bindings::kunit_assert_type_KUNIT_ASSERTION,
-                    core::ptr::addr_of!(ASSERTION.0.assert),
+                    &raw const ASSERTION.0.assert,
                     Some($crate::bindings::kunit_unary_assert_format),
                     core::ptr::null(),
                 );
@@ -261,7 +261,7 @@ macro_rules! kunit_unsafe_test_suite {
                     // (as documented) must be valid for the lifetime of
                     // the suite (i.e., static).
                     test_cases: unsafe {
-                        ::core::ptr::addr_of_mut!($test_cases)
+                        (&raw mut $test_cases)
                             .cast::<::kernel::bindings::kunit_case>()
                     },
                     suite_init: None,
@@ -283,7 +283,7 @@ macro_rules! kunit_unsafe_test_suite {
             #[cfg_attr(not(target_os = "macos"), link_section = ".kunit_test_suites")]
             static mut KUNIT_TEST_SUITE_ENTRY: *const ::kernel::bindings::kunit_suite =
                 // SAFETY: `KUNIT_TEST_SUITE` is static.
-                unsafe { ::core::ptr::addr_of_mut!(KUNIT_TEST_SUITE) };
+                unsafe { &raw mut KUNIT_TEST_SUITE };
         };
     };
 }
-- 
2.48.1


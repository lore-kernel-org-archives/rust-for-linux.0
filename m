Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD267B676
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 01:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940522; cv=none; b=p2cB94Jx1vFDZtcZBWdjMQYbLzhAA0E8fN9gQDsyVb+qVj8FzIe3aYhHQxjCn18hhCzYAnO58PHOpGWAiiFlhNVFV/N7sBdslcXsoBnl1WqbAxucQncP3RFxsFsCIOcZ1SMyMbaG4ZcRMJl/XWnxqDqHeK0AUqeralfW/ZCi6i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940522; c=relaxed/simple;
	bh=kom6gDwOvQlLWIY64LaKg/88QJeZpSqlKMB0/S7dG0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IA6365dOEoJxUDTcAqwi0XCToPOo7sqQzgHdNXE63QLasDczSXJVvagwvibLq/ZOCcWRhqg7Wli/t2jkEfETHuuVLGJ09SJeRE59PxF+V/Rlt5w88KmOoyUSL/DGT+24T7350QPzvKCSHeeqvi+FpH5rdTxqO8u5n1iKQ2UpkTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=O3/7knAw; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="O3/7knAw"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-707561e5fdcso1197777b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 18:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940519; x=1745545319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vZX6b4dOJQJVisyqBob3mx0+uYLldeHEIPiM/4owQ0=;
        b=O3/7knAweN67wPM4h5vOM9kmaVScSrD/GDJVfuqRJ/GfSzPFRbgbwoLVS6TO3u22I3
         sAX7JbbcQb7PMdv7dbWLZuF1uoJNLTkCkGDENR3p/qa+//24xzUA71r2m0U3ghWZpgii
         tVAvgKVUUuQylQ1vCXCjHFcw/38VblmJovoCatcZk3RGpIhnoSvMHEwjaUeZZ+DXT1qN
         L358GdaQHHBqOS4xQCUBus3g4w/8/hZpUfQPw+5mnB8/pkdfI0SwQZDAVwQlZes0cinN
         O+n2vqfAPoLrJO1ouep19XuQPO/+85V3TZErPNpfz8A/agaMfYcEducpF0308sbbkKpK
         7Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940519; x=1745545319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vZX6b4dOJQJVisyqBob3mx0+uYLldeHEIPiM/4owQ0=;
        b=aBt3aON87pmRjwUo1b73McFzkLqlQ/QlYWhwMyK6x1BWmbiy72EVhDb2uNYkYPrQmo
         zQY5vvobIoEdyPuI4E/jyMbOVKhwyxdscqpRv6F4XlXA62XUEAa9gv2btGFO/3lCt/qS
         g8eFhfmHtdVAa/ITqMXtKDHBhaGS6kWgHkoMFyaAMLZyDZNvUrscUvV8wpqqh64y1XG0
         +f4KmTM0OaD4/3ruAbyOlq18wH6n2pp5Dh6q2GDPhZxgV+A5zUPEm1AOI7trB1qEOi6g
         mV7MRQB4RdrSXvZXo0JP/sE7nOS2Qa5QmnCFz1IhdwtsxuAl9IaBGHCXbBrOb6vRaNG2
         d15w==
X-Forwarded-Encrypted: i=1; AJvYcCU597YlbT90jNhVchbJEytv3zZ5M/fjbPtT/KAqUw0E4tewUveLRQ2GHjZduxPF1UgKRXBLoLPxW0oCwxfYuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDH9GMfkkIzWjSizygK0DXQUV2Zq5Ip8ZmKm7uy4+baCn2LTNW
	iCzrlQCjz6RHMELRb39W8xFC1T0atM3+hGJpOKi8psFy4yqfD6VcPCF5iYd9qXc=
X-Gm-Gg: ASbGncv08A2/wDO9mmP55noI2wwNXgXUscvQeRRYJQX+Xmt+Q9LLFo5WPlRWgY0kFW6
	1DiwKKYGPE+6hw2AxhMsJ7APB2GSiOeC4gM1brtGlT+TDHavpJwby1ch/kGZKrB+kqkotKdVxqR
	e5catGU6FSKkqTGK3eP5OmReGG0gVQl9Dzl7EXkSM5ASYjlKdEQDtKm5VZ2w21HPtyg8BwqeVPx
	sjMc6uVkgtfztxAS9RRgh26fw/mnD3OyqLQvJ6uh2GFWX5u8R1HOsUxAPQqLuRd1jOaCZVejVD3
	yqYTYZ4fcOeaH2auQYNtd/66kmBbiYfpvo9INMa6nZ/6X4K19u+abPs1MwYd1ZxSNSBQn2IQ8mg
	Hig11nM7W/WM4tSNhQLXD53qFjaaFPRQAs7tdsv51R+NmyT4=
X-Google-Smtp-Source: AGHT+IHKWD99S0F6KCgIeVvybd53+ijSAXdB3OgMVFyeT/tM2oA/5o0gqeKoz8LgS6Bcx3tB8BsaLg==
X-Received: by 2002:a05:690c:3685:b0:6ff:1fac:c502 with SMTP id 00721157ae682-706ccce2277mr16272657b3.6.1744940519476;
        Thu, 17 Apr 2025 18:41:59 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:41:59 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Benno Lossin <benno.lossin@proton.me>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/18] rust: init: refactor to use `&raw mut`
Date: Thu, 17 Apr 2025 21:41:22 -0400
Message-ID: <20250418014143.888022-2-contact@antoniohickey.com>
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

Replacing all occurrences of `addr_of_mut!(place)`
with `&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/init.rs         |  4 ++--
 rust/pin-init/src/macros.rs | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 8d228c237954..5646b1079776 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -69,7 +69,7 @@
 //! ```rust,ignore
 //! # #![allow(unreachable_pub, clippy::disallowed_names)]
 //! use kernel::{prelude::*, types::Opaque};
-//! use core::{ptr::addr_of_mut, marker::PhantomPinned, pin::Pin};
+//! use core::{marker::PhantomPinned, pin::Pin};
 //! # mod bindings {
 //! #     #![allow(non_camel_case_types)]
 //! #     pub struct foo;
@@ -105,7 +105,7 @@
 //!         unsafe {
 //!             pin_init::pin_init_from_closure(move |slot: *mut Self| {
 //!                 // `slot` contains uninit memory, avoid creating a reference.
-//!                 let foo = addr_of_mut!((*slot).foo);
+//!                 let foo = &raw mut (*slot).foo;
 //!
 //!                 // Initialize the `foo`
 //!                 bindings::init_foo(Opaque::raw_get(foo));
diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
index 361623324d5c..28a91a1e1218 100644
--- a/rust/pin-init/src/macros.rs
+++ b/rust/pin-init/src/macros.rs
@@ -244,7 +244,7 @@
 //!                     struct __InitOk;
 //!                     // This is the expansion of `t,`, which is syntactic sugar for `t: t,`.
 //!                     {
-//!                         unsafe { ::core::ptr::write(::core::addr_of_mut!((*slot).t), t) };
+//!                         unsafe { ::core::ptr::write(&raw mut (*slot).t, t) };
 //!                     }
 //!                     // Since initialization could fail later (not in this case, since the
 //!                     // error type is `Infallible`) we will need to drop this field if there
@@ -258,7 +258,7 @@
 //!                     // of the `unsafe` block, so we bind it here.
 //!                     {
 //!                         let x = 0;
-//!                         unsafe { ::core::ptr::write(::core::addr_of_mut!((*slot).x), x) };
+//!                         unsafe { ::core::ptr::write(&raw mut (*slot).x, x) };
 //!                     }
 //!                     // We again create a `DropGuard`.
 //!                     let __x_guard = unsafe {
@@ -459,13 +459,13 @@
 //!         {
 //!             struct __InitOk;
 //!             {
-//!                 unsafe { ::core::ptr::write(::core::addr_of_mut!((*slot).a), a) };
+//!                 unsafe { ::core::ptr::write(&raw mut (*slot).a, a) };
 //!             }
 //!             let __a_guard = unsafe {
 //!                 ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).a))
 //!             };
 //!             let init = Bar::new(36);
-//!             unsafe { data.b(::core::addr_of_mut!((*slot).b), b)? };
+//!             unsafe { data.b(&raw mut (*slot).b, b)? };
 //!             let __b_guard = unsafe {
 //!                 ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).b))
 //!             };
@@ -1215,7 +1215,7 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
         // SAFETY: `slot` is valid, because we are inside of an initializer closure, we
         // return when an error/panic occurs.
         // We also use the `data` to require the correct trait (`Init` or `PinInit`) for `$field`.
-        unsafe { $data.$field(::core::ptr::addr_of_mut!((*$slot).$field), init)? };
+        unsafe { $data.$field(&raw mut (*$slot).$field, init)? };
         // Create the drop guard:
         //
         // We rely on macro hygiene to make it impossible for users to access this local variable.
@@ -1277,7 +1277,7 @@ fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
             // Initialize the field.
             //
             // SAFETY: The memory at `slot` is uninitialized.
-            unsafe { ::core::ptr::write(::core::ptr::addr_of_mut!((*$slot).$field), $field) };
+            unsafe { ::core::ptr::write(&raw mut (*$slot).$field, $field) };
         }
         // Create the drop guard:
         //
-- 
2.48.1


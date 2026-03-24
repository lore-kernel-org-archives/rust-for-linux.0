Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855393033E8
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349413; cv=none; b=Cn6msDyfGkaKUGNBvsNrp86fNmPd721fn0Zafz9zn4tobWh1LboeTQI1imheDDoFl17YRg7hRdcepa3iQ1ZNmU4SxpH2JCAgZNx+ewAZWGz66VyAJIPxTuzHFYyy3k7PL8t0LKlRNh4fSM2NTzsZmv6pooFkn4SFOeJhBiAFT+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349413; c=relaxed/simple;
	bh=wSjqerR0yFk9dlzsesUEREk/JITUdZDk3miGdH+M2IA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=C8fLgIriw5zsh0Jfu5fy/8EzdZFref5tFZlf9EZ8YaDSOD+enoiP7FxjvMdGjU/nAW4kPSD/Q33BiKaureuGpgHB1gMA2JhLWFnichtkNovZ+IbKUCPI6zfDrtFXdbJyptMPqtXDaRJvn9buJNyjlb0PT82hBwnNGfwFhyJRF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nMpp2SUC; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nMpp2SUC"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b941d4b7f2cso820421266b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 03:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774349408; x=1774954208; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/FY5xCX898SeUEbx5o5iNBa4HfVy2tCVVKrhr/lMRQg=;
        b=nMpp2SUCgOtu6L4gbd48x6nHO5xvWAVBTLVhDPRBu+IWVH7pGW+oLxR3W4ojC+2YSb
         X2xuA/hGntQwOXkJxIGIHWwVvIRlM+alDjy+8mO1XlvQk2od0ipel/CzH/YEg2D+zkTs
         JeURQ279qy4yJ/mipjZMFv2RD3gRDpSy6w9t8P6MzwSVEw2SCRcl03vdzFAAVUIlGoXj
         pjUE2fXkZKKzJnK1uipIOHvS/z52Ix36DrwImZ7Cc/cFEn8IbZXm76Z0h0u8W++fgNqT
         resymSXM3w9nyhCg9nl0zPM3MhLSFAqDy203gixsixHnqhle6ez8i40ZA2QAjVn1i28p
         9x+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349408; x=1774954208;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/FY5xCX898SeUEbx5o5iNBa4HfVy2tCVVKrhr/lMRQg=;
        b=HZAzLyH+5B89f/jAOs0k+JW7Bh3zYGYotP9LKJD3mXNk+MDQQcUO6WciDWtG28BFRb
         Sp1ZMDSjaAzXKcSri0S+xxv3ZZDGzORs6UTw3fjXbqVlWncy1B9MhrXLPo8q527D+fkq
         fjNiOd5JoYCmNC7Vwx4FioPVK/ryuE+4olvKan8I3Ic93crGm+ySf7z1mgIOmfcpvQ6i
         wIgzQ6KyLmAjkN6ixuoa+Hx0IFb7PyRGcsbp/7HmPrEE3qz4LyzI679p6tq6c8eIaVwr
         GOpbTbQ432RaVav2Bk43WR03au44EV9nLna+gM/NE+pmwIjxdJSR+tWO9Wimv/3lT1b7
         74WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYKbx9a6lvdjDomrLVC/UYFqPCS0GEMMPEzAn3ahP82fnqL1kBgI4dGpvOL70rYrfD7phwlX4Iajde6sTijQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxPwYbRdmgR3gIQeFKJetFg0Z4vxkpEkEkLv4tFDmysrFZ98TU
	YIlv5QMyPGMWGotQ//HWdvpLMVyLQesIKwAW1MVezsmqq39thdqs8USP7L7zks7lHvHlyB4sQhN
	sHD+VXIQEc5WtQS4Smg==
X-Received: from edsy11.prod.google.com ([2002:aa7:c4eb:0:b0:667:62d1:3f5d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:8b89:b0:b97:aacd:9e83 with SMTP id a640c23a62f3a-b982f210021mr1095181666b.23.1774349407909;
 Tue, 24 Mar 2026 03:50:07 -0700 (PDT)
Date: Tue, 24 Mar 2026 10:49:59 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFZswmkC/x2MQQqAIBAAvxJ7TqgtjPpKdDDbbCE01opA+nvSc
 QZmEkQSpghDkUDo5sjBZ6jLAuxmvCPFS2bACnXVYKuE3LWbM4ha+VG17hA7M1vbI+TmEMr6/43 T+34E5STPXwAAAA==
X-Change-Id: 20260324-regulator-fix-167227abcc92
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5543; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wSjqerR0yFk9dlzsesUEREk/JITUdZDk3miGdH+M2IA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpwmxaWym9oVHvY6aoUQA/dHg6UQFoxh68+cUyw
 CCcTClvAsqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacJsWgAKCRAEWL7uWMY5
 Rs7sD/9C2XrPKflPmbYSd6Sqt8NuTW3xyYwpEuhe325vm4V3/h293dPjDBUfLwHPQoKy9eT+I7n
 mNvvwnsXUEWT8BLVKKychLqmxfZHDMPKeW13zjgyxoexuw/d5eaz3h5SupL3JvjGBbXwAXZhIsi
 Mhp1EnSlwEGZklDmNyYz74KagcZXUvlhrRGRc2fA+UrVsk3h+A1DYI82/KinT8X+7KQHQ6MN8HT
 OXGyCfAXFyNBoz1UtSuddRzUaAceXWvfsZ+1p7RvITzeI7HdlaTSSWa0z7+mwJVXDFbln9KtE4u
 9GArLUEWFwtLrqmCR4QF+7E7comb+7eC0+eM1TBzTtjMtZfSS/xhR5PpfnDUiFg/kGthit7TerL
 abOfkpeAQi7lsENtVs6ME6P+XQEgcFA967JikqHuhtg09kWB+OnqtfZBPVGa7zqkdBdwGXFrpIB
 /F2v6qVCJULllrfz4C2RMCuyUYZFpztOvQ7KPClz24ZUmeUjX42irnYdVWBuMYNIEhxmijnhGgz
 S+T2lqhMGDEEjkUsg4ZeBxba5vXO1ZQSV47dkIgdikoVHGNNetIXSJM2J44tgfqSYOgj3QX9JUa
 bj3eNBmhVIel+CCWD/SLsvKEZXM6Zr1vd7ceOJgcLNrO+K72Sn3DtUy9bCZ0wgWSZqmWyynka90 BC6KNcqewnRKMoA==
X-Mailer: b4 0.14.3
Message-ID: <20260324-regulator-fix-v1-1-a5244afa3c15@google.com>
Subject: [PATCH] rust: regulator: do not assume that regulator_get() returns non-null
From: Alice Ryhl <aliceryhl@google.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jean Delvare <khali@linux-fr.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The Rust `Regulator` abstraction uses `NonNull` to wrap the underlying
`struct regulator` pointer. When `CONFIG_REGULATOR` is disabled, the C
stub for `regulator_get` returns `NULL`. `from_err_ptr` does not treat
`NULL` as an error, so it was passed to `NonNull::new_unchecked`,
causing undefined behavior.

Fix this by using a raw pointer `*mut bindings::regulator` instead of
`NonNull`. This allows `inner` to be `NULL` when `CONFIG_REGULATOR` is
disabled, and leverages the C stubs which are designed to handle `NULL`
or are no-ops.

Fixes: 9b614ceada7c ("rust: regulator: add a bare minimum regulator abstraction")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/r/20260322193830.89324-1-ojeda@kernel.org
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/regulator.rs | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
index 4f7837c7e53a..41e730cedc81 100644
--- a/rust/kernel/regulator.rs
+++ b/rust/kernel/regulator.rs
@@ -23,7 +23,10 @@
     prelude::*,
 };
 
-use core::{marker::PhantomData, mem::ManuallyDrop, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    mem::ManuallyDrop, //
+};
 
 mod private {
     pub trait Sealed {}
@@ -229,15 +232,17 @@ pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> Result {
 ///
 /// # Invariants
 ///
-/// - `inner` is a non-null wrapper over a pointer to a `struct
-///   regulator` obtained from [`regulator_get()`].
+/// - `inner` is a pointer obtained from a successful call to
+///   [`regulator_get()`]. It is treated as an opaque token that may only be
+///   accessed using C API methods (e.g., it may be `NULL` if the C API returns
+///   `NULL`).
 ///
 /// [`regulator_get()`]: https://docs.kernel.org/driver-api/regulator.html#c.regulator_get
 pub struct Regulator<State>
 where
     State: RegulatorState,
 {
-    inner: NonNull<bindings::regulator>,
+    inner: *mut bindings::regulator,
     _phantom: PhantomData<State>,
 }
 
@@ -249,7 +254,7 @@ pub fn set_voltage(&self, min_voltage: Voltage, max_voltage: Voltage) -> Result
         // SAFETY: Safe as per the type invariants of `Regulator`.
         to_result(unsafe {
             bindings::regulator_set_voltage(
-                self.inner.as_ptr(),
+                self.inner,
                 min_voltage.as_microvolts(),
                 max_voltage.as_microvolts(),
             )
@@ -259,7 +264,7 @@ pub fn set_voltage(&self, min_voltage: Voltage, max_voltage: Voltage) -> Result
     /// Gets the current voltage of the regulator.
     pub fn get_voltage(&self) -> Result<Voltage> {
         // SAFETY: Safe as per the type invariants of `Regulator`.
-        let voltage = unsafe { bindings::regulator_get_voltage(self.inner.as_ptr()) };
+        let voltage = unsafe { bindings::regulator_get_voltage(self.inner) };
 
         to_result(voltage).map(|()| Voltage::from_microvolts(voltage))
     }
@@ -270,10 +275,8 @@ fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
             // received from the C code.
             from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_char_ptr()) })?;
 
-        // SAFETY: We can safely trust `inner` to be a pointer to a valid
-        // regulator if `ERR_PTR` was not returned.
-        let inner = unsafe { NonNull::new_unchecked(inner) };
-
+        // INVARIANT: `inner` is a pointer obtained from `regulator_get()`, and
+        // the call was successful.
         Ok(Self {
             inner,
             _phantom: PhantomData,
@@ -282,12 +285,12 @@ fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
 
     fn enable_internal(&self) -> Result {
         // SAFETY: Safe as per the type invariants of `Regulator`.
-        to_result(unsafe { bindings::regulator_enable(self.inner.as_ptr()) })
+        to_result(unsafe { bindings::regulator_enable(self.inner) })
     }
 
     fn disable_internal(&self) -> Result {
         // SAFETY: Safe as per the type invariants of `Regulator`.
-        to_result(unsafe { bindings::regulator_disable(self.inner.as_ptr()) })
+        to_result(unsafe { bindings::regulator_disable(self.inner) })
     }
 }
 
@@ -349,7 +352,7 @@ impl<T: IsEnabled> Regulator<T> {
     /// Checks if the regulator is enabled.
     pub fn is_enabled(&self) -> bool {
         // SAFETY: Safe as per the type invariants of `Regulator`.
-        unsafe { bindings::regulator_is_enabled(self.inner.as_ptr()) != 0 }
+        unsafe { bindings::regulator_is_enabled(self.inner) != 0 }
     }
 }
 
@@ -359,11 +362,11 @@ fn drop(&mut self) {
             // SAFETY: By the type invariants, we know that `self` owns a
             // reference on the enabled refcount, so it is safe to relinquish it
             // now.
-            unsafe { bindings::regulator_disable(self.inner.as_ptr()) };
+            unsafe { bindings::regulator_disable(self.inner) };
         }
         // SAFETY: By the type invariants, we know that `self` owns a reference,
         // so it is safe to relinquish it now.
-        unsafe { bindings::regulator_put(self.inner.as_ptr()) };
+        unsafe { bindings::regulator_put(self.inner) };
     }
 }
 

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260324-regulator-fix-167227abcc92

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


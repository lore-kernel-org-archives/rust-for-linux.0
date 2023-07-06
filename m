Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D2BEB64D9
	for <rust-for-linux@archiver.kernel.org>; Thu,  6 Jul 2023 04:08:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232991AbjGFEIY (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 6 Jul 2023 00:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbjGFEIR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 6 Jul 2023 00:08:17 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47FFB19B6
        for <rust-for-linux@vger.kernel.org>; Wed,  5 Jul 2023 21:08:15 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-66872dbc2efso74139b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Jul 2023 21:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688616495; x=1691208495;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+m5KR/PFrZTx6enXhEab+8qc17Vd1q2W5VFLDwWkbQ=;
        b=R5NcCD01zaht+0iTMfXWFXoJFCphRQYKe/Jn8z1qPx5tIx9VB0B3kvVkkPioLGKh4O
         XsYliNzcIGDeWc4tUWZx+Ce3jWC3TUAeFAmSexkR2XnW/9deZlXoVlleLqCPx/F9YUiI
         S98lZgSrU9LZepXK42QTq+2hfwHJgVKZyr+S3BdwKMi/EznAtCmpwqHcttrHBvFyCvHg
         x+r4+OKLNn1WNel1xC3adKiO8RpF1j9r/PiTrIpUuc+YASRfEAnhwpDuavhqUmiXmYTX
         tK7NJDzEEsSgiOlCvvZQ2bGSe57xvI2Pu6hGKbbpBU83WMqjEVvJkm58NrOqrW+eA3fZ
         WcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688616495; x=1691208495;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o+m5KR/PFrZTx6enXhEab+8qc17Vd1q2W5VFLDwWkbQ=;
        b=E5GQtNiIURDUG1ESkFonjncVE/g9LzxcXX9fFS1PpJG8RRi3BrITqoDVtg2IrO1FAW
         +IgPPn325i2Vt9GE1wi/Qw0K7OO9URYbJjQmTlhCAVr8pSWSOukm+59MCBKkJ7qBv0a9
         k9l5+8MXh9okKlsasn9tRxb8U4zaSV71HqoErp3vujiuH238MoBGjEhYM1q5gIyaMv5r
         YwtTMvEYjygXHShLhH5OA5YtFdljOW37yNx9naTC2HGBPwD6bDyRfeOUYZ056VGkQKWJ
         rlY7volorqDUsv6OYyYxd+1oXDuLr3QR01p9TcPngzJ/Gk6DJ+LCMbyzzIAZ9q8JYbmC
         PYRg==
X-Gm-Message-State: ABy/qLaidFcwyG3JFN3VZIrDOl99R7U6k0YAQyVHCT92jvNsuXO3T4ID
        lcPzI+9o5Tyc6ERH0E6GIqQ=
X-Google-Smtp-Source: APBJJlETwzDsOFcif2ZNKCE2xKuzmHlfPL81nGvq6iHCdll4hL2SELo3eS71zxwBsw4x6vfreuFp2A==
X-Received: by 2002:a05:6a00:14c9:b0:682:59aa:178d with SMTP id w9-20020a056a0014c900b0068259aa178dmr782680pfu.1.1688616494488;
        Wed, 05 Jul 2023 21:08:14 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id b3-20020aa78103000000b0064f7c56d8b7sm263655pfi.219.2023.07.05.21.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 21:08:13 -0700 (PDT)
Date:   Thu, 06 Jul 2023 13:05:30 +0900 (JST)
Message-Id: <20230706.130530.28972016277282041.ubuntu@gmail.com>
To:     benno.lossin@proton.me
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/2] rust: add Random Number Generator
 algorithms support
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <0_ad81AiwBp5KWLfbBfeHP4ABr4cPr7B1WaKdx__tWLIZI75vsBSVA4Yzk9_5q7MAgTlafWxIMX86-SoHhWwEQ8FWs7anjul0a2wjIwqTGc=@proton.me>
References: <20230615142311.4055228-1-fujita.tomonori@gmail.com>
        <20230615142311.4055228-3-fujita.tomonori@gmail.com>
        <0_ad81AiwBp5KWLfbBfeHP4ABr4cPr7B1WaKdx__tWLIZI75vsBSVA4Yzk9_5q7MAgTlafWxIMX86-SoHhWwEQ8FWs7anjul0a2wjIwqTGc=@proton.me>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Mon, 19 Jun 2023 11:41:29 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

>> diff --git a/rust/kernel/crypto/rng.rs b/rust/kernel/crypto/rng.rs
>> new file mode 100644
>> index 000000000000..2215a8344669
>> --- /dev/null
>> +++ b/rust/kernel/crypto/rng.rs
>> @@ -0,0 +1,72 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Random number generator.
>> +//!
>> +//! C headers: [`include/crypto/rng.h`](../../../../include/crypto/rng.h)
>> +
>> +use crate::{
>> +    error::{from_err_ptr, to_result, Result},
>> +    str::CStr,
>> +};
>> +
>> +/// Corresponds to the kernel's `struct crypto_rng`.
>> +///
>> +/// # Invariants
>> +///
>> +/// The pointer is valid.
>> +pub struct Rng(*mut bindings::crypto_rng);
>> +
>> +impl Drop for Rng {
>> +    fn drop(&mut self) {
>> +        // SAFETY: The type invariant guarantees that `self.0` is valid.
> 
> This safety comment should explain why it is safe to access this mutable
> static variable.
> 
>> +        if unsafe { bindings::crypto_default_rng } == self.0 {
>> +            // SAFETY: FFI call.
>> +            unsafe {
>> +                bindings::crypto_put_default_rng();
>> +            }
>> +        } else {
>> +            // SAFETY: The type invariant guarantees that `self.0` is valid.
>> +            unsafe { bindings::crypto_free_rng(self.0) };
>> +        }
>> +    }
>> +}

crypto_get_default_rng() is called during the initialization so it's
safe to access to bindings::crypto_default_rng. However, it's cleaner
to use an internal type like the following?

diff --git a/rust/kernel/crypto/rng.rs b/rust/kernel/crypto/rng.rs
new file mode 100644
index 000000000000..1d5d16577f3e
--- /dev/null
+++ b/rust/kernel/crypto/rng.rs
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Random number generator.
+//!
+//! C headers: [`include/crypto/rng.h`](../../../../include/crypto/rng.h)
+
+use crate::{
+    error::{code::EINVAL, from_err_ptr, to_result, Result},
+    str::CStr,
+};
+
+/// Type of Random number generator.
+///
+/// # Invariants
+///
+/// The pointer is valid.
+enum RngType {
+    /// Uses `crypto_default_rng`
+    Default(*mut bindings::crypto_rng),
+
+    /// Allocated via `crypto_alloc_rng.
+    Allocated(*mut bindings::crypto_rng),
+}
+
+/// Corresponds to the kernel's `struct crypto_rng`.
+pub struct Rng(RngType);
+
+impl Drop for Rng {
+    fn drop(&mut self) {
+        match self.0 {
+            RngType::Default(_) => {
+                // SAFETY: it's safe because `crypto_get_default_rng()` was called during
+                // the initialization.
+                unsafe {
+                    bindings::crypto_put_default_rng();
+                }
+            }
+            RngType::Allocated(ptr) => {
+                // SAFETY: The type invariants of `RngType` guarantees that the pointer is valid.
+                unsafe { bindings::crypto_free_rng(ptr) };
+            }
+        }
+    }
+}
+
+impl Rng {
+    /// Creates a [`Rng`] instance.
+    pub fn new(name: &CStr, t: u32, mask: u32) -> Result<Self> {
+        // SAFETY: There are no safety requirements for this FFI call.
+        let ptr = unsafe { from_err_ptr(bindings::crypto_alloc_rng(name.as_char_ptr(), t, mask)) }?;
+        // INVARIANT: `ptr` is valid and non-null since `crypto_alloc_rng`
+        // returned a valid pointer which was null-checked.
+        Ok(Self(RngType::Allocated(ptr)))
+    }
+
+    /// Creates a [`Rng`] instance with a default algorithm.
+    pub fn new_with_default() -> Result<Self> {
+        // SAFETY: There are no safety requirements for this FFI call.
+        to_result(unsafe { bindings::crypto_get_default_rng() })?;
+        // INVARIANT: The C API guarantees that `crypto_default_rng` is valid until
+        // `crypto_put_default_rng` is called.
+        Ok(Self(RngType::Default(unsafe {
+            bindings::crypto_default_rng
+        })))
+    }
+
+    /// Get a random number.
+    pub fn generate(&mut self, src: &[u8], dst: &mut [u8]) -> Result {
+        if src.len() > u32::MAX as usize || dst.len() > u32::MAX as usize {
+            return Err(EINVAL);
+        }
+        let ptr = match self.0 {
+            RngType::Default(ptr) => ptr,
+            RngType::Allocated(ptr) => ptr,
+        };
+        // SAFETY: The type invariants of `RngType' guarantees that the pointer is valid.
+        to_result(unsafe {
+            bindings::crypto_rng_generate(
+                ptr,
+                src.as_ptr(),
+                src.len() as u32,
+                dst.as_mut_ptr(),
+                dst.len() as u32,
+            )
+        })
+    }
+
+    /// Re-initializes the [`Rng`] instance.
+    pub fn reset(&mut self, seed: &[u8]) -> Result {
+        if seed.len() > u32::MAX as usize {
+            return Err(EINVAL);
+        }
+        let ptr = match self.0 {
+            RngType::Default(ptr) => ptr,
+            RngType::Allocated(ptr) => ptr,
+        };
+        // SAFETY: The type invariants of `RngType' guarantees that the pointer is valid.
+        to_result(unsafe { bindings::crypto_rng_reset(ptr, seed.as_ptr(), seed.len() as u32) })
+    }
+}
-- 
2.34.1


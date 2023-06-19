Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4423EB64DA
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Jun 2023 11:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjFSLlz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Jun 2023 07:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbjFSLlt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Jun 2023 07:41:49 -0400
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D291AE
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jun 2023 04:41:37 -0700 (PDT)
Date:   Mon, 19 Jun 2023 11:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=i4qqnmugofbftpzbtagv4wxfeq.protonmail; t=1687174895; x=1687434095;
        bh=jfwkp6qmJDXQZ6jWBQKZKlxAaUd82g/yZK5XhrJ7WSg=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=NHHO/lNoIkXLBDeSUSeiXgT7Hla+akkw6NcWeqtrmivGnCum9ePm5CsFsQNhxGIpg
         DBBHQ+No+I4jxkY72qVnRZDGG+raYnaOaGhuq0WlfsD6jA9kIIsrFL9hDYiOKeYWr8
         tVCqgvZYVYIeqf0f0NXyGZyXwHFeluS68Wx9ca5WN8Oul0WLJxemB9o3Np0eJQa98Q
         RLsHIvUyrhylCRhc1w/RilTpuv7Y50JYh44F28C0YTxhqlOByopqSwXkP6N0qqfWsf
         hcP5xM6NvCtlwXIXm41jcY6CsU1MaHsr7w6Kh6W9KG8uKdPt33bn3+MWXloSHekINt
         wsfZ9iw7MnkTg==
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
From:   Benno Lossin <benno.lossin@proton.me>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/2] rust: add Random Number Generator algorithms support
Message-ID: <0_ad81AiwBp5KWLfbBfeHP4ABr4cPr7B1WaKdx__tWLIZI75vsBSVA4Yzk9_5q7MAgTlafWxIMX86-SoHhWwEQ8FWs7anjul0a2wjIwqTGc=@proton.me>
In-Reply-To: <20230615142311.4055228-3-fujita.tomonori@gmail.com>
References: <20230615142311.4055228-1-fujita.tomonori@gmail.com> <20230615142311.4055228-3-fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers.c                  | 12 ++++++
>  rust/kernel/crypto.rs           |  1 +
>  rust/kernel/crypto/rng.rs       | 72 +++++++++++++++++++++++++++++++++
>  4 files changed, 86 insertions(+)
>  create mode 100644 rust/kernel/crypto/rng.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 2f198c6d5de5..089ac38c6461 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -7,6 +7,7 @@
>   */
>=20
>  #include <crypto/hash.h>
> +#include <crypto/rng.h>
>  #include <linux/errname.h>
>  #include <linux/slab.h>
>  #include <linux/refcount.h>
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 7966902ed8eb..e4dcd611738f 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -19,6 +19,7 @@
>   */
>=20
>  #include <crypto/hash.h>
> +#include <crypto/rng.h>
>  #include <linux/bug.h>
>  #include <linux/build_bug.h>
>  #include <linux/err.h>
> @@ -52,6 +53,17 @@ int rust_helper_crypto_shash_init(struct shash_desc *d=
esc) {
>  =09return crypto_shash_init(desc);
>  }
>  EXPORT_SYMBOL_GPL(rust_helper_crypto_shash_init);
> +
> +void rust_helper_crypto_free_rng(struct crypto_rng *tfm) {
> +=09crypto_free_rng(tfm);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_crypto_free_rng);
> +
> +int rust_helper_crypto_rng_generate(struct crypto_rng *tfm, const u8 *sr=
c,
> +=09unsigned int slen, u8 *dst, unsigned int dlen) {
> +=09return crypto_rng_generate(tfm, src, slen, dst, dlen);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_crypto_rng_generate);
>  #endif
>=20
>  __noreturn void rust_helper_BUG(void)
> diff --git a/rust/kernel/crypto.rs b/rust/kernel/crypto.rs
> index f80dd7bd3381..a1995e6c85d4 100644
> --- a/rust/kernel/crypto.rs
> +++ b/rust/kernel/crypto.rs
> @@ -3,3 +3,4 @@
>  //! Cryptography.
>=20
>  pub mod hash;
> +pub mod rng;
> diff --git a/rust/kernel/crypto/rng.rs b/rust/kernel/crypto/rng.rs
> new file mode 100644
> index 000000000000..2215a8344669
> --- /dev/null
> +++ b/rust/kernel/crypto/rng.rs
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Random number generator.
> +//!
> +//! C headers: [`include/crypto/rng.h`](../../../../include/crypto/rng.h=
)
> +
> +use crate::{
> +    error::{from_err_ptr, to_result, Result},
> +    str::CStr,
> +};
> +
> +/// Corresponds to the kernel's `struct crypto_rng`.
> +///
> +/// # Invariants
> +///
> +/// The pointer is valid.
> +pub struct Rng(*mut bindings::crypto_rng);
> +
> +impl Drop for Rng {
> +    fn drop(&mut self) {
> +        // SAFETY: The type invariant guarantees that `self.0` is valid.

This safety comment should explain why it is safe to access this mutable
static variable.

> +        if unsafe { bindings::crypto_default_rng } =3D=3D self.0 {
> +            // SAFETY: FFI call.
> +            unsafe {
> +                bindings::crypto_put_default_rng();
> +            }
> +        } else {
> +            // SAFETY: The type invariant guarantees that `self.0` is va=
lid.
> +            unsafe { bindings::crypto_free_rng(self.0) };
> +        }
> +    }
> +}
> +
> +impl Rng {
> +    /// Creates a [`Rng`] instance.
> +    pub fn new(name: &CStr, t: u32, mask: u32) -> Result<Self> {
> +        // SAFETY: FFI call.

If there are no requirements then say so.

> +        let ptr =3D unsafe { from_err_ptr(bindings::crypto_alloc_rng(nam=
e.as_char_ptr(), t, mask)) }?;
> +        // INVARIANT: `ptr` is valid and non-null since `crypto_alloc_rn=
g`
> +        // returned a valid pointer which was null-checked.
> +        Ok(Self(ptr))
> +    }
> +
> +    /// Creates a [`Rng`] instance with a default algorithm.
> +    pub fn new_with_default() -> Result<Self> {
> +        // SAFETY: FFI call.
> +        to_result(unsafe { bindings::crypto_get_default_rng() })?;
> +        // SAFETY: The C API guarantees that `crypto_default_rng` is val=
id until
> +        // `crypto_put_default_rng` is called.
> +        Ok(Self(unsafe { bindings::crypto_default_rng }))
> +    }
> +
> +    /// Get a random number.
> +    pub fn generate(&mut self, src: &[u8], dst: &mut [u8]) -> Result {
> +        // SAFETY: The type invariant guarantees that the pointer is val=
id.
> +        to_result(unsafe {
> +            bindings::crypto_rng_generate(
> +                self.0,
> +                src.as_ptr(),
> +                src.len() as u32,

What happens when `src.len() > u32::MAX`? Then it will overflow here and
write less than `len` random bytes. Not sure what we want to do in this=20
case though, maybe call it in a loop? Return an error? Also below.

> +                dst.as_mut_ptr(),
> +                dst.len() as u32,
> +            )
> +        })
> +    }
> +
> +    /// Re-initializes the [`Rng`] instance.
> +    pub fn reset(&mut self, seed: &[u8]) -> Result {
> +        // SAFETY: The type invariant guarantees that the pointer is val=
id.
> +        to_result(unsafe { bindings::crypto_rng_reset(self.0, seed.as_pt=
r(), seed.len() as u32) })

Same problem with the as u32 cast here.

--
Cheers,
Benno

> +    }
> +}
> --
> 2.34.1
> 

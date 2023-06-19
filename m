Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B2EEB64D9
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Jun 2023 11:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjFSLlY (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Jun 2023 07:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbjFSLlX (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Jun 2023 07:41:23 -0400
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7A2E4F
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jun 2023 04:40:50 -0700 (PDT)
Date:   Mon, 19 Jun 2023 11:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=nnq7fg4d7jgndoqwst53jetwki.protonmail; t=1687174847; x=1687434047;
        bh=iiuc7llfs/NlViGXxR+9ZxxI6eQe+Ru4NPQ0iDdMoHg=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=lipxjjbHMsgFTwMMd6hNaR33oe/f/PqOCl8GWaeL+D9sYjRDpHlRSEj5kGZqheeR0
         U6QbcVgoCd6duW2GUByrcHLroQhMr9SjGBzzmlHK4638AGlukoSqUc2JbDxrhfUkR5
         xmKCqhJcDp7fyItBtlyf0mcLFRAVKcPEjMIuYI5fusmQ8Fneyz6TcjCNjPm43Kryij
         SFRrDC7oXFmQZKb0Bq3Wk7knZs1w4tMIaFTUoDOUEyJPqhZGCtUVUl6jEAVwDWO63G
         nA/5LOJDvpE8PNxThLe4XxoUwjmifR/lJ91C0FMKSOSahIJJQp50/YeElJiAO9WKzy
         gfw4hKH5MMfoA==
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
From:   Benno Lossin <benno.lossin@proton.me>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] rust: add synchronous message digest support
Message-ID: <udHI3v-OLUqHQt3fwnH71QuRJjzGxexw2rkIYEfnsChCmrLoJTIL_GL1wLCARf-UotY51jkPT6tC8nVDvjf8LkY2zvddpgeRQ5owysZwJos=@proton.me>
In-Reply-To: <20230615142311.4055228-2-fujita.tomonori@gmail.com>
References: <20230615142311.4055228-1-fujita.tomonori@gmail.com> <20230615142311.4055228-2-fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers.c                  |  26 +++++++
>  rust/kernel/crypto.rs           |   5 ++
>  rust/kernel/crypto/hash.rs      | 118 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  5 files changed, 152 insertions(+)
>  create mode 100644 rust/kernel/crypto.rs
>  create mode 100644 rust/kernel/crypto/hash.rs
>=20
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 3e601ce2548d..2f198c6d5de5 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,6 +6,7 @@
>   * Sorted alphabetically.
>   */
>=20
> +#include <crypto/hash.h>
>  #include <linux/errname.h>
>  #include <linux/slab.h>
>  #include <linux/refcount.h>
> diff --git a/rust/helpers.c b/rust/helpers.c
> index bb594da56137..7966902ed8eb 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -18,6 +18,7 @@
>   * accidentally exposed.
>   */
>=20
> +#include <crypto/hash.h>
>  #include <linux/bug.h>
>  #include <linux/build_bug.h>
>  #include <linux/err.h>
> @@ -28,6 +29,31 @@
>  #include <linux/sched/signal.h>
>  #include <linux/wait.h>
>=20
> +#ifdef CONFIG_CRYPTO
> +void rust_helper_crypto_free_shash(struct crypto_shash *tfm)
> +{
> +=09crypto_free_shash(tfm);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_crypto_free_shash);
> +
> +unsigned int rust_helper_crypto_shash_digestsize(struct crypto_shash *tf=
m)
> +{
> +    return crypto_shash_digestsize(tfm);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_crypto_shash_digestsize);
> +
> +unsigned int rust_helper_crypto_shash_descsize(struct crypto_shash *tfm)
> +{
> +    return crypto_shash_descsize(tfm);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_crypto_shash_descsize);
> +
> +int rust_helper_crypto_shash_init(struct shash_desc *desc) {
> +=09return crypto_shash_init(desc);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_crypto_shash_init);
> +#endif
> +
>  __noreturn void rust_helper_BUG(void)
>  {
>  =09BUG();
> diff --git a/rust/kernel/crypto.rs b/rust/kernel/crypto.rs
> new file mode 100644
> index 000000000000..f80dd7bd3381
> --- /dev/null
> +++ b/rust/kernel/crypto.rs
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Cryptography.
> +
> +pub mod hash;
> diff --git a/rust/kernel/crypto/hash.rs b/rust/kernel/crypto/hash.rs
> new file mode 100644
> index 000000000000..53f4a311b3b2
> --- /dev/null
> +++ b/rust/kernel/crypto/hash.rs
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Cryptographic Hash operations.
> +//!
> +//! C headers: [`include/crypto/hash.h`](../../../../include/crypto/hash=
.h)
> +
> +use crate::{
> +    error::{code::ENOMEM, from_err_ptr, to_result, Result},
> +    str::CStr,
> +};
> +use alloc::alloc::{alloc, dealloc};
> +use core::alloc::Layout;
> +
> +/// Corresponds to the kernel's `struct crypto_shash`.
> +///
> +/// # Invariants
> +///
> +/// The pointer is valid.
> +pub struct Shash(*mut bindings::crypto_shash);
> +
> +impl Drop for Shash {
> +    fn drop(&mut self) {
> +        // SAFETY: The type invariant guarantees that the pointer is val=
id.
> +        unsafe { bindings::crypto_free_shash(self.0) }
> +    }
> +}
> +
> +impl Shash {
> +    /// Creates a [`Shash`] object for a message digest handle.
> +    pub fn new(name: &CStr, t: u32, mask: u32) -> Result<Shash> {
> +        // SAFETY: FFI call.

If there are no requirements then say so.

> +        let ptr =3D
> +            unsafe { from_err_ptr(bindings::crypto_alloc_shash(name.as_c=
har_ptr(), t, mask)) }?;
> +        // INVARIANT: `ptr` is valid and non-null since `crypto_alloc_sh=
ash`
> +        // returned a valid pointer which was null-checked.
> +        Ok(Self(ptr))
> +    }
> +
> +    /// Sets optional key used by the hashing algorithm.
> +    pub fn setkey(&mut self, data: &[u8]) -> Result {

This should be called `set_key`.

> +        // SAFETY: The type invariant guarantees that the pointer is val=
id.
> +        to_result(unsafe {
> +            bindings::crypto_shash_setkey(self.0, data.as_ptr(), data.le=
n() as u32)
> +        })
> +    }
> +
> +    /// Returns the size of the result of the transformation.
> +    pub fn digestsize(&self) -> u32 {

This should be called `digest_size`.

> +        // SAFETY: The type invariant guarantees that the pointer is val=
id.
> +        unsafe { bindings::crypto_shash_digestsize(self.0) }
> +    }
> +}
> +
> +/// Corresponds to the kernel's `struct shash_desc`.
> +///
> +/// # Invariants
> +///
> +/// The field `ptr` is valid.
> +pub struct ShashDesc<'a> {
> +    ptr: *mut bindings::shash_desc,
> +    tfm: &'a Shash,
> +    size: usize,
> +}
> +
> +impl Drop for ShashDesc<'_> {
> +    fn drop(&mut self) {
> +        // SAFETY: The type invariant guarantees that the pointer is val=
id.
> +        unsafe {
> +            dealloc(
> +                self.ptr.cast(),
> +                Layout::from_size_align(self.size, 2).unwrap(),
> +            );

Why do we own the pointer (i.e. why can we deallocate the memory)? Add as
a TI (type invariant). Why are you using `dealloc`? Is there no C
function that allocates a `struct shash_desc`? Why is the alignment 2?

> +        }
> +    }
> +}
> +
> +impl<'a> ShashDesc<'a> {
> +    /// Creates a [`ShashDesc`] object for a request data structure for =
message digest.
> +    pub fn new(tfm: &'a Shash) -> Result<Self> {
> +        // SAFETY: The type invariant guarantees that `tfm.0` pointer is=
 valid.
> +        let size =3D core::mem::size_of::<bindings::shash_desc>()
> +            + unsafe { bindings::crypto_shash_descsize(tfm.0) } as usize=
;
> +        let layout =3D Layout::from_size_align(size, 2)?;
> +        let ptr =3D unsafe { alloc(layout) } as *mut bindings::shash_des=
c;

Several things:
- The `SAFETY` comment for `crypto_shash_descsize` should be directly above
  the `unsafe` block,maybe factor that out into its own variable.
- Why is 2 the right alignment?
- Missing `SAFETY` comment for `alloc`.
- Why are you manually creating this layout from size and alignment? Is it
  not possible to do it via the `Layout` API?

> +        if ptr.is_null() {
> +            return Err(ENOMEM);
> +        }
> +        // INVARIANT: `ptr` is valid and non-null since `alloc`
> +        // returned a valid pointer which was null-checked.
> +        let mut desc =3D ShashDesc { ptr, tfm, size };
> +        // SAFETY: `desc.ptr` is valid and non-null since `alloc`
> +        // returned a valid pointer which was null-checked.
> +        // Additionally, The type invariant guarantees that `tfm.0` is v=
alid.
> +        unsafe { (*desc.ptr).tfm =3D desc.tfm.0 };
> +        desc.reset()?;
> +        Ok(desc)
> +    }
> +
> +    /// Re-initializes message digest.
> +    pub fn reset(&mut self) -> Result {
> +        // SAFETY: The type invariant guarantees that the pointer is val=
id.
> +        to_result(unsafe { bindings::crypto_shash_init(self.ptr) })
> +    }
> +
> +    /// Adds data to message digest for processing.
> +    pub fn update(&mut self, data: &[u8]) -> Result {
> +        // SAFETY: The type invariant guarantees that the pointer is val=
id.
> +        to_result(unsafe {
> +            bindings::crypto_shash_update(self.ptr, data.as_ptr(), data.=
len() as u32)
> +        })

What if `data.len() > u32::MAX`?

> +    }
> +
> +    /// Calculates message digest.
> +    pub fn finalize(&mut self, output: &mut [u8]) -> Result {
> +        // SAFETY: The type invariant guarantees that the pointer is val=
id.
> +        to_result(unsafe { bindings::crypto_shash_final(self.ptr, output=
.as_mut_ptr()) })

As already mentioned by Alex, this needs a size check.

--
Cheers,
Benno

> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 85b261209977..3cb8bd8a17d9 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -31,6 +31,8 @@
>  #[cfg(not(testlib))]
>  mod allocator;
>  mod build_assert;
> +#[cfg(CONFIG_CRYPTO)]
> +pub mod crypto;
>  pub mod error;
>  pub mod init;
>  pub mod ioctl;
> --
> 2.34.1
>=20


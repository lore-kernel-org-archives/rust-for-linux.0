Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EAAEB64D9
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 15:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240387AbjFOPCr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 11:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240288AbjFOPCq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 11:02:46 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9101FE2
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 08:02:44 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b4420a8c44so15531341fa.2
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 08:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686841363; x=1689433363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zv1Q6JYvPUf7wwO0CBW3XgwmXuLwcDp0KtHo0JA+HA=;
        b=FDv3IbZXtwjvkRkDw7iIH4agZd+frsyHBuOpVb+B92FmgbrjVXVJZU0dFi4gqHDw/Q
         cMZgpBLwuWbVerma8v6i64hR+sZueGAz4AtBxuRG5PHhlG6hI7OfAlFGtJjPgibU9/ro
         WiH7EBYp3npGvJ9GdcceZvxfEoGKSIgoZknq7M/k231WlRmtb9PAAwDLCAtafNPboGS6
         jXXwSHlhqsA7ukZaNMT7JIDji3uUgZkW5dfg+9b1xbpt+CiU2Mp/cSZN0e8EBxsx2cWR
         KwfOjOohBWqLK7hnjkb6zHqJG9gDcWd3XkWNub08U1NCei4GoN7a8+dK5cxkHg0Pl/W+
         kSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686841363; x=1689433363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zv1Q6JYvPUf7wwO0CBW3XgwmXuLwcDp0KtHo0JA+HA=;
        b=YnDy76GEtZXzgMeutQX5zdmu6roewK6pmw7FxJMlcx/9QdqxApN6aAxiYKpzystUT9
         Wf2OxiKEPFlUUygLNz5gaXd9LrpTBQSO10mxOmU4oQsJ8c4sLevzuTao0KQ5ccsPdPPu
         heauc9M3XEF1WOHvOkzI6mkPW0AtZa/vf4RHnKC2AjFbF9PZXhMd/yYftJagVX8atOl7
         3+YvRCvJFAHjWjFwSWMNgrZOTxMxsUG3d+8yaZy5gs/pPAENg3uyqH1oBinrrThu2CSE
         CjENND6raMA/n4awKGPGGcQxgydVD1xirWDIDiE/MmqDVCsXtY3HbjikxlcRWYEeQiVh
         B2JA==
X-Gm-Message-State: AC+VfDziQ6ZNHU3JQbq6HQrspiDSgQQ0g/JNPf3Wmqn0YqAOX/ym5m7W
        hzLh+PhX3PIxRLnP3thHQMUlzqyym3LbSKJaIG87QP8nKVs=
X-Google-Smtp-Source: ACHHUZ4Dxy4FDyIwiaDTD8U7EPg7Hx8Vcd47eDl1DxfQ+UiKaRjPptixTiZPclzEx+9KAY8huqrL2WQ2An/WTNk1Iws=
X-Received: by 2002:a2e:3c08:0:b0:2b3:4891:eb01 with SMTP id
 j8-20020a2e3c08000000b002b34891eb01mr3881780lja.20.1686841362770; Thu, 15 Jun
 2023 08:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230615142311.4055228-1-fujita.tomonori@gmail.com> <20230615142311.4055228-2-fujita.tomonori@gmail.com>
In-Reply-To: <20230615142311.4055228-2-fujita.tomonori@gmail.com>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Thu, 15 Jun 2023 11:02:31 -0400
Message-ID: <CAFRnB2UCnidghmfBPeZr19R68njuzH5yEqGmd5gjweaq3k=yUQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] rust: add synchronous message digest support
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

One note inline

On Thu, Jun 15, 2023 at 10:50=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
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
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 3e601ce2548d..2f198c6d5de5 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,6 +6,7 @@
>   * Sorted alphabetically.
>   */
>
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
>
> +#include <crypto/hash.h>
>  #include <linux/bug.h>
>  #include <linux/build_bug.h>
>  #include <linux/err.h>
> @@ -28,6 +29,31 @@
>  #include <linux/sched/signal.h>
>  #include <linux/wait.h>
>
> +#ifdef CONFIG_CRYPTO
> +void rust_helper_crypto_free_shash(struct crypto_shash *tfm)
> +{
> +       crypto_free_shash(tfm);
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
> +       return crypto_shash_init(desc);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_crypto_shash_init);
> +#endif
> +
>  __noreturn void rust_helper_BUG(void)
>  {
>         BUG();
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
> +    }
> +
> +    /// Calculates message digest.
> +    pub fn finalize(&mut self, output: &mut [u8]) -> Result {
> +        // SAFETY: The type invariant guarantees that the pointer is val=
id.
> +        to_result(unsafe { bindings::crypto_shash_final(self.ptr, output=
.as_mut_ptr()) })

Is this sound? What happens if output.len() < the digest size?

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
>


--=20
All that is necessary for evil to succeed is for good people to do nothing.

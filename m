Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FF5EB64DC
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Jun 2023 10:08:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjFYKIq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 25 Jun 2023 06:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbjFYKIq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 25 Jun 2023 06:08:46 -0400
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796851A3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jun 2023 03:08:41 -0700 (PDT)
Date:   Sun, 25 Jun 2023 10:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1687687719; x=1687946919;
        bh=1etZM8d5syDDU+STzo3wQ1CLFhxgHkWioQJB57fK+k8=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=Ui4vxBLUnmNmvkXMSgiSUtvRfHT2EjxOllDc1yfB/MAGJnhL+ZSWfUZG8MyE6oIAH
         ITkR78sLsG6ZAI0lvcZhQZ66miIHMSS3aTXk8WdXCj7BJ88ejWPGiz7I/mXmGKrn1Q
         UGIxQZLG14OsE4dixdbriQq4pPtXUhWMVgbvfXMoO22XYIRhuPiWn5a6DwmkMIdF3C
         X+fesRQ5wCgC4DxRqjYGsAYdOoGZF+/mXvj4rOg56C/WAt53bLIfGs7M3UgrbsQ8w7
         6jhFjFG0gCGdVZtToT90/qnbPUQlVgpHCA4c5di6NGjJYaNWr1s9X2T3boU1RJGmrI
         45fXaWr9nO48Q==
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
From:   Benno Lossin <benno.lossin@proton.me>
Cc:     rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>
Subject: Re: [RFC PATCH v2 1/2] rust: add synchronous message digest support
Message-ID: <0a9af5fa-4df2-11da-b3cb-0a6b1d27fdc2@proton.me>
In-Reply-To: <20230622.111419.241422502377572827.ubuntu@gmail.com>
References: <20230615142311.4055228-1-fujita.tomonori@gmail.com> <20230615142311.4055228-2-fujita.tomonori@gmail.com> <udHI3v-OLUqHQt3fwnH71QuRJjzGxexw2rkIYEfnsChCmrLoJTIL_GL1wLCARf-UotY51jkPT6tC8nVDvjf8LkY2zvddpgeRQ5owysZwJos=@proton.me> <20230622.111419.241422502377572827.ubuntu@gmail.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 6/22/23 04:14, FUJITA Tomonori wrote:
> Hi, thanks a lot for reviewing!
>=20
> On Mon, 19 Jun 2023 11:40:40 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>=20
>>> diff --git a/rust/kernel/crypto/hash.rs b/rust/kernel/crypto/hash.rs
>>> new file mode 100644
>>> index 000000000000..53f4a311b3b2
>>> --- /dev/null
>>> +++ b/rust/kernel/crypto/hash.rs
>>> @@ -0,0 +1,118 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! Cryptographic Hash operations.
>>> +//!
>>> +//! C headers: [`include/crypto/hash.h`](../../../../include/crypto/ha=
sh.h)
>>> +
>>> +use crate::{
>>> +    error::{code::ENOMEM, from_err_ptr, to_result, Result},
>>> +    str::CStr,
>>> +};
>>> +use alloc::alloc::{alloc, dealloc};
>>> +use core::alloc::Layout;
>>> +
>>> +/// Corresponds to the kernel's `struct crypto_shash`.
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// The pointer is valid.
>>> +pub struct Shash(*mut bindings::crypto_shash);
>>> +
>>> +impl Drop for Shash {
>>> +    fn drop(&mut self) {
>>> +        // SAFETY: The type invariant guarantees that the pointer is v=
alid.
>>> +        unsafe { bindings::crypto_free_shash(self.0) }
>>> +    }
>>> +}
>>> +
>>> +impl Shash {
>>> +    /// Creates a [`Shash`] object for a message digest handle.
>>> +    pub fn new(name: &CStr, t: u32, mask: u32) -> Result<Shash> {
>>> +        // SAFETY: FFI call.
>>
>> If there are no requirements then say so.
>=20
> Understood. Looks like we have variation. Might be better to add the
> standard to Documentation/rust/coding-guidelines.rst or such?
>=20
> ubuntu@ip-172-30-47-114:~/git/linux$ grep -r FFI rust/kernel|grep SAFE
> rust/kernel/task.rs:        // SAFETY: Just an FFI call with no additiona=
l safety requirements.
> rust/kernel/lib.rs:    // SAFETY: FFI call.
> rust/kernel/sync/arc.rs:            // SAFETY: There are no safety requir=
ements for this FFI call.
> rust/kernel/sync/arc.rs:            // SAFETY: There are no safety requir=
ements for this FFI call.
> rust/kernel/error.rs:        // SAFETY: Just an FFI call, there are no ex=
tra safety requirements.
> rust/kernel/error.rs:///     // SAFETY: FFI call.
> rust/kernel/error.rs:    // SAFETY: The FFI function does not deref the p=
ointer.
> rust/kernel/error.rs:        // SAFETY: The FFI function does not deref t=
he pointer.

I am currently working on more standardized safety comments. Until we=20
agree on how it should be, you can just choose a wording that you think=20
is OK.

>=20
>>> +        let ptr =3D
>>> +            unsafe { from_err_ptr(bindings::crypto_alloc_shash(name.as=
_char_ptr(), t, mask)) }?;
>>> +        // INVARIANT: `ptr` is valid and non-null since `crypto_alloc_=
shash`
>>> +        // returned a valid pointer which was null-checked.
>>> +        Ok(Self(ptr))
>>> +    }
>>> +
>>> +    /// Sets optional key used by the hashing algorithm.
>>> +    pub fn setkey(&mut self, data: &[u8]) -> Result {
>>
>> This should be called `set_key`.
>=20
> I thought that using C function names is a recommended way because
> it's easier for subsystem maintainers to review.

IMO having a `_` that separates words helps a lot with readability.=20
Especially with `digestsize`. I also think that adding an `_` will not=20
confuse the subsystem maintainers, so we should just do it.

>=20
>=20
>>> +        // SAFETY: The type invariant guarantees that the pointer is v=
alid.
>>> +        to_result(unsafe {
>>> +            bindings::crypto_shash_setkey(self.0, data.as_ptr(), data.=
len() as u32)
>>> +        })
>>> +    }
>>> +
>>> +    /// Returns the size of the result of the transformation.
>>> +    pub fn digestsize(&self) -> u32 {
>>
>> This should be called `digest_size`.
>=20
> Ditto.
>=20
>>> +        // SAFETY: The type invariant guarantees that the pointer is v=
alid.
>>> +        unsafe { bindings::crypto_shash_digestsize(self.0) }
>>> +    }
>>> +}
>>> +
>>> +/// Corresponds to the kernel's `struct shash_desc`.
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// The field `ptr` is valid.
>>> +pub struct ShashDesc<'a> {
>>> +    ptr: *mut bindings::shash_desc,
>>> +    tfm: &'a Shash,
>>> +    size: usize,
>>> +}
>>> +
>>> +impl Drop for ShashDesc<'_> {
>>> +    fn drop(&mut self) {
>>> +        // SAFETY: The type invariant guarantees that the pointer is v=
alid.
>>> +        unsafe {
>>> +            dealloc(
>>> +                self.ptr.cast(),
>>> +                Layout::from_size_align(self.size, 2).unwrap(),
>>> +            );
>>
>> Why do we own the pointer (i.e. why can we deallocate the memory)? Add a=
s
>> a TI (type invariant). Why are you using `dealloc`? Is there no C
>> function that allocates a `struct shash_desc`? Why is the alignment 2?
>=20
> No C function that allocates `struct shash_desc`. kmalloc() family is
> used in the C side (or stack is used).
>=20
> IIUC, the alignment isn't used in the kernel but dealloc() still
> requires, right? I'm not sure what number should be used here.

CC'ing Gary, since I am not familiar with `dealloc` in the kernel.
I think the value of the alignment should still be correct if at some=20
point in the future `dealloc` starts to use it again.

>=20
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +impl<'a> ShashDesc<'a> {
>>> +    /// Creates a [`ShashDesc`] object for a request data structure fo=
r message digest.
>>> +    pub fn new(tfm: &'a Shash) -> Result<Self> {
>>> +        // SAFETY: The type invariant guarantees that `tfm.0` pointer =
is valid.
>>> +        let size =3D core::mem::size_of::<bindings::shash_desc>()
>>> +            + unsafe { bindings::crypto_shash_descsize(tfm.0) } as usi=
ze;
>>> +        let layout =3D Layout::from_size_align(size, 2)?;
>>> +        let ptr =3D unsafe { alloc(layout) } as *mut bindings::shash_d=
esc;
>>
>> Several things:
>> - The `SAFETY` comment for `crypto_shash_descsize` should be directly ab=
ove
>>    the `unsafe` block,maybe factor that out into its own variable.
>=20
> Ok.
>=20
>> - Why is 2 the right alignment?
>=20
> As long as the size is larger than alignment, alignment arugment is
> meaningless. Like dealloc, not sure what should be used.
>=20
>=20
>> - Missing `SAFETY` comment for `alloc`.
>=20
> Will be fixed.
>=20
>> - Why are you manually creating this layout from size and alignment? Is =
it
>>    not possible to do it via the `Layout` API?
>=20
> What function should be used?

Maybe `Layout::new()`, `Layout::extend` and `Layout::repeat` might be=20
enough?

>=20
>>> +        if ptr.is_null() {
>>> +            return Err(ENOMEM);
>>> +        }
>>> +        // INVARIANT: `ptr` is valid and non-null since `alloc`
>>> +        // returned a valid pointer which was null-checked.
>>> +        let mut desc =3D ShashDesc { ptr, tfm, size };
>>> +        // SAFETY: `desc.ptr` is valid and non-null since `alloc`
>>> +        // returned a valid pointer which was null-checked.
>>> +        // Additionally, The type invariant guarantees that `tfm.0` is=
 valid.
>>> +        unsafe { (*desc.ptr).tfm =3D desc.tfm.0 };
>>> +        desc.reset()?;
>>> +        Ok(desc)
>>> +    }
>>> +
>>> +    /// Re-initializes message digest.
>>> +    pub fn reset(&mut self) -> Result {
>>> +        // SAFETY: The type invariant guarantees that the pointer is v=
alid.
>>> +        to_result(unsafe { bindings::crypto_shash_init(self.ptr) })
>>> +    }
>>> +
>>> +    /// Adds data to message digest for processing.
>>> +    pub fn update(&mut self, data: &[u8]) -> Result {
>>> +        // SAFETY: The type invariant guarantees that the pointer is v=
alid.
>>> +        to_result(unsafe {
>>> +            bindings::crypto_shash_update(self.ptr, data.as_ptr(), dat=
a.len() as u32)
>>> +        })
>>
>> What if `data.len() > u32::MAX`?
>=20
> The buffer might not be updated properly, I guess. Should check the case?

Not sure what we should do in that case, will bring it up at the next=20
team meeting. In Rust, `write` and `read` functions often output the=20
number of bytes that were actually read/written. So maybe we should also=20
do that here? Then you could just return `u32::MAX` and the user would=20
have to call again. We could also call the C side multiple times until=20
the entire buffer has been processed. But as the C side only supports=20
u32 anyway, I think it would be a rare occurrence for `data` to be large.

--=20
Cheers,
Benno

>=20
>>> +    }
>>> +
>>> +    /// Calculates message digest.
>>> +    pub fn finalize(&mut self, output: &mut [u8]) -> Result {
>>> +        // SAFETY: The type invariant guarantees that the pointer is v=
alid.
>>> +        to_result(unsafe { bindings::crypto_shash_final(self.ptr, outp=
ut.as_mut_ptr()) })
>>
>> As already mentioned by Alex, this needs a size check.
>=20
> Will be fixed.
>=20
>=20
> thanks,




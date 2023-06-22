Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7DBEB64D7
	for <rust-for-linux@archiver.kernel.org>; Thu, 22 Jun 2023 02:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjFVCOY (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 21 Jun 2023 22:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjFVCOW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 21 Jun 2023 22:14:22 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D2A6AC
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jun 2023 19:14:21 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-557224e7716so267591a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jun 2023 19:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687400061; x=1689992061;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyCGV3LBCKaLn9QiEFCpBqpDbuL2A7vQktbYxMWj7k8=;
        b=RgLZMYDj/Zd/9IUcRQaPPopzmG/gMivfO/GOp5cYh8JqPknkiz3RP/h1zu81D5mA9q
         jawgt+2DH3xDtkaZJsEqkF7nh6BVIUm7tKgPH+3HEIaS4i6M+gH7VPVoxtAnQKAkKtbw
         8jVcvfH24Tki6bZkpoMSi1DV8gaFntwnRgKsZO2lqkY+LRR1pfhsHxAtxvSXudy5+XA5
         HOTC7fY5JuwEKG3oB/fBdAXZdTtyNWcSjQjKYfdvQ33tRybTfyl/pzb7dRdIW8Hk0fFv
         o6Rf4x6hdyhJxmAl+eX019HWOkqub8MvKblt7ofsrslLMoSFjdIorqVXXL9eW2O+AZl/
         Mqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687400061; x=1689992061;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RyCGV3LBCKaLn9QiEFCpBqpDbuL2A7vQktbYxMWj7k8=;
        b=TB7DzUM+z0v5c6GM8NpCC/ReZAaN/baVMQvkX6hd/bKZgnuwm56x5tpMt36wrfNU2p
         Fdp1vZGvQQcYTarqWdKrhCeVkr6fVsiBruEZMqalPFMk0c6IxYbz0xEZJseOBlbj4g09
         dBvLE7gC9ChR3KmiS27WfIqFcKk+zdcpz3dYCaPKLAXYOHUKh7qOWwYAP+wfl3Vqexwd
         GLgvMABr5EH48pOPsT8TwsI9jthM0bjO00mVFCyihAPkPG9ml1kkU29NiRynvoKJh7Cp
         FX6tZeX7f0ZFNcGnR02RJShWZElK6CSsRx55hmUEOcjumhar64Nbat5UNFH+tRWSlN43
         sbfQ==
X-Gm-Message-State: AC+VfDw3zpd4Qrnb+Wf2fWqtfg4SeZlzal56Xqrm4sIvAqBdMNofauUB
        5KFkV2dnmdl027w28BXAkOY=
X-Google-Smtp-Source: ACHHUZ5I9NKM2kFNO2y4Re0MJO2cxrtnxjoEnfDqShaZUnhc4Vc+a0KE3iJzZ8N8Gddz50lCSPVCJg==
X-Received: by 2002:a05:6a21:329e:b0:116:696f:1dd1 with SMTP id yt30-20020a056a21329e00b00116696f1dd1mr22214854pzb.4.1687400060558;
        Wed, 21 Jun 2023 19:14:20 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id g12-20020aa7874c000000b00666b6dc10desm3489749pfo.56.2023.06.21.19.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:14:20 -0700 (PDT)
Date:   Thu, 22 Jun 2023 11:14:19 +0900 (JST)
Message-Id: <20230622.111419.241422502377572827.ubuntu@gmail.com>
To:     benno.lossin@proton.me
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] rust: add synchronous message digest support
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <udHI3v-OLUqHQt3fwnH71QuRJjzGxexw2rkIYEfnsChCmrLoJTIL_GL1wLCARf-UotY51jkPT6tC8nVDvjf8LkY2zvddpgeRQ5owysZwJos=@proton.me>
References: <20230615142311.4055228-1-fujita.tomonori@gmail.com>
        <20230615142311.4055228-2-fujita.tomonori@gmail.com>
        <udHI3v-OLUqHQt3fwnH71QuRJjzGxexw2rkIYEfnsChCmrLoJTIL_GL1wLCARf-UotY51jkPT6tC8nVDvjf8LkY2zvddpgeRQ5owysZwJos=@proton.me>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi, thanks a lot for reviewing!

On Mon, 19 Jun 2023 11:40:40 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

>> diff --git a/rust/kernel/crypto/hash.rs b/rust/kernel/crypto/hash.rs
>> new file mode 100644
>> index 000000000000..53f4a311b3b2
>> --- /dev/null
>> +++ b/rust/kernel/crypto/hash.rs
>> @@ -0,0 +1,118 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Cryptographic Hash operations.
>> +//!
>> +//! C headers: [`include/crypto/hash.h`](../../../../include/crypto/hash.h)
>> +
>> +use crate::{
>> +    error::{code::ENOMEM, from_err_ptr, to_result, Result},
>> +    str::CStr,
>> +};
>> +use alloc::alloc::{alloc, dealloc};
>> +use core::alloc::Layout;
>> +
>> +/// Corresponds to the kernel's `struct crypto_shash`.
>> +///
>> +/// # Invariants
>> +///
>> +/// The pointer is valid.
>> +pub struct Shash(*mut bindings::crypto_shash);
>> +
>> +impl Drop for Shash {
>> +    fn drop(&mut self) {
>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>> +        unsafe { bindings::crypto_free_shash(self.0) }
>> +    }
>> +}
>> +
>> +impl Shash {
>> +    /// Creates a [`Shash`] object for a message digest handle.
>> +    pub fn new(name: &CStr, t: u32, mask: u32) -> Result<Shash> {
>> +        // SAFETY: FFI call.
> 
> If there are no requirements then say so.

Understood. Looks like we have variation. Might be better to add the
standard to Documentation/rust/coding-guidelines.rst or such?

ubuntu@ip-172-30-47-114:~/git/linux$ grep -r FFI rust/kernel|grep SAFE
rust/kernel/task.rs:        // SAFETY: Just an FFI call with no additional safety requirements.
rust/kernel/lib.rs:    // SAFETY: FFI call.
rust/kernel/sync/arc.rs:            // SAFETY: There are no safety requirements for this FFI call.
rust/kernel/sync/arc.rs:            // SAFETY: There are no safety requirements for this FFI call.
rust/kernel/error.rs:        // SAFETY: Just an FFI call, there are no extra safety requirements.
rust/kernel/error.rs:///     // SAFETY: FFI call.
rust/kernel/error.rs:    // SAFETY: The FFI function does not deref the pointer.
rust/kernel/error.rs:        // SAFETY: The FFI function does not deref the pointer.

>> +        let ptr =
>> +            unsafe { from_err_ptr(bindings::crypto_alloc_shash(name.as_char_ptr(), t, mask)) }?;
>> +        // INVARIANT: `ptr` is valid and non-null since `crypto_alloc_shash`
>> +        // returned a valid pointer which was null-checked.
>> +        Ok(Self(ptr))
>> +    }
>> +
>> +    /// Sets optional key used by the hashing algorithm.
>> +    pub fn setkey(&mut self, data: &[u8]) -> Result {
> 
> This should be called `set_key`.

I thought that using C function names is a recommended way because
it's easier for subsystem maintainers to review.


>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>> +        to_result(unsafe {
>> +            bindings::crypto_shash_setkey(self.0, data.as_ptr(), data.len() as u32)
>> +        })
>> +    }
>> +
>> +    /// Returns the size of the result of the transformation.
>> +    pub fn digestsize(&self) -> u32 {
> 
> This should be called `digest_size`.

Ditto.

>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>> +        unsafe { bindings::crypto_shash_digestsize(self.0) }
>> +    }
>> +}
>> +
>> +/// Corresponds to the kernel's `struct shash_desc`.
>> +///
>> +/// # Invariants
>> +///
>> +/// The field `ptr` is valid.
>> +pub struct ShashDesc<'a> {
>> +    ptr: *mut bindings::shash_desc,
>> +    tfm: &'a Shash,
>> +    size: usize,
>> +}
>> +
>> +impl Drop for ShashDesc<'_> {
>> +    fn drop(&mut self) {
>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>> +        unsafe {
>> +            dealloc(
>> +                self.ptr.cast(),
>> +                Layout::from_size_align(self.size, 2).unwrap(),
>> +            );
> 
> Why do we own the pointer (i.e. why can we deallocate the memory)? Add as
> a TI (type invariant). Why are you using `dealloc`? Is there no C
> function that allocates a `struct shash_desc`? Why is the alignment 2?

No C function that allocates `struct shash_desc`. kmalloc() family is
used in the C side (or stack is used).

IIUC, the alignment isn't used in the kernel but dealloc() still
requires, right? I'm not sure what number should be used here.

>> +        }
>> +    }
>> +}
>> +
>> +impl<'a> ShashDesc<'a> {
>> +    /// Creates a [`ShashDesc`] object for a request data structure for message digest.
>> +    pub fn new(tfm: &'a Shash) -> Result<Self> {
>> +        // SAFETY: The type invariant guarantees that `tfm.0` pointer is valid.
>> +        let size = core::mem::size_of::<bindings::shash_desc>()
>> +            + unsafe { bindings::crypto_shash_descsize(tfm.0) } as usize;
>> +        let layout = Layout::from_size_align(size, 2)?;
>> +        let ptr = unsafe { alloc(layout) } as *mut bindings::shash_desc;
> 
> Several things:
> - The `SAFETY` comment for `crypto_shash_descsize` should be directly above
>   the `unsafe` block,maybe factor that out into its own variable.

Ok.

> - Why is 2 the right alignment?

As long as the size is larger than alignment, alignment arugment is
meaningless. Like dealloc, not sure what should be used.


> - Missing `SAFETY` comment for `alloc`.

Will be fixed.

> - Why are you manually creating this layout from size and alignment? Is it
>   not possible to do it via the `Layout` API?

What function should be used?

>> +        if ptr.is_null() {
>> +            return Err(ENOMEM);
>> +        }
>> +        // INVARIANT: `ptr` is valid and non-null since `alloc`
>> +        // returned a valid pointer which was null-checked.
>> +        let mut desc = ShashDesc { ptr, tfm, size };
>> +        // SAFETY: `desc.ptr` is valid and non-null since `alloc`
>> +        // returned a valid pointer which was null-checked.
>> +        // Additionally, The type invariant guarantees that `tfm.0` is valid.
>> +        unsafe { (*desc.ptr).tfm = desc.tfm.0 };
>> +        desc.reset()?;
>> +        Ok(desc)
>> +    }
>> +
>> +    /// Re-initializes message digest.
>> +    pub fn reset(&mut self) -> Result {
>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>> +        to_result(unsafe { bindings::crypto_shash_init(self.ptr) })
>> +    }
>> +
>> +    /// Adds data to message digest for processing.
>> +    pub fn update(&mut self, data: &[u8]) -> Result {
>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>> +        to_result(unsafe {
>> +            bindings::crypto_shash_update(self.ptr, data.as_ptr(), data.len() as u32)
>> +        })
> 
> What if `data.len() > u32::MAX`?

The buffer might not be updated properly, I guess. Should check the case?

>> +    }
>> +
>> +    /// Calculates message digest.
>> +    pub fn finalize(&mut self, output: &mut [u8]) -> Result {
>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>> +        to_result(unsafe { bindings::crypto_shash_final(self.ptr, output.as_mut_ptr()) })
> 
> As already mentioned by Alex, this needs a size check.

Will be fixed.


thanks,

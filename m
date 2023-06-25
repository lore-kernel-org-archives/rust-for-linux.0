Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552ABEB64DD
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Jun 2023 11:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbjFYLzy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 25 Jun 2023 07:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232035AbjFYLzr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 25 Jun 2023 07:55:47 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A170410D9
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jun 2023 04:55:09 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6748a616e17so148284b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jun 2023 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687694109; x=1690286109;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+0rY9dcanWVxR6sRIymJgjiZmejUXF7IWUozqAb9is=;
        b=dNodgk9B75aALRlJDMDJ7yJpTL6VCmHXeDHcnu+1LA9bnZ8z0qHkom6odM/AbLaj39
         fczWbEEeFH27JXKNTo1Wxo4p+uJJ8yCdR0aIbTWySH2HUFdWT1AX09hXm9/5tJp/eCbU
         09p+IEVExvM4C1aziYoVmOCOmu+FKCUYso+9LxXyvY6BM/Y0grLuA8gK6PNCwwezRr4q
         V/TCI/oAg/yvnxDetITUFULtK3Qm4rimGTB1vajn9/G2jL6s99tY/BqDtpRqr7mg7Phy
         UMliRdQuJkUWn3C0zjJOMlLvEBfm5ELvJkr3LdTQByKl9Fu1KNyMakUKT9qU30FIKOOw
         s1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687694109; x=1690286109;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G+0rY9dcanWVxR6sRIymJgjiZmejUXF7IWUozqAb9is=;
        b=gj7wFRMoo/7RzyW8cNqLQY2woci0F6YlAtjgRgP3dQQ83U82KRvX+hFqeg0uIuU2Ad
         2+In87AGLzBH7xPpGkz4AH7tEfK0dfV1Li/O69U5JFiiiLlAaju8BknFZXq+W/UKAlL7
         HNLdQGXknUZtIlP3fjwD0CaZwECO8ipPbSs1GymNJtgBOTQ0DtzU29yEbC2nUCGMxFw+
         e3cbgn/APikyD6HSZxYj6d5YSbRQvnUrEBgITnDUWdWz9NwkRs/s1Kmr+lQEmnZsgtf1
         uAuihTsfbyxaDikTlTkbS/l2XldaIj1CsFYIi2yRSCkxKb/n4Ol2m3Q4b+ZtTufTqYc+
         g0qg==
X-Gm-Message-State: AC+VfDx5Dh4JTTPd/jTLpZBWzYmB82jK6dmERNATm1+7LjpO5drNZ1CD
        OPKAO+VEYIx1xvTQtPJHhKA=
X-Google-Smtp-Source: ACHHUZ44IAvMRFWGx4hjq0kA4hS6eMs0m4Bnj0LlijsGv2hsprTOLX1t3hc0dT3etS02fD250HMokw==
X-Received: by 2002:a17:902:d489:b0:1ae:4567:2737 with SMTP id c9-20020a170902d48900b001ae45672737mr32852640plg.2.1687694108653;
        Sun, 25 Jun 2023 04:55:08 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id bg6-20020a1709028e8600b001b3d0aff88fsm2377974plb.109.2023.06.25.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 04:55:08 -0700 (PDT)
Date:   Sun, 25 Jun 2023 20:55:07 +0900 (JST)
Message-Id: <20230625.205507.24200574349942230.ubuntu@gmail.com>
To:     benno.lossin@proton.me
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
        gary@garyguo.net
Subject: Re: [RFC PATCH v2 1/2] rust: add synchronous message digest support
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <0a9af5fa-4df2-11da-b3cb-0a6b1d27fdc2@proton.me>
References: <udHI3v-OLUqHQt3fwnH71QuRJjzGxexw2rkIYEfnsChCmrLoJTIL_GL1wLCARf-UotY51jkPT6tC8nVDvjf8LkY2zvddpgeRQ5owysZwJos=@proton.me>
        <20230622.111419.241422502377572827.ubuntu@gmail.com>
        <0a9af5fa-4df2-11da-b3cb-0a6b1d27fdc2@proton.me>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Sun, 25 Jun 2023 10:08:29 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

(snip)

>>>> +        let ptr =
>>>> +            unsafe { from_err_ptr(bindings::crypto_alloc_shash(name.as_char_ptr(), t, mask)) }?;
>>>> +        // INVARIANT: `ptr` is valid and non-null since `crypto_alloc_shash`
>>>> +        // returned a valid pointer which was null-checked.
>>>> +        Ok(Self(ptr))
>>>> +    }
>>>> +
>>>> +    /// Sets optional key used by the hashing algorithm.
>>>> +    pub fn setkey(&mut self, data: &[u8]) -> Result {
>>>
>>> This should be called `set_key`.
>> 
>> I thought that using C function names is a recommended way because
>> it's easier for subsystem maintainers to review.
> 
> IMO having a `_` that separates words helps a lot with readability. 
> Especially with `digestsize`. I also think that adding an `_` will not 
> confuse the subsystem maintainers, so we should just do it.

Looks like `digestsize` is more popular in the tree so let's wait for
reviewing from the crypto maintainers:

ubuntu@ip-172-30-47-114:~/git/linux$ grep -or digestsize crypto/|wc -l
112
ubuntu@ip-172-30-47-114:~/git/linux$ grep -or digest_size crypto/|wc -l
37

>>>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>>>> +        to_result(unsafe {
>>>> +            bindings::crypto_shash_setkey(self.0, data.as_ptr(), data.len() as u32)
>>>> +        })
>>>> +    }
>>>> +
>>>> +    /// Returns the size of the result of the transformation.
>>>> +    pub fn digestsize(&self) -> u32 {
>>>
>>> This should be called `digest_size`.
>> 
>> Ditto.
>> 
>>>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>>>> +        unsafe { bindings::crypto_shash_digestsize(self.0) }
>>>> +    }
>>>> +}
>>>> +
>>>> +/// Corresponds to the kernel's `struct shash_desc`.
>>>> +///
>>>> +/// # Invariants
>>>> +///
>>>> +/// The field `ptr` is valid.
>>>> +pub struct ShashDesc<'a> {
>>>> +    ptr: *mut bindings::shash_desc,
>>>> +    tfm: &'a Shash,
>>>> +    size: usize,
>>>> +}
>>>> +
>>>> +impl Drop for ShashDesc<'_> {
>>>> +    fn drop(&mut self) {
>>>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>>>> +        unsafe {
>>>> +            dealloc(
>>>> +                self.ptr.cast(),
>>>> +                Layout::from_size_align(self.size, 2).unwrap(),
>>>> +            );
>>>
>>> Why do we own the pointer (i.e. why can we deallocate the memory)? Add as
>>> a TI (type invariant). Why are you using `dealloc`? Is there no C
>>> function that allocates a `struct shash_desc`? Why is the alignment 2?
>> 
>> No C function that allocates `struct shash_desc`. kmalloc() family is
>> used in the C side (or stack is used).
>> 
>> IIUC, the alignment isn't used in the kernel but dealloc() still
>> requires, right? I'm not sure what number should be used here.
> 
> CC'ing Gary, since I am not familiar with `dealloc` in the kernel.
> I think the value of the alignment should still be correct if at some 
> point in the future `dealloc` starts to use it again.
> 
>> 
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>> +impl<'a> ShashDesc<'a> {
>>>> +    /// Creates a [`ShashDesc`] object for a request data structure for message digest.
>>>> +    pub fn new(tfm: &'a Shash) -> Result<Self> {
>>>> +        // SAFETY: The type invariant guarantees that `tfm.0` pointer is valid.
>>>> +        let size = core::mem::size_of::<bindings::shash_desc>()
>>>> +            + unsafe { bindings::crypto_shash_descsize(tfm.0) } as usize;
>>>> +        let layout = Layout::from_size_align(size, 2)?;
>>>> +        let ptr = unsafe { alloc(layout) } as *mut bindings::shash_desc;
>>>
>>> Several things:
>>> - The `SAFETY` comment for `crypto_shash_descsize` should be directly above
>>>    the `unsafe` block,maybe factor that out into its own variable.
>> 
>> Ok.
>> 
>>> - Why is 2 the right alignment?
>> 
>> As long as the size is larger than alignment, alignment arugment is
>> meaningless. Like dealloc, not sure what should be used.
>> 
>> 
>>> - Missing `SAFETY` comment for `alloc`.
>> 
>> Will be fixed.
>> 
>>> - Why are you manually creating this layout from size and alignment? Is it
>>>    not possible to do it via the `Layout` API?
>> 
>> What function should be used?
> 
> Maybe `Layout::new()`, `Layout::extend` and `Layout::repeat` might be 
> enough?

new() needs type and extend() and repeat() need self; both is
irrelevant here.

>>>> +        if ptr.is_null() {
>>>> +            return Err(ENOMEM);
>>>> +        }
>>>> +        // INVARIANT: `ptr` is valid and non-null since `alloc`
>>>> +        // returned a valid pointer which was null-checked.
>>>> +        let mut desc = ShashDesc { ptr, tfm, size };
>>>> +        // SAFETY: `desc.ptr` is valid and non-null since `alloc`
>>>> +        // returned a valid pointer which was null-checked.
>>>> +        // Additionally, The type invariant guarantees that `tfm.0` is valid.
>>>> +        unsafe { (*desc.ptr).tfm = desc.tfm.0 };
>>>> +        desc.reset()?;
>>>> +        Ok(desc)
>>>> +    }
>>>> +
>>>> +    /// Re-initializes message digest.
>>>> +    pub fn reset(&mut self) -> Result {
>>>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>>>> +        to_result(unsafe { bindings::crypto_shash_init(self.ptr) })
>>>> +    }
>>>> +
>>>> +    /// Adds data to message digest for processing.
>>>> +    pub fn update(&mut self, data: &[u8]) -> Result {
>>>> +        // SAFETY: The type invariant guarantees that the pointer is valid.
>>>> +        to_result(unsafe {
>>>> +            bindings::crypto_shash_update(self.ptr, data.as_ptr(), data.len() as u32)
>>>> +        })
>>>
>>> What if `data.len() > u32::MAX`?
>> 
>> The buffer might not be updated properly, I guess. Should check the case?
> 
> Not sure what we should do in that case, will bring it up at the next 
> team meeting. In Rust, `write` and `read` functions often output the 
> number of bytes that were actually read/written. So maybe we should also 
> do that here? Then you could just return `u32::MAX` and the user would 
> have to call again. We could also call the C side multiple times until 
> the entire buffer has been processed. But as the C side only supports 
> u32 anyway, I think it would be a rare occurrence for `data` to be large.

I'll change the code to return an error in this case. I prefer not to
extend C logic (like calling a C function multiple times) but if there
is an official policy for Rust bindings, I'll change the code to
follow the policy.


thanks,

Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB0DC77B73
	for <rust-for-linux@archiver.kernel.org>; Tue, 30 May 2023 07:22:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbjE3HWu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 30 May 2023 03:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbjE3HWV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 30 May 2023 03:22:21 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E905E4B
        for <rust-for-linux@vger.kernel.org>; Tue, 30 May 2023 00:21:47 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so27094655e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 May 2023 00:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1685431305; x=1688023305;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=TLXAtxiSrzYBIqowst8fYYSmLsOfa+DzojwrE+Dj58Y=;
        b=lJ65t1rka6ry5GPPbgFan7QhZEsuQFbeK7qxuyt5ugdsnYtXxojvNRPyFnxr4+wjsy
         dzqq1O7PPwxmemEvb5ucIaysA2rwrdxDmvNOHIQ+r0KTYBIaUqGuPAzS6GkG8YpYH0q3
         WR3H7/NKSPC3p0GymMBmR+CR3qjp1ieZy3vbaDOplHKbrMAqRq4Nzqn1efL93I1Mhywl
         Ga1mSYqsn++N/nKXwZ7LPz7T5STXUCRlnmqj6qVsx8KtPIo8dGNsPGBxvXhwwfk176iv
         RDZbcUnr+uZ/XA/tcwq39nbjoykBwULN27qtJHvSgxH3ghMl7C1gn0ilPoQjizz1xNVq
         5QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685431305; x=1688023305;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLXAtxiSrzYBIqowst8fYYSmLsOfa+DzojwrE+Dj58Y=;
        b=XKyLuFosxyWJLq5RrpbyzbxgKK9VgIOL0xYfVnRwNVY81COfbphKKucZ8RhHhTv38A
         9hf9APjN3F5e+9eEgpveNbPvbrzRSL2mY6yYNpBaAFJmmuafqEUs781s9o3oFmjwtkcM
         7wTfygjwQkoGXNZoCr68DrArNXFpRq3OBVOCC9VSVa9rfCAFU59Z4omGXPs+zR0vw9wn
         Gg9XH5fnSQpZzgzofpEWwUIPLp7qGm69CprGrQvDTERzRGXe25DkEeXZgDYnT3jf7MWX
         pRnNIWAD3QjMmIwL9Yruekb0zON7VvDSu4vFErTWQR7ry2ic8JxvhN6GsA50sk5Ke5Bk
         CWFA==
X-Gm-Message-State: AC+VfDyU3+HQ4mb57WnE52sRQsMEUia8FpB1M4/a/IHlm7uwpJrweuhf
        xnMcZ4yzzPe4l2X9GfJN9oA2wQ==
X-Google-Smtp-Source: ACHHUZ4bpQk50zd1Sz0M23Ww94mlrU+hZmpxEGF/P7hHJ9PrpDsxwMDnpsbFzNuNRlXyTb0FAwRc3A==
X-Received: by 2002:a1c:cc17:0:b0:3f5:772:f333 with SMTP id h23-20020a1ccc17000000b003f50772f333mr713950wmb.4.1685431304750;
        Tue, 30 May 2023 00:21:44 -0700 (PDT)
Received: from localhost ([147.161.155.112])
        by smtp.gmail.com with ESMTPSA id x11-20020a1c7c0b000000b003f50876905dsm16450769wmc.6.2023.05.30.00.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:21:44 -0700 (PDT)
References: <b54801cd-1afb-2190-3b8a-4a095d04fdff@gmail.com>
 <20230523110709.4077557-1-aliceryhl@google.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Alice Ryhl <aliceryhl@google.com>
Cc:     yakoyoku@gmail.com, alex.gaynor@gmail.com, benno.lossin@proton.me,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        jiangshanlai@gmail.com, linux-kernel@vger.kernel.org,
        ojeda@kernel.org, patches@lists.linux.dev,
        rust-for-linux@vger.kernel.org, tj@kernel.org, wedsonaf@gmail.com
Subject: Re: [PATCH v1 6/7] rust: workqueue: add safe API to workqueue
Date:   Tue, 30 May 2023 09:19:52 +0200
In-reply-to: <20230523110709.4077557-1-aliceryhl@google.com>
Message-ID: <875y8ab7y0.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Alice Ryhl <aliceryhl@google.com> writes:

> On 5/18/23 21:17, Martin Rodriguez Reboredo wrote:
>> On 5/17/23 17:31, Alice Ryhl wrote:
>>> +unsafe impl<T> WorkItem for Arc<T>
>>> +where
>>> +    T: ArcWorkItem + HasWork<Self> + ?Sized,
>>> +{
>>> +    type EnqueueOutput = Result<(), Self>;
>>> +
>>> +    unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
>>> +    where
>>> +        F: FnOnce(*mut bindings::work_struct) -> bool,
>>> +    {
>>> +        let ptr = Arc::into_raw(self);
>>> +
>>> +        // Using `get_work_offset` here for object-safety.
>>> +        //
>>> +        // SAFETY: The pointer is valid since we just got it from `into_raw`.
>>> +        let off = unsafe { (&*ptr).get_work_offset() };
>>> +
>>> +        // SAFETY: The `HasWork` impl promises that this offset gives us a field of type
>>> +        // `Work<Self>` in the same allocation.
>>> +        let work_ptr = unsafe { (ptr as *const u8).add(off) as *const Work<Self> };
>>> +        // SAFETY: The pointer is not dangling.
>>> +        let work_ptr = unsafe { Work::raw_get(work_ptr) };
>>> +
>>> +        match (queue_work_on)(work_ptr) {
>> 
>> Match for boolean is not a good pattern in my eyes, if-else should be
>> used instead.
>
> I think this is a question of style. For a comparison:
>
> match (queue_work_on)(work_ptr) {
>     true => Ok(()),
>     // SAFETY: The work queue has not taken ownership of the pointer.
>     false => Err(unsafe { Arc::from_raw(ptr) }),
> }
>
> vs
>
> if (queue_work_on)(work_ptr) {
>     Ok(())
> } else {
>     // SAFETY: The work queue has not taken ownership of the pointer.
>     Err(unsafe { Arc::from_raw(ptr) }),
> }
>
> I'm happy to change it if others disagree, but when the branches
> evaluate to a short expression like they do here, I quite like the first
> version.

I prefer the first one, but both look OK to me. Is one more idiomatic
than the other, or is it just a matter of personal preference?

BR Andreas

>
>> Also aren't the parens around the closure unnecessary?
>
> Hmm, parenthesises are often required around closures, but it's possible
> that it is only required for stuff like `self.closure(args)` to
> disambiguate between a `closure` field (of pointer type) and a `closure`
> method. I can check and remove them if they are not necessary.


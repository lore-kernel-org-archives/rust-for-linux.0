Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765A8C7EE29
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Jun 2023 07:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233755AbjFHH4u (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 8 Jun 2023 03:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233839AbjFHH4s (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 8 Jun 2023 03:56:48 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7261B1FCC
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 00:56:45 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-569fee67d9dso8777147b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jun 2023 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686211004; x=1688803004;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zbtN0AUFe407eC+d5fxblBSb4UQr/n52GpnrUJew0v0=;
        b=19VtV9M0bwIkPEjkE7st2aeds2q6Rj/c8CQavfKd8F4oMrXP/RmTfwbjmM5iKR33Ro
         yYUe68WbeNgkf4J5Uw89cpUGEUKOu6n7b3ZdI3CDH6euzDyjRuEnZyUbGndNp1Xv1rIM
         fImHwKLkz68U3nlc3+1oVmzTldqxZdlmMXD8jfTdLEScoONxqwFzc1nOdCTwaMkK8T5I
         Uo7hZ3FTrVz1nXYuN/6W0x1KgzhHn2nd4skmBfQNKKrWXgwSTNYopATFAJ3VLoC9VUQc
         d4ZA2WJGLN3GOgjOoeNNLGDKVCafZ5g78wMDSbB/t48d9V8WlwdxZhpkSocnp3TwzHpR
         aTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211004; x=1688803004;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbtN0AUFe407eC+d5fxblBSb4UQr/n52GpnrUJew0v0=;
        b=NEjLg6vvB69SUXMr11HT/9QHh4PTrYP5xwz2TgwrqNMs9FJdOfyiHDhiMR55f+NKDj
         9yN+p7a20k3bIvllvwE5vGDskGwAOrex/uOuE4CKtMgQJW/Gl/VQZ89uu7XFxy3cAOGO
         7+DwkMS5h442XoxQ7BxT3n58DWxj0I6+qAxXMOf/B8bC7HwhvoaEpiTtCnidyPqDArpm
         A9/2NGsPXjXzzF8VqaLAOlQt3OX/jF7fhCSzjDrPbOuO/sftQD9/c9eIhzZriytPTuPi
         NQGw01S85FfPXF+tSEfnomFkz8gszw+7PxBZ75J5Btzg/xHBX9c9/tkTWWf+u+b27zhj
         n0ag==
X-Gm-Message-State: AC+VfDxR5MOHMcZ+Hh22GVDZcVGFUxWZ9XwWz6rDeMBe7J+guv3xThSl
        IM6FPYvvUPwC3fnsjRK+p/Zod1q1jS9KiNg=
X-Google-Smtp-Source: ACHHUZ5NiwDZg7GhMA3n1fgKQsAHZ1IzNZ84AR9+4LR+Q2XkkkOeHzwwpxkhO5QOua/7F3kTwoI4RrP4EPPD5po=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:af47:0:b0:568:c8f9:1d86 with SMTP id
 x7-20020a81af47000000b00568c8f91d86mr836003ywj.2.1686211004668; Thu, 08 Jun
 2023 00:56:44 -0700 (PDT)
Date:   Thu,  8 Jun 2023 07:56:42 +0000
In-Reply-To: <010101888bd95727-14bd2f14-91f2-4bc2-bca9-e0912f256d21-000000@us-west-2.amazonses.com>
Mime-Version: 1.0
References: <010101888bd95727-14bd2f14-91f2-4bc2-bca9-e0912f256d21-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230608075642.1355797-1-aliceryhl@google.com>
Subject: Re: [PATCH 3/5] rust: add support for get_stats64 in struct net_device_ops
From:   Alice Ryhl <aliceryhl@google.com>
To:     tomo@exabit.dev
Cc:     aliceryhl@google.com, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

FUJITA Tomonori writes:
> Hi,
> 
> On Sun,  4 Jun 2023 12:48:29 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
>> FUJITA Tomonori writes:
>>> +/// Corresponds to the kernel's `struct rtnl_link_stats64`.
>>> +pub struct RtnlLinkStats64(*mut bindings::rtnl_link_stats64);
>>> +
>>> +impl RtnlLinkStats64 {
>>> +    /// Updates TX stats.
>>> +    pub fn set_tx_stats(&mut self, packets: u64, bytes: u64, errors: u64, dropped: u64) {
>>> +        // SAFETY: The safety requirement ensures that the pointer is valid.
>>> +        unsafe {
>>> +            (*self.0).tx_packets = packets;
>>> +            (*self.0).tx_bytes = bytes;
>>> +            (*self.0).tx_errors = errors;
>>> +            (*self.0).tx_dropped = dropped;
>>> +        }
>>> +    }
>>> +}
>> 
>> It seems like this type is always used behind a reference. Your current
>> approach has the disadvantage that you're introducing an extra layer of
>> indirection. You can avoid that like this:
>> 
>> ```
>> /// Corresponds to the kernel's `struct rtnl_link_stats64`.
>> #[repr(transparent)]
>> pub struct RtnlLinkStats64(Opaque<bindings::rtnl_link_stats64>);
>> 
>> impl RtnlLinkStats64 {
>>     /// # Safety
>>     ///
>>     /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
>>     /// may read or write to the `rtnl_link_stats64` object.
>>     pub unsafe fn from_raw<'a>(ptr: *mut bindings::rtnl_link_stats64) -> &'a mut Self {
>>         unsafe { &mut *(ptr as *mut Self) }
>>     }
> 
> I was wondering which I should use here, a pointer or Opaque. Can you
> give guidelines on which to use?
> 
> The condition in the above commment is met, Opaque should be used?

An alternative to what you're doing here would be a type that wraps a
raw pointer:

```
pub struct RtnlLinkStats64Ptr<'a> {
    ptr: *mut bindings::rtnl_link_stats64,
    _lifetime: PhantomData<&'a mut bindings::rtnl_link_stats64>,
}

impl RtnlLinkStats64Ptr<'_> {
    /// # Safety
    ///
    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
    /// may read or write to the `rtnl_link_stats64` object.
    pub unsafe fn from_raw(ptr: *mut bindings::rtnl_link_stats64) -> Self {
        Self {
            ptr,
            _lifetime: PhantomData,
        }
    }

    /// Updates TX stats.
    pub fn set_tx_stats(&mut self, packets: u64, bytes: u64, errors: u64, dropped: u64) {
        // SAFETY: We have exclusive access to the `rtnl_link_stats64`, so writing to it is okay.
        unsafe {
            (*self.ptr).tx_packets = tx_packets;
            (*self.ptr).tx_bytes = tx_bytes;
            (*self.ptr).tx_errors = tx_errors;
            (*self.ptr).tx_dropped = tx_dropped;
        }
    }
}
```

With the above, you replace instances of `&mut RtnlLinkStats64` with
`RtnlLinkStats64Ptr`. That is, the wrapper struct is itself a pointer,
so it does not need to be behind a mutable reference.

This approach also eliminates the double indirection, and I think both
approaches are fine. The mutable reference is probably preferable
because it is more convenient for the user, but there are some cases
where you have to use the `RtnlLinkStats64Ptr` solution, e.g. if the
value behind the pointer is dynamically sized (can happen with tagged
unions).

Alice

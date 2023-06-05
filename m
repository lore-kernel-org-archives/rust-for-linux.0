Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE562C77B73
	for <rust-for-linux@archiver.kernel.org>; Mon,  5 Jun 2023 14:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjFEO1I (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 5 Jun 2023 10:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbjFEO1H (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 5 Jun 2023 10:27:07 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D16099
        for <rust-for-linux@vger.kernel.org>; Mon,  5 Jun 2023 07:27:04 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-43b2c7d9b52so889282137.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jun 2023 07:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685975223; x=1688567223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsIoAS1HNpD11by4u8lMsfHbY9fTFqylEZLe4Tffle0=;
        b=kmI5nRoVCKW2slh57eVl4BIrEaUKIu9UfxHMGagolVB1NscPARl5t7Qq7BpWoaMAQf
         ckfaE92D1ZZFVDjnyBHHTzMoLiVC51WsfbbLcJfuagcMhh7MrYeYO2saUJZ3YRv4fKHC
         9hhd1JAxCzjUeYQDZpiMhSN1cLJivN0Efu/cDFoWJgzT3a0sOoKH3Neu/pDK9RAmWauh
         RNI7COXga093eyxKMw05LYyMP1NG4pgnV61Sa1TWdzm+9yujCycE4S7E8jy8SmXjP9/d
         zUF4phzgyfDbUkp7Vny0hkiC59L1WXkZFvDRmQnElZtTclGOrg1tkcfGLFrGpU7efUC1
         nFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685975223; x=1688567223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsIoAS1HNpD11by4u8lMsfHbY9fTFqylEZLe4Tffle0=;
        b=iovsaBaNuXXXA2ZD3hG6xfN27O1Ld5IABkmHQziiXDGLdBbRTb/wTgRNyPcWwbkoR0
         nrKtmzGJDiLznbYyS3N+XzC46wvPKooUJm9KC9OoZNJfiSjQL/f9LGA0jXLMhycOaBuj
         j90JZlANKspdbAZ7k/37+kRcndK1JhSczNCa4XG9LLpDTtZvUm2XPIqAgFmQSe8bJz7o
         4WMuHTSwAt862hHaXMa2ktfY7zrVN46AvOubbU6JZbcXiO6ujQJgMQbWEpvSuV9yG88L
         4DdqRMJBzqzH8HX1Yv0Rt96pKkdZTXGHxUm6BzXANrzuJBgAXarqsCX2N9iopJQOXSOV
         8vYg==
X-Gm-Message-State: AC+VfDzt943UsKIQT7IU9u6zjoign5Y1IyYwo2ILNoAXdj8qZNEeMXg8
        vwcXHxkoXKdcygJkFpG0H08=
X-Google-Smtp-Source: ACHHUZ5pvJV6OP0kf2tsyDZxB1HlAQP6y06mAHNndhuVhEYMGpTCc5rjifrI9PXK8RJk3FymnPPZKA==
X-Received: by 2002:a67:ee5a:0:b0:43b:240f:b92e with SMTP id g26-20020a67ee5a000000b0043b240fb92emr38095vsp.18.1685975223358;
        Mon, 05 Jun 2023 07:27:03 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id p3-20020a05620a15e300b0075941df3365sm4176035qkm.52.2023.06.05.07.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 07:27:02 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailauth.nyi.internal (Postfix) with ESMTP id 63A3F27C0054;
        Mon,  5 Jun 2023 10:27:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 05 Jun 2023 10:27:02 -0400
X-ME-Sender: <xms:tfB9ZNrHjfXWe7pq79XwLONuPhsx194TjjfYJ9UgMslFMXtlaUfr6w>
    <xme:tfB9ZPoP2n_NMCTNuS0Gl6v3tPkxD5LdWVMYs2wEYF3piKFuzQpuBhHvVRBDhqktC
    4fJo_pYW0auRD-e4w>
X-ME-Received: <xmr:tfB9ZKPBC9g3OJeAvVwxe9Ln8-5UtiU-aQVE11ZDw5PJGu-u1IEtj_z3mu3Po46vUAGxzptacfP8h8Tw9VfufzMsxZRaVIj0wUE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelledgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:tfB9ZI5QIa6Eo8jK_QVhaDEV7_RR9bYvugvKmNNpTWdeJmc-1-D_AQ>
    <xmx:tfB9ZM6kurVjQwTmwcYms_sdAnZH5nCU83UY0iLUG5PYzwsNWo7DOQ>
    <xmx:tfB9ZAjcVyNARVu5-eniNofyKgFD2FZE1hdHDMRzdKXxECCY5MgMvQ>
    <xmx:tvB9ZKm6zMpjIRDrWRUKHwx_2P3oBnPQgORLYVmm2fVh_1cHOTCnQw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jun 2023 10:27:01 -0400 (EDT)
Date:   Mon, 5 Jun 2023 07:26:59 -0700
From:   Boqun Feng <boqun.feng@gmail.com>
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     aliceryhl@google.com, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 3/5] rust: add support for get_stats64 in struct
 net_device_ops
Message-ID: <ZH3wsx9KBFFfL9yT@Boquns-Mac-mini.local>
References: <0101018884325b30-c6344630-ec10-470f-b027-514e7a20d5eb-000000@us-west-2.amazonses.com>
 <20230604124829.1381069-1-aliceryhl@google.com>
 <010101888bd95727-14bd2f14-91f2-4bc2-bca9-e0912f256d21-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010101888bd95727-14bd2f14-91f2-4bc2-bca9-e0912f256d21-000000@us-west-2.amazonses.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Jun 05, 2023 at 01:57:36PM +0000, FUJITA Tomonori wrote:
> Hi,
> 
> On Sun,  4 Jun 2023 12:48:29 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > FUJITA Tomonori writes:
> >> +/// Corresponds to the kernel's `struct rtnl_link_stats64`.
> >> +pub struct RtnlLinkStats64(*mut bindings::rtnl_link_stats64);
> >> +
> >> +impl RtnlLinkStats64 {
> >> +    /// Updates TX stats.
> >> +    pub fn set_tx_stats(&mut self, packets: u64, bytes: u64, errors: u64, dropped: u64) {
> >> +        // SAFETY: The safety requirement ensures that the pointer is valid.
> >> +        unsafe {
> >> +            (*self.0).tx_packets = packets;
> >> +            (*self.0).tx_bytes = bytes;
> >> +            (*self.0).tx_errors = errors;
> >> +            (*self.0).tx_dropped = dropped;
> >> +        }
> >> +    }
> >> +}
> > 
> > It seems like this type is always used behind a reference. Your current
> > approach has the disadvantage that you're introducing an extra layer of
> > indirection. You can avoid that like this:
> > 
> > ```
> > /// Corresponds to the kernel's `struct rtnl_link_stats64`.
> > #[repr(transparent)]
> > pub struct RtnlLinkStats64(Opaque<bindings::rtnl_link_stats64>);
> > 
> > impl RtnlLinkStats64 {
> >     /// # Safety
> >     ///
> >     /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
> >     /// may read or write to the `rtnl_link_stats64` object.
> >     pub unsafe fn from_raw<'a>(ptr: *mut bindings::rtnl_link_stats64) -> &'a mut Self {
> >     	unsafe { &mut *(ptr as *mut Self) }
> >     }
> 
> I was wondering which I should use here, a pointer or Opaque. Can you
> give guidelines on which to use?
> 

Always avoid raw pointers in data structures, unless there is no
dereference on the pointers (i.e. use the pointer types as plain data).

The reason is as Alice mentioned above.

Regards,
Boqun

> The condition in the above commment is met, Opaque should be used?

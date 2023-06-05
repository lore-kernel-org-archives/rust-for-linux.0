Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144EEC77B73
	for <rust-for-linux@archiver.kernel.org>; Mon,  5 Jun 2023 14:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjFEOEm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 5 Jun 2023 10:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234407AbjFEOEZ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 5 Jun 2023 10:04:25 -0400
X-Greylist: delayed 393 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 05 Jun 2023 07:04:10 PDT
Received: from a27-50.smtp-out.us-west-2.amazonses.com (a27-50.smtp-out.us-west-2.amazonses.com [54.240.27.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59EA7E75
        for <rust-for-linux@vger.kernel.org>; Mon,  5 Jun 2023 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685973456;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=AgMzmo1LxL6uIFrodRqRgDnL3yRXk410Acokatvgxqo=;
        b=S8AJLcFK7IGm/ckIxte8m84EO9iLy5vi9yGLpyUcbKMlEFuHHzDuKEVfr16KbhBh
        c9TiNUt2sPlwE9ANGkOM5KYx0VLSk/UiUnHnJJ9kY1mgc1S4QEh+PBJ57ASQiJxFgzd
        8XUez/rZzvgReFe20afUqiKjX1VWYg6bJH4gIsPxQSziX+1Wuto9ecqii/Pp5X2rVJJ
        OWlS+9XgMJkwjCohsSsWw1CdJp0zSiB19Gjbn1DyFXx3dAKNSAMeT/3dk9WShRPbvDh
        5Xygdwz7AEDE5pBkSSJ0nU9Zknhj2xtum0ZB6WK+WQel+prsXvBSBWyM3dAyGSz8dCl
        ITE3TnrVCQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685973456;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=AgMzmo1LxL6uIFrodRqRgDnL3yRXk410Acokatvgxqo=;
        b=mvoDGeM3ORVSAgO5RyhSoOJFmkR3Yxh66gtnKxv/uVGp945tdcr6l+SgPoHDrT93
        EQXpJ5xpuDs8rN/ALuGfrsRWwMTM+wMgLwdfZnwdy/SOCjHZ2SyfxZ1R73m0Kg4V427
        JccYC7Y79Hg/XzGHJv/NPPFNyJqXxuXFNIy2ao9Y=
Date:   Mon, 5 Jun 2023 13:57:36 +0000
Message-ID: <010101888bd95727-14bd2f14-91f2-4bc2-bca9-e0912f256d21-000000@us-west-2.amazonses.com>
To:     aliceryhl@google.com
Cc:     tomo@exabit.dev, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 3/5] rust: add support for get_stats64 in struct
 net_device_ops
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20230604124829.1381069-1-aliceryhl@google.com>
References: <0101018884325b30-c6344630-ec10-470f-b027-514e7a20d5eb-000000@us-west-2.amazonses.com>
        <20230604124829.1381069-1-aliceryhl@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.05-54.240.27.50
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Sun,  4 Jun 2023 12:48:29 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> FUJITA Tomonori writes:
>> +/// Corresponds to the kernel's `struct rtnl_link_stats64`.
>> +pub struct RtnlLinkStats64(*mut bindings::rtnl_link_stats64);
>> +
>> +impl RtnlLinkStats64 {
>> +    /// Updates TX stats.
>> +    pub fn set_tx_stats(&mut self, packets: u64, bytes: u64, errors: u64, dropped: u64) {
>> +        // SAFETY: The safety requirement ensures that the pointer is valid.
>> +        unsafe {
>> +            (*self.0).tx_packets = packets;
>> +            (*self.0).tx_bytes = bytes;
>> +            (*self.0).tx_errors = errors;
>> +            (*self.0).tx_dropped = dropped;
>> +        }
>> +    }
>> +}
> 
> It seems like this type is always used behind a reference. Your current
> approach has the disadvantage that you're introducing an extra layer of
> indirection. You can avoid that like this:
> 
> ```
> /// Corresponds to the kernel's `struct rtnl_link_stats64`.
> #[repr(transparent)]
> pub struct RtnlLinkStats64(Opaque<bindings::rtnl_link_stats64>);
> 
> impl RtnlLinkStats64 {
>     /// # Safety
>     ///
>     /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
>     /// may read or write to the `rtnl_link_stats64` object.
>     pub unsafe fn from_raw<'a>(ptr: *mut bindings::rtnl_link_stats64) -> &'a mut Self {
>     	unsafe { &mut *(ptr as *mut Self) }
>     }

I was wondering which I should use here, a pointer or Opaque. Can you
give guidelines on which to use?

The condition in the above commment is met, Opaque should be used?

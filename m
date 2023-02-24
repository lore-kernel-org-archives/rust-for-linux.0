Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6ADC61DA4
	for <rust-for-linux@archiver.kernel.org>; Fri, 24 Feb 2023 15:34:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjBXPek (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 24 Feb 2023 10:34:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjBXPej (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 24 Feb 2023 10:34:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E07519BD;
        Fri, 24 Feb 2023 07:34:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C3629B81BA6;
        Fri, 24 Feb 2023 15:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA4AC433D2;
        Fri, 24 Feb 2023 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677252875;
        bh=yqgynGCXjfHPElbDGyjxGTtMq2BNVsC10RR73bI0d14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EQCCIOMP44xsBGBDCLyxlirfFI/BaNyP4f1UVzZrOaxYFhun01K2AGzChwCDfNowB
         L3YsmZTRa560/PRBoxWv69q9Cm3mgHU2wmsv/S8AroDbb/W6Pm36jyCL+8C1OSEPUW
         pM8tbmkKmda9zWQwdovIUbhsy186VyN3YaRVjo0k=
Date:   Fri, 24 Feb 2023 16:34:32 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Asahi Lina <lina@asahilina.net>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH 5/5] rust: device: Add a stub abstraction for devices
Message-ID: <Y/jZCCl4jbKoOiPX@kroah.com>
References: <20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net>
 <20230224-rust-iopt-rtkit-v1-5-49ced3391295@asahilina.net>
 <Y/idMBIOfFZxXnVM@kroah.com>
 <26fc1456-0244-a379-0af4-e6adc819545c@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26fc1456-0244-a379-0af4-e6adc819545c@asahilina.net>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Feb 25, 2023 at 12:10:47AM +0900, Asahi Lina wrote:
> >> +impl Device {
> >> +    /// Creates a new device instance.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
> >> +    pub unsafe fn new(ptr: *mut bindings::device) -> Self {
> >> +        // SAFETY: By the safety requirements, ptr is valid and its refcounted will be incremented.
> >> +        unsafe { bindings::get_device(ptr) };
> > 
> > You don't check the return value of get_device()?  What if it failed
> > (hint, it can)?
> 
> Really? I looked at the implementation and I don't see how it can fail,
> as long as the argument is non-NULL and valid... (which is a
> precondition of this unsafe function). Did I miss something?

This function has changed a bit over time, but yes, it could fail if
someone else just dropped the last reference right before you tried to
grab a new one (look at the implementation of kobject_get()).

Yes, if you "know" you have a non-zero reference count first, it should
never fail, but how do you know this?  We have the ability to check the
return value of the function, shouldn't that happen?

thanks,

greg k-h

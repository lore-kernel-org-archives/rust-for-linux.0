Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7100C433B4
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 10:05:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BDB961453
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 10:05:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbhD2KF6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Apr 2021 06:05:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:38826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232258AbhD2KF6 (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Apr 2021 06:05:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C0766142A;
        Thu, 29 Apr 2021 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619690711;
        bh=B4U6INbbFuXS+8tIhj+PBopurtIGvEU38c61RE6Eub0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bLXOyZU9r4x90zJaCqHW5KIYgp0EHTxJB/k2ST7qXSsJZNBYfx3gvIspOCwv+1vz3
         yqtAkzvhxz936nWSSn2FGTU7aq2bTvLl5HDGx3Qvzqz9F6OIAlx7lP6DfpCs3iAnBW
         f4U/VDleEEXsl/sRT7bOUs7Yfa8NxccafswaPOck=
Date:   Thu, 29 Apr 2021 12:05:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: module parameters permission
Message-ID: <YIqE1B3qMK+5AwQj@kroah.com>
References: <20210429095819.GE1409@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429095819.GE1409@agape.jhs>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Apr 29, 2021 at 11:58:20AM +0200, Fabio Aiuto wrote:
> Hi all,
> 
> I'm trying to declare module parameters this way:
> 
> 
>    params: {
>         scull_major: i32 {
>             default: 0,
>             permissions: bindings::S_IRUGO as i32,
>             description: b"Major number",
>         },
>         scull_minor: i32 {
>             default: 0,
>             permissions: bindings::S_IRUGO as i32,
>             description: b"Minor number",
>         },
> 
> i.e. using S_IRUGO macro exposed by bindgen. But I have the
> following compiler error:
> 
> error: proc macro panicked
>   --> samples/rust/rust_scull.rs:12:1
>    |
> 12 | / module! {
> 13 | |     type: RustScull,
> 14 | |     name: b"rust_scull",
> 15 | |     author: b"Alessandro Rubini, Jonathan Corbet",
> ...  |
> 44 | |     },
> 45 | | }
>    | |_^
>    |
>    = help: message: Expected Literal
> 
> the same if I remove as i32 casts.
> 
> if I write permissions as in samples/rust/rust_module_parameters.rs
> 
>     params: {
>         my_bool: bool {
>             default: true,
>             permissions: 0,
>             description: b"Example of bool",
>         },
>         my_i32: i32 {
>             default: 42,
>             permissions: 0o644, <-------
>             description: b"Example of i32",
>         },
> 
> I get no error.
> 
> What's the right way to use S_I*UGO macros?

Not at all, use the octal values instead please.

That's the way that we have declared a while ago, and I think
checkpatch.pl will even catch if you try to do this in any new code.
Please don't force us to deal with S_* defines in rust code as well.

thanks,

greg k-h

Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B59C6FA8E
	for <rust-for-linux@archiver.kernel.org>; Fri, 24 Feb 2023 23:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjBXX4m (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 24 Feb 2023 18:56:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjBXX4l (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 24 Feb 2023 18:56:41 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E784988A;
        Fri, 24 Feb 2023 15:56:33 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id h19so1221629qtk.7;
        Fri, 24 Feb 2023 15:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mg1OhrK00U2abybneZCMDTPfqJM1ATwamgUcjQxT/Ug=;
        b=GiygabvyzRuFJ8dv+ivRo4TEC+5qtINQFNuDy7WUVNf6VjdtII4weY5pTfheItp32m
         FAF3kfBxoxVYBIaBU6+ddc0CvpZ6btskJh4DWm7CVnTqHeihGRS8oky97Cy9rpXd6Yiu
         U0JTpYp60G3Y9W0SruQ+Qk4CMAyqTctP2xfpnmc3jwGzQ7UCuhmL3CbqmbyVIt87U8PX
         jMy1BcHhv7l59Rb9OYtwpR5LwXlGnyC3CN0WS7NgRAzxXKVnwvethiLcXe6IkXWCdcBI
         /A1FhsY3XtEiLJ8LizRwRENmtU/Tk6bwlmsmQm0HJdXeUVXMRTBPhVxXpgqp8lqf0Hky
         1BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mg1OhrK00U2abybneZCMDTPfqJM1ATwamgUcjQxT/Ug=;
        b=iM1vsFZ17cIPt0QeyPAb4oNG/KfsyYdlZGvDxtSuWMU3IY6UnKLrIOrUk4HOFtpMRE
         In7MFlZq6tSt0Vmn8ssIlyEqEkgJ3+qKY8iY5AqpgerFhP9qSliPZkvsy+8tOgZcJC/Y
         Wce0Zk49w/P1VuznV1HyZrEIoOWrpDS6y6BhC2+mHUyYNQ1er9IaSOfE5UwBxXF0n4Ga
         bhYzPPw+HQNW5i5lTnSSmNlaoaTYMZcnBVum/EIVBlcWjatCzGlyzN7ZmaGoVBVMubdC
         avqRBk2aQ1WNubJV7t+zJhKTc6LrBDM2c1XwHH/9wS2RYgwQbE5WyCn87LOIURQOMQdl
         DC7w==
X-Gm-Message-State: AO0yUKUsk5ZRk0fdbqLGaFP4E8BtikGJHxNjoxdkK9vGY6xTzyJggQWQ
        rHeAoV6yEgd+Drgg3PMGBhHOtmkG7Wc=
X-Google-Smtp-Source: AK7set+CUGse5PQzutt0zUhWY1SRG6tx0fw2YPSB3juRWoaHUjROLJOFGsQFJr0Vbn70qpGsYVHarA==
X-Received: by 2002:a05:622a:c6:b0:3bf:c665:657 with SMTP id p6-20020a05622a00c600b003bfc6650657mr281115qtw.8.1677282993098;
        Fri, 24 Feb 2023 15:56:33 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id t30-20020a05620a005e00b00742709bc5edsm291976qkt.5.2023.02.24.15.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 15:56:32 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailauth.nyi.internal (Postfix) with ESMTP id 0933727C0054;
        Fri, 24 Feb 2023 18:56:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 24 Feb 2023 18:56:32 -0500
X-ME-Sender: <xms:r075YyXhOKyjdjgVphWHVyKy6cjIrDB_C2iDKSi51bLdZIQxqQLW2A>
    <xme:r075Y-k2kVqw78n09CMOwAgyd_XbiSjRPOr-VyoaxqoHFU_9M_wxk3LUgxg14yDIZ
    6hG758rm4MZhBvW2g>
X-ME-Received: <xmr:r075Y2YPVqsn_xIskHNtbTlLy6bxgqWg1HPpEtVDjE45e7pPW1VC_0Nuv7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:r075Y5WeZTC3YruI4k9p0OVOq-louwPCjoZKGlOXhpqw-N2pMMTckw>
    <xmx:r075Y8knXovlpj2zQVtOQDHUDN-qqwuCjHu4ga50I7RvMxKL282wGw>
    <xmx:r075Y-ciCGuJDpogbTh2hnCx3Bn5iTHz-WCKdWNt4MHk0BKL9ggGEQ>
    <xmx:r075Y1c-shbs9FZq5sSEnT3_PgEBnnigeaSdiVOBRe-oMdLlsNwFuw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Feb 2023 18:56:30 -0500 (EST)
Date:   Fri, 24 Feb 2023 15:56:05 -0800
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Asahi Lina <lina@asahilina.net>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Fox Chen <foxhlchen@gmail.com>, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH 5/5] rust: error: Add from_kernel_result!() macro
Message-ID: <Y/lOlcSpc+d9ytq/@boqun-archlinux>
References: <20230224-rust-error-v1-0-f8f9a9a87303@asahilina.net>
 <20230224-rust-error-v1-5-f8f9a9a87303@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-rust-error-v1-5-f8f9a9a87303@asahilina.net>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Feb 24, 2023 at 05:50:23PM +0900, Asahi Lina wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> Add a helper macro to easily return C result codes from a Rust function
> that calls functions which return a Result<T>.
> 
> Lina: Imported from rust-for-linux/rust, originally developed by Wedson
> as part of file_operations.rs. Added the allow() flags since there is no
> user in the kernel crate yet and fixed a typo in a comment.
> 
> Co-developed-by: Fox Chen <foxhlchen@gmail.com>
> Signed-off-by: Fox Chen <foxhlchen@gmail.com>
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/kernel/error.rs | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index cf3d089477d2..8a9222595cd1 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -226,3 +226,55 @@ pub(crate) fn from_kernel_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
>      }
>      Ok(ptr)
>  }
> +
> +// TODO: Remove `dead_code` marker once an in-kernel client is available.
> +#[allow(dead_code)]
> +pub(crate) fn from_kernel_result_helper<T>(r: Result<T>) -> T
> +where
> +    T: From<i16>,
> +{
> +    match r {
> +        Ok(v) => v,
> +        // NO-OVERFLOW: negative `errno`s are no smaller than `-bindings::MAX_ERRNO`,
> +        // `-bindings::MAX_ERRNO` fits in an `i16` as per invariant above,
> +        // therefore a negative `errno` always fits in an `i16` and will not overflow.
> +        Err(e) => T::from(e.to_kernel_errno() as i16),
> +    }
> +}
> +
> +/// Transforms a [`crate::error::Result<T>`] to a kernel C integer result.
> +///
> +/// This is useful when calling Rust functions that return [`crate::error::Result<T>`]
> +/// from inside `extern "C"` functions that need to return an integer
> +/// error result.
> +///
> +/// `T` should be convertible from an `i16` via `From<i16>`.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// # use kernel::from_kernel_result;
> +/// # use kernel::bindings;
> +/// unsafe extern "C" fn probe_callback(
> +///     pdev: *mut bindings::platform_device,
> +/// ) -> core::ffi::c_int {
> +///     from_kernel_result! {
> +///         let ptr = devm_alloc(pdev)?;
> +///         bindings::platform_set_drvdata(pdev, ptr);
> +///         Ok(0)
> +///     }
> +/// }
> +/// ```
> +// TODO: Remove `unused_macros` marker once an in-kernel client is available.
> +#[allow(unused_macros)]
> +macro_rules! from_kernel_result {

This actually doesn't need to be a macro, right? The following function
version:

	pub fn from_kernel_result<T, F>(f: F) -> T
	where
	    T: From<i16>,
	    F: FnOnce() -> Result<T>;

is not bad, the above case then can be written as:

	unsafe extern "C" fn probe_callback(
	    pdev: *mut bindings::platform_device,
	) -> core::ffi::c_int {
	    from_kernel_result(|| {
		let ptr = devm_alloc(pdev)?;
		bindings::platform_set_drvdata(pdev, ptr);
		Ok(0)
	    })
	}

less magical, but the control flow is more clear.

Thoughts?

Regards,
Boqun

> +    ($($tt:tt)*) => {{
> +        $crate::error::from_kernel_result_helper((|| {
> +            $($tt)*
> +        })())
> +    }};
> +}
> +
> +// TODO: Remove `unused_imports` marker once an in-kernel client is available.
> +#[allow(unused_imports)]
> +pub(crate) use from_kernel_result;
> 
> -- 
> 2.35.1
> 

Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852EE30DEA6
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780757491; cv=none; b=BRpj87If6eq1a+M1yV8sLfcPqRtUT1eegiHZr28i0fMfOs9T+ZcH2JDZaOk+Es7cvX6nyjaTPq//FJ0K+ATD7FvTW7K/oBoOUpXrlzWmI91htCiH6/gAlNU6qEVN7idVGVKTeMz6ZHYRhkVeDW5+pONijUL0gaPWmEeuvWPFgAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780757491; c=relaxed/simple;
	bh=sWf4wkTLH789FhDJhKwyO+AP6oz1ciEMmywSF3k68cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Do8ggvNeS2dGbyCLGRhDFM38mVbl+PYAtuTGmpPCpJf0SkJKlWxrbUDKC0Gr58Qh7EqvLINAr0f0QZ9vYkcK/76cx5DIAAcInqXyr7qRidBnT/+zndANnq+RPJ9aAjtuAWHGe0zUIxe4yrMd7G2GcWOMywwOoAPwDeBadloKrEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mwTpoKTL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mwTpoKTL"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf22c18ad3so222175ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jun 2026 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780757490; x=1781362290; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=djjDHCNu5izfnOxL/0uU9FKY3th5OUnw0j8EdOmNhFQ=;
        b=mwTpoKTLoJLk4UCLenX+wB1Nuhrce9itZ5uqLvTXdWL8exy+PjvB1/H7Fee/YocHxI
         ON8efXursaDiWLN9nVRIHMEOi+QbZ87A9B7dwHVLEK5V4AqOFn8ytBxVNlCh0rSzQZWS
         zTU7DX8uZMfm69SlKLwzEgqLO+TF69xf4J7j9YTswnMBENMm6hLNtNzXWrty1qUCmUeX
         pGxm9cdzNvLDrZWKyNReepD2caMxC2UA7/I1ApI3Ns42G5j7bSRDIrCWHooyK7RQDc1K
         M44a5yMZfAEaB00qvHuJ55rf7p3+4m6DHG0EPOXwqeoVNrNn0vk9c/0wPGLCQvmgCn/L
         1Iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780757490; x=1781362290;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djjDHCNu5izfnOxL/0uU9FKY3th5OUnw0j8EdOmNhFQ=;
        b=LcyeyFZv9LAHznuqcoNkjmQx1CogEhGVyRPwX+fEu/uGj/GchHIO2U/UkyzyS1I8tg
         E30ZLFj1/AUi2FuKto1A2xh188RGzpFQEA3RX1hBocsjZxYuAW8E84p/wMi6c0N1bDIH
         n+TnWJ50Ehvohqbjj8US3eyWYX1bSl2FmIDa7KRSR++hsGI7+buBbuyJ2AOllnJtWqRF
         4KHvwOsMY8euh4VbfbQTnY6/fqzoeUX+nBymolltGAZTQUaD6R9KX97AjdW/wI+PWU8Z
         oVmLRg3FtWlr0+Pw7h3ZHFw0SHPLS1Yfoc9zOcmZsGIUutjGOdoF04dKVlbXnI0AUphs
         HWJg==
X-Forwarded-Encrypted: i=1; AFNElJ9t4njAhO8s5uMsS56DFthqV+n4YQF6Ku2hS1YtPoHfWagDtc7THZi2t580GhcmdmM9E4qDp1faS10O2uIXqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKn76pngGkzuCAQI0h7V2c1rRbfIXFpjBVhyehugwo6l4pJKde
	lnYC4KtbGBSu1l+iNhcyeI/hGL/Xm9LCTvlS2XwvVF0+3uIQYl+wc6xe2YRiP4e1/A==
X-Gm-Gg: Acq92OETncuqdIJgxRX99AGv6mBkKBrrWPlrlXEhASGvRXNjwBU9Yn1KHvjwAGb0dIB
	2lDMYPZOyEVCT6rcYMwBI3CILM4rQvbjXz5+BUi6A3bWBTx9/d407stQtIpvbUjXKfUDd5VdpFt
	Vl6fAhz2s7O48sRyGxeV3ClSBbDpU7Y88B8XlNklKHVVqCEldK0J15IPTPOtMN3/UO0HxDn7bdm
	o33K2MFditY2ZshmQeBl4A6JCpXguFbxPlbJYZbTzde0hfJChL23vHi5La2D08jKOOpWKVO/qnv
	2ZAqsa9tCXhmhKz8BibtBwyXIBHQwAiTFUbDogK61G49xZB0jfxWDvTdk4MJ0X9GWXEfFLi+iOo
	8VGIbMZ/EzjyHy/Vm2En8Fd0fTg6RqFLjyIBmkeHQxfkXl6pDg4hYi6hAY3F9UGrABjdYjh9KQH
	pDvi4Y3Pa5JAO+6b6Gy0J3FhNa1zBhoImblBwOx+Uff+fpCS/IDg3sLe0oxKXhC23lZiL9YLmrU
	XabmfwLQLcb2E5ZUB+GSQPr8M/frbwrnIOSwx0l2ULqbHTjJQ/WqoZRYk/k1bY64lI=
X-Received: by 2002:a17:903:46ce:b0:2bf:749:55c with SMTP id d9443c01a7336-2c1eb72eca7mr3563915ad.21.1780757489421;
        Sat, 06 Jun 2026 07:51:29 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b26bbsm10870423a12.23.2026.06.06.07.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 07:51:27 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:51:23 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yunseong Kim <yunseong.kim@est.tech>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Brian Swetland <swetland@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Subject: Re: [PATCH 0/4] binder: cap max_threads and reject duplicate looper
 entry
Message-ID: <aiQz6zwXRQEpf7wF@google.com>
References: <20260603-b4-binder-hardening-v1-0-d0aae3556c9b@est.tech>
 <CAH5fLgh664qa63CBqWY1CVNkdMwJbOPNzzPawpm8Ctz4U219gw@mail.gmail.com>
 <0dd33a00-8fe9-49e1-a32f-565c4a312429@est.tech>
 <aiKc-4v4T4X4DKSL@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiKc-4v4T4X4DKSL@google.com>

On Fri, Jun 05, 2026 at 09:55:07AM +0000, Alice Ryhl wrote:
> On Thu, Jun 04, 2026 at 10:27:19PM +0200, Yunseong Kim wrote:
> > Hi Alice,
> > 
> > On 6/3/26 20:57, Alice Ryhl wrote:
> > > On Wed, Jun 3, 2026 at 8:02 PM Yunseong Kim <yunseong.kim@est.tech> wrote:
> > > 
> > > My understanding is that the only thing BINDER_SET_MAX_THREADS does is
> > > cause the kernel to tell userspace "please spawn more threads" when
> > > all threads are in use and there are incoming transactions. I don't
> > > understand how it helps by pass ulimit. Did you try running your test

Correct. SET_MAX_THREADS is simply the threshold at which the kernel
will stop pinging userspace to "please spawn more threads". Nothing
more.

Userspace can choose to ignore that or not. It's got complete control
(as it should) to spawn more threads, and it would still be bounded by
its system-level limits (RLIMIT_NPROC).


> > I think accepting 0xFFFFFFFF for a thread pool size is arguably poor input
> > validation. no sane userspace would request 4 billion threads.
> >
> > Would a separate patch (without Fixes tag) that caps max_threads at a
> > reasonable upper bound be welcome, or is it not worth the churn? this is
> > hardening, not a security fix.
> 
> I don't think that's useful.

Right. Please let userspace decide it's own threshold. Let's instead use
the appropriate means to limit the thread creation. There is no need to
duplicate that in binder.

Cheers,
--
Carlos Llamas

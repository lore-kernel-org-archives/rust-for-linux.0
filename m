Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B7E38DCC
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 20:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714510788; cv=none; b=aAiLL4N8qGBfI0+Hj7KCKhfF5ZHkV+gwVJsK/9E3NcU0LcDNN/+ftuH+FZHuHOvHZ3acGU8gPH4FHOa6u7Y2HywwLO5HJFOf7pOv8AHuHjKVS6gxL5QE46EDryEGIaqjpf73PDXnN48OZekkbatZ6tkHaKCNISwJJNSsLc9ekF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714510788; c=relaxed/simple;
	bh=gaxg8fAfCg+iDe9RcJiai35Bjxc5cbef5aQt8tLLARI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuJTz/Wv4sHGlsQDYNGg3120+l8X/sJDe7sYw5yZlOr8IjnGtBjrCaxkugFK+zXm2RO6VenY6RCjPesGeMgcQd8XOh33neZP6Hh3g0VNrNiFiEir+Ij/c8WIzxd12ysaXQjnFMtq/rnuqFt8fv8Uc7mdu9hb2wO/eFMsSjWuESk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOHId143; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOHId143"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-437a660c94fso39123001cf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 13:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714510785; x=1715115585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GLDOY4s61u1NwB/kb6EoayA2H3UKveNuz4joQBY4Dc=;
        b=dOHId143d0Bs9upoy/5oRE/I4tPxQkc7DAT9bL0PFDR8/FTpUQdVZwf/ZgpPVepK77
         F6t09r6F/i2T18P/nTo+a80UmCoKJzEiBt1p5ijhTBMnc1cxDV6ZIxSXtsV2s8g/T40N
         5t799h2XBnpG1STdYc9fRaKykutoQQN8jFPkl++qB9sFQ19/0jagd2D9Tu5VIdRqis3Z
         dZDZfK7EVCVYZCRs+C7vatZkxkcFYCVy33xJxVcdX23rHh5d+F/3+WGpWB77xmaumnqy
         Jhtq4fmhk5pdptbw+MCNcgd/VDUrtpfpQhbaDg5AuZvfNtuvowjk/+2jm7PQzO8lCfTg
         JFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714510785; x=1715115585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GLDOY4s61u1NwB/kb6EoayA2H3UKveNuz4joQBY4Dc=;
        b=fn6b/+bsRXYX8WnuEXIFEwnYPqasJr7BnNLd43WrN6vPYBXWrX3JEmjLjA3dAi2bJL
         3wy2gTSsGHeWjshGz+lWQMT9ec0mQG6cqn79Yqwe9abRtSKNIvT+squFJuFQS+tvIRC+
         SfLaeF5jQ2h2ov3/oyfvD3bV9/43JGK9PyS2DJY2lgQTf7BryDastVRTpmmr95W6IwcU
         AymnYUwQJZvvxZCJVlOSYRnmPfU9g8Lcblpd+LTSl8lgtx3QYxzE+mo9D7ezIUoiuIL8
         qaS3+7f6wSCxSW7w363tMkTU3l6vHZ7S4YEApkxEsevJDC0QzIQhrtBK1R6+izXHLkV4
         WZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7egX7TsGOioszADSq72uflati/2HwDXMG73/2ZnO/ippHRXdW3p1tNYyZNPZNEY4ylzSNMk5UN2Imhq3Q0CU1i1N56YzQE6zinTgotHo=
X-Gm-Message-State: AOJu0Yww5iZYtJ08h4iHvvYdpJK9eneyQ48wbk0+Yzu3q0PmjqO582Go
	OeBNO6yf/QY6IySHCyhEFCyssTZGF7glYce0E4oKVYp1+WWwwrp7
X-Google-Smtp-Source: AGHT+IF/QdrVGxRzzpMK/60GtkVOKY8JlFlnVivVLAS14K++tGMsYaPtlFPd/Wruqr5hQrG+L1gSjA==
X-Received: by 2002:a05:622a:345:b0:43b:b1:f4df with SMTP id r5-20020a05622a034500b0043b00b1f4dfmr572026qtw.7.1714510785499;
        Tue, 30 Apr 2024 13:59:45 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id b13-20020ac8754d000000b0043718726f76sm11635205qtr.90.2024.04.30.13.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 13:59:45 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 95B461200069;
	Tue, 30 Apr 2024 16:59:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 30 Apr 2024 16:59:44 -0400
X-ME-Sender: <xms:wFsxZvGb9YEg3qRXCZ3QMw5LQH0ysD570HlmSnDw9MFRc018VXyIkw>
    <xme:wFsxZsUH0AdlVuHBJybYsA3d0P17CTbvoYmiS6yJ1Tx6yhkVpCH6pbeypdXY6Wg9u
    BkuEbtvZ1wnxd9Edg>
X-ME-Received: <xmr:wFsxZhKlijE6LoVfeqtwZo7XXQYBWnxMpgS_RAfhpL2rQa2JM48meRqYHC0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddufedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeeg
    vddvhedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:wFsxZtHg0bXdqdY6Rm7IHIdBPTbcjg9mUrRnN0P3T5lb7hB0_2RiSw>
    <xmx:wFsxZlVDSLWK8iMsOZYdvJfVzXXim1cEOHjOMz-6KPFgRqQzFHH1ZQ>
    <xmx:wFsxZoOlhWW_VrHNIPC_5w6_rQ948FPXZ5xYPkR3B1_-c9T5WRKavA>
    <xmx:wFsxZk28_O2SYeasMTMwgx5FW_7X9lD4r0VxJYnt9IGFt64b-hNRXw>
    <xmx:wFsxZqUndsv450MlfBvwrwfE-04xo40EPAUd4TA249uSYK2hpQLUIz6a>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Apr 2024 16:59:43 -0400 (EDT)
Date: Tue, 30 Apr 2024 13:59:19 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <ZjFbp_XABvDRXIaL@boqun-archlinux>
References: <20240429192435.2235-1-dakr@redhat.com>
 <Zi_6aDHO4B_iY9zF@boqun-archlinux>
 <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
 <ZjAYpsFROI9agY_L@boqun-archlinux>
 <ZjEfW6QpErDDnntk@pollux>
 <ZjE5gzb-aDNyK2Xv@boqun-archlinux>
 <ZjFYvPyTl6UaYSrn@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjFYvPyTl6UaYSrn@pollux>

On Tue, Apr 30, 2024 at 10:46:52PM +0200, Danilo Krummrich wrote:
> On Tue, Apr 30, 2024 at 11:33:39AM -0700, Boqun Feng wrote:
> > On Tue, Apr 30, 2024 at 06:42:03PM +0200, Danilo Krummrich wrote:
> > > On Mon, Apr 29, 2024 at 03:01:10PM -0700, Boqun Feng wrote:
> > > > On Mon, Apr 29, 2024 at 11:01:45PM +0200, Danilo Krummrich wrote:
> > > > > On 4/29/24 21:52, Boqun Feng wrote:
> > > > > > On Mon, Apr 29, 2024 at 09:24:04PM +0200, Danilo Krummrich wrote:
> > > > > > > Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > > > > > > initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > > > > > > passing a dangling pointer (instead of NULL) to krealloc() whenever a
> > > > > > > new Vec<T> is created through VecExt<T> extension functions.
> > > > > > > 
> > > > > > > This only works since it happens that Unique::dangling()'s value (0x1)
> > > > > > > falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> > > > > > > krealloc() hence treats it the same as a NULL pointer however.
> > > > > > > 
> > > > > > 
> > > > > > Good catch!
> > > > > > 
> > > > > > > This isn't a case we should rely on, especially since other kernel
> > > > > > > allocators are not as tolerant. Instead, pass a real NULL pointer to
> > > > > > > krealloc_aligned() if Vec<T>'s capacity is zero.
> > > > > > > 
> > > > > > > Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> > > > > > 
> > > > > > However, since this commit is not upstreamed yet, so it's suject to
> > > > > > change, I'd avoid the "Fixes" tag here. Alternatively, Miguel can fold
> > > > > > this patch into that commit in his tree.
> > > > > 
> > > > > I'd be surprised if rust-next wouldn't be fast-forward only, is it? If
> > > > 
> > > > Well, I cannot speak for Miguel, but there's no guarantee of that IMO.
> > > 
> > > @Miguel, which one is it?
> > > 
> > 
> > Just FYI, linux-next has all the history of rust-next snapshots, in
> > 20230411:
> > 
> > commit ("rust: sync: add functions for initializing
> > `UniqueArc<MaybeUninit<T>>`") has commit id
> > 2d0dec625d872a41632a68fce2e69453ed87df91:
> > 
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230411&id=2d0dec625d872a41632a68fce2e69453ed87df91
> > 
> > in 20230421 (also in the PULL request), the commmit changes its id to
> > 1944caa8e8dcb2d93d99d8364719ad8d07aa163f :
> > 
> > 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230421&id=1944caa8e8dcb2d93d99d8364719ad8d07aa163f
> 
> Yes, linux-next is an exception. But linux-next is also never directly pulled
> into Linus' tree.
> 

The point is that linux-next merges a snapshot of the -next branches it
tracks, and what I post is an example that a particular commit changes
its id in rust-next. In other words, you CANNOT assume that today's
rust-next will be the final version merged in Linus' tree.

> > 
> > The -next branches are subject to rebase for multiples reasons (e.g.
> > applying a Reviewed-by tag after queued), so the commit id in these
> > branches is not guaranteed to stay the same.
> 
> I've never seen that this has been common practice after patches have been
> applied already.
> 

Here you go:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230411&id=105d7c03679002c977e98b13e7a4008cc3933fde
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230421&id=692e8935e23efab6c5d5fc4b003816b33c8082f7

in this case, Alice's Reviewed-by was added between different versions
(snapshots) of rust-next.

Regards,
Boqun

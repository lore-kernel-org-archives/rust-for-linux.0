Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A700CA6F
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 22:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714516936; cv=none; b=AVbjgq5I4sVI16YvYOZM77engpDE6xxzpTkuAwmrq9hbqQSk08u/t3m5m1e+tRKb2dewVKVEDQRiNKudr1aEN2Arz6NfmMpDHUoNXq+zQzKXhhRK6MmbU5a6HPS1ZTcCbpUeLJuhyp9MGArvNDj9L39gG/ZnXVyj46d7gn+ZovM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714516936; c=relaxed/simple;
	bh=9WnsOFbU6rlRnGALGrPtr1ixoVBv1ao/gLGQiBnwc90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JY3HRcWr3rmJhRI8mvJ0WAlAZG64Yyt0z/nNdu4xqnMHFpRXFey2L2ehazTwAnuRHqgztuRYy4pWrPLNFuxbF3CRd3zZ0jkp3SFCYvAVxrIASZ/zybnWAaZwNylppjzHDCEYFrcZBEL4Fp2JzlBEzZbni+2BS0xvK/gYTH8RNrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/GwJlgD; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/GwJlgD"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-43ad4097aefso11675131cf.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714516933; x=1715121733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir3dOz9CAHvPl1te3XIrGoa7f4nfP9mjyw/RinnHhoQ=;
        b=S/GwJlgD/f+2VaslQb+bLjT0k+KpCtxIrgBfRd5ziftsmI5KM/yscTqEP6/uI9DrUs
         WOGfXixpHLvhcAyhAvmhNlhAwiR+4Wp8ptpKp+/TzHhyOUrl/IhoMa1dukW5WV4W7Q0G
         HuRSdg8OYcqzV5AYTNmJcXRwOumEwmW9ckJanmGra9ZNi8QHbkCd5UoKSAAHILcEI2h7
         +TMPWBNbY9w2Gpk7lV4Lrgi9anhAbXef1HrhbKdX8rQu17JeId2Oa6mmMjwqpQVJMiZi
         lb/a0oaNknl90P98vSvar4ZQjTbO/8wiO2ckZRmo8IgLlE4fqBc5LiBCB7+Tie6YUVuL
         43uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714516933; x=1715121733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir3dOz9CAHvPl1te3XIrGoa7f4nfP9mjyw/RinnHhoQ=;
        b=M2/tGtBBW9n9rtlqr0hBmjNM04yicb+GSrQFJNW/aCY1umGnAQ2M8eHpNg9Ucm4Woe
         IXGwjSjctr6OP1nZqNoe/zkQcoVRfg4ZM2kCrhbcToAAyJpMDuWeGFDLrT3ktfdYliyT
         hHpqGoitW6T8hxWrLjl1kqZglIzzHpsfNffeJExRh0Z7sGQjHq9P+HDM+mtlmtAEtRyp
         IY2Sj0BTKVlRS0YkwwZxz/952DLCEyNjrYK31k//LbNbCABX8hBjCTbBL6hXInsfa6tz
         gkyMJW9tdu6P0QQiiugci+BXrHw/PLfvv9eliLMKLOGP+f8CwOS/PaxOF8dHKNGlUrFp
         lc6A==
X-Forwarded-Encrypted: i=1; AJvYcCWM2B0Vq+vfuuufCvJ4njdwDBdI1nkwIZW2DB4Gno/LeVl0sMhoEqOCh2Z4hmIzhdw0shRyy9WSW/VU0dLXy9DU3njo5sM9OFTPBGpxqVE=
X-Gm-Message-State: AOJu0YwEdsESGJNKJdohFUSOSEyRdMr6Z7IMdsdE572IMHfVVdTidRN4
	DiqMluK74sB6DQfasvNTF5CnjZkJj6hegeYOH4xtJt/fr4/TfY6r
X-Google-Smtp-Source: AGHT+IGgxt/8n+i50Tbcbv4QBO0cfoytma4UyZC8sfieAMpZbRZZSHQnGuJmLjywlZ1fTuEX214niQ==
X-Received: by 2002:a05:622a:10f:b0:43a:d4ac:7976 with SMTP id u15-20020a05622a010f00b0043ad4ac7976mr801604qtw.56.1714516933188;
        Tue, 30 Apr 2024 15:42:13 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id do7-20020a05622a478700b0043999fccc10sm8933754qtb.62.2024.04.30.15.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 15:42:12 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 4DBF11200032;
	Tue, 30 Apr 2024 18:42:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 30 Apr 2024 18:42:12 -0400
X-ME-Sender: <xms:xHMxZmW16bJ0_DPdGTVVmueQETrlm3y-YthBihRijeu9CiL5t40j5A>
    <xme:xHMxZikWjT2tt0cnwJzwWdb0iRxW4EOp5PRl-QKElO7J4P4Qo_hA8xDvqifINzlyg
    zhtmgXBWi_WEDxqKA>
X-ME-Received: <xmr:xHMxZqadJ-o11EH6-ksxPZBPcQsv3CnhUaMN6cvCdVDDSkOYXkg6yJe9MG6bVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddugedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedv
    vdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
    drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:xHMxZtWvbNjz3yZqn9BilEfkdBa0JKcsyf0bZoLRb_BqtvuIY4_sKw>
    <xmx:xHMxZgkA4Nb_1M-l2aJrmuCNkIQcLM5Q8KKok3MSSbMLbJC_W5eeQg>
    <xmx:xHMxZie2mhQ1KjG1047OyVnHdAsdfR6efBS21stLGyy4SMPSaCmIvg>
    <xmx:xHMxZiEqGPbbocmH6wYrB84zncRD5f5RfusBN2BKmZqrbPHotxvLhw>
    <xmx:xHMxZuliQPsUa2Pj44W4JkpgF8h4ZPInXj8p8btETHpifnA8CSH8sX4->
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Apr 2024 18:42:11 -0400 (EDT)
Date: Tue, 30 Apr 2024 15:41:46 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <ZjFzquZ_IoYMk0IB@boqun-archlinux>
References: <20240429192435.2235-1-dakr@redhat.com>
 <Zi_6aDHO4B_iY9zF@boqun-archlinux>
 <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
 <ZjAYpsFROI9agY_L@boqun-archlinux>
 <ZjEfW6QpErDDnntk@pollux>
 <ZjE5gzb-aDNyK2Xv@boqun-archlinux>
 <ZjFYvPyTl6UaYSrn@pollux>
 <ZjFbp_XABvDRXIaL@boqun-archlinux>
 <ZjFdzzY6gysrQMnl@boqun-archlinux>
 <ZjFuZe1WIUyZ34f4@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjFuZe1WIUyZ34f4@pollux>

On Wed, May 01, 2024 at 12:19:17AM +0200, Danilo Krummrich wrote:
> On Tue, Apr 30, 2024 at 02:08:31PM -0700, Boqun Feng wrote:
> > On Tue, Apr 30, 2024 at 01:59:19PM -0700, Boqun Feng wrote:
> > > On Tue, Apr 30, 2024 at 10:46:52PM +0200, Danilo Krummrich wrote:
> > > > On Tue, Apr 30, 2024 at 11:33:39AM -0700, Boqun Feng wrote:
> > > > > On Tue, Apr 30, 2024 at 06:42:03PM +0200, Danilo Krummrich wrote:
> > > > > > On Mon, Apr 29, 2024 at 03:01:10PM -0700, Boqun Feng wrote:
> > > > > > > On Mon, Apr 29, 2024 at 11:01:45PM +0200, Danilo Krummrich wrote:
> > > > > > > > On 4/29/24 21:52, Boqun Feng wrote:
> > > > > > > > > On Mon, Apr 29, 2024 at 09:24:04PM +0200, Danilo Krummrich wrote:
> > > > > > > > > > Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > > > > > > > > > initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > > > > > > > > > passing a dangling pointer (instead of NULL) to krealloc() whenever a
> > > > > > > > > > new Vec<T> is created through VecExt<T> extension functions.
> > > > > > > > > > 
> > > > > > > > > > This only works since it happens that Unique::dangling()'s value (0x1)
> > > > > > > > > > falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> > > > > > > > > > krealloc() hence treats it the same as a NULL pointer however.
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Good catch!
> > > > > > > > > 
> > > > > > > > > > This isn't a case we should rely on, especially since other kernel
> > > > > > > > > > allocators are not as tolerant. Instead, pass a real NULL pointer to
> > > > > > > > > > krealloc_aligned() if Vec<T>'s capacity is zero.
> > > > > > > > > > 
> > > > > > > > > > Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> > > > > > > > > 
> > > > > > > > > However, since this commit is not upstreamed yet, so it's suject to
> > > > > > > > > change, I'd avoid the "Fixes" tag here. Alternatively, Miguel can fold
> > > > > > > > > this patch into that commit in his tree.
> > > > > > > > 
> > > > > > > > I'd be surprised if rust-next wouldn't be fast-forward only, is it? If
> > > > > > > 
> > > > > > > Well, I cannot speak for Miguel, but there's no guarantee of that IMO.
> > > > > > 
> > > > > > @Miguel, which one is it?
> > > > > > 
> > > > > 
> > > > > Just FYI, linux-next has all the history of rust-next snapshots, in
> > > > > 20230411:
> > > > > 
> > > > > commit ("rust: sync: add functions for initializing
> > > > > `UniqueArc<MaybeUninit<T>>`") has commit id
> > > > > 2d0dec625d872a41632a68fce2e69453ed87df91:
> > > > > 
> > > > > 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230411&id=2d0dec625d872a41632a68fce2e69453ed87df91
> > > > > 
> > > > > in 20230421 (also in the PULL request), the commmit changes its id to
> > > > > 1944caa8e8dcb2d93d99d8364719ad8d07aa163f :
> > > > > 
> > > > > 	https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?h=next-20230421&id=1944caa8e8dcb2d93d99d8364719ad8d07aa163f
> > > > 
> > > > Yes, linux-next is an exception. But linux-next is also never directly pulled
> > > > into Linus' tree.
> > > > 
> > > 
> > > The point is that linux-next merges a snapshot of the -next branches it
> > > tracks, and what I post is an example that a particular commit changes
> > > its id in rust-next. In other words, you CANNOT assume that today's
> > > rust-next will be the final version merged in Linus' tree.
> > > 
> 
> I meant -next branches in general. As I understood you previously I thought
> you're not sure whether rust-next is prone to altering its history. Now, you're
> clearly saying it is - noted.
> 

Yeah, I wasn't so sure myself, so I digged into the history. My
understanding is that maintainers are usually allowed to alter the
history, and most subsystems I work on do alter the histories from time
to time.

// It's a curse of the knowledge, once I see the power of rewriting
// history, I cannot unsee it ;-)

> > 
> > nor it will be the base of the final pull request.
> > 
> > In short words, -next branches are subject to rebase for various
> > reasons. Commit id from them is not stable, period.
> 
> As you just educated me, for rust-next that seems to be case - again, good to
> know. Generally, I don't think that's commonly the case though, hence my
> surprise.
> 
> This throws up a new questions though. Does this mean you'll actually just
> squash fixes into commits that are in rust-next only?
> 

Again it's up to Miguel. For this particular case, in the common case of
history-rewriting-allowed subsystem, folding your patch in (with proper
update to commit log and SoB) is an option. Taking it as it is is also 
an option (maybe drop the "Fixes" tag), since although it's a bug, no
in-kernel users really get affected(?). If it's not -rc6 already, I
would definitely lean towards folding. That's why I said I'm OK either
way.

Regards,
Boqun

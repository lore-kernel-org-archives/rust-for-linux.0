Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09559374E60
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jun 2026 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479346; cv=pass; b=J/W8fg7Kitmz1pL2Q/bKCFwrnlk1jZTlyOOTeiFQKpRTlyWqJyfGH4RXqiIBqMKNfchIBxJbmqKfKDLCD/f3n/052XcMOzcitV7lgwP1zJIyiBug5sX4Kz8UGPfxY6RmtRpBRmTQ7/N0O2aLsfxoly9fSVSu2xAaDDDywVHhLB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479346; c=relaxed/simple;
	bh=qnmLv29VDM7TDLA9eKCDywEk/4kIQYPIoZRxiHYqPdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Boq0uwG7ruD3jMnRu9BL4D+lPEGbn7x18c1SqOxYX5t0hZ1mRQz0K6Bz+rtrRu6+7FNh5uUuE57Jj/sgPEu2JlJ+qhJf/RHbjcLQZ6czL6vteV+Kh0NwCsNvDPrXIWCxS9Z+D7ejZcUzXtRsvc2j+fDjaLF41ayLho7OtLoPJoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GiV2P4f3; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GiV2P4f3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ac357c55so31489755e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jun 2026 02:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780479343; cv=none;
        d=google.com; s=arc-20240605;
        b=Gv5kApw7070q/QMLVnNfcnFPhqpGA0lx5uqnZwusddVL3Bd9UbAW8uRsDdkLDTvqT7
         1odtyu1IHCZsDILwGhiPbcXtxact5WP1esx7fpSEGLq2ktj6erHOIJ4gWf9qglKtO5Ls
         /rml2LAL4BgmXZtt8kC34LSpAHmVO8WE/m8rp15VG+xBvKory0veX83M91L7ls8321WB
         Ej87/wmZMVTPQL5a6b8ZBg/UuEAUX/rFpIlb2uynsZh+RAfNjGocED+muNUyoAyu3uZv
         oQYgPr+hlfm+sSN5fjSOh9fcd6kKTzQpkALeNis7UYof3t/2dEOx6s3enTYTnXEnH4i4
         7MFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qnmLv29VDM7TDLA9eKCDywEk/4kIQYPIoZRxiHYqPdE=;
        fh=1idb6+lubJioRNG7LaAtwH9h2JsyUHnsF5gTsDtcdJo=;
        b=lr59SXEU8KXX+Ws0AzZ+hzJ8bchZ/H/KXj6GEBmvwcMqgEb19WrpKAz7tMdj+fRmpt
         zaHg3NcDMjB99ov5RhkStyoX3oAJ/ffUKmTIQC5nJ14CnTVqiI93Oh/Fa3jl2W1Msyki
         KhaPS1wILsP7YF42gan6hORMRl6ewScASs4cC/dpPINDLmvIG/ESoMI9J5rf3GLSCxmI
         LhUv8Qlv6L6jepB2m8r78eGwgKan1VlujlAtLeaT97+h5LrCg9ysgXx2Yqwfe+T5Uikg
         PiSbCjPVaOFccp0ZwdwgNp3ooEhpLdHitx7HCqyRFoK7wIW/cjii1KwMfynUVIYJ9y04
         NfxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780479343; x=1781084143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnmLv29VDM7TDLA9eKCDywEk/4kIQYPIoZRxiHYqPdE=;
        b=GiV2P4f3PopCt4Y3ZQchR9NalsW55dkf2SjcvmJGXIYL71soDe6I7mW5dqve9FlqFE
         GOL1V6LhpSuHQsjNOHvy3BXc708CCd+HmZtuV6hQbBI9N5aRRzL2U+0bjW5BTQumMph9
         GG9+4jSZOSUPxVhYpNhLwKNI6vuQ4DtVRZUHiKIqheF1BVAdjnUhvOJz2bLTVmydCAGr
         iYE/DDYNRtMAf8Sxq1XB1IvgHlZBdfJ010h5AazpE2PhnDEchXhXwFLsMoLh6UMU4RFe
         1suDTdsGtchHFLd6nyWxFzQHcCWYr27K6NeCzYSOvFlrypOmZMC8zYQwORsE6zPU/1qu
         V6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780479343; x=1781084143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qnmLv29VDM7TDLA9eKCDywEk/4kIQYPIoZRxiHYqPdE=;
        b=lfhLgIpNNt+iXuYFTDNJeSPT+Fpkmn+gGSFnBuDAXC+ic/ZPFl7MrWajoyUpwrYT/3
         H3Qk89I3i3jvaC0/2s0CsrEw+mQYh20oAw6/ad4zhOtUtJe/wb0AdlF+WTJQKnD+Eqmm
         SGN56AyZR3jjdjGNVbP9ulrdK3JaCmHYleAfCzgCbFHLutr975RJV3/N78xFxZ3jMmZo
         go0ZGDSU30Hq68PvabHfJAdUXt3LjCtSnFfcKD/S+fwG+sbwLd4be37JMBQWW869czrx
         DNUaG4ZZ3rjdCk0aHQG9fMDLGpKV0p1oKw5XAI/X/enzvq8BYmzIr2wLdBoY7zThK801
         bB3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ujwROUZpbyA1ktAPQ/FQnPmdFsHIEpPeVFyzigUh/clw0aBznqFONIdD9xi7/GEIfADFUC9q/tn72qHwnqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhCKVQPMU9lQxNj6L+XioEtMC3rBqmQGJefc4qhPTZ/BSYicuh
	+ohMNM2uIT4kqE866TbPT7FQvbIdduMg5E6rn+7T5aoFVGicQtA9N/NKUgXS7nDIkSvMdYM4kt+
	y2FlqQSGQOOZ1enNHNaWIU5Dy7IaJi0qHoas6ZSf0
X-Gm-Gg: Acq92OGb58ycNnfLsr23KkdwqDNh6gOXkjDlLubvIyxh2miuNzMERnOgJ2HGbeYAPX3
	F9s8gP3snzEW3uOpP2NGegzvdvML3KrQ14Qsvw/8CLpeUbSeGNklScq8m9m96p/kxQxp+cOSqp+
	Q/FuBK8OEiK3ZUgPeyXXE709RPSwROIf6jjjUnENalEX+/CxmTC8K5zhccRGuMHCWW5EjiPVg3l
	uJqh5tjVxFEEAhqUz16Ym33s6YlJwyuZL547ODIVk/ZV7p+lfB20lDism1FJJZJL4W3R/MgyBt2
	5VPBAjPlz6NWZjdyOZbM2tZEBT6k+2AAPgZ1SQ3wzHhXeqdTxcyZMjWQ3kwXp7165YrPABaLrsl
	/ASvA
X-Received: by 2002:a05:600c:8184:b0:490:5cd8:d213 with SMTP id
 5b1f17b1804b1-490b5eb44f8mr43679475e9.15.1780479343116; Wed, 03 Jun 2026
 02:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530143541.229628-2-phasta@kernel.org> <20260530143541.229628-4-phasta@kernel.org>
 <ahr9gtzQLSbPeBx_@tardis.local> <e8b16f3b40d42f3b0a8814180fa9b06f82c9d901.camel@mailbox.org>
 <ah2L-TMT5UHSd_Hs@tardis-2.local> <441fccce521857ab82b84bb8e5ab539ee3810a36.camel@mailbox.org>
In-Reply-To: <441fccce521857ab82b84bb8e5ab539ee3810a36.camel@mailbox.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 3 Jun 2026 11:35:28 +0200
X-Gm-Features: AVHnY4JfNUks84z0WqzXiLep0aUyPzGhK0pYIVWREZIpQzivqBZzfg4IE8o75iI
Message-ID: <CAH5fLghA5LfV+=r4-LbX+gaNo6v_-gSdcXOJHa76Lc74WCJ5JA@mail.gmail.com>
Subject: Re: [PATCH 2/4] rust: rcu: add RcuBox type
To: phasta@kernel.org
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 11:33=E2=80=AFAM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> On Mon, 2026-06-01 at 06:41 -0700, Boqun Feng wrote:
> > On Mon, Jun 01, 2026 at 09:56:23AM +0200, Philipp Stanner wrote:
> > > On Sat, 2026-05-30 at 08:08 -0700, Boqun Feng wrote:
> > > > On Sat, May 30, 2026 at 04:35:10PM +0200, Philipp Stanner wrote:
> > > > > From: Alice Ryhl <aliceryhl@google.com>
> > > > >
> > > > > This adds an RcuBox container, which is like KBox except that the=
 value
> > > > > is freed with kfree_rcu.
> > > > >
> > > > > To allow containers to rely on the rcu properties of RcuBox, an
> > > > > extension of ForeignOwnable is added.
> > > > >
> > > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > > ---
> > > >
> > > > I have the following on top of Alice's patch. @Alice, @Danilo, thou=
ghts?
> > > >
> > > > Then we can have:
> > > >
> > > > type RcuKBox<T> =3D RcuBox<T, Kmalloc>;
> > > > type RcuVBox<T> =3D RcuBox<T, Vmalloc>;
> > >
> > > No objections by me.
> > >
> > > I just think we have to decide how the treat the namespaces, though.
> > > Probably Alice wrote it like that so that it's very apparent that thi=
s
> > > is not a normal box. It still breaks the naming convention in my
> > > opinion.
> > >
> > > rcu::Box vs rcu::RcuBox
> > >
> > > With all other subsystems, naming like that seems not allowed.
> > >
> > > dma::Fence vs dma::DmaFence
> > >
> > >
> > > I probably would allow the user to decide whether he wants to just us=
e
> > > it as `rcu::Box` in all his code.
> > >
> > > But no hard feelings.
> > >
> >
> > For this I think that rcu::RcuBox is a bit different than dma::Fence,
> > because Box has its widely-accepted meaning through all Rust code,
> > while `Fence` doesn't. Hence my current thought is rcu::RcuBox and
> > dma::Fence. My personal preference is using namespace as much as we
> > could until there might be some misleading.
>
> Yoah, probably better we're safer rather than hyper-consistent.
>
> >
> > >
> > >
> > > >
> > > > and Philipp can use the `RcuKBox` in this patchset. We also need to=
 impl
> > > > InPlaceInit for RcuBox, but that can be added later.
> > >
> > > So shall we merge my series with Alice's patch, and later we add your
> > > patch and other features, or would you prefer to have the additional
> > > boxes from your patch from the get-go?
> > >
> >
> > I would like to have it from the get-go mainly because of RcuBox vs
> > RcuKBox naming. Thank you!
>
> Fine by me. Just process-wise: how should we do it?
>
> I could include your patch on top of Alice's. Would be a bit more
> consistent regarding the git-workflow if we'd squash the two patches,
> but then you two would have to agree on authorship.
>
> All is fine by me, but I wanted to ask instead of just do A or B.

Squashing is fine with me, thanks.

Alice

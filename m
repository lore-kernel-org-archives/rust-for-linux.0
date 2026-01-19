Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAE23F26A
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768833353; cv=none; b=coz/L5HixpZcWnlPvTS9nLqr55dD98oC05etfB1qa7rHBZXj50Ez+3DnD2OznWb6hHG/A1Wodl21/A9RHwpvvqrv/k4Zs3rbT8pDRJHulAjjn1Mip490jF5voCyJy5fn0pYjpxcdw+tcwdcpDqj58Z7s5g9L/13bPas1Ge14L9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768833353; c=relaxed/simple;
	bh=bZp4gurbfHjK3O0u65z12ZPd50+JQtOOSP0sZ8LFzag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s98HpYtSwFC3KWgc8GsSJynJ7FHxBVOKGCuIEEgmJrICQ5TeIwytnwd/LzIUlOoQLefTo4W8679WJv2gQw27pUFToazyXB8FqWOwD53iNhUJgQIVUG9nOYQGhJTGfHXGg6j87XORK/cBcqdRKdbndH+hj2CuRidvypOKnyJn4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eieS91i4; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eieS91i4"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88a2fe9e200so41040106d6.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 06:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768833351; x=1769438151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXq+PWkPG1nHye1gMKa1/5w7nQSLXCkEOoBAppRannc=;
        b=eieS91i4uV8HDWVjjwZ6hJbMMIEQ/heN7IyNMRdx1j/B7N3JeCCM/5l0Wmc76CZyql
         TOr2ISKddHJpeXOfh7CBt4feIzcgt/qdIwGxvUSm1bLJZCsiraqS9clMAjacof6OQJNw
         HH0VkfgocKUrfInDQds9MaZXhpGMJZlhIeD/SQyOhP3QHzH7GbWzBVKIt2HH1jnUmYyu
         OYHc1ZQSJuwBRG6/x23Y11+eHG8dj/YGr8wX9u1YKWl71a8i8JUb+DGN4/wjIjFRjmis
         IXMWj48omISCQ4hUDQohgjQVv4bMdkeLO9h9v2ITlbkI6H5DM2GDigKFf3cWFXCNJs1G
         rsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833351; x=1769438151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eXq+PWkPG1nHye1gMKa1/5w7nQSLXCkEOoBAppRannc=;
        b=tvXfN9RdfUXnvXCtoBvOevfQAl6sEK0vts0whAJvq/5l73YVm1WHzD9BIJ572RJvf4
         0vMMxFCXk7xj1omqq29Dz4dFMtKSuZeEoymX/11mqgu3nOFj34s/jTy7D0bmsX8jwoFM
         835ol3LsvgBPq0gRGCTvDnn4dTMY8vLHdbTM3ekaL2/rF1QuDHKbzFRxtM3hGtAup6z2
         yt3hQLJZpHdpt5T+uGAWsVUEw+BxDrRwLU7p2p3VwJvxLKaLa0JbtQJgP9z+oeCdI2Qr
         UwohV4SQ6xWrHreRJeoSuHQsZ66J8/169zluz2ELfYbUbOTb9o9wmPhxbidfIPE8uUs5
         4k2w==
X-Forwarded-Encrypted: i=1; AJvYcCUL9d7l6Bvag40uKd0LpVAXsxWDcQQtU03q03t2MQOYk4ri3YABOwlByMlxd6VuL1hsaAi8cxX/Q4fB8+6z+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5u4U3Ztl3omQFZKmCnIlugE8edVQTARtvn3niXTb7FF8vMjJ7
	zNnmNocfyXKhBsArBif7HYuvB9aCvfcBluC9enFplF9BnKoer0nPy1SV
X-Gm-Gg: AZuq6aJfpO+l2FqwX2Dhob0YaBeTPKRmd91613Lx+5gu8ZeM3X8bAm+vIP20l03wJfh
	srulEqEJmIIHASge+qFJAHWO8K0frtsGNpocg01+0Cp5cEIcDAZlztvkP53/QkYIrlXmx/Dzu4R
	2JmDexxusFIgo9HuYNYFv3fukp1AknUxzMnfzlbYqZjtkfBMF2Ckf+6+fQH4ndpHZPMYhjrIpQF
	2oRoFe/WA5DxtFEB7Ml80w3JHqXm8jmyS99DkgeFQY/WRvzzgea8drzKuVV5sURekqVYKFLBmjC
	lw1XDbOCqXesKztgByMA9wxiI6Mn10QytvNv6U2HStFcTtso8FSvftyzhrWkeZOJB6l637uAdFD
	pLVbCIdk+DHMKKaBbcLvnZA/7oxdrSnlnWCjAxxZgdIk30hTk03y32grSNdFp3w8s/1kBYBFTjH
	hy42XpRiZGkXuekXNl5VfDdhZ5dLJ4SrzYqqPfME5OiDtzI10b/dvfgzg9A/5Pj6y2ZeTX8I2O3
	fipSVkWtJIJWUg=
X-Received: by 2002:a05:6214:1d25:b0:888:fc28:7d0a with SMTP id 6a1803df08f44-8942ddc534dmr173016936d6.51.1768833350469;
        Mon, 19 Jan 2026 06:35:50 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72985a8sm800086285a.54.2026.01.19.06.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:35:50 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5C19EF40072;
	Mon, 19 Jan 2026 09:35:49 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 19 Jan 2026 09:35:49 -0500
X-ME-Sender: <xms:RUFuacjvF1QlAG2ALcFGerXTyH_IB76cqMT9jBuGIqezkBLtqefaew>
    <xme:RUFuaQ-HQxVRFO-fNEGi4U0MGhya4qbaSsnFQAbL2fjL43hFiqZdDWz3rFBO1PM8B
    6Cn7Q2tBeyfqP6VZXNgEL9SsI2eUD6144vSmm7BVkOI_MgQ782fNew>
X-ME-Received: <xmr:RUFuaaOXzf9QLUaVpPYEpI__6VxD6aNkxWKC1iEDQubclloxSST0pWla>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeejkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrrdhhihhnug
    gsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhujhhithgrrdhtohhmohhn
    ohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphht
    thhopegrnhhnrgdqmhgrrhhirgeslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhope
    gsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegurghk
    rheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:RUFuaTrbr-dkv2-EX0ekhoyqatrVaStN0KO9JnfydzNSfrN_MO3-PA>
    <xmx:RUFuaX4mDhfeBna19W0u_kbxniU3yRfCsA2zt90WUJ-Mvhf8faT1pQ>
    <xmx:RUFuaVoz7ORgJ5o3UNFqRazg6ZXE-QrE2Gm6PxbwR2XWYn2AO8RX6g>
    <xmx:RUFuadLYS1wfN83wnau_lnU0gFkMF8KWhAe_havT-tuneSkq2twHaQ>
    <xmx:RUFuaaiUytBZ51YyrypU2LDwP36FZd15yFk2lJ7xFZWh_CYa-0mCbY41>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 09:35:48 -0500 (EST)
Date: Mon, 19 Jan 2026 22:35:46 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org,
	aliceryhl@google.com, anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com, dakr@kernel.org, frederic@kernel.org,
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com,
	sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
Message-ID: <aW5BQnLhE-ojtQkF@tardis-2.local>
References: <M2M7QTmzyv0cuTcfmp8k-pHEgTa6pOlfONQW596m3-nM_3-fQoakLTxJy7SthiIlT_5I-07GG9On36gsydLT7g==@protonmail.internalid>
 <20260110115838.3109895-1-fujita.tomonori@gmail.com>
 <877btdpyz2.fsf@t14s.mail-host-address-is-not-set>
 <DFSL81HEHYU6.8E3YYOXNV5C9@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFSL81HEHYU6.8E3YYOXNV5C9@garyguo.net>

On Mon, Jan 19, 2026 at 01:07:58PM +0000, Gary Guo wrote:
> On Mon Jan 19, 2026 at 12:29 PM GMT, Andreas Hindborg wrote:
> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> >
> >> HrTimer::expires() previously read node.expires via a volatile load, which
> >> can race with C-side updates. Rework the API so it is only callable with
> >> exclusive access or from the callback context.
> >>
> >> Introduce raw_expires() with an explicit safety contract, switch
> >> HrTimer::expires() to Pin<&mut Self>, add
> >> HrTimerCallbackContext::expires(), and route the read through
> >> hrtimer_get_expires() via a Rust helper.
> >>
> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >
> > Patch looks good to me, but I just want to check with Lyude about their
> > use case in the rvkms driver. I think that is why we did the racy
> > implementation originally. In C we have stuff like this:
> >
> >
> >     /**
> >     * drm_crtc_vblank_get_vblank_timeout - Returns the vblank timeout
> >     * @crtc: The CRTC
> >     * @vblank_time: Returns the next vblank timestamp
> >     *
> >     * The helper drm_crtc_vblank_get_vblank_timeout() returns the next vblank
> >     * timestamp of the CRTC's vblank timer according to the timer's expiry
> >     * time.
> >     */
> >     void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_time)
> >     {
> >       struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> >       struct drm_vblank_crtc_timer *vtimer = &vblank->vblank_timer;
> >       u64 cur_count;
> >       ktime_t cur_time;
> >
> >       if (!READ_ONCE(vblank->enabled)) {
> >         *vblank_time = ktime_get();
> >         return;
> >       }
> >
> >       /*
> >       * A concurrent vblank timeout could update the expires field before
> >       * we compare it with the vblank time. Hence we'd compare the old
> >       * expiry time to the new vblank time; deducing the timer had already
> >       * expired. Reread until we get consistent values from both fields.
> >       */
> >       do {
> >         cur_count = drm_crtc_vblank_count_and_time(crtc, &cur_time);
> >         *vblank_time = READ_ONCE(vtimer->timer.node.expires);
> >       } while (cur_count != drm_crtc_vblank_count_and_time(crtc, &cur_time));
> >
> >       if (drm_WARN_ON(crtc->dev, !ktime_compare(*vblank_time, cur_time)))
> >         return; /* Already expired */
> >
> >       /*
> >       * To prevent races we roll the hrtimer forward before we do any
> >       * interrupt processing - this is how real hw works (the interrupt
> >       * is only generated after all the vblank registers are updated)
> >       * and what the vblank core expects. Therefore we need to always
> >       * correct the timestamp by one frame.
> >       */
> >       *vblank_time = ktime_sub(*vblank_time, vtimer->interval);
> >     }
> >     EXPORT_SYMBOL(drm_crtc_vblank_get_vblank_timeout);
> >
> >
> > Also, we got some new docs for `read_volatile` that allow us to read
> > memory outside Rust of any allocation that are not "valid for read" [1],
> > meaning racy reads are OK as far as I understand. So the original
> > implementation might actually be OK, although the number might not be
> > correct always.
> 
> The wording is for MMIO and should not be relied on if the accessed memory is
> C memory. Also, `HrTimer` is going to be a Rust allocation.
> 

Right, "memory outside Rust AM" should mean memory that outside both
Rust and C in kernel (i.e. userspace, MMIO, etc.) It's not a
"out-of-UB" free card.

> Even if we don't treat it Rust allocation, it's also only "fine" in a sense that
> you don't get UB for doing it. But the value you read can still be completely
> meaningless if the updater is not atomic (it would be valid compiler
> implementation to, say, turn a non-atomic write into a write of a garbage value
> and then an overwrite of the actual data).
> 
> I think the usage you quoted is just wrong, as on 32-bit platforms this could
> well read a teared value.
> 

Agreed. It's a data race any way, unless there is a proof that ->exipres
won't be updated during read.

Regards,
Boqun

> Best,
> Gary

Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B930E85E
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750359071; cv=none; b=QAn4r6KNMaSha/2Tl1A5GQZ6EM2sMnnyEraP6KhlLg9ENZmX84h2yRGqaXjIXogv7A9eNclTYFtjJOVjdDUBIKfxwrgdnT4Ztv2XFCe7UbSuk6IuH1Osny8ceW3d696PKoul9ZR9QmUnX5Sv6zQof3VDiGSCwET0jcCNh3cU8l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750359071; c=relaxed/simple;
	bh=e+vlI5UuymhktcvT9Ds1na5nu7/PmlEQfQ9A3DosE4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uL2+FnF04hHfWR6+bXk0SqByGuWoxjHExYficZ9FRndNpG1RCrKZY0Osvhcf/T0tLpYRKs8ueqmW7FaQICTPO1f21ePHy3DlZQSy/fNIrjG8kNkEgMR4Hj4qZQAsE1ia7AzeiKTEV5kKnKSE2A4UdkzDnt6ZlB90Z738vrJ4VfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPGS97Ht; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPGS97Ht"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a43d2d5569so13704951cf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750359068; x=1750963868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKKAk183LON0LaFk62wU7oU2Ma5sbSO4CJebMn0Pu3E=;
        b=XPGS97HtP3VATcmhOmL69Htrsh2daq4PSpSSEeGT6xpTZhu+1rv1iF+PfUg9HljImH
         xqJD6ofE0D2L1X8vjRPlyVr8zzY9bGYHwCUo8ozgA9Ay6tWKAENcy7AhTg9PdnqeIMZh
         5i5qsA1IoC+NE4Q9olDQMrt5BtlLpYm0s40nw98PHjbk3v+KvcaQWQ3fHpIy+eVfXNJT
         BsDrxbx6v1nyjaimEKEH/G32B/l05BWC1QPKTi4itfnEru+ll8SHsFsOqTzd07wPiw7w
         3coujv/KzJHNDdRRguqI1mF/otLnKzdbcPMesu80IdXU994iISiXSNeI54K38bhhc2wg
         9LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750359068; x=1750963868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKKAk183LON0LaFk62wU7oU2Ma5sbSO4CJebMn0Pu3E=;
        b=A4Yay6GP5NtcMW5OJjyCPwmxcfDkAwqbYsB/LHR3iNGjgGLzb+bXZJfBa0rLJX+eCK
         TuH2YW8OgVWtGr4SIEqtc9GQcGRv8rFag2wiXtNmavc9RMGGS61J4nWed3uqm+m4odop
         cC/tLeicxSLIa7x0jXf/V4YxSbc4wpkFSGhkftnqJB+6hnQytrk2R2Ix9LTsJbYK5q5h
         mBxydHp5Gh+pGi2CUZU5l2WQnYGPxl6QM5nOmF0617BdZn/4cZr36wyGZkoxx2IvIyGs
         q/cZELI4jjzBbzkU9QmAb631kVtZGVjSAQOWuJhwqifpJX1nmgZnZlbWUUcLUymlx4/m
         aDqw==
X-Forwarded-Encrypted: i=1; AJvYcCXVbCxouFiruUFCoAsoVpsW98NNl8QRYdvnH0BHJ4dN2f3M6l128vdE0Y8ssOEmNIyYDS9FDsf4zInnZlHdMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxshwKggcEpTMKtnPjVgthx4WxrtRw4h+148tCxEDwWrWFR8PSS
	v06fVxNVejtlwHYDt6RXJWCEg8RXmxytFT4pqZVumCGLnPFsvuy6hTIE
X-Gm-Gg: ASbGncuS2fUviRPXLP2g3oZGF84yAGzmAPO7Y83qnJaRPdTTX/6Os4nm28/7+4+oyFX
	avUB08Nmx1iV5BMkHYxpNYjWsa2w+MLuh9J0Q5+ubi+69DlOseR+25cSDNd7yG1EelK5CEc/0WF
	YCU5+6R3CVUQcytc4UOXbeM6Sw+jdm4+vAibDymAi3ck2AI10bCideydUOuQ0f7AumbDJkf0goQ
	WB240GRenwaqYght16W/AInh8XFFoydceavnGhAFNn6I32TS54OJz0GzjcXSvncXEq70U5cgNEk
	7Milx+hb4SNOjA7pJZ0BoOE60MC6kXWf2nGpBEHZjG1Dgn0/seXmyHfSjrnCprQZwHzYofHqFTi
	40APa+oUJZbeoPdYDh76beOHBc8/MxUgAW1o0EI+PGrHYerWvWSyW
X-Google-Smtp-Source: AGHT+IEDmzFBjR3SBwALgKUML5XliuafaE6n8mmnU7/RfTa+6/FBfzM8QiP8jGq20AksCvZSjKAR+g==
X-Received: by 2002:a05:622a:408:b0:4a4:3963:1e10 with SMTP id d75a77b69052e-4a77a24bca7mr3055671cf.13.1750359068595;
        Thu, 19 Jun 2025 11:51:08 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm902981cf.30.2025.06.19.11.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 11:51:08 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id A07DF1200043;
	Thu, 19 Jun 2025 14:51:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 19 Jun 2025 14:51:07 -0400
X-ME-Sender: <xms:G1xUaMqpNGlla0O-EQDV2zzANztpPNXDPLtvR5JfsQgJXX44MYdPVw>
    <xme:G1xUaCrjJRYew-Q1H1VJYKOD_rLXPOQuveO-PjSWmJCeh_hOGCiOk4pNhgk2mruIJ
    VAHUNlTqpHPcoI8Jg>
X-ME-Received: <xmr:G1xUaBPNUUbRcfDPffEMTVaYgpmP3F6SFuQGOQeVRXvef3LZwj8sBP5_hfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeivdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlrd
    grlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepuggrkhhrsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegsvggrthgrrdhmihgthhgrlhhskhgrsegrrh
    hmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopegrlhhitg
    gvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhu
    ohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtg
    homh
X-ME-Proxy: <xmx:G1xUaD7PejvU0ja62vAPLexQ6evqGyvINo7mBADgQpxse8rnDBexdQ>
    <xmx:G1xUaL6157ab8nVGemTuXg_7n_M0zAYacf_SxYey17I_qmdu5vgWIA>
    <xmx:G1xUaDiy_90fnTtwfmMdq4NgBOYyfnvL6uEHPBD4Fbk393EWrjVhlg>
    <xmx:G1xUaF7DOo4cX9Q4IHbxz0Cr2zEXgfek6Rlv7kl-nEReKCmj6EWt6A>
    <xmx:G1xUaOJv5AHvWJ2VoVXPOaXyNfRd2YDppteE-eEGCcE-8Sk_PfusLJDJ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 14:51:07 -0400 (EDT)
Date: Thu, 19 Jun 2025 11:51:06 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Beata Michalska <beata.michalska@arm.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, aliceryhl@google.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org, tmgross@umich.edu,
	alyssa@rosenzweig.io, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFRcGsS6wfb-HfEg@tardis.local>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux>
 <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
 <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
 <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>

On Thu, Jun 19, 2025 at 03:17:31PM +0200, Benno Lossin wrote:
> On Thu Jun 19, 2025 at 2:26 PM CEST, Daniel Almeida wrote:
> > Hi Benno,
> >
> >> On 19 Jun 2025, at 08:01, Benno Lossin <lossin@kernel.org> wrote:
> >> 
> >> On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
> >>> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
> >>>> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> >>>> index 445639404fb7..12b296131672 100644
> >>>> --- a/rust/kernel/drm/ioctl.rs
> >>>> +++ b/rust/kernel/drm/ioctl.rs
> >>>> @@ -139,7 +139,7 @@ pub mod internal {
> >>>>                             // asserted above matches the size of this type, and all bit patterns of
> >>>>                             // UAPI structs must be valid.
> >>>>                             let data = unsafe {
> >>>> -                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
> >>>> +                                &mut *(raw_data as *mut $crate::uapi::$struct)
> >>> 
> >>> I think we have to document the guarantees we rely on to create this mutable
> >>> reference.
> >> 
> >> If the C side is using pointers to read/write the value concurrently,
> >> this is wrong, it needs to be wrapped in Opaque.
> >> 
> >> ---
> >> Cheers,
> >> Benno
> >
> > How can this happen, exactly? Can you provide an example that corroborates it?
> 
> I don't have the context on this, I only saw a raw pointer being turned
> into a mutable reference and that's only possible if there are no shared
> or other exclusive references for the duration of its existence and no
> raw pointers are being used to access the value.
> 

I think in this case, as Daniel described below, `data` points to a
buffer either on the stack of drm_ioctl() function or allocated from
kmalloc() in drm_ioctl(), and drm_ioctl() copies userspace data into
that buffer, so at the this point, the data should be owned solely by
this function. But of course the safety comments need to be adjusted.

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
> > The general pattern for drivers is to fill an uapi type and then wait on an
> > ioctl. The kernel then copies that using copy_from_user, so we're safe from
> > that perspective (i.e.: from the perspective of concurrent access from
> > userspace).
> >
> > In kernelspace, we usually extract arguments from the uapi types to then
> > dictate further processing inside drivers. In what way are these shared with
> > "the C side" ?
> >
> > If the result of this discussion is that we agree that this Opaque is not
> > needed, then we definitely need this patch, because using Opaque<T> complicates
> > all ioctls implementations by making it harder to get to the inner T in the
> > first place. We would have to needlessly add a lot of unsafe blocks for drivers
> > that wouldn't otherwise be there.
> >
> >
> > -- Daniel
> 

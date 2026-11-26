Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714249;
	b=FLVGcWwZgc36mutCGG6toYFciY/bw0KFmaCurm7j9zQrIEmZG/TKahY8HyFQkcWsPXUB
	 qxR+JA92Bsd6YrAu5E3zWU3djY0UzIN3Y3u8w07LS0M/4rABoYxUM+tNjwhGhaEIX/L22
	 KiayhYPFnqc6BeMTpkBX5AVgACkdDjWfv4OhnLpj0pE4l8N0bKUFYENH4Wfuu6e9UfMeX
	 8FlCYBWCIpSH6rQXkOkt2X+aYFoIzcDqI1+6uCPeUAdnvvRO/Ywdj4TLQBTcJ95An/IVc
	 uAOniF7KeRe4BWyQibF9oqCZTiCQJIzSd1rJYgNGygvgTAb528oOC/stuqKiWwnS4SA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pYk5wAcyTKA1us6S0oQwHk/cu9RUlgZp57aA9h4156M=;
	b=Sgg9Ccigwr7+L/pWtc9HWaa5eyVfBuakumCzQa0yY9Wb/84/7NndpJBXD1wvHFBW1nfs
	 lW2GauVn3e97aC9lCDnCt8cKCbhTsjOhWyfBkU2WUux3rKSTSOo+pwIIQP/AlJNkS4zmQ
	 wOUOraZJrZnA/Wg2PlUldk5lTr4zDYNl6QSDc0WqWgf9aCpUlxHkwT0OTF2bE9VKHaWA9
	 3mKHLKxmlrib7QJk30+xgZwkl9LdEydYipfxNxQzxTcLZszB9bMvFu7EWarlYLAPElIrO
	 T0KBasSHiClhe8oEjNx2zLJQIVODvkOjgxbPLCpWV3kMskPaWObg3+luUkNgnGdXoMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cSEX6iD3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F017606A31E
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 17:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F017606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cSEX6iD3
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53634b8328eso67802721cf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 09:30:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714248; cv=none;
        d=google.com; s=arc-20260327;
        b=Vxki1fbnqbxpl6uIq5XVoPguFEYGoJXYgqs3tPPsnHIw4AtJ5Mkx3OXim8EqpJOter
         JhdZvWQI92g0DRz1JPBbWzNaliDj11egx30jdaLkkh1ZNEpS7OYkrXeu5K20FTugJ2b8
         Mtwy9psVoKYXqE1sC1jVdR9JJ1oMMyfHzTsRk2SUXnDiVmnENZPMl4OzTSgMa9zj0+fz
         mL+nhaqaV8gPnP+nqiw7DfLq3BBP3UaiXOWQXxpANzvCv1Lba3AXwd+AVfvW5fr6EORM
         CHez2K3omizCQdtjLp1d+9B8DnctgsyMdlBoVyf0P418LTh9W+gCPK5WJBGbSqxJFK28
         tS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pYk5wAcyTKA1us6S0oQwHk/cu9RUlgZp57aA9h4156M=;
        fh=/hyOwelguraz2ZSB6lPRrPfTK+ARAOdnQom0stt5P7c=;
        b=oQFM+yLvA9EBAJcm9WDL6vU7QMmhPDofSSb4+0jKWbIhH2ds2tpu3xCWXWeimrR1ii
         1Hi1fPoY+bWOnjKweUNe861WS2YerlsD3eWbYO5X03B5MiigAyHet0AB/3erhhc+3t3W
         8VKOtiHLyMXwITPvtv83JuFPHqyIWVf1BcbhzPfNlv0kxRdOfdtZo9TDM+C+mNN4r4vS
         dstv3DSc/lVWQWf9N84RjIkunRlURvlGUdlX2Q4mugfsJYJaLlNGstbVsTzxRky2xx8J
         sgW2o2EoA5hXPrgzpoFj5eKfa4SDQMToyLmnuF11uu5SCwHkC8v0PMePmsSmmKOqV2a9
         o7Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795714248; x=1796319048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYk5wAcyTKA1us6S0oQwHk/cu9RUlgZp57aA9h4156M=;
        b=cSEX6iD3QYgamOwCXT/5f8p3A6ZJjgukawPqaFNZJZPZ7XpfU1ld0kE7wTNUtdDrtq
         wBBH0wBISymqp2Zs3NHHR7w7ZVfuZ7YHZiq0ivAknpURKcpgQyCp9VFXjkIskshr5DgZ
         Me3I4zvtQljqVulprweMDL/8Rxi3gcHRFAL+fWt45ikpfGFUbyolO+k0N0amoH+dGOoD
         Z4MbEdMDSQbNrWN9lwdd012L2e6CQCNeMpMEDcNkt2/CLqWw0WQkeAfvTeEuhEIBD1XJ
         HCfnPK/pSGIjBB0PHkE9dta8sIpt/APYFHMGEAsp1UrbnUTJncXOFLhVM8VUoSmxntBn
         XWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714248; x=1796319048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYk5wAcyTKA1us6S0oQwHk/cu9RUlgZp57aA9h4156M=;
        b=WzskzQmkGW/p+qwQZgVpdSWqk/cxtfG6Py3EDaqcdkORFJIQ4UqPiEqEoriaFyPqnX
         VQ8FsbDgQNrK6SDOAbZ4ZbrW86G2iGPZ0dbDzp+Pb7avM5Fyz5sLTROXE5vfS4xScCkX
         Cz5bnSnl2hV8GcrhedMNWNC+p0mxLD7DdwoRl2zk7FXKrtm6SA26SVvXFNlTmhPJQMHR
         OyLXVIr7rZP6ut7SpkdsTICz5dHJ4p7x3Wy3ArANFMOb7Y9GqC/wwndNbJp/BEUlGbJj
         iXNkKeZrkervRvTdAwistoSoG3zYAXh+BSTrtp1V58pVtwyWXrhjyxn8vig/KHMWymtg
         JGWg==
X-Forwarded-Encrypted: i=1; AL+hErHDOjAdADFka52L4b9LcelNP+krFxxSujANtTcgZAOYPV9lNNeRfVlRHz6xK1/uONUPdYRWXbS8as1jOnydkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8J9cEFP6iWjNE4+HqfsWTdDCI2ygG3OcAvYlmb+YKXTclgGVUP
	ynMDTq6wm2OuF3UZnkKOEyqm9VjDQu2ZcG6xO1eybyPOaXbS0itzcLtPWZ33PGzgWW/SEwS2FK0
	KZaRjxhnBdb/Ie7vHO1AoSdy3YsyZHtc=
X-Gm-Gg: AZFdTZfGSWYkvXf3tCD/o7kYPtX+9QySDqpOK0sEdobj+EZlKnSqj3zrXwDj4knAFrQ
	wxCh5xgH2OX4SIpAXI2Q1UFi2VjnFYMBUQ604tg1zHCQ6kG3rte2KWJonSNCKItE26hr9v9Cwuw
	xShhXg3ysH1oN2PbORy/rFX8rvGXP1/ZSSAUOROt50fBRjw+jooSJoOzcJ+c8AZjo66oPmNgpgu
	TPekTTZ+UQnBUUV3gwFKw97yVdoDGOXwn3voFcCGoVQAdkPzuMtnPBz/IKyl8FS9PrqfqGb/0GN
	ziVSnkBqz4x+NPh+j9RQtWP9CwVNdBAcALWURV+yoQ4+5UIzGR9clkANUcv5UkFkVHxcNRcaMpG
	nP91IkxDbn4mUJPpTVNrTvReGntMaYBvL7IdC
X-Received: by 2002:ac8:5d49:0:b0:536:6047:5223 with SMTP id
 d75a77b69052e-55d76a89c91mr393754511cf.49.1795714248209; Thu, 26 Nov 2026
 09:30:48 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124132707.101769-1-mbkchelofficialdev@gmail.com>
 <20261124.225103.2152350984946270550.tomo@flapping.org> <DN59EXEWINPV.3UUBOIK6EROAC@garyguo.net>
In-Reply-To: <DN59EXEWINPV.3UUBOIK6EROAC@garyguo.net>
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Date: Thu, 26 Nov 2026 19:30:37 +0200
X-Gm-Features: Aa3M54pUd2g0wgweuLBmsRg_pmRKl67kEJhI-Zk8ycWIZFLVampA67QmR6GpFLc
Message-ID: <CA+YDrKCiL9p7h5DrjW3iGn3ckJg6bbvdsW=OwYC0GeXkUD0p8w@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: add warn_once! macro
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <tomo@flapping.org>, fujita.tomonori@gmail.com, ojeda@kernel.org, 
	boqun@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, liam@infradead.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,
Thanks for the feedback!

I've actually already sent out v2 and v3, where I dropped the
warn_once!() macro and switched to debug_assert!() and pr_warn_once!()
(gated behind CONFIG_DEBUG_VM) in Vma::zap_vma_range(), following
suggestions from Miguel and Nicol=C3=A1s.
You can find the v3 thread here:
https://lore.kernel.org/rust-for-linux/20261126145257.192636-1-mbkcheloffic=
ialdev@gmail.com/T/#u
Let's continue the discussion there if you think we should still
reconsider bringing back WARN_ONCE!
Best,
Ivan

=D1=87=D1=82, 26 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 17:4=
9, Gary Guo <gary@garyguo.net>:
>
> On Tue Nov 24, 2026 at 1:51 PM GMT, FUJITA Tomonori wrote:
> > On Tue, 24 Nov 2026 15:27:07 +0200
> > Ivan Tverdokhleb <mbkchelofficialdev@gmail.com> wrote:
> >
> >> Add a Rust counterpart of the C WARN_ONCE() macro. It behaves like
> >> warn_on!(), but additionally sets BUGFLAG_ONCE, so the warning is
> >> reported only the first time a given call site triggers.
> >
> > C WARN_ONCE() takes a format string. This macro is the Rust version
> > of WARN_ON_ONCE().
> >
> >> The macro returns the evaluated condition, like warn_on!(), so it can =
be
> >> used directly in an `if`.
> >>
> >> Use it in Vma::zap_vma_range() to report an invalid range, which
> >> resolves the pending TODO there.
> >>
> >> On configurations where warn_flags!() ignores the flags (UML, ARM and
> >> LoongArch), the macro behaves like warn_on!() and warns every time.
> >
> > C WARN_ON_ONCE() warns only once on these architectures too. I have a
> > local warn_on_once!() patch that does the same on all architectures.
> > I can post it if needed.
> >
> > Also, this patch does not build on UML, and test_warn_once fails on
> > x86_64.
> >
> >> --- a/rust/kernel/mm/virt.rs
> >> +++ b/rust/kernel/mm/virt.rs
> >> @@ -115,8 +115,7 @@ pub fn end(&self) -> usize {
> >>      #[inline]
> >>      pub fn zap_vma_range(&self, address: usize, size: usize) {
> >>          let (end, did_overflow) =3D address.overflowing_add(size);
> >> -        if did_overflow || address < self.start() || self.end() < end=
 {
> >> -            // TODO: call WARN_ONCE once Rust version of it is added
> >> +        if crate::warn_once!(did_overflow || address < self.start() |=
| self.end() < end) {
> >
> > Miguel said that "Erroneous Behavior" cases like this should use
> > debug_assert!() plus pr_warn_once!() [1]. Also, the C side uses
> > VM_WARN_ON_ONCE() in __zap_vma_range(), which warns only with
> > CONFIG_DEBUG_VM.
> >
> > [1] https://lore.kernel.org/rust-for-linux/CANiq72=3DtKVD13GD2Bzmt_LnC4=
SiOX1nkHQPcz2BS=3DP=3Db23e0Yw@mail.gmail.com/
>
> For zap_vma_range I think we do actually want WARN_ONCE. For something im=
portant
> like zapping a VMA range if thngs are used incorrectly we do want to figu=
re out.
>
> A debug_assert is not as useful because it's not enabled on kernel shippe=
d to
> end users. A pr_warn_once is not useful because you don't know who's call=
ing the
> library and causing issue, and also a dmesg warning is mostly ignored by =
people
> like a WARN.
>
> I think a condition is unlikely to be triggered from invalid userspace in=
puts,
> and the misuse is actually a bug, we should prefer WARN_ON because that's=
 how
> can get things fixed.
>
> Best,
> Gary

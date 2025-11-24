Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FACE1400C
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976704; cv=none; b=FqhiAsNqYGYgPgrEZLytADi65mI3N3vuEC4CuFCpHo6xXU/lfZDo+MTeuuwCOAjhCGeXFkxW5/ZAJJAlG2o0ThWT6wKKsiXKaMQDI/nK8fDO3UmfSkgnYVe3V63sK0/xtLAGAoFgo3OKDRedwevB/bxWxLovxBpWQYBwz43URvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976704; c=relaxed/simple;
	bh=ZR4BA4FXyoqaNf9XdLhA/rm09DKR1S5BGKo1X2HoomA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lEUEgTLTvX6fJayWnWw1FT5DKLPUcBWM/e1cOj73FllwDVH0gqW+rdYgcXKDhOH/d9aNuL9dC0B+qrTYwCEr/4fXGvSx9GzPMBoQQqcyq9AvD9C8jFmBcbutJzpOqYY2SEen6MkqCA3FaH2Z3ek6nwnYrwwP4kFB4WReRapjGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NW9Rg1rm; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NW9Rg1rm"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b478551a6so1903879f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763976701; x=1764581501; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgq0F/GpwjDAB+nXr4KktACLDYM4+/4E/B2rlxoQ3II=;
        b=NW9Rg1rm6lY9kI/lGT8Vs+P1EnvsK1Rjadj6JAINNCkVXZeWMi4l5lXEo1uiHaIAqt
         lad3uOcZ73X/a6wS7zTE3wLjoCF6UDBjGmkA1x9bMxZ9tJykCGt2dW4iGnryvmpAPNFs
         /O+NxUmef4NLm6d327j7JYa7X9tNyaeH6ingYYTq6ETn84TQ7g5u8CGnxYXfbOD7u1Ik
         eu8080UhynJMrhg0sytKCP/HRRsvUMfWMkhxCaR4uB/WZoopvTLjJQDGsmZIQaRQL1wm
         OvB7JBzLkIJx3tdVItyOUJyOSgFM1t2DcrX21Boqev259AvrXmmM+IQOy4DRYdJEtZcd
         0bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976701; x=1764581501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgq0F/GpwjDAB+nXr4KktACLDYM4+/4E/B2rlxoQ3II=;
        b=TvKR/sy9Cj8IKmu+MsJouYWC1Mj5OitwrkTpCgU2TgZbIAkwT2LFjCj3IfhTwokjMt
         UotH56eKOtFlePPCJMt0UGz4hNlcxVmMBMdrnZxDZxNHDuIzGM8gUGe5G29o/UUXSPt3
         ZscIjhq1BsGnoC7iPGiqP7KXVesZnZGaQthO80IKJzMwEeWi6nA9NDYwS91/dpdUcyOA
         WZ5uWShWF9ne4jIosoiyNgdUGMbfGDCF3FsYd+x1E0CS7OIjZHw6NST7lS3c+at/CESa
         +BihlwSRrjcLm9s2SizrNx7xyGwI+9NqeGadzr7ovcmMccPa5nwBnZ8C+n2PbzMDbvhP
         spYw==
X-Forwarded-Encrypted: i=1; AJvYcCW5NLscz0hDFVMf2o0w6HtsD1uJYKno5ESInmua9M/xWTDPRyWTMc2T2aEcrnzOIyiDPqUMD2zLv0SiIyhspw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE8HMcd9/4v9HITL78wjLDoKqXZCmU94M1unsrLnDg2BGkJFAI
	qyNUi3jeEyMK74YBUU09u8Z4ZiUB5/CjU59AmhJ9t3+1pyyEDKxB7hJcNhlTWJtHT/ZWi6z+L0E
	PbmkAWlaUANUMtpQe7Q==
X-Google-Smtp-Source: AGHT+IHqNPkwGUM9B6wCxGEJJsVYSnMOs9NT9NJUIzBZveXimHTlZN8zmUWWB1Q2EDOpGMlfuU7W1c2020SnO1M=
X-Received: from wrof8.prod.google.com ([2002:adf:f588:0:b0:42b:2edb:9e83])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26cb:b0:42b:3ee9:4772 with SMTP id ffacd0b85a97d-42cc1d525b7mr11180670f8f.52.1763976700950;
 Mon, 24 Nov 2025 01:31:40 -0800 (PST)
Date: Mon, 24 Nov 2025 09:31:39 +0000
In-Reply-To: <b8234f181d35b21a3319b95a54b21bdba11b8001.camel@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251118132520.266179-2-phasta@kernel.org> <20251118132520.266179-4-phasta@kernel.org>
 <b8234f181d35b21a3319b95a54b21bdba11b8001.camel@redhat.com>
Message-ID: <aSQl-83Ny3seL2XK@google.com>
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Alexandre Courbot <acourbot@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Dave Airlie <airlied@redhat.com>, 
	Peter Colberg <pcolberg@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 21, 2025 at 06:03:22PM -0500, Lyude Paul wrote:
> I haven't gone through this fully yet. I meant to today, but I ended up
> needing way more time to explain some of my review comments w/r/t some
> ww_mutex bindings for rust then I was expecting. But I do already have some
> comments worth reading below:
> 
> On Tue, 2025-11-18 at 14:25 +0100, Philipp Stanner wrote:
> > 
> > +
> > +/// Container for driver data which the driver gets back in its callback once the fence gets
> > +/// signalled.
> > +#[pin_data]
> > +pub struct DmaFenceCb<T: DmaFenceCbFunc> {
> > +    /// C struct needed for the backend.
> > +    #[pin]
> > +    inner: Opaque<bindings::dma_fence_cb>,
> > +    /// Driver data.
> > +    #[pin]
> > +    pub data: T,
> 
> It's entirely possible I've just never seen someone do this before but - is
> are we actually able to make pinned members of structs `pub`? I would have
> thought that wouldn't be allowed (especially if `data` was exposed as just
> `T`, since a user could then move it pretty easily and break the pinning
> guarantee).

It should be ok. If `data` is pinned, so is the entire struct meaning
that you cannot obtain a `&mut DmaFenceCb<T>`, so you cannot in turn
obtain a `&mut T`.

Alice

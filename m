Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC93519CC02
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738059947; cv=none; b=uNTzBwZOlYu7n0AagbFaSUKMH4h4xhP2iKyO8scWKAVSTd1QurZlU9bcMGcl3cRbAe3CYUNg5UhoozhCHj7k0bCpOftRS98jilt4q11ofnnL22JXQkMmTaQr9GDlSmD+/HGFkaaEtp7Ya/5uFSL5xYFYIueqoqc4HlNxxGhkFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738059947; c=relaxed/simple;
	bh=MJu5R0MF5TiC+CyW0Qe9EekqjqUAvKAoZ/rwwaVRzWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHsHp+iSyYOUnAi39nIuXte0lwXm5QH7vavRj8ym3ONMrKZp+VoY7nkrt0W8E2YJEK+FHkdu9qQVmdSzaUw00rv2TJuZ6AwedhZiNspQQWuEn8DSx48irpmhwECQVnCIj2bQEZ98d/1PsS+9iX7GuTg+V4IOiJNXpuREFl8xmMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yYtoYP5v; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yYtoYP5v"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e06af753so2937490f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 02:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738059944; x=1738664744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJu5R0MF5TiC+CyW0Qe9EekqjqUAvKAoZ/rwwaVRzWU=;
        b=yYtoYP5vKieaV8petJZqAuH+QEmVsKQK95xCUu/7Xraucl/TvChvAel7ieygtn/3KH
         V8bjcG5n8Qt31No/bncYldA6cVlbCC8uses6BX7duRJDoEghfDlZc6LhZgpPE928LhHS
         4pOJoEDV8iCHOWYC/oO8f8pY360lOn5JNFwydT89W/2LFda1fzHE2hmgCbpcukQS+qh7
         gDMeUuHrLQtiEe4RO0gM30nBuMdk3DkqQPuewh18yqKMKyPSb5ctTARMnXabsN/7bwJI
         +99GkZvxcsRtfXAUyq3c9vTtYuPM5PAPxIVh+1hXJ8ipXZZCtjVmjn94aPIgmDOrSJOV
         xwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738059944; x=1738664744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJu5R0MF5TiC+CyW0Qe9EekqjqUAvKAoZ/rwwaVRzWU=;
        b=nbs+O3Gd0cZhYVk/brmFsLfwJyrE0ioCfqjP61ojel2rrjisl9bdgLdDsZhHeDCIem
         1LBboA6njF1W7QLhn7bxxyLWJwqhLdGQzFVl6btXyDpM5Lb6Do8nasq2eIglLM3C2b2v
         +/t0uRyOCa7/4LXTYLWDURzlkzSUhGyZtr0MieYUCJkbM+66GSsybRPuH3+v3T7cLxE6
         op86ighGS01W7rEaVloBTB/Cz6e2BhfnuT7D0rT9Jy/U30s6qnJG94GwPP8amOWnlQY4
         /o0xUmORwxxQwbH4QmB+T40XV31LvqGBurz0QsCHx0DQVsXzJipUftiMhVmszKsDHQCr
         +X+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgansMCvd/9zogVLfh32jFmT2IS86S6X0ChVzEPf6/z1HcZD6uiXprc6xffHMknIGugypa/GvPBT7ruX8Xmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG0ZgnsNND+Fi7u9Cekm2qj6HW1qev8bdgOZhzn3m3pM/QUUlu
	GH0nCLnVPb6SFqnsljGQXl2PY3nQD1fSyDEzaRgyYvPaNh+H0SXkS8UmnTyMrXXPZCHZF7bME5o
	bqPBL7gpBjXgXum6uEHY6iRy49+RpYc/oZDOM
X-Gm-Gg: ASbGnctab7C+Mh6frwcatBv8Ic5x3mxkZtOYsQHtene+niGOM+X0xkxElafY+6bDeg6
	Nma4qpTiv6dHMrj4xaBo3xFJPR2Zqip+6v/ZPcoIk+BK0KnUbQcWjhijWaBbDBD6ZZCgajO+2Q3
	CJksCHWo+vNSNatogPex7SyeSkBQ==
X-Google-Smtp-Source: AGHT+IEH90BFbkOp2SYmGkeYnH3Xp0516Xr0wSSe7xPqdF4528/Cj7GbtqfF9cTkbeL7NcQEeKy+SngdmFt02Mg/p5A=
X-Received: by 2002:adf:e946:0:b0:38a:88bc:a8e3 with SMTP id
 ffacd0b85a97d-38bf567a57fmr33366059f8f.33.1738059944088; Tue, 28 Jan 2025
 02:25:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
 <20250123104333.1340512-3-abdiel.janulgue@gmail.com> <CAH5fLgjL0aGGwkjEfXH08Jopwin1NfkLzp9vQWKcHPEum8jV4g@mail.gmail.com>
 <0E0FC88B-95C0-4DBE-B497-AF9101BACE70@collabora.com> <CAH5fLgiW6n82hMhbmJ-ynd6329mEDFX6TzxXQZaaoG47HAWWcA@mail.gmail.com>
 <95382414-7A44-45A4-8F3F-C6D755422AD5@collabora.com>
In-Reply-To: <95382414-7A44-45A4-8F3F-C6D755422AD5@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 28 Jan 2025 11:25:32 +0100
X-Gm-Features: AWEUYZnhdm-O4jhFXri6BK-i1np_sxsPH8BwJdv_jxk9-d66JQytiLOOaeJiOPM
Message-ID: <CAH5fLgjZiux1_=dNuZN+7SEY6fUGMDNLoJNTwmHcB=WbKChwzw@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	dakr@kernel.org, robin.murphy@arm.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 11:23=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Alice,
>
> >
> > The difference is exactly that - you reduce the amount of data copied
> > to just the size of the field.
> >
> > Alice
> >
>
>
> Is your idea to have that *in addition* to the safe methods?
>
> How does it work when you want to read a T at a time?

I mean, I imagine that you could make the syntax
`dma_read!(my_alloc[7])` read the entire struct. I'm not sure which
safe methods you are referring to, because right now there is only the
unsafe as_slice().

Alice

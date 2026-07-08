Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5478D378825
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 16:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527835; cv=pass; b=MUQ2J34TbD5W89sIsq1Ecqytntdcf7YYHpovSo6LCZ5FU99udw+PUNPqMmLkUilkYw5h09A9FzbzDytO0jaoQfgQA4wwedkeBIn5Zkv96jDLmcnDxitNdO/rYUGQNlnu/G1eQpiT6ftTo6aQceQs3rDhqayVTE3wCgnsE7fMZWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527835; c=relaxed/simple;
	bh=Cqtw3/smNx2n88cIk0j+ukr4koypZouZU+Y8rdSn5OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WV3Td8HLL38RhyzwfLEZINL91BpS36WXlFQ8vaAZsx82ez8P3keRMiDEO98kSeYgC8l/jzby3rsgOUhKU09fPXwGdBbW9NZRwr0AXU3Yz+qx30dwMEa2WV5Wujbt6n6B4PFvfaYy9kcCEzggcQFk3z72Ahi0vFoTTWSbFmangYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spXT/MGn; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spXT/MGn"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3812af5b025so101342a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 09:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783527833; cv=none;
        d=google.com; s=arc-20260327;
        b=JTbzTq6jPWf9j16Ze4mBTFkWnplNpL2uV+VuzrIzeo2AvmB0zXEZWQJ7DkwDY2SYfM
         DTCwFSstNAgIUCPblQ26hUxkI+57749Be81FWNRid5pip6Xo94uOrExfK0th1s3ZSz2b
         IZc2IiPxqHblHritIF9iTsu9/L/7KU4XcUpjXI1QT+yUS351B5X8gVpkbgn/MSf7clks
         1DSOb27PQ06wfkb+8AzbEYENPxveCEFWqfQY38N8/NFPn+aYB6wxEpXmI/S1N8AEjpu5
         d6ZrwZIdoWGrb2FiHICNK2D5uDXxjUQ0IpC+9fl1fmuw3JDQDQWQytdiTR6DWCEo4E//
         SyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EPSyQb/x6hLK45ZzzOLofFJ0gwK7F88y8qdqGvRcDo=;
        fh=3F9+r9kmpOqx3QtBnxxObcQOq5b00z6Dt9IaZUW6NC8=;
        b=kQObsq4qf9wRigRaw4BIBJ22q3R9ddXCgSeqnImlQfuYoEC8qkruzQc1vq3AaQYuy/
         a/j2aOy7uIjbcIu9dVl6SW21QIspjnxsMdDMuAkRCIf6FA+oqnyZPWrTJEAWTdYV+Cds
         eJ1M3yU5+CxtZKj0F/jLV/ExaC4kFXQPqpFzkDd3WmpEY7hppdWwlw8oPVp6AXgCGAgg
         I2qsDMWInylKO+JK+6rCNJ/iiXI3K41LHWCtHaYOwuC3axKuRT6t98ITNO0jDdzDVtTm
         hKQA0QBdf2bTXXHV4sFxutgKEqhtvwnoGie7F3OeQActfcAdAeLdjtaZq2wpdGIy5Dsz
         jXqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783527833; x=1784132633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/EPSyQb/x6hLK45ZzzOLofFJ0gwK7F88y8qdqGvRcDo=;
        b=spXT/MGnlsQz0z0blpH3SuKDzS3HsZTAZ+XT17bgt32h6jpG4TnOOFfEwxPs2JdSnT
         o7PkZXQxYYI3W79DHIsv2745nkBJZdOAFJ7takZyAf6S2kYBUPesX0vTQH20Qh/kQBFw
         XUqkl8neV7MtskYsbT9uXdEiSDX01tFx+0ci+2gqaJJRZhtnqp/H+PIH/uwdVZjqP8HH
         u2ar+b4amkwhWJpz0NjCXKA9Va3qIbIMdYolGOFl3kVBjmlXMDYNyyI/+/S7Ivc5Eg8z
         A19mFDRscJu7PcBeofE/0mO9s1vh2wbzqkMTZJadHUiIw3OOs1fRw9OmSsK5rXoQmfYU
         HIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527833; x=1784132633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/EPSyQb/x6hLK45ZzzOLofFJ0gwK7F88y8qdqGvRcDo=;
        b=akKW+kcXPCG6RxjJ/LR5QgfzkAYfyTbKLeBCYCIiu/uo11t7FqmPBDs9ALceql/CtZ
         s1EdcSLXzPaUwPgse+kN2TyY+rAZrWCyDLyXkm+YnnQ+FtlWWX4Jwr/ZyoLpUhdwZzM3
         Afjix7Pl1RFipUUGoV8vP9xgjT4Abu83LqYY+ik9nKIBWStdJ2KKQ1kj50YZJMpNx876
         VEjj4hFi1Y2IWOrc4eN5j0oTX5AVyASKzq2Hh9SBmKsb8ldoEKormsbrzlhEI1f1Shws
         0uA5K9bc4mtZnVbf3Ht8EAqiCAgex6RMQcvjWDZmydY3tqSCXHv1zetT1Ikptuqgjjnd
         uMRQ==
X-Forwarded-Encrypted: i=1; AHgh+RogPbmRtZ+49jNlRLbbydRp8NteIVXU7MMz74dANKYPjFCDJPyAbvd+sDV61UBOblUhI6TP2h7zNG9bm6Xe5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAaTo0NlgpGzSYnkgR8HPkkR40OCp7fSgsTQZasvCP1guLyKSt
	/IdogsjcnPsBddgJJwcIoKS4vylKdkaYB4YWnkFeQfexoDPopgeMKisFvcLQ/aIEZQJA/sKYZfn
	5Geja0TdNXCCDKIA7ycCAVqK2ULjdVBihdnVdQeQ=
X-Gm-Gg: AfdE7ck8FJIF7mnXAI5Xc+fSqAwixnhsBUSwVNfM8kmdtjG1ia/x3D6EZH1zdoOZmT2
	yKKKroNyS3CbeUX/W1lXknIgsQ1uZRtWFOyvccLZv5N/zFMmAdsq8QaajiSuIqIIKcFYQaEZxcK
	UlujwyNC90GYJcHB7OYAFE9TzGthmpe7Qr5IDelubfkA5dQ6sgIVW4KtZUAE65mKPlft5RYNCbf
	i0QC0NwRagV30MLPl0yUPM4I0fh8OfRtuYAicIcCzXk8oVay4Kh/5/I0DlBG1B9H5Ht2aaWAmiA
	C1SlZuMzMlp1G+TgmrP5yXnzfC+6D+tdas0/SmrLy7feL9Eh0Hf72/0Wf5zSk4BuRHWCjJiz4dh
	2YM6SfJbWYGvv
X-Received: by 2002:a17:90b:2d08:b0:381:28e0:6248 with SMTP id
 98e67ed59e1d1-38a1f1dd5c1mr206547a91.1.1783527833486; Wed, 08 Jul 2026
 09:23:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-zerocopy-export-v1-1-2bfc355853c6@nvidia.com>
 <DJT5P43GJ9MT.2527G7CFCEW46@garyguo.net> <CANiq72=HwD=z-t4e5qPwc3WjmXUsJhV88JaN7OKyf7E3rrAFmA@mail.gmail.com>
 <CAPvrYMF3L0x5PBJk2TnSPyi0Lci2H0vGBu6QS_Rm4XFQtTV6mw@mail.gmail.com>
In-Reply-To: <CAPvrYMF3L0x5PBJk2TnSPyi0Lci2H0vGBu6QS_Rm4XFQtTV6mw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 18:23:39 +0200
X-Gm-Features: AVVi8CcVcxGSzQIjAVhRKBSUv7-2k8kkqQRUphHjbFgj5l-bc3dMzKzuuMWSTTQ
Message-ID: <CANiq72nV69epk4mToh01KcETCnDZo4S-7vnb4KnjZN8TqW0Mfg@mail.gmail.com>
Subject: Re: [PATCH] rust: export zerocopy symbols to modules
To: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Gary Guo <gary@garyguo.net>, Jack Wrenn <jswrenn@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 5:35=E2=80=AFPM Joshua Liebow-Feeser <joshlf@google.=
com> wrote:
>
> What's the list of symbols that you'd like to be marked `#[inline]`? It'd=
 be easy for us to add that upstream.

Thanks for the reply! Gary sent a reply here:

  https://lore.kernel.org/rust-for-linux/DJT6235B3DOV.222XR5O6VHG4M@garyguo=
.net/

Cheers,
Miguel

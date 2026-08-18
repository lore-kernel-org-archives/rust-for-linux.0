Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FAA37B00F
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787085484; cv=pass; b=leb11dLDuURPiU1wHoTdNmI2jgTYPspZ6UHW1vIBmY0oUVRq9XYxjsj75yAcPxVAsl9wfxmpJuiSMN9zyOVFZGBiLFsYb119kNGObJkl0kZ1EXzDQiEpRubouwuIgKkET5UdFYepNqSbbe60keuwVpRBfGE4P8SNUFihCU82B/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787085484; c=relaxed/simple;
	bh=OuEEKeuH8pabQ7wPMfHguwiuSYwslIuaLBsevgkhbxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YzbRs2tqtOYoZediPsm3s/21rXgrVAayOI/HiqPfFoFN+Q0Cz2gOZWr2D9elnq89gLLIuYouDdk3l7O86XXFesO/7kE2xuaW+aPlytOAIeKk/WQDLmyAVvZMnNl04ESOafahUnNnIo20F21KmZ0tp9jqvAV7law71z+nB9LEqYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETaV79cv; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETaV79cv"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84a32ff53fcso55309b3a.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 13:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787085483; cv=none;
        d=google.com; s=arc-20260327;
        b=MJRl3dSJTVsskHymSftqcX9e4kqAuUzpFqJvMEe9Z8P+MXBIg3qDdi9204oMNx+9c7
         +1Gag3NcMycbrRf5nzbCz6r2hHzb5fYnOI94cYEb7IOMVn4ulripm+UMrDLnSPOtWyr4
         F22TnOQ9PX5psgjGcUm1awLa4WmXAp/a9tU9qpGUiFpDNWMxPgD0oBaM2YIX3J73Zn2A
         qO1rx0qR62RWXui2g2HPY7P2/PVucr9PL4WqPIQxdZK0LjBhdzfyo+/x4X0HEreYI6ja
         AGJyNRfKGdERHrMJRbtx3GLNW0HppC1OBJ5EemIYmGibIs20d0XOJue4SjqQxEdiEUeq
         B8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OuEEKeuH8pabQ7wPMfHguwiuSYwslIuaLBsevgkhbxE=;
        fh=Cl8O4Id9JxoNS3OZmZr/414geqyJ61orn+zErS67+O8=;
        b=S6WEy37zEyS5LZWhULFQ3FKfDz8z0klGYD5pGS2vUGtMTM4sjF+vBYgrryH/XswsDF
         0+IVfXO3NJ0Yi2ghbJ1zebEfB8qhOkKBvdtQnZ3tqjBla7IyJLtpocWoxmJhLVj0ovto
         dTSKi73BmXEJK3B57SMZJI2klrCtCtV3Drq++qc+JMHsxslx6WIkDecmvQgOb1if+det
         fANwoz/ztyDqyceXnWduQ8li6qRkGXfq4At4TpzDcffh2of0o6QXewLAG/rUnoXngLs0
         DA5Z5CK/x8xuq2tE2FMVNBxcrA7uE9SLsyppVPQqhi47baWGH3butL97poGqF4+FnA6N
         M51Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787085483; x=1787690283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OuEEKeuH8pabQ7wPMfHguwiuSYwslIuaLBsevgkhbxE=;
        b=ETaV79cvufYgJPCNC9Q0kL6k2i6L+RZ8+GFKB46SHeueKj4Ta2/L/IlZiDgJEWt/1J
         t0tzswTORku0570mFECUVa7IguLEVThHHopHenbH4W2wGPpJgZY295vLRz2H7fF/kTPR
         q6SnbINt4V7Q/qy/gIOQ8T9KJXh/4Q3sFc13nhf8hCS7RLcL1F8x2OJVLHIOQSojyIV4
         QXvn/gIBB5jMhkznvH4fzJ1dVwVs87U2fRqy6SIJjCYeLS19qCQoQtN+02mDmD01yob5
         IdLbRMcVzhqQMsl4sYrLy9QzHPWXc+jUOrocDz2sJVgL6TkkzpmBA14QQI2dUrap5U1k
         9CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787085483; x=1787690283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuEEKeuH8pabQ7wPMfHguwiuSYwslIuaLBsevgkhbxE=;
        b=Sg5RqxJ2kgWW8DzOxTAmN/D6/Nlxhywle5SH7GJXmdcC7c1VEXRjNn+EyaQcb8Yzsf
         7L39ZijDINu9d3XSvx4u0lEsltQWOU4MZlebI/HN/WHBwKphNY6p8PTa8MGaTeyqPwcs
         NTJkD2Qn9yEb7ErND9K7okFvAvj7piiedt8uBqg2QSAh6eWw2DXcAwC2SOjuSEOqznFt
         UiAdosCCuerQOrInYQdnPQpEH6rCAYiJsnwstqoQTi/NIlQ+joV3Gioai3TV6ptvk+el
         XHWTgWzXumbZRW2XWfWVsMcYDNud0Cb50xWu+QjSEf45xqQhIi9rVjvLVz+faKJv2Fq1
         ynIA==
X-Forwarded-Encrypted: i=1; AHgh+RrYioFWhOJ8nsd8hVTI90kH2uIVyRcDNihiTRuG1SSMW/Xx2n4BfY/q/GcQJaLOMB2Ofdmv9a0OWboBX82/9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgejPyVl5cf/oNghAx9iNMN2I+TdYz3DuQ7OsVr8bosBp2T5mY
	NpfeikvFqAysDmDTyzhix9TaU+x6seJUBCgPNYLsl2NaZfz35FjhMzswwV7yM5RW8PH768Z8rKM
	St9UHX9bSOdLuFfIqEJ8o7xrZJR/4NdA=
X-Gm-Gg: AR+sD12lF0k0TaxPeZD+ubhwLDXjhTQy6d1WTax8ouNuLc2NAVviontJ3Lo2voNP/A6
	LZgyDuSaSFAp6ovTk/0twn96A9TGcpsyujvpcFPHLKwC9NvRqrowPh1My5ZTSKwYLDGNr8+IYFc
	RzZWtcYL+QlSZpKIQCor6/nO85G3FPkYOWo79LjhyA1o7n8WwbqlfvLz2HhwUjEwrFt1+zhm6lB
	6RRGtr2c/L79l/nnOAfTPdEGP+QkhlcomE92nNOE3wBtZePVjspwGaAFTyXiS9edgyUCWRsN+Wt
	NGy4uWdJnBrUAz46xbx/Cmdo13POuMDRCGr+pCJsFjDYLKwhB+xwl1gUCRrAbIK4qCSYpv1Xc72
	NNavwcfSfvr2zfChVj8FUEcd1ujigC1EghPSbmPF2FF9VzEnkf0rNmRG2LjAs
X-Received: by 2002:a17:902:fc46:b0:2d5:3f09:4126 with SMTP id
 d9443c01a7336-2d5f6bc2264mr4348095ad.4.1787085482484; Tue, 18 Aug 2026
 13:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818105350.361218-1-ojeda@kernel.org> <20260818125558.GB5432@nvidia.com>
 <DKS3G1HH0835.P8T7VT9VW24I@garyguo.net> <20260818132022.GC5432@nvidia.com>
 <0e0c9ee9-ce44-49cf-b5c5-3764f260f1b5@sirena.org.uk> <20260818142300.GE5432@nvidia.com>
In-Reply-To: <20260818142300.GE5432@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 22:37:48 +0200
X-Gm-Features: AcwNN1UxmUGgZFAV50wBeoOEzKNFymmZQEpqmj4fIDpqhF4GTKNx0UBPwrBe9FA
Message-ID: <CANiq72mOqWw0gxCCcJSyWRVC_OXSt92g5HmAOx6OL4xp3fcC1w@mail.gmail.com>
Subject: Re: [PATCH -next] rust: fwctl: replace `__pinned_init` with `raw_try_init`
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Dave Jiang <dave.jiang@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	linux-next@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 4:23=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> My impression is the rust team is still learning how best to apply
> rust to linux. So things land and get changed around with a healthy
> does of compile breaking changes. In a certain sense they are building
> a unique kernel specific dialect of rust as they go.
>
> It's fine, and this particular case is managable, but my main point is
> as rust increases in scope a more accommodating process is needed to
> maintain the general kernel work flow.

So we have done that usual dance in the past, i.e. waiting a cycle or
more to move users over time etc., but in this case it seemed like we
could fix essentially all at once.

In other words, we do our best to avoid annoying others too much
(especially Stephen in the past, and Mark and Linus), since Rust is
not too common yet.

In Gary's defense, he definitely knows how that works -- in fact, the
commit where he removed the method only did it for the Linux kernel
(he has other users of that library, where he didn't remove the method
just yet), i.e. he was definitely thinking about it! :)

In this case, we weren't expecting more to appear, so we went with it
-- I could have asked him to wait a cycle, so it is also on me, but it
seemed minor (easy diff and missing it is "only" a build error in
certain cases), and Linus has been OK with us having minor semantic
Rust conflicts from time to time. He even tries to fix the conflicts
in Rust himself, just like in C, though he asks us for the test merge
/ diffs, for good reason, of course.

It is also true that, with Rust, as Mark mentioned, certain bits can
be a bit more painful vs. C. One more example of that that we had to
deal in the past is moving items across files even if identifiers do
not change name, because Rust items have paths (modules, like C++
namespaces). But at least for those we can usually use what is called
a re-export to expose the same item in two places etc.

I hope that clarifies, and sorry for the trouble!

Cheers,
Miguel

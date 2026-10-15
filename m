Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B33A5218A9
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073495; cv=pass; b=tQsOA7steJu9J88mqpjMZyoUAI1zcyYTiIDBK7wuh3OOiHjBKbVnCWZ9vBa0MhCvumGPTxZuPq2PDhQckkhRAEesqhcZDZGId8MngqFh1i8hNgcLC3L6ammO8A37JTV30dXRgp9cpznyJ7pyWxyfn/l6aMJCyS2DzGwUCh7BxV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073495; c=relaxed/simple;
	bh=+s5DiKy14EsGvCvBTRU166D6R/H9a45gcJqw2SwIGD4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QWDYpD8MqsCO8xoGyaXor14V3XeiU7XoAcvyaLZzBfau3mVoQqx0naa8PjLzB+9bAm0tv6EmxMECC60DXrYH4I656EK0ERO/rl+VRLhudm6QsxhX9yDbPAb24u39ZX1rvzs8+wBkR1EX00mgr+k0no6F1PdDLL0MN5nMYPZKrZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRg/RFyg; arc=pass smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRg/RFyg"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-49de5c7e06fso134838fac.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 07:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792073493; cv=none;
        d=google.com; s=arc-20260327;
        b=Kj3g16wbfSjZGdgdXtfzBsI9eBqvNpa/TNgJiY9erNQYMusQn26xugRe5cmBI4yYJr
         jSte0fdc0b/GmgoRSdv9m8o+18vf76tzOmZ/KgRESUKB67ddtlSRenlIGFdTd35L30lU
         dwlWyhWTP+VR4oQasT13r4gdc1SxGPvxY937pSyj9keY8ISaEVbQiRqWgwkXEfGZOPy6
         FEqBBRMiQIwEdxAeqsgC+FUzljL7W1GkRVSfYeCBqcmTJctPbsWcS7ySBosCpAa8FhZ0
         ZPoJRvhVh6tfiLh6vzL08qwdQfrv2SSgMChueuEnQMvWZ+iyPzBgnHsXMC3vWpYj1VGE
         UADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+s5DiKy14EsGvCvBTRU166D6R/H9a45gcJqw2SwIGD4=;
        fh=EtiRVb0Mdwe8SZRrBjJrajxm22008/O0AlCEhQVYBjs=;
        b=oYiafxihj4wETZU8pgi2jdopnU5Qc9mYOhaxlgEZiah6aqoIjR09YXoXhj10D5Qqg1
         J5gzRQn4u5ZRfLk0XEmACtwUiw3/sJVdPrx/jqf1EfTq5fpPvrOtyZGrLd0Tpq2fHj0u
         FUs1Jm3NKsOU2uhJ71Axh36T7GYxJ/3lS7KdWCOSwWdBChHaLVeas0XYhVqFAGQFbh0b
         2DxL2mLnJKMKrmkcJuT/+iU0rh4nCT/Tbx1n37uKTAOP03Oesntmy8+9MrJyIb5WW19i
         cTbZoU0DEz9x3BIJl/RdhrMZ3ghbfu7WfIUKA1B4XslYU/PidMeTD+r7SJjxp7FXNWfN
         mokQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792073493; x=1792678293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+s5DiKy14EsGvCvBTRU166D6R/H9a45gcJqw2SwIGD4=;
        b=bRg/RFyghr0rxCER7Yccit9X31cP4U3s4lUls/fNEgrJHCdzIE3iXtbBfKPMwcniFx
         Zmq6/aP3s4568w2ozmBYud03/FVm4rN9TpZKkT2JAiCFrQvz55Yw9pIcKtiql6dWSPWa
         +DcgXtuzGMGNtkkHlI0MctneoMdiHB2m4iE9McM54CdO/AXPLshwQBwIXOahRQCASmN9
         mJO5Kv258cFeLDpeuAButPfL8FeT1c4BbiW9+f0LUlemNisqVH2P8oD5v2hn1icYVICg
         SPVb1/M2zODxBAy8Ww92YYt6m0ojj9MjNbCRqLgDd0DPTXn+EnG+I9xlbn5u7Q1hox3N
         KwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073493; x=1792678293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+s5DiKy14EsGvCvBTRU166D6R/H9a45gcJqw2SwIGD4=;
        b=zbEL6ZUU/BHQdXk4o/WOuAs6uH3LTzDknXjzNyTzdzRPiSJLjAGECzMySo2W+v9ql4
         dtlIMDLIHsBaZiCDjWeBURkKkdJrcAF3Y2J3ltoewuHBFC5WSWzBSs2Pe4A/Yw4OjM2k
         2lRPrtojHEHZqvD95j9YN2TzbIJ0ayvy+2vMiRqYlgWr4WYj1D5bqPBEDVofGq5n4LOB
         Lxm0t8PDIZNCk9QLNsElBY8+E2rcLP1e9scnIoAa/r547HSzfgWbYeJZl7QB8oppk9DQ
         0dKQ/29XNjS7+ziq4OKntLsNw+fmHqbSmyFpozHX3n8/M09V20UVIqY6DHu0ibF9rvz9
         2xFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2pJXdt6L1ju8c7lN/P7i/oS6y4iNLWUiQn0OzG/Hjn09SuHB8aBYv7tjjdBSZ6Zj2iLLszDiO9xI0rYyU3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLp7RBfWlgIJqA2228MCzWOPZ1FoEs03uT6u9Wq09CCVMgXnM5I
	dyhQmiuO5m+p/fylWUNseWK3itsV8bJOoQ6mIWoSiF+VnslC9Cloi3LcRzbpX5iPozr3bzCcfE6
	AeM52+slogDcqpo4BvC+LfkPq5OKbDYA=
X-Gm-Gg: AYBFou1tZDmCNwRpEXtCP5rOgkOiZcui13dVHXHPlTEyoZWYzxPh+UqT9HLDkMUsiz0
	PGQBm7S2KDg0k/objgnlDrSF0jaFpKZ1VRUcNfwDnSkSfpEkWWoc7mYdess00Odb1taIlrQlj8n
	i+iFoiKkyGtS9bBgLBp1XDwp2qgUjlt7QeONvm62zqf4Zgt6EMQZJ9TD/wN6xBpgmms66Tm1Rql
	p3l2v/Gna60EoMQT9LnKRmr4UY3R4TeBgOIns7TIMcaq4fbrUDY7rs3ATc54zC9HXR0TFb7+rEv
	atPjo5K/Yu8gya358ugV3zeecigTcbFpunASLkMtU+BLnUxCbXObPco4SHjbDDel0mrxedzuhMD
	QACOQQtVB9beB9AP9ecDBCeoTTCiuwVhlhzJswSgZ4NXVN0MBppsRgu3fxjMhJ+Mk5YIf/+j2g5
	XJ9W2RcV6oil1Pp6mm8ZDCwpe0uP50xmFtkq4xDM4LnHX3DqTt5kM=
X-Received: by 2002:a05:6808:6c82:b0:4f5:c569:b9dc with SMTP id
 5614622812f47-50c322d0685mr27828787b6e.0.1792073493075; Thu, 15 Oct 2026
 07:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <DM5FG6VMG3U7.1XMZW8RJI2KLM@nvidia.com> <DM5GYU1H0Q9I.308S84Y1RV33P@garyguo.net>
In-Reply-To: <DM5GYU1H0Q9I.308S84Y1RV33P@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 16:11:16 +0200
X-Gm-Features: AclHuK-BrRtruor9bjEzlo4wzp0P652R9kks6YvTL17OLNy7yC5MpbvU74aLVxw
Message-ID: <CANiq72mBAAQaJkL1Yji9hbPjWd9Nm48j6i1G1uE7+KP1kKSHrQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: add NonEmpty
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Lorenzo Delgado <lnsdev@proton.me>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:08=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> `kernel::types` is too generic and becomes a dumping ground of things. I =
wonder
> if we should group things that are new types with just range restrictions
> (together things like NonZero, Bounded, and perhaps eventually Range, Non=
Neg and
> others).

Yeah, we indeed had that problem, which is why nowadays as you say we
prefer things to be more split than less, because going into the
"grouping" direction is usually easier (i.e. it is easier to comer up
with better hierarchies when we have more types around, but it is
annoying to have a big file growing with no boundaries meanwhile).

Cheers,
Miguel

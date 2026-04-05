Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D3385512
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 23:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775431347; cv=pass; b=mqipF3ZOKnWOW/sjbMK5gdl84jOqJzRbYVJrb0KqQv6w2JS4WRi9u+usdK6Ndem+Zxmpboct/z9Wp60W5RQnU+PuDvDWYohnN7adnkOqosHZyJyAeWHV1dmASq8Ie95wmo/dUL45Ky4zW6ZUprkeNNk8F/wi3eljvYIPdzQADwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775431347; c=relaxed/simple;
	bh=4kPwwT+4h4ki047A+BT6qzm5ZSNrm1mFAA1oF5hosxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evsSYn1yUrROLc9cbkrtqmVFij/PrDcFg7eQtPMm/d/dID+CeGxhXOm11Ac00tEl7zFm2zsIWtVSHToq3p+mvK1LKdahRsFZpk3w9QwYdzrZHNUkiZeN3JMaObBlzsvsDCfOktU++ctEWphtiWN9FvT40yCpwuXnA17TiEAgano=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AF1MZVF+; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AF1MZVF+"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c7e5f38a69so183755eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Apr 2026 16:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775431345; cv=none;
        d=google.com; s=arc-20240605;
        b=l0qtKsOrVP3iJ5hVpItD+K2C0m1MoES9hZX8KdZARqo4HlGt1P36M3ey4M1+zfV9AL
         D71BRX6uz9jNepr9MZ9EUqjTQixm5pKRaKvBIh7gRQMIrN9v18Bsyfk/AwJnnXzcL1nX
         QoOwaD33J5Th+FYjtDZkG3dHJj5KcCU+YGXz3iH57Bi4sDRKN8qlWsuqk73kKhHWaFpr
         XHD2rfkQYTrQpiqm6rCP3s4HfDBbqHM3FKSgmya4+1LNQgWsm2vpqhXE4N7jGMZ18clu
         VFB4wzL4YDUSAtmha+talWaNdlUVkHo12hNqQYhqWsB3PreiyUe1yLd0cyCQDk0L35cv
         X1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4kPwwT+4h4ki047A+BT6qzm5ZSNrm1mFAA1oF5hosxQ=;
        fh=EwJY7Ais5eXfvsOSArpYXvxOe2mFfn07FAPSxyqYu30=;
        b=Q5KLNf0DMGRRbUVY3zw+idWnos+eDKiBM9k1pXHJ/1MTY/4ElcjoGZD14sUalcxnv9
         LmSTgKvUHlV1/xAuChVgvr4jUcUU+q/XaR3m+xtIDHYk9sFNW/YjRfxTavulpgM0rbpk
         lKeq2x3OyJkbynTQbiLG15noEXEZSDGhuMBZussMOY3/g8yRtGoRjpWzypJjnikj3AKk
         7z/vq3HqydVhV14PcPPnS4LLwDXCgeZN3w8XQVFk3v+bxZ82I238MoeJYkEn/DpGWBTO
         K+oaa44Yq2GUq5oWC0rqjvu67RSb2XoO9bDy+/vpymKeXNE4GhF4zeSi6kOBcWc2YGa6
         KGmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775431345; x=1776036145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kPwwT+4h4ki047A+BT6qzm5ZSNrm1mFAA1oF5hosxQ=;
        b=AF1MZVF+ZxQzSzVsKJeQUaz9lOg+VPnEx1delD3axhK4gKqThGBzemPGW7HIndonHi
         RhCtZ14zE+zZSHbGOmkNXmJFRbJZttt4Ix0aE9uxN0TCQuOqf9Z8qh/IqI6dIJnhl1yj
         TkfV/Ot5TPRiZrs+I170ccKse23ChcpM12J64YHJrbmsq78y7w2AoLO4kx5ZVySDTw5F
         nKqKWqJNp07BPZBIYLm0PK8X9xvnnBSSu815FKv/4dWriAAPG4QWigXI0lqS/kwRGHq0
         P54f119HxTAGfKXbTNjPYCDUwIjEu935EoHiWyvW1nbmTNAFWax6Z7jgi9Jd/29GQOdB
         r0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775431345; x=1776036145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4kPwwT+4h4ki047A+BT6qzm5ZSNrm1mFAA1oF5hosxQ=;
        b=mKpEldNapGEsvHbFUdZGL79S9uW8TNX4cmhQrd5KbKXSkGu9TLVTEJhzt5YRUcO2gq
         Qpz+WI3YxBECqzZXk/DT78UBc/Q9lWlQQDYV8hthLE2Q9h7qr4Wj5Z9ZIDLdA66q10X9
         hITq/p2DwMaYAmpZvbv0h1hgU05+gMoLY4lCtfSUCJj3+FjnCl3a9yuAL02TlQiAhPge
         YIxquwRxJTeUZ7vwmGJiRj3MFbh84tFfH1xui8lUVQ9BoK2bEmrng9KRjOe9Y/olswOa
         2LseUOxL/veefjpjJAsZAOurNc/Rc3KQaKaVMsSKb7U9O6zF1L3HMKbpDztywqGisNZw
         CZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8+pu+YAagjVXEiJn3EiIpm/4AZ8py5TamYmO5rSlWjeufIFFvuqv6y8OLZuezS5F6E6Jd1irn2yer/huiNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfTV9/bGdMh/1KI6k7q866k2tEWDPnD94+5fgGGv2kwwjAsbXe
	Drqqilp/xvC3GHMvJzjPtOSg2DNyRQSjuYn0q2wRM0gyMJRZZxBcSFxk4+Njn3udmNEAJjI6+ge
	LYFlOZfoxcsnkwBM19rKIAEGmexu0QCw=
X-Gm-Gg: AeBDieulmL5eG3qNE8gtEBrUSFXrWbRfnHFt0Y3BydlKFw2u6piUdxrtVOx8B+kdbWf
	ICsiAYnaAhJy1kNrNwBIrRVMVV6L/7KAVBI0dKHqpWqxwrZpv41J5ws/IPmGwLOpyoWkcY4Muzl
	+DrFpjzZPlMBhg8i7iEVZmkpRVcFp7xAEHuSO3RQLNZJKn+8Gp23txpzA8el0VeGs1r8ehoAHAT
	EkaF4EwKDeW6vESXIfK/hJYepuBWZ/qTikOknsw/nTkW7SjBQdN2n1f7UeffK7NiOjeT+3ZlHy5
	SagMF1gMYzko4J1UjQaS6ZuEqrRQTfC9kl1+EkymKylPB0UzMseTVdXJ4op+9QNKJB+5gCDvFuk
	vaeErYaeHLibGq4MI1OLpaGg=
X-Received: by 2002:a05:693c:3005:b0:2c4:ec89:bdb with SMTP id
 5a478bee46e88-2cbf96f8978mr2292338eec.2.1775431345170; Sun, 05 Apr 2026
 16:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404212831.78971-1-jhubbard@nvidia.com> <20260404212831.78971-4-jhubbard@nvidia.com>
 <CANiq72nToewesUCDJS=WBKRvCO-obzixW9+D1vH6s9mJXUeO1Q@mail.gmail.com> <DHKPPLI3TUBA.396C00D1NDPUQ@garyguo.net>
In-Reply-To: <DHKPPLI3TUBA.396C00D1NDPUQ@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 01:22:12 +0200
X-Gm-Features: AQROBzAeEB_-c-5TuRNgQ9lek-30x7a6jQDhD506ToKfWMKdcdFrTs-PT9rLyi8
Message-ID: <CANiq72nEVgRZ736=cerzQh5aAO=_JC0JD=_esZAxXvT=Nhusnw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: ptr: allow clippy::incompatible_msrv for slice_ptr_len
To: Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 5, 2026 at 12:09=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I feel like this lint is hurting us rather than helping. Perhaps it's wor=
th
> disabling it globally.

Yeah, we can do that. The `msrv` is still useful to have for other
lints, so I kept it.

Cheers,
Miguel

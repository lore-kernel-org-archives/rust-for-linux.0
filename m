Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA85358382
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 20:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174025; cv=pass; b=lYpsNOEitYbkkEznO7dGGsQDAExJmBlAZdGIb1+0lREG3PAn7QJnolAtKh1CDwiAHf4wN3fLt1IxyWCHfjgrvbsAAC5K2RT0H9t3vy0MMq0mpocxWdDdr5yTrMRd2/jsjilrzzLZj8kTxIARJzSA6As3gOcX0uWIDGMCIkzxk2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174025; c=relaxed/simple;
	bh=YjKe1ThZNbm+uW5oDOjlD7cWbLREX1r9cful0Ph0+dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n97lIF9N72LQPCPOG4aSG5lSivQQIuB6CAW8lyuEUzb+reNhHYv9etOSG7wVcC1Zi9pf2BuQM477EC1cSrbfydpsY/qio241GeacwWKN2uP4HkH8nDT2EaeJx3MjzRcHCVBmP+XPEC0icTuDpJwm7ypt+w38MyBE0cf/Jxlddog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ8q8kBu; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ8q8kBu"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a13bd862e0so900453e87.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 13:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773174023; cv=none;
        d=google.com; s=arc-20240605;
        b=OhSh5PrfooWtXnmNsseUNMthGzf4PcJ1ZmjlWUPCCl8HBY+XMZGZZNcaXmVTKhe/iQ
         Zonteeo6m5tZq62+UHJNCAnYlgbMUv9KAqaWsIuzi2ng4w7FWQOyXRBZXHUm93ENdlcO
         fXBr2gfXLoiHtVz/b1+sYvIHY+ypD5VorXcdz9Rbak56ooEIkX/DdjxyLA/Yb3CnGlC9
         Q7LXDWxyVmEguz4FawLY4q3hK+vtRxD0IcAPOlL4IctN9DhMPiGNIk11e7Zn1cJ2cyQE
         KOlSuGaQv+hiasSRsWFgli3/eZ5IUe5DGmcVrMWoYSgumcV4o6uuP05p1s+8xkFqM7vJ
         AAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ae6+3cAEYojxzOrk3u2Yijz8ayAjeD9LfoUXEasC/LE=;
        fh=SFc5KndYggq7rmqGdiTChxASX41wSJ8S3bpMRHI6GoM=;
        b=NFAeM3GmXK5SVknyD2fFdDTkDvmzOO6OLbBWwobstMk0HIIy1tzNrFqlpCEdnM4Af3
         KfS2gIJVZoimbxcasOYJw2X/9adW9ZYT2TSdh0lda1RKHcfc9jH1zl2bRnj3HqTqgo0E
         BvRDbdpS3pRGu28VslVcMgSaCT/a5To/dpyrrGk/hjiqBtVGMiCDfdM6ri5y17Y27yjo
         Zidonhx3eY5/wWfScrneLt1JpUOCqzOPzSKZjpUfvjXcKvbbIrmoNh66iPS0t8Jf5GKX
         /Vzyjc5nN0uIXN3jG/8iKqExlT6z3fqwM8EaEGze3v5LwHBQxpGQU13aq/8xm6LCE/DM
         jQTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773174023; x=1773778823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ae6+3cAEYojxzOrk3u2Yijz8ayAjeD9LfoUXEasC/LE=;
        b=DJ8q8kBum+aenGGnYD4iHbaSvnrDWEdhW+xJNWnvjf5MhLMt0ui5dnB8VsFsSryNJp
         z67al7HdB9cGXBd0uuNuz+6GxSQeVfwp3n3lW9pt4tsovGd2/iYejzy/3MUJLOSkovjD
         afGRs3cwfZckAZDOH0fOvdYEIQHMCX98shyKRCM7+/cv6pZY7et7RoeKfRDXFxceIoGU
         /nVb7P8vibvHcN9OjdSd996qj3DK3BRW+NvCllZqVSePyJ35hgmcyDcYIMMEe8gfV0gx
         CQrYpgCLnMAROKc9sYHrwo8exKbmm6kfg+7bx8k7Pzj+32daIj1QZaU9cpvLjBgcNhsi
         I/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174023; x=1773778823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ae6+3cAEYojxzOrk3u2Yijz8ayAjeD9LfoUXEasC/LE=;
        b=TnMjLXNDec+tjQm0zTuH+/AJBZFwbGmfwz8y6eyruicp6ICcL1GY9k/RsZtCiXmjtn
         nBfnpFCdVTlhqIzeXig//ILeP02U7Y8IgYQxZkOnzwryf2jSINHG9SU/kjsxQ/8jcBcj
         mNLRQVYOjT9C/WxBF60pkwN5Cz7EA5zlkjciaDbFja3aVcj9BSkLEulnBEip07Td+uIQ
         LGL4B6g/1nyUw7QWj4jCZl4TSBOtOhairZqaGOFhD0UFWejvgXmorr2cDRFgjPVkcquI
         277hbK3pLF8decrU7cplwh5J2Ob9hBp6be8SDiAkBwFjD+xDlhGlfl3V5VV+KBg2Yg/3
         D9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUsGknjuSqSdj2KkRSrQqaXndzAPaAAykuZ4FgYaNC4lb9eamTMVsNQNKVHl97oUZTRebWaxIUS1juXp9az8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKph7OpHyde8NQlEPBZeF16jVE+c0ElfF+9nhxEGJCrEsMvu2v
	fjABu27Ykm3qbZJ1YiovXwTjPi9eBKfoVMYisP6eh8fHHXGV765PbH3QgCJVQiMgiFB2Riz63sQ
	XASYgVubEakTVGepLK2w0szs/e6X3MxQ=
X-Gm-Gg: ATEYQzwBpaD8pyxOqb26OPD4ih84UZpwG/S1UOVqQjzQOvQJToF4hfmHJCxB/Um5XPC
	kvyds3gY5RHlw/QnNS/q4K9xXiBdqn6RPFtowCQaSB2C/JA6O7gWmEca7vQwMsWpplRs6b3IAx1
	XLhuWkz6OwqNY7bcIR/+130MezU7ZDvHaEjVdaZy11tiO1A0DhpbHH7uHQitKVYjeY2JnJ6m8SL
	LiVf3BQwyUQc2G8gxukV7kxRtnBzQwga6NAkE2dM2gi6r7Vuo/ROZpYCx6dkxayCRHtSGV6YzFJ
	4PQx2DEmdzDizGoPDzr/FGT2JO3OiRqIGWzjuPws5i7uF1rn885zW3TWX1p3aqQbJsyAW2mx5Wk
	q6mQrSGAzoV/bGcIE307AmiA=
X-Received: by 2002:a2e:a104:0:b0:38a:539b:f50 with SMTP id
 38308e7fff4ca-38a67d64e54mr115011fa.2.1773174022458; Tue, 10 Mar 2026
 13:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310023145.120037-1-jhubbard@nvidia.com> <20260310023145.120037-2-jhubbard@nvidia.com>
 <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
In-Reply-To: <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 21:20:03 +0100
X-Gm-Features: AaiRm5327nMmj-g0OuISMWSs8yOnbci-4vHXYIPEgZH-lmA0Mup1JHBFtRcDdiA
Message-ID: <CANiq72k45b+famoLjUyk+UFnZbEONLNSgiwDDQCgUoV6U2m1uQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 2:51=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Regarding adding the constants or not, I am ambivalent. On one hand, I
> see the pain of repeating it; on the other hand, adding these only
> works for particular values (i.e. we still need the safe casts around
> anyway for other values).

I see both Daniel and Danilo would like to have them, so that is a
strong indicator we likely want them. Thanks both for the replies!

Whether we go for `u64::` or not, please feel free to add:

  Acked-by: Miguel Ojeda <ojeda@kernel.org>

Either way, please consider the suggestion about using `const fn` in
the definitions here -- or if you prefer, we can put it as a "good
first issue" for a separate future improvement.

Thanks!

Cheers,
Miguel

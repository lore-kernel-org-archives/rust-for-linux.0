Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00363191BD
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 21:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776376481; cv=pass; b=LONTVXmsMTl2aDKk/ArdW0XYukD7PPr1h6KpFj+4A4uqK+lFMlcevTCtGafEQc4/cRXDiHyVdoIjkpkiTjTtgNhPT/YTl58/wS3m4APb1CYwPGOXZ2pNiX+x+KBK/MH8z9DnWRn9H0c9Oz5VN/gmVNCp5/RD1Qo6T7wGyvI+anY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776376481; c=relaxed/simple;
	bh=17pPcPgXgxDyr4Vx4IWg1VDKFlJ+ntuKpXQMKn/dWSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbhf3LZ7iY/ol3yAUKosggifjMgF4GrDb+wVBQhrMjB0RTlKDGl/ARNXNossAFym1wIno7aiqeZiCiNU4snqVw25nNHzXidm4KvlKcTaZSYn2heiotSGu7BlVCmTzcZmjnGY6h0QyxjG0cbyop/wdsCj0+X/exFC3qqd0Pix1gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q6NcH3kk; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q6NcH3kk"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66ba6d3dab3so3836a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 14:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776376478; cv=none;
        d=google.com; s=arc-20240605;
        b=eWffenyF8qBc8K5VfaTLKSEvK54cTDCMVO4ToxYgIRPZPiei5Vp2x359usoSC8RqcU
         aXGwj1yryOQzQTgG/FSLmI1sz3lAW7BtB0V6VEpenMbmmpYHCBJKNov+46h/A7xtnzKi
         Xn6BPedfhtBEYTy2nFaLtIVSgQdWIEU7ISAxzKy5EzYcqeaUB4ccXqDK9gMFVokxZbui
         b7u14wE9tVZuLJf1JPy8o484wRiPEKdCfcRjPAlaITiOOQL3lejiWL1iGA3f9mrANo3P
         HkgoiYYb3Jm+o9WFcIjP5dzUE0cL6SkjqenFMuDGu9So5FrPOavImAFVNcXShOra9xy6
         mXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QqIoomE1yKiiwg+MicNqQNuWN7E/azhqG3c31W0K1QY=;
        fh=Y92U8jUkDx56AyLWV6qPQ4zvbSBwlktn1OtwLungfBg=;
        b=IATUNUOFkUxLa1dL4QwLfBSfi8n9iK69f9GOpy9klLVwJzDEPswadI33G8NTAHVjnl
         5KkFon9l5ROTDcNJK3idSjXfcR5vcTmkAde0ifQMoXpq5JVZJ9ixr0ePL8oGgMmE/Zqa
         m+THQ7mqo+G0NlfCj35+8n9Yn1H2OW2QDN/o+T6epaoT3i4m1/hPviIcb32IIvuIM1Xu
         pH8p5XGTQMSL4cYy4T0Xvnr3daPy17v1s0TUMzxdAI1jOwAH6YN0Na8XI6GPDs8YPxn8
         oAEnudeBkzwfwfMRYoyYZc6ilwj+9kt9P3felSzpiXswqXxzH6PJTdT4qEBdfGA64bTL
         1qnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776376478; x=1776981278; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QqIoomE1yKiiwg+MicNqQNuWN7E/azhqG3c31W0K1QY=;
        b=Q6NcH3kkNeD9s4ILSHGZWJAIdMAjDV/7burOLar6MojIGfUybyQZi6LalRy088GuZp
         khcNqiwdlcKqNKE2mxnDvCVBIb3nCrr9oXzaKho97x8WIUzIlZAA4e9Y6GXKSkH006/i
         EzB9idGhVB59Y+j07a4gRGxWzVLVTx+VWfzXUBovGDf8MNiBYXUD6KRPJk0/EEjdDc3X
         KchTrkZsyaNBRf5/94voWnsNLrqOGib6ttU2Y81sCRR+C5buG+7UpdEwsmLKP1tGF2xd
         mnZP+mkC9N+u2Mcn5qY2hKO8cnbZi51dYuPcq8BeJdu7VjXNotJYfIW2bNTLlnwoOcpT
         LhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776376478; x=1776981278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqIoomE1yKiiwg+MicNqQNuWN7E/azhqG3c31W0K1QY=;
        b=i5lgpGnN676VqAm1+ypgvg7j7UOz0UTgWLo6CNJbrBob47JPjXf4TQVtieWbH+NQiD
         ZMum0nDjU3kSsO2MCIwthzRji/WkZ4KlSv+nOwwx2nkuhB6ycDZ9TW5+BQzrJutlDNYP
         mBsfrlcabGur/qMMgFQM+cHjMyGYGNNaKFvkY5kpl0fl0uBk7mCzrexjydgoiRUbwvhV
         pHKz3s28s37S7O/GfLcn3eGpa41y38q26Ga4vTOxlrtjzW9LdDrZOfuJpS0/P8TEB9AS
         kZ6tyJmEzyBq9OrBUxDYRdt8R2MdknY9Dj0FqIGpFBPYYtcEWv2xDO0TTXBaydPz+nED
         /RHw==
X-Forwarded-Encrypted: i=1; AFNElJ+coTuFK1+M6wtDDbZSnRlTsYQqbNxFgyTrefi796AZrlDl2IsUIQPDJnnv5C8YcvOKvZDX8uOfkQ09MA/zwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzulpCKjd6ZuTfL5bM8gUyZXxgfjbewZOc0oWM9kVPKfWHPuu7v
	Q7cUE9escdhlft0Hmyi7fq74vZDF9g9+naPkD0NDiG7jLG295UyJmLfiFALsNjRn3k7wEZJkclI
	mrEDESBhEgWF0bzuAHCy80R5Ih/+3145CRyx3ZuSp
X-Gm-Gg: AeBDietO3kOPJL5B99UDDYyNSv6cNKNtPTfy33nxRbQC2Zb/edV/4XT6aBVcWNmo3Io
	IEfIiDOBMJejs0adDOvzuQQIUXL/OCkfeywjiBV8/xeugGCII0DHrgGPciW5o5Fp8wWW5Nr273d
	UkOxLUrRZHXZyj0HLIUFFSZrunVVbbCWYc8tcyGoTFEqjERq6X2joyYtRdz7H8pOHbza7cmRtPN
	eGKKBvIj4TB2qGVSQndS7zBV2Fs6D4XTVZZ76IUkag/1GEgQ8iqAEbk8JQRtviRrsqPKN+yB+Eb
	SjpbD/QDBUDvdPdBbC1kuoFskD3SambSdlhSWR+5oAJwdQLbF4xPg3UB67w=
X-Received: by 2002:a05:6402:461b:10b0:66f:f414:7c21 with SMTP id
 4fb4d7f45d1cf-672c07d1e93mr2732a12.12.1776376477750; Thu, 16 Apr 2026
 14:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415-binder-netlink-v3-0-84be9ba63ee2@google.com>
 <20260415-binder-netlink-v3-1-84be9ba63ee2@google.com> <CAGSQo03b4tTQW=bXiRrmjvF8NympD_dcJX=2jwPdMmguXLfifQ@mail.gmail.com>
 <845b36ba-7b3a-41f2-acb2-b284f253e2ca@lunn.ch>
In-Reply-To: <845b36ba-7b3a-41f2-acb2-b284f253e2ca@lunn.ch>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 16 Apr 2026 14:54:25 -0700
X-Gm-Features: AQROBzB20J3vX4qdtl7SVpcpXlie5DrozpgNn37YBFnMFgsik0yvBybZBJqMXW8
Message-ID: <CAGSQo03hxp0PSMK0rCvMKnpUCnktwL09ao2NSvmQLHjTsfBWaw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: netlink: add raw netlink abstraction
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> So i would agree with you, freeing it on error somewhere within
> genlmsg_multicast() would make sense.
>
>         Andrew

If this should be fixed separately, then for the rust part:

Reviewed-by: Matthew Maurer <mmaurer@google.com>

with the caveat that documentation is added to the two `const_new`
functions to indicate that they are expected to panic on error, and
should only be used at const time.

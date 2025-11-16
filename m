Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CAE23E346
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 23:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763337157; cv=none; b=NlQkfkKgslQAnOpWJw2n9P3FtdkYsaI9H5oLyEHCqgfOtKBKJGgDVDCY1ToKYlrnxqd7YRmzAm2/VU1HHuoPA3dv8LZt1KbEwJJH8sfovrmg9lHEAoSv9XB9XNJgdyDoDkMHFBLeE+fBuYqu4A/itmfAt6TR0RQq7IHYy66y0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763337157; c=relaxed/simple;
	bh=FpQG44YCiDoDEKjDbtFB1mxhp/Sh4UsuhIkn68oXA4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bckKcA4uYH97+gdi3eZ7peJu6OqEi1tqbzs9WUV3gyvPDQCTc11zW2gdR7bjuM715gfpiFztn2q6VbyeRNIq8PKYzJvKDvzsbiQFfxIEK6cOZIqxI71uZBzjGJ3xvSWOE9jc3GH2pghRVB3txOpZfNKBMHKNp/FLiqhbxKyF+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdweU4ij; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdweU4ij"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297cf964774so6421735ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 15:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763337155; x=1763941955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knEPjdoRUKiLfnKO7GGFzIEEDEiEdL0akD0BsikWeWM=;
        b=JdweU4ijx6R29LhGY+MBds5EZIif60Z1mfdcvCDIycoE8XTNSk+r/IbLinBrXby8dz
         ZwkdkYZJmFNd+LUcxzH/HpU/bHx22/ax2Oibb+SnkdY0LZji+Yz0xFexlM2GF6lKagH6
         ih+GbDtbtb/3XdOif0bH1mY8QVZvUgz9CaZVpMbEkyUSnn0Jvejkpl6RXZ/7ZH4Pf6u6
         5uH2PHpcYrE5wMCKi7WKY5dT9qswWMjbPcf+cbE26+9eNeq2a5IUnWg8HCqDyIoXut28
         9zODW0+rXnigLFOyjybL01PXGMF25A8HA+wPfTQchSgU+UyKDh+//nSoL7Tpbav9NsZe
         ZZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763337155; x=1763941955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=knEPjdoRUKiLfnKO7GGFzIEEDEiEdL0akD0BsikWeWM=;
        b=JR8QGSBaABq3JFNw4QNoOpU9BdrTN6onwOyyT1dcv9RS68UcRiEWXmxuRphw4dpy6U
         0tC6WqCIKTpEDNcGwCJTJ9jMBCAJqM/jAX8eHfpbUMHGNhxctcZeDY7AHexrOxtIoV9H
         T7nfTJrJoHeALJM042afNymQ4uvHjA5W20s+yDHp81uNTKaett4ybTzOIiyO9miJSC4/
         jfBdi7M4+1Jw8SWlO4iPkEFVChh+u5ZSOQv7gL9qcojk4b/+xIiCIaTd/8kvW3jouTyD
         Zu36IHjUxZoY31297NS01F33U+J2j1pS9zv4LpIAO13rvWyUMa7lmSVxD4JNqhLqz4JK
         ilDA==
X-Forwarded-Encrypted: i=1; AJvYcCWkHHbn3gFkY6R07D/4UJi1nS7lwSRZV4AfHiUgTQ8gVHlyh/Z1U1i0n4App8IpUrVzCLxCB7CZMS31+5E2Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpKyFPbpxcB5cz08+evtIvAACytinrQ6ueSqffd+DffLXUpI/
	DTJ4Xy8IzBjcY+P1+SASpK46xTgwAkVrEWNF16LgyKpvhszo9Rkd5cUlph4TH25L5c8gWnBC0vl
	n43x8fnGaW5TOeRuX8/PRgsgGa6tuEsE=
X-Gm-Gg: ASbGnctruNIGISO05aDOVXoBDe15E5JwGedkXUntmlTGfpF8qggVhbMc57VQ3/xa4bK
	TMLrLmQoLAceL4IXHx3CbfrVfiJKvA4BXNXdRR/sLNe1/350RcmCePGFFBlayWw+QfHNec/iHLm
	LEiRnj0u0/UVSfrsiWxlhYk9v/qS+0x0Nr1SABuwe8DySHpDXvIgvxASlz8NZJcoE6QgStCmXcA
	hh4h41qW764YZgbd6+CrgCtWW8RhI57lPO94OGhbg7b2/nxee0pkwQEcxqD1k42NeP3Eiq82dmw
	JHNKnJfnI7spnviGzdS6lestMFpucrKvs/y7Hqka68WsGrxFBWpRHrNssRaiUhAHdUOc+6G2V5u
	gNic=
X-Google-Smtp-Source: AGHT+IEPP5GQJGpkQvAHm/n2E8E4oeg3mkqFHU5A9snFx2FAUhtXE2SCjstCrw+QoGTLtYsyGouZt0iiD1TQn51UTAY=
X-Received: by 2002:a05:7022:248e:b0:119:e56b:46ba with SMTP id
 a92af1059eb24-11b493eca20mr3590028c88.4.1763337155289; Sun, 16 Nov 2025
 15:52:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113-core-cstr-cstrings-v3-0-411b34002774@gmail.com>
 <20251113-core-cstr-cstrings-v3-4-411b34002774@gmail.com> <CANiq72mBfKwXEbyaw=pBAw37d7gCLVJqHcLcd6H7vNKey1UXfA@mail.gmail.com>
In-Reply-To: <CANiq72mBfKwXEbyaw=pBAw37d7gCLVJqHcLcd6H7vNKey1UXfA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 00:52:22 +0100
X-Gm-Features: AWmQ_bl-gNkTicpVObYCtSZ3F4-M6vnWSG4nKwGWGeOhtqUYQwGBsAi9iRsUdj4
Message-ID: <CANiq72nQhR2iToP8ZauwAjM2p1OWEK1G5cjsEXqs=91s7jOxMQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] rust: sync: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 12:09=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> This requires the next commit plus it needs callers of `new_spinlock!`
> in Binder to be fixed at the same time.

Actually, do we even want callers to have to specify `c`?

For instance, in the `module!` macro we originally had `b`, and
removed it for simplicity of callers:

    b13c9880f909 ("rust: macros: take string literals in `module!`")

Cheers,
Miguel

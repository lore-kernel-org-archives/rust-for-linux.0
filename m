Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D780D48A8C2
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587911; cv=pass; b=SIMHZ++Z+dddNYNamdLUlJr3WjhuG7Iu3OqyTTM94KmDvgqiGjsSyWZpTXA3b6WteLRKYP7FodvE9e4JkaS5gfRV9nWhiuw0jZxAro3W8ps6I4YLBXb9q1zFfXK6Cc3z+LJmonaTtdJEQRSCjJV40GeM5LwLZIyLulB5hj/yVo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587911; c=relaxed/simple;
	bh=8bjgfdeQqI2IU+pfMdd1CQBiBYTPKG3YxVTrgK+MF0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGkBnkKHGF8oaVnAVOBk0Pzi7HCJ0YdUbMIlcEaoFklKcACEhUH2GVzLviTa56mRh0dGIiGE7faHpPNyTHgFsKfQ8ld6cGGE09LxA5aUrKyI45rhgatut4D+SPe8UQIPCh3vpapJbxJMXCUJMmOAElEmN+EGPKPIyVQI4LbeX6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7lRS1yu; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7lRS1yu"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343697ad877so106579eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 02:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790587909; cv=none;
        d=google.com; s=arc-20260327;
        b=GkbUWKKHDQwFh+bZdJhOV30h0bu/QF6jKa9V3QpivWRXKgzMwk2KQvf8I+ZEptm+1D
         q0BDIlmJromj9hPfbVOvYkR92KVt0x+RUc+F+AuvZzoKgDAVB06yljEi5hBXeUahNngG
         0g1hspwffFtl48RNE087US1/B/FgdpZOpFU8ZOp/reEBuHGEbKWD6scR1qEkDF6hrTNe
         ez1B29ZYwjOqGmgF3yAV+po2ojnCwRRg6DoeSO5BJjTqaGSCTaKE0rGYV5bPOHwp2G+8
         HAHRJKJeXD5StvoEHyZvmCFg2m90oicej/BJ8MT5XsSPnv4VdxOHwB2Hs8Gu8uDs0dmP
         z6Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JatWv86M5tAY+wc+iIH3agFbdWx7YD2AHOeP9v9NLF0=;
        fh=tsyHT6T31oIZyT7+sYf4bP0Pyd8RLnPx2jSHjrwYyY0=;
        b=naoL5B8FHd3zUkV4WvW+C4Oph2G6gQ6fFQl6Jk3bvsAjDDpFMTUy7WkHZG92ByiRA6
         zyehxwaT9E+zYRCXfR2grS+qEWDtgx2f+JTll7PiICStNsUf2vd5hiPwX+x4naGL7yDS
         vueu0PlgZAWiCj49Ns36YQmwi0if0MZS3Gla223unQu9aL05ZyoS9T8k4sGGg0TQ5G/l
         8vZ1yEkaSl2YIwHPjLCWgb1NEvQRfXuJ5GqQQG0qUmhu1z34jmFUD6aUfoAHTfJvaGvp
         ItF7Efn2tw8n2uSD6IZ3rNPvmG1YcCMCybhrwS+5vk2x04V7G21+yvxDoFRk6JIzv4kT
         xcGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790587909; x=1791192709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JatWv86M5tAY+wc+iIH3agFbdWx7YD2AHOeP9v9NLF0=;
        b=h7lRS1yug0s0CyXl1DG0U/dn/Fo1Wite3QMYnhPaWxf158B/Rh2Wue2Sj6ivRtfAGk
         NHjghB8yjwBWlWzEU9e5afBIB4A1gKHybgiNbLXC1LTNKH68C9dEV4ubC5X1nP0Z+dxJ
         ogIGtPMR65VIxo85lKvEDhh5IC1ZzH7JCnXVkRr77Uc67HG4JqV7oseCTSNgOGYP5azD
         3u+CpNSowIVMFo4c+U/TTmuTtiojPQSFJcgQwKYTo3Xe8IO2dvFAh6M/ehUXTnwahDij
         LqwCAQ9nBWu50lvyBXCAZF2BR7WnLR5cdnPc/3osFDNSDMI4ikw5dboNFNRR6UNMZKm3
         SfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790587909; x=1791192709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JatWv86M5tAY+wc+iIH3agFbdWx7YD2AHOeP9v9NLF0=;
        b=GRnspes2jiCGH55Ug1LrvzfHHiVf7FUTa9gISkLDKEL1A5yaVXau03dUtrCB4PDXAx
         4HC31sGldci153SS3OL1Mj0pS52HMyp1YaPzA/LqI42pDMZPqUJBFMZPhmQafC0aWtrS
         aR15Y6jO8+RO+5cqNeOwEldP8AlClGfyNTvvqSulH0lJc9wpT06Y1bKikMgxQRL5025k
         oE8qta1+fxYyDSWRCmrQ3mmyQTg1U5DZT1zxmQyiQn1uq5KxQg17zSjsa7iL9O1pyAML
         W15SP/YgqqVEAMg3jQJZfOJCK61o86xM9YQYF8OET1UtHHhA0p4Dn5rPyn65Tw+FXl+f
         3D+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgVxzsGyNcC1tPJq81NrIGBkLzaFXGyY0kn0xRZ3niagd47CQhvczKKwzjlVhRrVTpLvY2ngyBKANZPpc6eA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIgeIeZ9ekLm4vJeFVQhE3qyxInsxW3/W0OwAm3hqsHMXmXOtj8
	I//tEjr32opEREcXaOwebMSYd0eHbin9VrkZ3RXOC2xXz/9ed+hF6O4AFUmsEqOV0wHeZxqDsRm
	4R/7n6BcI1ew8OZsokVV7rtGRXPYTMKw=
X-Gm-Gg: AYBFou2v45YwObTIJRDVvc+bS00OWEGXGiJL+RrO7NGG7i4NDTAVfiFmHam1FD+eg/C
	uU4enhXN0L8/vwp15z6HiRzo82UemkKH54DiuRrtfS2Pb5TXydRvj2zzJBisPYpwS+bjODsb2Jm
	ThYiwp5tvvlul/F57PGgP/AgiJEaT0so7ouEiOh90zoqYJVMpS+ysOg5eq88QNFGEhN/XH2Nbrl
	0tl61PzkkGuLZbBX5akEPxiQfdwSCHve617piMZmQUhFvpPZMOL1pxWwSgPCR/t1ASI/xbMROro
	nKRtYbPFcU+zZSdjTt6+rrj2x6MVPN48FqveD2v7O1yfsJN7nVzLiT1/lu4UheOn6LquDNVi3BL
	yFJ5JVp2cGyBG8+kTOShpSt49UJF+iZ7f3bgJyoEMHLuwD9DNzSEr//8tnGYOWFhzp15wZGhvwr
	ioQ3A6FIJBwWGcDKpA6KEjbD6ikkMViNxjTyQ4Z3H+4beV4AxY26g=
X-Received: by 2002:a05:7301:4d08:b0:343:fdea:9a0 with SMTP id
 5a478bee46e88-343fdea25bemr10256179eec.2.1790587908057; Mon, 28 Sep 2026
 02:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921115708.4009754-1-gary@kernel.org>
In-Reply-To: <20260921115708.4009754-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Sep 2026 11:31:35 +0200
X-Gm-Features: AclHuK_5UnWgzOwmLK9oqngFyj2kXH-LQPWosQXOUVyycWaI9jdAOOJ-IBnfSXI
Message-ID: <CANiq72nR-QzR3zOiV=RL4je4U8m_hCsPhOD3SxAcjc+4VCrMsw@mail.gmail.com>
Subject: Re: [PATCH] rust: proc-macro2: enable `proc_macro_span` feature
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 1:57=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> Miguel, please let me know if you're okay with the proc-macro2
> modification.
>
> I'd like to take this via pin-init-next if possible.

If you think the diagnostics improvements are worth it, then I guess
it is fine. The ones in the commit message do not seem like a big
deal, but I assume the upcoming ones you mention in pin-init are
bigger improvements?

(I would also probably had shown the improved example outputs in the
commit message for comparison; and especially one of the upcoming ones
if those are more important to get right)

If so, then please feel free to pick it up, thanks! The change itself
looks good.

Link: https://github.com/rust-lang/rust/issues/54725

I would also wrap the `README.md` like

  identifiers, to remove the `unicode-ident` dependency, and to build
  with 1.85 with nightly features enabled.

to keep it like the previous lines.

Nit: "a overall" -> "an overall"

Cheers,
Miguel

Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3A0189BB1
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 19:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620420; cv=none; b=WFoL/iRJ7l6Xtw6Wcg9RN66iJaNVlCuY6cyyTdNGllB2jVb0XUmegCm5KJbD+rofXYdgb/P8kIHz7S+4gnqoQX1IknwTnG8VUsOkI98NYxyal4/J+6rhw/SaYXP09F8vtXREBum8qE0kjrqDwj5pYDDRZZlXQbvSU1nnIC5AJu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620420; c=relaxed/simple;
	bh=8hAoGMUsCM3LJT57hzIzWU4Ki/zGUNf2SwDzDSIPY5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSl1R3shkiA4yhQIZ3iYS1RTUxIx2WtW/du1Is9nlaBrCW5LD6ZQL3ruEBNcikzMgBOlgg2MtRSN4RnnY2oBhDXtFEuf/AGmqy63CXsHLZdZlaXR4d0IC3UxhnQIkM1hC434roQ02/8HYAli6Qx9MyRB+X4hb1ryR+3SWXY8JiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHMC2IkB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHMC2IkB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2240ff0bd6eso250675ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Apr 2025 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743620415; x=1744225215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrEsERCzuelg15fQP68SR3mhGJYEUUdFA9cIk3RVLzY=;
        b=NHMC2IkBgpGYpTV8TIlUBukUHfktKjXeD0xIKrnqyHGf96/CSJjrADg9UjQmXifIk/
         g58e+mUiK3mDhD24Oha0EIoEE7Y6z4V33uNmjksafOrKMaqsoN2CNNr+Y/3yCcSnVFTv
         9heW/ohZLIcB/pu+hvUuveDxixvReTautVFmD19h0uCSgdLbxtlzhbtRFrQztRejR0uZ
         ItlHxYog6kSwJ3RrR/IzUYuNA+Sn3Mjj0e3E1+232npB091DCbquBDIYjaZY1OqmgPXb
         zwBJYirQ5VC9koYHAbk6nKfpx1kCSFRD/3nJjMjxNUgJeAGofJJZIYpqLUyB4JnGAGYB
         mRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743620415; x=1744225215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrEsERCzuelg15fQP68SR3mhGJYEUUdFA9cIk3RVLzY=;
        b=A9Reqvo5FThf5+hh5Vh/LN22JaU2ULC5N518XjtLGglhl1NiV0cmzE7Q/MrUPDD+L1
         EZOxry3kOVlc43pqA0VHoG2r0JKgs6MySDGkPDU5S8iTnJhwO3kUoaqZqVmvbuGUnPHq
         LZadISk/FCz5uuzBsuMH4vKe2lSsn7Ddg6BHeBzoQo+r0MSv/V8PHX/pDxG0DZR/pFgw
         kRLVvsMtSjfozY37d+OIpsDkcNp6VG+ikdCAOedkGin0IKromC2DiyfP4cyKX+4NqR//
         Q5lx2L0DHvrV37JMg60slP6uup7dKJLRSB9E89hBloB1/HkWu6Te8z/1Qw/IO/WjQhio
         mNng==
X-Forwarded-Encrypted: i=1; AJvYcCWNB7CtAMu15fFtaCSGeS4GlkXnDTNJHCUSTM/voAhgNBRZQm4B4H8p5zCTA55WaKKsJVZo6WHtM/qX8eTogQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWw0Fjbx6GXpCb6HvggJrXXdi8jxTWBSN9ErVhy7IhKtgPERaz
	woN9uoWXLyXI4fhrZXRFIs7Ia/XQqJkiLGWro217wBARdBE2E1lTX7nB5Q9u9lzCXbiQSzlrl8I
	EBelwadUmA75jw6Tm1SkOZIYb/xM=
X-Gm-Gg: ASbGncsn2wjXv1MShg2MTwxIft/TYq+Qc/85iyoiAuO/lbgBE8yFkm+mJv8/CcOQcOW
	ecGct4ES6hELUIXCEL40DG+dkdeK+M1eKD+EJeN2pnXIhxLwnS3radJL3Kju9W/FmBxf7Pm88Zd
	Qg54o7YfBf1vwMg9luVxyq4gmZ
X-Google-Smtp-Source: AGHT+IGr4wLpMi7ZL1e5sbbY0aSGPq+bXdxqBttBkJ7o1TfjEAb9uvJCjV5WA5eUHp7d52pu9gJDBYxBcU8fTPbgZqA=
X-Received: by 2002:a17:902:d4c8:b0:224:e0e:e08b with SMTP id
 d9443c01a7336-2295ea40f40mr33277025ad.0.1743620414720; Wed, 02 Apr 2025
 12:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87iknmv1xs.fsf@metaspace.dk>
In-Reply-To: <87iknmv1xs.fsf@metaspace.dk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Apr 2025 21:00:02 +0200
X-Gm-Features: AQ5f1JoBdJiusU_SIfZjQtWy6BEktiUDwPs4gwAAEm28V0k8mOE9f6_EjMoxdiM
Message-ID: <CANiq72=20SyjyPCZ7maPMGc-vK1KPgX6iTjntPs+JKqVHqZhDA@mail.gmail.com>
Subject: Re: ABI stability and Rust
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Daniel Wagner <wagi@kernel.org>, Boqun Feng <abstractionfbq@gmail.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 8:44=E2=80=AFPM Andreas Hindborg <nmi@metaspace.dk> =
wrote:
>
> a) Ship a blessed toolchain for each kernel image you ship. Users
>    building out-of-tree modules must use this toolchain.

Indeed, this is the way at the moment.

> b) If users cannot use the blessed toolchain, they must link all rust
>    code into their module and ensure no rust symbols in vmlinux are calle=
d.

We currently don't support this. We could perhaps support it after
some other planned build system changes land, but I wouldn't recommend
planning anything based on it at the moment.

> Outside of those options, I don't think there are any other solutions. I
> would not hedge my bets on rustc getting ABI stability, ever.

There are some related efforts, like crABI, but yeah, I wouldn't
recommend assuming it will ever happen. If it does, and even if we can
use it for the kernel, it would be a long-term thing.

Cheers,
Miguel

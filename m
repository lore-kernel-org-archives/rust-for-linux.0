Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56330C368
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 06:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362165; cv=none; b=iiHEechARqiWxIuoSdpvMSNu4o47Vja5eU4rMKDexoaQbqwSm3c8X0NOkOhtnrl1CKZdNtCcn6fbiWxbFvKiHHIXsBlzB4D14+TIF82Jr/ML3TYEyHgU+ASY8lo4Xs9M3aQkdax9YrjwUSrSR/8aFrQrcIgSpXG/iu9CyzFK9sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362165; c=relaxed/simple;
	bh=cThcEII4ZNy2C7iDl8hVCYm+Ag9qKrzQcdnzO6KXSUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXIKvk9FL+RimUfVb61ZH6OwFZetIB//AgwJ+CqalcQlSgNuWevGZryjae7HtmEpYZfPfKpXGYhpZiEGPKolWt8gwGqsmf3iWmBQBXJcVQFEydVo5XdaJ1+8VpHsFtldu40yuM0xgu2/zDw9CRb/mY6dum3l0nOu8R7yLA6GWIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1EZBzTm; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1EZBzTm"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b9a2e3c4afcso338505a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 22:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763362164; x=1763966964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cThcEII4ZNy2C7iDl8hVCYm+Ag9qKrzQcdnzO6KXSUI=;
        b=G1EZBzTmP6gnS4hLXF0Kk4fD6Ob9Hx3vGG5/Xf2+JJMcOWRO4EC36ZT98A7k+frxYa
         hI0LXnxXPlBhxHXxdAP1ioFkzr7VL0oTiATgxtGmxn34h0n0ng+PUaQwony0lYD+qqA+
         WsxP9/c2hjtRT/uKQJfK6P9xloP40NP8xoCG8qZ3wIxr8bG+whJZEJDRPLX54U3EvETz
         xvATrJmlkZkhFauhNzqXjg+D3Pw0IcerbH9FMfIemThTrCD5UDhZ8cBrqmnL6e4Qsi/S
         AhlbwDA1HSAsVDfI41lF1dwgYFWYF4vT2jP90c+ksND0P+9YJJEYmqH4gxsxtvSokMh0
         RqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763362164; x=1763966964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cThcEII4ZNy2C7iDl8hVCYm+Ag9qKrzQcdnzO6KXSUI=;
        b=eezdGcHNjUgrL0ZopX/pJeUzupA8D1haZEbBDb28kjLZknInxc2evX3FyMbf4icTa5
         6tCeUIIVYy9r3xrMEjTVThUe78yu25+6lBsMWUZlmJdLD0RvyocZRN2qIGDoGapkZRRX
         qLZpD1qdYgPW5tewhdAoVkl12qIdETCVs4sb/3qsqLRMhU5PlK/X10nd3XC8HXgFoDgF
         DC/kmwZoqF3sij08hVaC/zavyO3RfNWr6yUsct++n9w2rykOHqeciYL91YdHgHlKgPF/
         9bZz+RsaoLhXLoOKRruDJ3SLbJV2BkP43QrwfjdbzTYrNDYW9ixH7J77ImECLtrT59PY
         ddNA==
X-Forwarded-Encrypted: i=1; AJvYcCXMwb2gwQyne8k+NWO+Fg6MzC52c+lirHYLf66XtMKhPgL+c9xzvih7dLxypJ49lg6mYIrJsk+JMNLju5x0lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweUXpnWuvUNclDGnjwAN7sCPxfSXLUTRK21oJgcaHllX/AunL6
	FRRndluYELO/oPnyWWlIBu9pnuWlLLhSoa3ZmNwu7eJ88Fi45GjbBUbRzTkfg+nzWbk2n1VZjyV
	+TmAMWVWAHNqS7Bqy2CaVitn42cNQhjw=
X-Gm-Gg: ASbGnctoUX7D6S8lC0jLoTk1S6u+Y57sXjyIzgmsL2rlG9ziXiopB3lLNuoXI6wMo4v
	Pe3xdfCaOO7KJmTyBkNHhvH0/5sni4rWPvHO0lJ+w5VZnW/R8CV5G6IJhGtPFGCL5p8+kYNW/MZ
	MxhEDY1Wd/cfSIQds0HYWB8hm6uvo/jlVPovFOD0ASBo4Zbte+sknT6sWhp7MOR0iZYV3S2oYVT
	pCKE9LSbbPwx+w8j5pYvb4LGmNYK5QhoBx+PpyLRLDc8/xGYJtMB5hM/x8gi0sh5HoOy5o8ipEC
	2MjG5bxbis0U4F8ZFl/Ij2qg6MTPeFCs/93SdI0PCtrSLRCBAwwhBBBS3rwKMGGTvS8Z/0r3g9q
	FeDw=
X-Google-Smtp-Source: AGHT+IGe1fjIYVQRND0R8O4aQBAvRNJ7cGataY75D6aELr+qEQxFaFLAV5cPwElk9IuiJxDtW03F4B+zEvd8d1HE5Ds=
X-Received: by 2002:a05:693c:2888:b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2a4ab7784bcmr3435509eec.0.1763362163611; Sun, 16 Nov 2025
 22:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114140020.327075-2-phasta@kernel.org> <CANiq72m_wGhXqu9es=zOcDbK4UqAiSbn5bBLhjDewXV3=4ckmA@mail.gmail.com>
 <7146fee26e0d24d0998e9a9199d9ef3ba842e0a8.camel@mailbox.org>
In-Reply-To: <7146fee26e0d24d0998e9a9199d9ef3ba842e0a8.camel@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 07:49:11 +0100
X-Gm-Features: AWmQ_bnO_17VTxtxmUQDNqWlbO3Edn1schK8GOSHjVBH4BHbtJp2f1PHbd_kjVM
Message-ID: <CANiq72myNb1Lf8TVbknd0VYUHyv5TvFEr6LRcjgjUO0TfGF6dw@mail.gmail.com>
Subject: Re: [PATCH] rust: lib: Add necessary unsafes for container_of
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Tamir Duberstein <tamird@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 7:36=E2=80=AFAM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> So shall we in the mean time merge a fix as suggested by Alice, IOW a
> version 2 of this patch here?

Yes, of course, the missing blocks need to be added regardless (and
otherwise will break the build when the compiler issue is fixed).

Thanks!

Cheers,
Miguel

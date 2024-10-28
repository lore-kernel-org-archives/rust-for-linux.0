Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4137155C97
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730134389; cv=none; b=IdqrwXeRzXwtV7b3BbYXC5J/LizSi2LEn1I7NB0r88gyvJnd6tBb9wlRNM8MxNgLVPhyHzWklrRvvAaKp9x4H5ZtZN5HkpwEL4Jjw1Wv4wuFKkBbxXBWi59CM0GlP34b4jV+1FdpsueSA6ZxRRt+7xnh0EFVZsbHUZbQQl3/oOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730134389; c=relaxed/simple;
	bh=fXi//WrWlw4jSyWQ6mbQM4i1hin+0sCHECYhRpfOYuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bALtOcGFibbxwwU3JXGfwWrgRRRz4HZ5N1nJjWsVbLqBtLHCs0XnWhttAJ92De4mw5uXI69jT6KYjNdqWesZaYYyeZYlptrje3BS7odN7Z+gJOFR+j10mmtfbKC4+Pay/B85iR3ApSRvEsy9Yi2ZEYQgVGxrhEuJsx13SmAiRrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDmnVrEc; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDmnVrEc"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20c7a14ca26so1864235ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730134387; x=1730739187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXi//WrWlw4jSyWQ6mbQM4i1hin+0sCHECYhRpfOYuQ=;
        b=VDmnVrEcqbiCkjeOAxiBr9AeNOxy4xdQuC5l/83Pfhcif0t/wVF11MuZgSkP/5Zy3y
         px2fzCScThqE1OPUjUkJ0wxntEEgzmdqm5OqloQImWG3u1Q46QY3Q7epJSwrbIAFroNf
         5tg/2i9dEoOjlLuswoZpCsIgOT3ckRVkBZ0Osd5STLFMV0bexaOTC2xKZYQDoYbwH6Pw
         ICDRbOTcNDkRmA6+bo867KvI/+kMxFa/5ysNZsXwCc3a4lyDu7+MGRRFsaTE2AmOiUih
         M29doqNog2OWNr48tiz1S2Q3rQssKbtNjM8hKpnx3z+so55nX9+UD8F9zTsZoWAEr7yX
         /NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730134387; x=1730739187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXi//WrWlw4jSyWQ6mbQM4i1hin+0sCHECYhRpfOYuQ=;
        b=HI/THd2qXwV/EbQzjPZAHVOoQtupzKt+ICLuMbHt2QulkMRGWDgVPxrMdv8qNZR/8m
         k5IrKDLswrM9WIsxlgMIcPPrqN18LjiY5uvNB/92P1ztxZZcM/awyuL6jQ/ECI0f0UqX
         ESKhm49g0FFST3PrRQ5AM2PYFEfGGM0rERUZLszTKo42OWHZC7wuYhx5uuW6ZUesbc8E
         qBd0VpT8sgbsM1rFqe0zU9Czq8O6NPqlcNg+RNbWEoJO9LNpftI8/YNKjg9mCgUWY075
         0476arMvCRcjOMPZsxSxOrxCOvDn+WCwK4k/+AiIZNiVB+xV71U+/upYY2NnYKmVlyhp
         qPKg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ93BCORJxskgF/jo+cMTw6esCokpkuH/Pk0caZFGgCQL5iLPtIrf5LbKuGzH7sctrQION/lr+fTmBD7oqfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQZ4/VlVkyw0tgdW6a2SRR3eYxEfVKcPZk1D6DoqrokkOQJpV
	hHg1y6GnXgt53Rq4/QfXYr06XsOdaKQ3QlKc+hWecS9qU9MlOpT4KE5uXfEV9SiwLymNdTMFtM2
	Ki5vbg3uWwzWU9/arurMN2uCoWpE=
X-Google-Smtp-Source: AGHT+IFdAcbDicwcvVezQhv6kgT64S7GR/7g9yrGoIvohwbtELpVWQDd5XcxR+jpfhOMpNhSH64G5P5/EG9D13U7ikU=
X-Received: by 2002:a17:902:f682:b0:20c:6bff:fcbf with SMTP id
 d9443c01a7336-210c6c756demr52528145ad.10.1730134387159; Mon, 28 Oct 2024
 09:53:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com> <Zx-_IzvBzL1TjQ39@Boquns-Mac-mini.local>
In-Reply-To: <Zx-_IzvBzL1TjQ39@Boquns-Mac-mini.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Oct 2024 17:52:54 +0100
Message-ID: <CANiq72kek2x8sPjsRRza7hCWLnauN60mxq0Fmx0_-kfxkromMA@mail.gmail.com>
Subject: Re: [PATCH] rust: Implement fmt::Display for kernel Box<T, A>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: JCKeep <2407018371@qq.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 5:43=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Please use a Closes tag to refer an issue you want to close on GitHub.

Nit: it should be Link, because Closes is restricted to bug fixes
currently, according to the docs (well, at least my reading of them).

Cheers,
Miguel

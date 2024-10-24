Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410B61714B0
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 13:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729778319; cv=none; b=qazecyl+MtN/m8DL19WCHWYq7c4RBRI3T6BKJ3jPlAZ9KRyQksVgcUAcpS0kzfoTktHpdSqAol7+irYFwFrpF9F66mO2mdsiujUpU5m1Zh+Uc4q7pW+pXfMN9oWdqUCSouUWYsYijn/wuAxVRPqG/dnFTEXvpROpLVYt7iMdt7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729778319; c=relaxed/simple;
	bh=D+tWMkucZDreOHA2Cub2LtlU4ZdniRztqPTlRKuXX7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5xbo3YrEJtwogWd2JT2Ugm75GL+BaaHvVbxRlZlK9nDG+/rPnp5uJIhDA1d2OSqZFpE825/UmKcnLXIrwfRIFftgY6/T1zlLS/Z/E/1vewm3oWPEyguOrX2I+6OOcb0VKC2lzU0qHWA8ZD64A0V/2P3y17s/9XfUk5hnuhUqHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAPqUDXc; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAPqUDXc"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2e31aacbbso173793a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 06:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729778317; x=1730383117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+tWMkucZDreOHA2Cub2LtlU4ZdniRztqPTlRKuXX7A=;
        b=ZAPqUDXcw2KGijMUUF4oCRftlAyqEo8LJg4/DBe8G88PRqcDn1wwfRfTNYt8mJnkHm
         SBsaxIIO/+wfPJom7D0YwGSKT3Gix1sk2+kFfKOerHcQy9LW8sb6M90PP+MTo57COUm8
         t/ABKubQNn/4hCkPjnuBpK9xEtUlD9OMjOdG0jUb6Kwkh6/onnxgxowVri/g6xvb32D8
         DLd0ok797281srZCDAiRPl12V54r9t664U3GBzSAyrwrTu4qAXeJF64L8WqOfeY/mXOB
         x3FfSmxCw5RxMGJCfT47ZBnK2g/tRIBlpKuTI2CcP+QZuoYjsuIWNrrijKpMFrk/7ncr
         OQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729778317; x=1730383117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+tWMkucZDreOHA2Cub2LtlU4ZdniRztqPTlRKuXX7A=;
        b=g9LiaQpDd7fm0hIBw+eaYpisgVr3fVZhQWEz/7pdlVJTZTnjILXnCHvPFYxD3ci3sY
         4OvYCjJKtvZ6sF7gy49fpGmtMZxfBkpSjkpsYvQkIfvZdPcRdH0dpUggHls4w2Vx3NqF
         AmWZayYo9fRdqBV2TiKnNt/J0n+cJg0LD2GgARdDmprcUdWzHm9B6VpDI0XYi+x1qwfc
         aBLUzv4cGkWdfIrtvMMdtAx7aH8aRTSONs1IYIsLcnGp9eVgBn1LbvXSIEdztYzEcAim
         8ZCVDdHA/SyFoypC4VVr6YjtLHUg0YrDos4mcJyiaywcmUTyaLm+GuFlUfHaDWvGUNCU
         Xmcg==
X-Forwarded-Encrypted: i=1; AJvYcCV8onNzhWdC3iJU1nli9zQRJwbU5oKM1sRx/dLVXG4jtCkLDg4dM3xfP1o4+YVqy7+T7rrE637WRANdxcFs+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL9oLhI0lU5vx/EP4B82xnFrzoSK3cIPRwYJjppgRJzVWJH22z
	WLq3NfVYU8yyn3pqMEAwbcMHFI+nuTQsq+JXQOhqSe5Ra6rrqquCl/YAHTULvTZ+vr5/4RSandM
	Ycnv09VhgQ5Bt7OOaY7EBpawp2/y42vg1
X-Google-Smtp-Source: AGHT+IGyO8bTDAC71IDqmYaoa/E1UUFd7zGTY3EgLwCYgP7Pdd1+ns0ry3vbk/c3tPAhauqUwpZuItya/R82ECKwa7o=
X-Received: by 2002:a17:90a:2f62:b0:2e2:af5b:a18d with SMTP id
 98e67ed59e1d1-2e76b6ee988mr2978662a91.4.1729778317168; Thu, 24 Oct 2024
 06:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZxkcU5yTFCagg_lX@ohnotp> <Zxkdpf1tT0e79maJ@Boquns-Mac-mini.local>
In-Reply-To: <Zxkdpf1tT0e79maJ@Boquns-Mac-mini.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Oct 2024 15:58:25 +0200
Message-ID: <CANiq72kek+83THbtn=eQUwksAqjbXHUpXQG-yZu1WLgid6MUyA@mail.gmail.com>
Subject: Re: [PATCH] rust: block: fix formatting in GenDisk doc
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Yutaro Ohno <yutaro.ono.418@gmail.com>, rust-for-linux@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 6:00=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> This looks good to me, but not sure we need a "Fixes:" tag, Miguel?

I think it is fine either way (it depends on who you ask).

Personally, I don't mind having it or not, but sometimes I may
nevertheless take trivial fixes like this one through `rust-next`
instead of `rust-fixes`.

Thanks!

Cheers,
Miguel

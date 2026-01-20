Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF4D41B35E
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 13:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768914891; cv=pass; b=D+TTyjFfpgqmodQJm5xvNWckrS8j1F7h8AJz5VDFf265oEyVB6hFWNN9QLmHRvS67n/f4kzGM+NMET9e3c3HL7Mh4ULhbEml6leDth0iyR2dr1ZhbUWIQNZY6GPIjtHwC+KAsAau68iw6P9QT0z4TPONEXjX7n9v18HS3sX864g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768914891; c=relaxed/simple;
	bh=a0daTRUMD/QqAHdYNPNnzOTT9IEFOFrvYBQdCT1bZpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B29pbY7KEie4XLlh5EGeFXLKV7CFzTECd3exOAdTRQTefVVJ5N9mGbcpe6kaIVRrSYcy8/EjNNBR6mePxCysaXXc1Y2dmm0cB78fQznzDlPb3eC00srWdVBYtZ4o0WjH9yGwTJaQLbRMDFG4opgTsvCJrU01y6ZcCJn8J5MOkKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddwPuw5D; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddwPuw5D"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b6a868ad45so420914eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 05:14:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768914888; cv=none;
        d=google.com; s=arc-20240605;
        b=RKwzENiXjqo9X/9oRLdzV4pl2jZ5oOKWDjXybKLIhX46L3dT9yl2OmfLcXnm+rJGU7
         6f1dMu5l/XYlgnQ0g3dwXHcqVloH3P3rUfMM20my8xz48gPq9lDz8k+n6UKorxWuG1Po
         RDcujvRwyyppFr77OWb7OgszTAr6rNXi1OZVxAl5MY/4SrbTdhpVmjZToN479I4NZHI+
         3VDNIF8+NnqQkE7BrTCkpVx2HfB3OlA0/Ye63i9s94jWmYPC3YoOCae4m8MKiOhbrUmd
         U6RPyZdCXNl29bNN0SNOVs3y/i5ps9HdaqgSIZVsdZloPwm2KIvs6+RPRWbhkdM/FF54
         do9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTX3Xw1yeu7R7b2tLDDClybbkbiHwJOByP2lYq4qtfg=;
        fh=TbAdUpueAcstC41bNXW16TMt8iLbvH2ldErIRxtBFwc=;
        b=EbBrU7t0M8M+Ta6rxt077lxvazPv+tvWa+jHMAJqrBMg/s+hVWiqU1/nijRtY9smGf
         iNxxKzsWBunIsdiGAeGuLQLe6ESEChqI/ZL7qR6kZWa3mo/yNzz4Vs23qXGjgDgDWLMn
         R0Kp0fzA/FLiGiSQ2XTRRzCr84cDILvFGeqUBAkjN5RRk5tGbAJu6Mf4uVnGcepEvVdh
         GE7dgWeK85rXN60TR6/0j/ZEw5zItZproWzMsrfVy7+yY/PSaLUfglIGYwFjUrLRZrpj
         db0Yp2dmlNHRw+mL6VBrKfzggC+M0ZwZNULIuqVe63Kj5gBQRQo2sVx33phLBmFQKvPh
         fiFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768914888; x=1769519688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTX3Xw1yeu7R7b2tLDDClybbkbiHwJOByP2lYq4qtfg=;
        b=ddwPuw5DEvrYVzOf1Np/hInkwNgEZ9zOS+c7UzyBIroGZlRIFo9O2U3XgEjCF4hSIH
         hKUuyjtIib6nrUd2DXiL2m/WKKf70z5gnCJPVUbp5abRdyqaZnzl1HXQxwzJBBGXDmrU
         tMjJYdBRwdzkSyjeKf1eHTSRgF3KsX3R2fAi9qANHMtH6UnDpBJfmiL8Qn4dhbWMMcX2
         xr4s3Y84JlRZ++3TuFpMulOdAbaj6zklpsKjsorPd38zzPt1lT9WyHblAfuLweEt0dTE
         jsiyFcIBIrSU6896U7J/v92f3WVlO5qLFA0x0ER3VAe9K7cFwVJYrI9zKmhq+On1gjjc
         FkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768914888; x=1769519688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GTX3Xw1yeu7R7b2tLDDClybbkbiHwJOByP2lYq4qtfg=;
        b=D/HoGpZJjFp+B06ns24j5NdUq/PVyrAd40CSurpZI6IzDgjmnG7fWvBMxvmphiZIme
         qFZMEJhggwootigqmu31LlHXyw+JiKzbi/1B7Zobo72RgMqkmC9L2tj4D9LfoHlzWKVX
         SR+4vpRdRMCVMd367DeXSThVp6g+Cn3xEahXMDOJZgDyXRNNJr6/FYFuqo0D0cmu5LBM
         PtO3+PqkrLEdaOMSWkru05mQLNpGtns64Ity8+lbCO5BN9vORyAG4aOvZSVplfyXA3SY
         k4ezyN+paHXn+jJG8g8N5mk+bJvI/hWECRNQLFy9lZWH2vEBRcqdNJfDg5a+w6uCZrtQ
         LtiA==
X-Forwarded-Encrypted: i=1; AJvYcCX3fopp1BAFnLnsDmqAArZqry/G1mKpnuXqEg3g8f82KJA5JAkvx/itB40vNWodGMwYgwcmE+/eLDThXD7tJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy47x5XpFX57ysgyQ+buc6qOjwCCG2cmI8hP3rvxLooeIivfVML
	l4uPs6S9GVJIYZTA6NzzTSKM0RUnYb/8MvCqwkBvGbCn0jVUB902ezipCa+70v92+DJEPlatuA+
	H/dzZCnLg4+ccnVW3i4w2WXkzow/H6lc=
X-Gm-Gg: AZuq6aJMzu84/+uFThvViatKn8K+slWrxyTcxP/lEhvurUrNMNiTUZ6V+X6cl0V0Gt3
	frPmSp1NHLlm7IRgdbCN0VbcVS0ZUtNLobQalSFcvIJAKOwB7X+UAifvFAhz9qFgVlAhvjw2oCt
	vY9613NrLdD67BnM2DgQ7txQUWqF8hRCz6jVJCpXOLPgjlYbeFR9FuZUvNsjAoNznanNMjCLn9t
	jHsn3jRvPePrcEax6ynAiM6vQ4ZWKwssPowihmqo4SpUXX+Nlhvlpna09G0kLyDpGzcp+OK23ro
	lq6n3yAFwKzS4UR4TDW/hMVzJ6El+iUYHICCgI8nlhKC/xpdBi5+j1XsQ0FuvJN5/0+Ebi144lu
	9LOJtDSdDL/LX
X-Received: by 2002:a05:7300:df4c:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b6b40e44b2mr5624822eec.6.1768914887319; Tue, 20 Jan 2026
 05:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
In-Reply-To: <20260120-register-v1-0-723a1743b557@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 14:14:34 +0100
X-Gm-Features: AZwV_QhUM5NafezP6fH9cNWpuhkenW8bP_cgvPk8lrcybkk9vlSzNz4vbR7pdWo
Message-ID: <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com>
Subject: Re: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 7:23=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
>       rust: num: add `shr` and `shl` methods to `Bounded`
>       rust: num: add `as_bool` method to `Bounded<_, 1>`

I could apply these two this cycle if that would help, since they are
straightforward and you say in the cover letter that you also use it
in Nova code -- does that mean outside the macro? (I don't see it in
linux-next, but perhaps I am blind...)

Thanks!

Cheers,
Miguel

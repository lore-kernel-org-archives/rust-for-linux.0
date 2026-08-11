Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6846E418377
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 21:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786482069; cv=pass; b=c6/hNNxYoauDWWP3im5tQ2Ho/q8KVevvkYd9fIFClG36PFKbJjrc+XlaL6SZcRrZ9QPo3ChxvKEcjTwy0vB8w16wJWwLok5qGwiBifwanJFFNY3pu+yELmm4psqoC/tmUuFXYE4phhZu/nrIkOncEnLBkdwIwx6R6cMCCwYgklI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786482069; c=relaxed/simple;
	bh=xHSrXLJhSdTyK4h/bnRaFJZbZafnqYoCBbPsiMsKwg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oC+ZgIwHPVIXukyOpMQLMzhAKcZ80F1KmWNt6ztVSNT8ExU7xwHjXV/VFcdwlooEVF7cik1BaXR+5d/MTEv5rHbPMUvEDmFnG1a8WHXWLtB8FLHMqlPqFxjkRu/UDMM9vvxsMKlAsR6SPfHCvOfkRK+KX+Y0wHBF0sCoj40NsPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3CV34C9; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3CV34C9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so68610a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 14:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786482068; cv=none;
        d=google.com; s=arc-20260327;
        b=QE4OJ1hxUbFJcTs7po19mlcyEhpvFEYdcOwxQc/kYObARusrvNJf9pirqZuHfXfm2G
         BuoovTkBC4ekev5Mbvp9TaMsCdSoK6GGAXp5Iro6eYPGYnx+CmJKCphgj/1iSDYbgH4A
         FAVUpJ9XEsL8dFGUST8TDIppmbn0r8LJ+87wUUlXtKHzcsG9vJCv1S1Gcdg97u18IvE3
         K0jRqdeUkgTIn0CXHraZGPp3SZ0N4o9D6svAFe21IFxr+ku3UBkvyDq5PFrADl1ryTNC
         ifjqd2LFscpMhxuF3T+7ytciKS7RvnXATggT7VAjIzThD6ZOveiBTkvEa2MnEGCMDgLj
         XIaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xHSrXLJhSdTyK4h/bnRaFJZbZafnqYoCBbPsiMsKwg0=;
        fh=RX8BhKJGKV73jW5TcPixUpxe9MxxfEBOpqADnwrJlOE=;
        b=E0SBskflS0AwWcz7J8IUmiOnvSCSUQ5e64E5H4gittXeCkhBEdMTlkM1ogzwE3nz02
         FEhqDI1XJCiDoHsJwiJPMUU8WLHu97BBoyft3gwqxBNLW45ypDztxZYFLQhqU6p/SoIb
         EgjtipV4a+3cRfI8megTyt40lAW20NbktzKdj74+vKrwudIsbTIk495SISZwQLjeocBp
         jP2hn483FRfegnhCcbFpS7mfWfKI0lhLAExj0DFTVuCc5XgWLooTb4tjJJFouAFMwTSk
         YfqKDfv3Epu/NG2BOomaKGYXhS13E0GeXVZDZ2IIIzDMQ3j3lHg5eWoofw+tCDGe+w5p
         7HNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786482068; x=1787086868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xHSrXLJhSdTyK4h/bnRaFJZbZafnqYoCBbPsiMsKwg0=;
        b=G3CV34C9X27yrrJFsdYI3xlHCX245+zPcJgauH4WFJB1qNYD5cueQm9KOt1s/GFqxP
         81ieXGMjtU9+VXyCruHlKJ4aB4huqLODASCeBuD+1w+Z3wvGApwz+F8nnQPOU8CFVjEO
         Y7AwjyJs0fe3YHHFPFYiHZv7NJ6xvZvxABYQq2P/pfLrRD/OAb4ofJ3d3CZcVw2P57Fl
         pMLZyd/7eIY+Zo21H9KTCboPHPql6xI5RqRbqM68Xqq7TokWu0EpCPXOWeOHgxvq+mTb
         Cbf00aj0PJbqXCdjjVDYJVUZgSrf1ypt4vJ1+kGWAM2T1psPodzuPVqLjYza1lsBLNjP
         xV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786482068; x=1787086868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHSrXLJhSdTyK4h/bnRaFJZbZafnqYoCBbPsiMsKwg0=;
        b=KtBPJ65WPqMrOX5Al7KbkzzoF8Wzkr5ci1MdXYN7NnLr22ph0QtsKsMA2VsE9sPE+O
         T4sTG0l9NcjaHHcps4Qsc0NVB1v4VabLNxDLFR7PlAUu4dlhc7jQNBk04Xdt33kJC0My
         J/PIkCvj6a1yyLwd2C2AnEvjt+sj7dQTnLC3EUetkp6rfyBDZpx5Yz3QoIugllinDnrd
         DQ3xUMKaCZw8WXzCiYRsvKA1awASjTETTqUdzQt76iOOSX6lDrWkPwj5FDVJDY1gt4LV
         DONRMdKbnwIAjeyjQ6/h7zN4cYuaShaSVSb+bE9BqTtoM3TzR8LjMfXch/W2n9nn6DmN
         LJzA==
X-Forwarded-Encrypted: i=1; AHgh+RrN9tLTSIV5EPe2VL2TYR61cszGr42KqCvYrAoIjytBKb+6/SFiEveLqQdAbpZeus2SNTgc2l2UPRBIHb07Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys1YFd7yaicAAdegufcHzNS7XYnka+hggDlZRvhFpqS3rIbpcA
	/TeidNrBh/hhnhjoCVq+jM2dhTt689dgUNcvwzk7Eu10edpE7lC6jleI32Ku6TzzrmCHyjDdq4K
	smSEDBeOnSrl1zh1u0HttLccHTCJ8dU8=
X-Gm-Gg: AR+sD13TvJsySz7L39XuYazUzPdxCythwzvJQ+E/lZ4jHrVA99TVGroChtRNc7XGPYe
	ILm08DShg+9kQUGnGsXZcD1cUo9t4HwXLvliUjhuHVF4+f2nMs1lcesUrgpLeEOqNsrBJ/zyT42
	ayFd89dJP6IHgP4Y6LxwvyD9C6hNwbggK+H0PxHNv2TOk37RzRzoBWHsqMUDMIr49JFueEmZD0H
	yvO5NDUjo1gBmqY0tSdhg/hFcAsVKLa/1dparJAqvsL2wH7siJsSemsdAeq2d1Q7MqMRbGgmoPF
	oj8SEUQQWrRc7j5G3+CID76wkMKNB1k/BFnsFfcy6RIYB8Bjb8y7pHPr/DwJOca9gacPY4m06UC
	IEv4YA/4d3RL5inLw91MDUXeEWf2eiX1CmWXbOrTdv/uUZOrT0vSXATUiX+Iy
X-Received: by 2002:a17:902:d552:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d3456e7622mr1975195ad.4.1786482067126; Tue, 11 Aug 2026
 14:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603160910.159307-1-laniel_francis@privacyrequired.com>
 <anqsTVj5QGYGiEQ9@monoceros> <20260811-garrulous-serpent-of-agreement-cf9b19@meerkat>
In-Reply-To: <20260811-garrulous-serpent-of-agreement-cf9b19@meerkat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 23:00:54 +0200
X-Gm-Features: AUfX_mx5xTNPSjPRZOiSX7b2JNTHPN7r0POqFAALJCuvChpsFwzRnqIauZY0U20
Message-ID: <CANiq72mb0RK=2Oaipzas9UZQiEy7FW331dosH0+cFKuVQNE6Hw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: pwm: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Francis Laniel <laniel_francis@privacyrequired.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 10:54=E2=80=AFPM Konstantin Ryabitsev <mricon@kerne=
l.org> wrote:
>
> It was just Miguel responding with a suggestion how to better reorder
> trailers. Since we can't tell this case from the case when someone actual=
ly
> replies with a follow-up trailer, hence the error.
>
> I added a special case where we ignore trailers we find in the follow-up =
if
> these trailers already exist in the patch anyway, so, at least for this
> particular case, the problem shouldn't resurface.

Hmm... I usually indent with 2 or 4 spaces my "non-tags" to
distinguish them from actual tags; perhaps I should mark them
differently? Is there a "standard" prefix to ignore them instead of
several spaces?

Thanks!

Cheers,
Miguel

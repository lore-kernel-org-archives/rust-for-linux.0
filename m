Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF53A9628
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267028; cv=pass; b=Rzz8XlXWpBCucuSgjud1dQHPMB3A+kB69MtlAqORaX/YtvAm6tmcbHpXeCCTvq3eT0uaRiECZaOuAFfKjIeC+Y7ebEkkGEgIFz/YkFG5b7vqjlntHkr497eTwGbMs9IurapRt8XsNNf8rzGLkiWUfxOP0YWDaRLKdF8NRrMEGNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267028; c=relaxed/simple;
	bh=OuZdxdtD2MuuyArmy960J2u4SzK0kRJyCn9E2H22tnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2b7J9VT9vRfHVj0RoaEAOYK6wMN5VR1gE5XBWg5aEmZepaG7ZtiyE7U5CbZWEwt8nr1TXLo+lQ5NDyDuD+Sw3LBevWtxGw+D8gtETDkKNs3J3ZqhFnuaQPXNmgYoTguuNRFHb25ORY6oN2JIcJ7E8vW9Kri8bXq3IcGLxIV/9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9M6iYc4; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9M6iYc4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf49dc28ccso303245ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 12:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785267027; cv=none;
        d=google.com; s=arc-20260327;
        b=T7NJZ2Ys5WEGNwH90YYSaAIC5KiODvyrYiCSOYXYj+0nOVY73RXOf2NFo9+rZTQNF+
         Lvupi487uHjcNGrBtHx2V3XAgFWCTt9+tuXCYGfM/l6swoRtAvqAeMuh4n0JjaFKF1t7
         XGVT70PZCY74lxXD1bVYoAQ494mNU0vhmNJ+gKZB6v8svNHR9tDd0lbXigsgx1dc968c
         +JsAOtRNOVjiK5+RL6IFgLu1fPinigOfpKk527i40jFLa0Bk/eXMc8FgB4a8x+YoOSo9
         QvjwCPQ5vzdEgP60o3nP+436yy93hz56UD864HW8njXXn3qSIbPCSrxbamSBHqXwSN0H
         SOJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOlnY10tnr4QkKaIlxFYxTs9Lp19ftPVrjCjqbroCWQ=;
        fh=aevomHh13AP+FmekeqJdKP9EBGuW9JiC6/ownPZ9/ZU=;
        b=UDwe2Mh6SrQTj1n1v3montOyn7E2CXhx8gx/LnAF9ORCD+i0+8yeyy+DQDuY4f8Z9j
         goh3gFaggOfAofTmboMPS/ms8E6UgjhWG8yV42eeCWFFKWyizOXMzKTWyjZfdO04OH9z
         tCwh0AyQ2GWgkD1yEFj168bFtqWQHKTGsCRkPlOQNspO1GXBUPNBnppcRsTNXQ1yVdmE
         WQLCg4LFuxNwtSz6PjdeCO5giaOekCg0JygXI1O+H5tJlhmGyOr4q9mFNDLZD6viuToA
         Y+dgOZ2R48lOzjVlDcsgeewnlTey8hSDUdWcX+5vFp9n2O6U2mNCzrTOHD3FWlJeuA4j
         j+sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785267027; x=1785871827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOlnY10tnr4QkKaIlxFYxTs9Lp19ftPVrjCjqbroCWQ=;
        b=e9M6iYc4ltG5uN3Rzl1KyierKU0sM9Aj4sXlKNMnqu3A6GEpTGZddBj+9F5TXFKOA3
         SQiWnl29Z6tJ+Qr4M7/SUzHx1H55LJFIz8fKo41Z89LpZZTqHs9nIvrAKp7JG3id5ro6
         gl6PlvBrG4BFvNAWA8JsQv4YxyhR88axdG4qKnrZiwT6aasDCZbM1O0V9M5TUiShuo+z
         vZRDp4r8LI6x3BmKQYJoix5sBYNO7FVJ/EXY4fuTy+TUykDmfp7+jEPxmWPDVbl9Ao+/
         qeZBeoxNk6QdXE4+ZdtqL1J1Bjrz6dGK5fUphOdysAGLQeB5UbfO3izhFm4jmYhY7FjV
         W1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267027; x=1785871827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOlnY10tnr4QkKaIlxFYxTs9Lp19ftPVrjCjqbroCWQ=;
        b=jrISchFx55PfmoGJUSogKEe0b8Kk+UFVhiE+iZgoT8zOyIOQ4TxSWOqHncDGkmyZ6f
         OQl6pF+fg3oC0CmUbjYlztO1mAU/zttXmwjGnOwsUq7RwXKu/H4i4nsXMGhiGPQAwDJ1
         zesU+Y7IuTx3xyKNf/vQVRYdbQMb8UvRknO/HdXHvGwNawjMQwy86YAENc1n7VOvXRCh
         76Jjn7xPeTkAm/BgQHaFDUdAAYaffmqZYkh1SA90UbjpOJZsjH+o99bZreOHFGvaPc8U
         bJjjOjUKX8m+qcWgMo8cZAsXDJ8dkhfTs8yCP9ZkTI1uo3xU7aFDBx0IUy4Dw5Rk///8
         O6tw==
X-Forwarded-Encrypted: i=1; AHgh+RqruuXPLDDfV7S3XtfFfmsSuvr3PkZW/hTe4hJwVsYaOScKN5yjl8kWFx7VaDusrbB076n3uhz9IphtFFtDfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6+fwEmiNl3ds4uFb4jbdP7irgbq4/mAyZujSjwJOEs8h1U6hM
	PRYmE1owlOE21X5o06+VPN4tAYOcf8tevNDfIDLFAMT0YpeKlaRS1dFGtzZTGqg6gJey0Jps2ZK
	YXmE4WU0/ommRZ53DlDJWjkrLhfoEG+o=
X-Gm-Gg: AR+sD130MXMMfGbZzlDrKCLA6RpS9lCtN5YTE9h3OZUSI9dAzGgfysfvIeiFhzBfK2N
	tEJ5BW4GKASm9l9Ca+ySph/LViHlp6c55d6pTuNQhZLX2IeYevPLj18d7qflCLozclWpKa1Zwu9
	l4SZgwjBVAyWAUhhaU5olikJtS1xHYKUUX/LTHNkEwEEyiSu+oyg0V6q9mM/8meSOPWpXSyLK/c
	8ayYib+ZdDKNsB3lAru3l09RB97Ym7KizYTnKPmmm0fRpDLgVHECd6O70DhOdnQSQZYH3TRhPzk
	5i+UAnRyD7ze50PY2UQytbPjrCwcVpeJceyIasUI+f7o+VsAtzkmIfyjQF+YfawUbDOSMwq8nGB
	Lw1DhhqImunMMvxXCfJticem8IPVA6F4KySOiiuqs2KJr8BSrtLZ5s6/cYp+A
X-Received: by 2002:a17:902:e88c:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d0157877cfmr34510465ad.0.1785267026639; Tue, 28 Jul 2026
 12:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-typed_register-v1-0-452d72b60262@garyguo.net>
 <20260721-typed_register-v1-8-452d72b60262@garyguo.net> <DKA02Y5RE1YJ.2FGI97Z60X96R@nvidia.com>
 <DKA4Q5QUBUXM.1K6QS2QPXT12H@garyguo.net> <DKAASRCK3M06.G9XODK0T5AAK@nvidia.com>
 <DKAD64Q7CEQD.Z15OS6MRHEKE@kernel.org> <DKAEZ4LDA10F.1RFA9JKBGY2CF@garyguo.net>
 <DKAFMD8X5LFP.UPKPHK5FYZPH@kernel.org> <DKAFRETW93IW.SXUWFVB47V3B@garyguo.net>
In-Reply-To: <DKAFRETW93IW.SXUWFVB47V3B@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Jul 2026 21:30:14 +0200
X-Gm-Features: AUfX_my7ge7MYUh2zUi3Gt3zgCDTbiWd0Gi_L5P50g4KhlbsBg8SdJA5xeWd3II
Message-ID: <CANiq72kqRh=ucvE8ibPmesyrWdLnwbOwcsmTx2A0iD34DdUsVA@mail.gmail.com>
Subject: Re: [PATCH 08/10] gpu: nova-core: use projection for PFALCON and
 PFALCON2 registers
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 9:03=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> It'd be a compiler bug if const folding is expected to happen, the whole
> BUILD_BUG_ON depends on it working.
>
> `build_assert!` is a useful tool that I'm not giving up. If there is a ne=
ed to
> use it, then I'd use it compared to having two variants to do the same th=
ing
> with different syntax.

Yeah, and on this topic, the overall concept is being discussed in the
C standard committee due to paper:

  N3846 2026/03/10 Grant, compile_assert =E2=80=93 optimization-enforced
conditions at compile time
  https://www.open-std.org/jtc1/sc22/WG14/www/docs/n3846.pdf

I gave the author some feedback on the prior art in Linux (at least
since 2002, originally using the linker approach) and GCC (adding the
compiler attribute in 2007 from what I could see), including our Rust
macro too, starting in 2022.

Hopefully the discussion will continue -- the thread was active up to
a few days ago.

Cheers,
Miguel

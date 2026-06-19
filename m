Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2575331D72E
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855189; cv=pass; b=Gh275C1RNKATfiWHTF6oBSQ3mV6fHId8ZbwbGMLcOiNB9i/euIZnzJWpBT3FHPoSuVNUbMAtGsZyzCrnrrj/a7LR2flKRUgOSRKt4Y0mvZ2+wt8JWSSHeMiUwMNRa0JYHOK/qpNZrVkG/zpkpddqkEFuKfblOwCW1L963xpAcn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855189; c=relaxed/simple;
	bh=aCRTd9jlyyJd4Xfqt/Ww1AC6ceC5ZfvAZhKiebLSRp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4g/NlKIsOxSLRallw7SxVYKEFJrE9bP3FV8YaRiGUImyk8KBoU9c8BlONQ50cgoR87x4hGXZaRuNXSt5M9Lob3Xt2IZ35QkluA6rm0sfcZ6jmLbyeMYErQlMkjCJB4V0KV+Te9wfxhaUAdkD5mXl1e2FdNkoinCTamxQgYoKqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P1fBoMep; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P1fBoMep"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bb87c90deso228633eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 00:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781855187; cv=none;
        d=google.com; s=arc-20240605;
        b=MQ6qzh16NwuhpPIwoc7++ygV5TONzKz5txrAElmsYvwEd/BBQpTPnAZsJYEvzwCIsI
         9cVeLhJNwo//0I/JU5NKHZCMfwe4OpQlXtVj/fNnk5fy82QwQyt87yfax+BrbxDlcAf7
         oe5VpZ+rzohsvEKXhSkMCAEAWLN27o5MLpBGp6zgRnzpYxNssXfridXLnQ0FZMsshmqm
         FBcl6eipyeYHixbCw3lfoLjmIclQ75nSIs+hAcLVtjjKWspv6pOGxt+KOtiDRS+EbtQK
         qeKYmCuiiPZZlYBbD+KClxPxLUREiqpyr9IvcP0G2jswtL7fjvquh5F98FgpQuz99mMg
         7Pwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/0Q+cvUfcBxjnvzmikgZmLYPhLHEmMy80/ozDiYHARI=;
        fh=GV3PsAc1+npkI12wb6bGFBMwUbkEx+9cln+aKX3e3B0=;
        b=MiuzXuawH3BkR2iW+TPSqSeEa3DXlOEQN5SsjXRozRjkqqkWHT7sN6mZfH+JZ+qYcR
         09YNhZWirlYJ2OmPD96qZwqOSFz1lDw1Q+ayhcwFVrOSJewvz/lPGZtDk+ji9VnwhSqb
         cLi9vcZ4/hh4umy5hXgaJNibZxiwpuGeY0yUWite4lQZjEEX4JIrTYw9oInUFqzJzfVF
         tq5pUbekfPENV5qYIop1of42Lub9kImaaXlJ+YSZwyllXXHbwnSL1f9Db0buyhmiXatl
         mMqNbmGn4y6UIoxVRIcAdlnPRALU3R6gWHwmWEdxjR/jiPz/Ed106t6sU/Off3r0kD9C
         akJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781855187; x=1782459987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0Q+cvUfcBxjnvzmikgZmLYPhLHEmMy80/ozDiYHARI=;
        b=P1fBoMepkq68ZzAPBBrP2yGbWOV7ypBuhtfPqXKrEhx0NZgiIV65+uevjb0qP98slL
         fYrHjwkLSSoK/DCEcjUXSRdwMxXeAbSPPta8qIvezS4IDwh7CpuU328XPz1od/NqDMRd
         uz2qWvIYGu2vxiZl2iRCnxg41c0+7LfUd9uegm9Ec8onLcMmB1qBgub9LEYGxZ6Wju2P
         flHU8dcgycansxRJlEWeMRi/ZYoyRLdOYXVMY84rUtkVDSkGxg2j3V1YznqIFMPdNYxO
         gSmZSXemA3k8XjHHsGrZJvKFg6pCwPQbAtJRtssbidSsEp4/BZ+VHGio3dRP2rvi9jdT
         j/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855187; x=1782459987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0Q+cvUfcBxjnvzmikgZmLYPhLHEmMy80/ozDiYHARI=;
        b=cXBZQQ6woaQI1T2j/YxN1TcE1VJqK/ZVEio5pZhe4s1IZYxXuOBHUqAkMpqE0QXpVX
         Ah2QpKAKVHc/XcvR3b0rLZK7P+xygunwvmmQywJ+xAeNHsPIO6SDMVP93i1CO64Q8JEJ
         VytA2SV0eE9WUgWF/0o7ld8XFTHuEgUQcbH/Ex4U3Mu1qMSShlgPkr298h7LcuD3mZlk
         zERAWqwhFZWui0/HsnYR5yGFFnlDSuBgpNr47bcIGmqFwQbRC/af/t2GhNDlGTQIfzPN
         XUwKqBm170xi/eVi4SEpop8adwzJd9Qbg9W+P3mWucZwu6P1s5Oy4LXpZP8LiMYykmPn
         jvGA==
X-Forwarded-Encrypted: i=1; AFNElJ9Lq0aHMG+4zmsbfcJrTgwnerFBcYRNkswFSOtyKclAuSOTp6Ir/pzX4FY0v3F0VNgr31aMOaD+EfsN6Y4YmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+5mgWuuJ/Cs36OaKOuxSiwpQpYNGzSjPQqCD+tn/GeO1elq8
	o6R2eC9Pwr4cRxozLNtUqL+E2mIQ+P/v3YvjkIxitU/8RutI6FU8eoz3K+/lzUEKuvQrowX2ORE
	QdH9IJ91w7Qh4ECZFIabNbgzzV1/4UN4=
X-Gm-Gg: AfdE7ckxZ0BtE6Ek6qtUrwqpHyfTHie0KFijZCq0rxLm0JiLQ2lOGSs+R5EXqsCMzH1
	qLU8B0ialfNyY8cI3HmQ7V76neXvBYdwIGW/XkQJNis55/xkL9wIWOAOBesoc43VBfaloRkCSoA
	i7kEiRznwR79qVnhD3utOwFF5rND6KovpsHiXoXarWP3DhoOU0+b77LeYXn97V2nlejGZ7NER4X
	3AmNKn3bsdIkBPd3Y1yrtx3aIs/DBeH5Fk681Pt0rh3arVJSxur4j50yTiXg50xLBt1xDOIeZFo
	foKHUAP7Jmsl+PqsZv1jomZooxZH4boSjflYXnzBVCDOWoC9nm0opYeoHwgaR1PrCiwaXaquXgQ
	/Z2g4+VfzQLvF
X-Received: by 2002:a05:7301:38a4:b0:2d5:9438:2a02 with SMTP id
 5a478bee46e88-30c06fea5aamr875495eec.1.1781855187239; Fri, 19 Jun 2026
 00:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616132559.2245814-1-gary@kernel.org> <CANiq72n-QC-DGUX1Cng0FTDbDM11t9N+6rUC4QxxBQtL9ntwMg@mail.gmail.com>
In-Reply-To: <CANiq72n-QC-DGUX1Cng0FTDbDM11t9N+6rUC4QxxBQtL9ntwMg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Jun 2026 09:46:14 +0200
X-Gm-Features: AVVi8CdZmh8TXI9AU_ds1F4ehLYLgNNFHGOZvy1KvZNuzh1wq5A-KTs8sj59tBM
Message-ID: <CANiq72=tXTSfG_+mkpAPsXZf=_S163XiEkE9FfO9rZBFWu+qrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: doctest: fix incorrect pattern in replacement
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Igor Korotin <igor.korotin@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2026 at 9:35=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
>     [ Improved comments for consistency. Reworded to drop changelog and t=
o
>       fix typo. - Miguel ]

Actually, I just added a link to the comment to the upstream `rustdoc`
PR for context.

Cheers,
Miguel

Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863CA21CC71
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 23:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771111867; cv=pass; b=c2DpzyTfLoIEk9h79qO/xfy+VoME8RQOsahWjch5QAN68o01f57W0FdNb7VC00RBu3CbMUZNDdFk2hoF/N7nzjoafBQl5S3Ng//bi4/Y5vbqDIYqokxP3wGdD9PwKtJryzYBqwFn9Wsid4rCNJksXkm075PqGhruSwE/DqExvSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771111867; c=relaxed/simple;
	bh=LpQBO3056AcK+d8jBxjLLXuBAl1os0K8InIpM2Fh1+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKjoj1taBk8fUjt2a1Y9XMNvVPvD/uTXCmunRot/l6TLY/B5CAhQ4uJFGq7YrU9XVEfs1CMiuYfMFVy2iNx5DW32gZGEO2HTgE0frjMeg/R3f/D88lopuHFq81QCVWY/38rf5xIw++K6nh0BgsvNWpUYQyjlz9Hnvx886XE+Q0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8LsO2KQ; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8LsO2KQ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba6737fafbso115888eec.3
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 15:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771111864; cv=none;
        d=google.com; s=arc-20240605;
        b=QkdwZLK12QTDGWwW9jGof7x1Mf/07ICLocPeS1dv/QoRrEyI+Z2uL0AE4QMICY0m6X
         UiqtvT9dGehC/jQLpia82d0vt7RAvwz6ixhZA6ciGbGgvST1H1xHR4V66fhHhFUuyqyD
         Df2FmGEw4/nhEyyeY3Eby8/Xl0hN2gSrJXg9nuLKWirM41kISNYblVLSSSq+fT/iQIJp
         eGr+qnzSB7W5pr3DN6EVTs9KhFwjpHLsB+Wu8r1IBk0IgYNoVXexhudeDFw77vfntm7D
         +17ROcrdSTrd2/0uJlU3yPzUa5xY53oIYBSxK+iHvrbsCkqsEkvu7WswpoO553aPMqkE
         ctew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=80kxHCqjFNvroeRYB41NRyxVm/wdCEGoasgU4QprHqQ=;
        fh=gu8p/0frPk0yq8J5NVBMBKjSIqgK5L2YKnGdUCxQa18=;
        b=Y8hzbpncw2NEbKj2effyi5lA4v2Oz/UEKlE7lbETxOi4RmtqBQhTsfkIcpdelhJHvl
         qyQKoAHxn2I2TxZGd8HI068SYcHwPL+6ZSqmXMb587UgfQZSHn/R6wA5vBNOiubZMHlP
         HrsIGURzk49lftH6h9wkESxQWKX7jNlD7WcNe4NowuuQ8QF3WUOzI+XNOmei28iYxfLv
         Nfc68SicyZPgnMOh/ZkH1n2OxTB9BDXeXUTH9x92KYUZmDlCL8ZqRPkMzFiRln8Jjp0X
         NItS3MJwppk0yMIgENvSwgn8L47Zyrb9R1c0JH5zP6QcPi4m97fkykPieLS4vJ9xLIFr
         bdUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771111864; x=1771716664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80kxHCqjFNvroeRYB41NRyxVm/wdCEGoasgU4QprHqQ=;
        b=i8LsO2KQrqEWkOS62Ie94nM3KFqzjZ9zv5hWSwN/vv+30YjZyGv6YaWgJEnMtXoe4z
         LNBZT0ZYghl35wt8Taz3ulkjdAzhIBBo/ZGKTtain29rzMXqR5UV77xrrFA84ItfK1Gz
         Z89eLuaFwKZpr4PMuNS8USfCU6j4bZ7AklXoln1m4c4PVcoaUjH2rN6YuF7zX8my9u8E
         t2Q1vTVy7GLwFIYprHrxCQuoJfIqDf4et6fOxUSDme/65EgdzNYun8jPLpoRDIQKBmve
         tpwY6OfqRVhhoi0jo6MjE7ZA+qU0Nkdym9zyx/XqFS1V0v7eUnN5WMzSt1RO3UcD6P/M
         7S+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771111864; x=1771716664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80kxHCqjFNvroeRYB41NRyxVm/wdCEGoasgU4QprHqQ=;
        b=iFU06OKQI1mqDkzPgZDq4CbXsNEQL0QMFgr2UuUdxno++7WlEiqVKSFkGpb/zL5Wa0
         Vu0AamwFLXZfnPY7z56ozfi79u0Vf/g6XHdN1L+AP3gnPO+iFmdyiDvYsVS8Lj0YuwAX
         5qXh48UcFy73SuAwAcK2QjWE2AcUcyNEJUc0obWbNvqHRLjmpgShwfzwUEB1grfjMn6F
         WVqY8gX5rEYy2CSQr69Epws4gmIu+V02f3NARDbl1HVjUSEVPcy/U9wzhQWV99U0HfMd
         YHFDH/UupCvu98Ajr8pMf1/rq0uPbCGAF9Yh1W7cEyuNiNZK9Pfie6OR8ZGUkqpJ+de7
         An4w==
X-Forwarded-Encrypted: i=1; AJvYcCU7Qq+JgAmo/q0yxuk74ElDLBlqw4sWT0dBl4ivdAParvJkQcEmTAEKCKRjYTDqRsh154/kf2fROQkRs3CzAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVw4zdW+1Aep0Xo9VOLlOkLXzxYmmoYxyrAp8rcKUMnp2oRQyq
	MJwTOeQDDpLvBSY4ksbtZo+ITwZJ/fDMPWryZzdNT5Jot+B+Jt6dudPrIIBfhwWAYfJQJASoRlf
	vmgTvPL6T6Knv6xaSX/tf35rKly9wCI46bnBL
X-Gm-Gg: AZuq6aIttC0OKiD+Cxt5WJLP1iQfYujOtn4MQvBeXWF04jd9CMoTKlxpzUNff0QAl6z
	qtbbq/mY0aKBCbBI8kCh2YEoafWhP3lInZ4hMXORfSs/Hq9rT2ucMYiabMJymiazbYTDjZGCO9r
	d8LHFWdIrn0pYihz9BHH5A+o7+mbbL6OmlnqVJA+nmszEiWMmgFCZoPDCCFSHBp8VMDUGVLepD+
	xDB7Hyo9EM2wTjH81TL17b4IZyAG2jzCTcycts7OILYb8zyo9IzxPHIqUky2AQmM25uRnOuZWwE
	URyrvUWaLIfllVw8MUTrt1pFtacW8n1GWoMuDqc8bX+5oJf3gbIuhtTvgN5s4/MsFv7awRRS8lE
	rs9jC8sO+wFflBI+dqnQA3ZpD
X-Received: by 2002:a05:7300:fd15:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2baba0f2857mr1351071eec.6.1771111864429; Sat, 14 Feb 2026
 15:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mB0N3GDe+w8qT_VU1ieMQSRBiEPaFdSVa-2GLDiDMEZw@mail.gmail.com>
 <20260207224907.234815-1-jason.kei.hall@gmail.com> <ccbb3422-11ca-4a0f-a517-1f48b3004052@gmail.com>
In-Reply-To: <ccbb3422-11ca-4a0f-a517-1f48b3004052@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 00:30:51 +0100
X-Gm-Features: AaiRm50Y9-EdHcDpb4SQGQdyOr7L-lp9TdDq3b1fUgvNHhUTtlLysAR3O2ppfBY
Message-ID: <CANiq72nm84Wmr+D_VS1DnpG+uVb3zZpCCojGPxJGyZTBj-Okow@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] modularize Rust lints and add RUST_UNWRAP check
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Jason Hall <jason.kei.hall@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakru@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Andy Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, =?UTF-8?Q?Alejandra_Gonz=C3=A1lez?= <blyxyas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 7:11=E2=80=AFAM Dirk Behme <dirk.behme@gmail.com> w=
rote:
>
> In the last time we have introduced several rules by "convention".
> Without checkpatch or lint support. Like "please use vertical style
> for imports", "please use `__rust_helper` for helpers" or "please drop
> `as_ref` from dev_* prints". Would it be an (easier?) option to go the
> same way here? Instead of enforcing it with checkpatch?
>
> I'm thinking about the same approach like we did with the examples
> above: We identify the "wrong" `unwrap()` usages in the existing code
> and "fix" them with patches. What would result in a clean code base.
> At the same time it will give developers an indication that the
> remaining ones are "allowed" ones which are ok. And for new code in
> the review we ask for corrections if we spot a "wrong" usage.

[ To give some context, in case it helps further discussion... ]

Yeah, that is the status quo, i.e. catching it during review
(depending on whether it is an acceptable case or not etc.).

However, there were concerns that now that more and more Rust is
getting into the kernel, with more contributors and subsystems
participating at the same time, we would eventually see `unwrap()`s
and so on proliferating here and there, i.e. that things would slip
through.

So after some discussion, we settled on asking for the Clippy lint
upstream plus a `checkpatch.pl` warning meanwhile / on top of. Thus I
filled the respective issues:

  https://github.com/Rust-for-Linux/linux/issues/1191
  https://github.com/rust-lang/rust-clippy/issues/15895 (switched to
Alejandra's earlier
https://github.com/rust-lang/rust-clippy/issues/15861).
  https://github.com/rust-lang/rust-clippy/issues/15896

The Clippy one would be the end goal, if we can get it to work well,
while `checkpatch.pl` would serve a similar role to the C side warning
for `BUG_ON()` (and friends).

Cheers,
Miguel

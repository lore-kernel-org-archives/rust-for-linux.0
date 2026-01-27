Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB33359F86
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521148; cv=none; b=gI6uWVrp1d9N9nyRRHBQ79k9WQV1wB7i1y37DPbZvTb9IiqomMNfM8q1ZNs+jTajqBHJbm8jq+wLMrPYfNPJS0j3u60GdDu0iCnWFqt7CILj1OP8f1x/VJB0EGmANsXCOiq+Ny31bQiCVr6Rh6jB8a1hDoHePFp4MerjSS0n51s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521148; c=relaxed/simple;
	bh=BXBAVxyWkRwktqFoA1SWEnN3RAb2r/Avzdd8ijNHOwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsAAK3XGK9kQAfuLJ2P/e4poByvffom97WKQud/4t4Df3DRAXMPewROph3ttnv3w6O7SSYn/olVKETxQyUVTM4lcXVrr8bPjYgWxbZzjy0KZrl2OAefHXubhk9VS5m6OsmY76DScc9sxprswxQHkY9GbD1h3Ga2vlX/xjUt5530=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoDqUcCW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoDqUcCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52CEC116D0
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769521147;
	bh=BXBAVxyWkRwktqFoA1SWEnN3RAb2r/Avzdd8ijNHOwY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GoDqUcCWmctPCDsxdDLxjL+t08Ywuj8ZH4ZjShT8RreDgPrS90sydjDurxn5OR6mh
	 NsevvaBvDAmCCY8jqVvxgEl8luVL/BVYo94L5P+68ioJ7DkulWEPNY7fQmRZLPS0y9
	 EHmr9KaSXc+iwO0fpp/5XqeQeTq9J4msd5i6uXCPTGd2n0nPUOebXmpsHR+gz60/76
	 P3lFLS4K/QBro5E/J3BJZcxXm108OUt5IK68qnowfvOHfqwMYypj5qHPxAIuupMh0Y
	 DaNAiphd1y9sKl2AH4DF66zWrcBoCbT64U7iwdLDf4Uk3LNJph1s6pAAQvZZYLkx7L
	 cBhS7rw5qyX4A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dd490be5fso7489755e87.2
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 05:39:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxxeKsZc8qKjL3e+DbNdjG7bWmYp18DD6ByT/lLspze+m99XffI1uf9/v7CNLc+c0AzWq5sxb8LGDcUuCjsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNfo7493NZMEbsQS2sY/AIRY/aMbcsb+K9e32dd3XkAou8sDen
	4Zs17WTeE290By9TG595mRAKSb+lk1qRy75hj1lupf9v5kLtePTt12vL3sr1BIsCNz/+UAd5fOp
	462zlpjTf9DPX92pp1jR2RylYIcZO6/M=
X-Received: by 2002:ac2:4f07:0:b0:59d:f475:40a5 with SMTP id
 2adb3069b0e04-59e0412c67cmr807071e87.28.1769521146651; Tue, 27 Jan 2026
 05:39:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-fd-leak-v1-1-945577813b20@kernel.org>
 <CANiq72=+2s48M5imZ7tZj-0SN==f_mLmw_2cWfQYKtBhD1ROCA@mail.gmail.com> <b07a1e07-9265-4b77-9665-0bfae9b506d3@kxxt.dev>
In-Reply-To: <b07a1e07-9265-4b77-9665-0bfae9b506d3@kxxt.dev>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 27 Jan 2026 08:38:30 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9k92BRP=3-LL-d1YZzROE0ayEH7s5ptf+xPcPYBnb-7uA@mail.gmail.com>
X-Gm-Features: AZwV_QhNhaJEiotjq3ZQI93lwlmWQGbyXYdpdDwMCzFfNiHMhq06xrewGGK3FzI
Message-ID: <CAJ-ks9k92BRP=3-LL-d1YZzROE0ayEH7s5ptf+xPcPYBnb-7uA@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: avoid FD leak
To: Levi Zim <i@kxxt.dev>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 8:10=E2=80=AFAM Levi Zim <i@kxxt.dev> wrote:
>
>
> On 1/26/26 10:09 AM, Miguel Ojeda wrote:
> > On Thu, Jan 22, 2026 at 5:44=E2=80=AFPM Tamir Duberstein <tamird@kernel=
.org> wrote:
> >>
> >> Use a context manager to avoid leaking file descriptors.
> >
> > This may have been intentionally written like that for simplicity,
> > since I think CPython closes them immediately in practice even if it
> > does not guarantee it (and I think the kernel may be assuming CPython
> > given the version requirement?).
>
> Path.read_text from pathlib would be a better choice for keeping the simp=
licity
> while ensuring the file is closed.
>
> https://docs.python.org/3/library/pathlib.html#pathlib.Path.read_text

Thanks, I thought this would change semantics because `open` would
default to binary, but it defaults to text. I'll use read_text in v2.

>
> Best regards,
> Levi
>
> > Nevertheless, it is better to be explicit and proper, but it is not
> > urgent, so I would say let's put this in rust-analyzer after the merge
> > window even if you end up considering it a fix.
> >
> > Like in the other one, I don't see the Tested-by from Daniel, so I
> > would suggest taking the chance to double-check that meanwhile too.
> >
> > Thanks!
> >
> > Cheers,
> > Miguel
> >
>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E45D2E266C
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144933; cv=none; b=TEY5b2wOaOW+ngqj8IqI1WcmxHtHBjSAXhByX1CZ1G/3UQ9bAPUDck1CTj78A2/oOZbYKWh17pTWMDlYKom5C+mNCN8Ikcd+n9gQAgg02AdVmG7VPipQLwfxOCazuOopPfZfwy8qcLqVZef4kDiX86xepKPI70hPg+OyIgu0avI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144933; c=relaxed/simple;
	bh=yH8br7dalAFoJLqHWEwJGRgnfU9X9SlcieagzaNdJ1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eaV5NB81qyiotFdCKGhhnaNIGILAESmUl2iP8YFhJsWppf1jdKzkC8LtCSJVIySt6N7aOiPuBEiNr9KxqoZih4u6P4hs11qPi9W0HGMko3JIxGotYLLtroKnREfy6Rl9o9vO2c+rQuXL30R9fky+8G/2w39f6ofoFAuPveEFHyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZm2buh9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZm2buh9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04C6C19423
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775144932;
	bh=yH8br7dalAFoJLqHWEwJGRgnfU9X9SlcieagzaNdJ1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mZm2buh96mdtv9gCoVLaWXt6GJG+tp3XtDnDzunDW/oMUkBZo5704pFOlp1tOLGtP
	 US9wjTo1l2/w8ZROdWEkDRSsOaGFrJggdarWwCnAGw4v41scIgjbm9+wl1qY6n6a5G
	 eXY8eV+DCJKStftbqqJWnuahPg99gVOi2bQG3i8ZpNQsftouyJwFY7fwWOOy1kdk2B
	 DPD5inAIXwatNI4GtD14ExjdN3PTbHd0xvgQeFpETL6ldKnj9G4qvui3eBFblqItM9
	 inznP5MI2jxHozyp/0Og6Ui9Nca515pkM0R+2RQ+7lXIvhBxltrV75eRGsQ817BnbE
	 Hz70jDs13NcQA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a2f196cbaso8960491fa.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 08:48:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5i9cGsWwxQAy6gXaqc/CF+R01C2J/IF9WEW8YvhaStiQrRVI8OmhRPAi5YIqeCuo6sII8oj5p5DTlv/D4Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5k0mRvt5jtSk0qTE063OYOJ340MC+8XeQxXnu0p7TPMLqV/OP
	2blW8D8kkwWxOp/a6zAhw/55LBSK5qyks/wpMwZVwOC00GUWDz2lZWdxzKwbk4zgXf9h4H8VeO4
	gf9Qtg/Yq9TPP+AVcgjYxf2g3mPjr8fY=
X-Received: by 2002:a2e:a543:0:b0:38c:6a67:2f07 with SMTP id
 38308e7fff4ca-38cd37458a6mr13847401fa.20.1775144931659; Thu, 02 Apr 2026
 08:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9n4jgykD1L0kgyY6JUs8eV8w-JbuJ0K4_2PueWW5k=47A@mail.gmail.com>
 <CANiq72mNkLZTx2F9N15_K4w4kLNZytMzae0Y1XM=T26o6WqgrA@mail.gmail.com>
In-Reply-To: <CANiq72mNkLZTx2F9N15_K4w4kLNZytMzae0Y1XM=T26o6WqgrA@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 2 Apr 2026 11:48:14 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kgrd-hosX-BFLtBBy0BMYcdiOGar_0OQHO1GnvvJknuQ@mail.gmail.com>
X-Gm-Features: AQROBzBt36tRIwvJy5-A6-3H-nYRcN5_ZCrdSpNk4IKBzNqn3DSuD92AuNlAKNc
Message-ID: <CAJ-ks9kgrd-hosX-BFLtBBy0BMYcdiOGar_0OQHO1GnvvJknuQ@mail.gmail.com>
Subject: Re: [GIT PULL] Rust Analyzer for v7.1
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Eliot Courtney <ecourtney@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 5:35=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Mar 30, 2026 at 5:37=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > All commits have been in linux-next for at least 6 weeks.
>
> >   https://github.com/Rust-for-Linux/linux.git tags/rust-analyzer-v7.1
>
> Congratulations on your first PR!
>
> Merged into `rust-next` -- thank you!

Thanks!

> I noticed that the tag didn't seem to be in linux-next for that long,
> but I saw you rebased the branch (the commits seem to be the same, so
> I am not sure why) and I recall the reset of the branch initially, but
> isn't it more like 4 weeks, i.e. March? Or what am I missing?
>
> Cheers,
> Miguel

You're right, those commits have been there since March 9. I should've
been looking at CommitDate, but I wasn't. Apologies!

Regarding the rebase: I don't remember why -- perhaps I expected a conflict=
.

Cheers.
Tamir

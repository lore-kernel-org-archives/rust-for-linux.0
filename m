Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15E30EF7F
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 14:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768402633; cv=none; b=kxyzsJ/r0THoY32nSlxe+I5QlE8+LUAa8Q3nLbNyIjaUJVMqeMLqmlInlMAFBy4emKe0oKf+qNza2Qvlbj0RxKuKHh+ay+hs94eLryiEVO8neo4yu5h4L2GKeCOPZKEXf7T5d+nET4uCKJMKv4M8lilOCwsmWn5entYHBp2Kh/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768402633; c=relaxed/simple;
	bh=Nll7EpbN2rwvERFhmx0X4ABMOi+AtbkBVR+yHVIYV6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZ9GqlSSUGwU0AHqGGk0cTq0pU2xYswhySq1akvL14CrnNHGd7MlcwizCz3RNPK7O4baJpXxB1VtQL1tbHPlKs7aHBhtD/ToKXWuCfbnQjCiK1DeWBitQ5CF/jPeSiPujaJ1p3bEmBYEIfTuiXTb2n+TKYQ8BJaU4ptXibVGjgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkecpV4c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkecpV4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD630C2BC9E
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768402633;
	bh=Nll7EpbN2rwvERFhmx0X4ABMOi+AtbkBVR+yHVIYV6M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DkecpV4cE4ZseEDELWzeZe7AwIWZej/rPhKbWBCzlD/JoR8vidKfQA8SJoPpSGxjF
	 6Hbu4j8IM1wD8gQYZsxabvh9ucc8WBhvDu1w2eKmaMu7y+feB3sK53RPm0z1wmzoIk
	 KGZCQEWJetazqYTZwxemFdL2eZCOBLQeKXpAUL++73mgrhlSYkMO+nekAIvyuHUDoK
	 B0nbzmAQyvetGCrf2UG0Gv8yxP6fLLZbPJI2lre3qRE/nzTq/j7Ut5Rj7Ego6MyPZS
	 EsDoS4FYYMW2sM/5qhcwoDP4lI03SEDGwxlFSaw2+CkakcCHkJZbI3bmyzHy56xxsC
	 vwUl1AX6zWCSw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38305f05717so59775291fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 06:57:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpu+t+553WORnPpISKJy5Ypgd35qCuzl6SwjNJUmphiecyicEk3eehZ291s60/wS3bbN6YODMxWk/wAieEXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyABUgloW959a1YGV2zFVhAMjxXefZZlFIhUG0MWrt7KJD9TP1E
	6Yk+tYpMIZmeSKHtjjE7nYmoeaG79vtjG1Zpwa0aja1X9FczTVqetYollm0R3wNzTLcDVOmv4yu
	WxDloIx50gefQe4cLDe0pa0IWy/mSiiU=
X-Received: by 2002:a2e:bd06:0:b0:37f:c5ca:7111 with SMTP id
 38308e7fff4ca-383630de31amr7960571fa.42.1768402632349; Wed, 14 Jan 2026
 06:57:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <20250723-rust-analyzer-pin-init-v1-3-3c6956173c78@kernel.org>
 <DFO7DMI84JCC.1IAS0JWKKLNTZ@gmail.com> <CANiq72=rs4vu5RMY=hf7Q3MZe34tbq4XyOAMyDy9Nx5D6EhFjw@mail.gmail.com>
 <CANiq72=vbcntKJWypj072qrV2T+CoGRow0QQwh1Yrv8W+M5+Dg@mail.gmail.com>
In-Reply-To: <CANiq72=vbcntKJWypj072qrV2T+CoGRow0QQwh1Yrv8W+M5+Dg@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 14 Jan 2026 09:56:34 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9np7J1rFaaMfxW1j5Yi=Bd3X3yy4OCVPRt38Zat2Ghyyg@mail.gmail.com>
X-Gm-Features: AZwV_QjaPjIkwH1Kf-SErORF_rIu1A_p5lq_tUZnE444O7suwQ8hSaJyRwsEfZA
Message-ID: <CAJ-ks9np7J1rFaaMfxW1j5Yi=Bd3X3yy4OCVPRt38Zat2Ghyyg@mail.gmail.com>
Subject: Re: [PATCH 3/3] scripts: generate_rust_analyzer: Add
 pin_init_internal deps
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 5:32=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jan 14, 2026 at 11:29=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > I wonder, though -- should these be applied as fixes? After all, even
> > the commit hash is provided there, so we could add a Fixes too. They
> > could also be backported if needed.
>
> Ah, yeah, you already said that in the other two.
>
> In that case, we can take the three of them into `rust-fixes` directly.
>
> Cheers,
> Miguel

Sounds good to me. Miguel: do you need me to send a new version with
the Fixes tags, or can they be added in a reply or at apply time?

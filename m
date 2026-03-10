Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA512C11FE;
	Tue, 10 Mar 2026 16:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773161596; cv=none; b=SeAMOsprF5PRruDWUmnEsRG4xrvw9EhKALao9ZZiGiiZIghuqMYczdAjCXER6TDHtxJ3m3QLVNbGn+9Guz9boW3KP59IHoq9mLtbh1gXFTwhH/8+9KxuEMRMi3dLOqlO/eoe6IKw8oSp7TpAY0yQtcW0FYoysmyMPjHahiGe1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773161596; c=relaxed/simple;
	bh=TVNOIuMqq9dZcMDPP2WXg3Iy8G3SaJR08q0LXPu3bmI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZGUR2qmV7YKT6aK9nctAL/c13vdLy/T5F9X4NDe6lOiKUVfJ23AKgJbu/qRb8plKsah24SAw7E+89tzlwvO31cQkAv1059JZVWulBf3T1WHfrRZwl2/b++eJ8y6nR+3NzQSwe4DBfX+d8nA4u05oA3mjvcSjddaja97DBv/dwRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhGOAno1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhGOAno1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B5DC4AF09;
	Tue, 10 Mar 2026 16:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773161596;
	bh=TVNOIuMqq9dZcMDPP2WXg3Iy8G3SaJR08q0LXPu3bmI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=JhGOAno1peJOlPKmzd+SCU83Q2IWpxW3PZ5pcw4t0NQ4G2HAdnzTKG0u4s63seLEd
	 ydYclh9//xRt95ECm2cs40OBnag1NjhhHA/5m7DbXUyb6baaaqqDy54gApZOQU6GD8
	 P3uBXlDZht99jkeAlBEQhetmORUF7nwy+gE56Y6/kjPHGeg/R6tLzVd+Ylny5rdwvK
	 +NGvaB61KpuqazStBzF0TDIPMT6xaV6/4BY74CWBl0b1DCQT9EYjPWRx4H2F1H8lR3
	 xVzvYCkLNTRUnV9JftbToBgNDElPEG+6zIqjh4gvXSH/JwDUGJbt7sgTck/1gyt6YB
	 pTNJ4eVyGbXbg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 17:53:10 +0100
Message-Id: <DGZ9BP8JRU4V.1PYK1RR3U145T@kernel.org>
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310023145.120037-1-jhubbard@nvidia.com>
 <20260310023145.120037-2-jhubbard@nvidia.com>
 <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
In-Reply-To: <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>

On Tue Mar 10, 2026 at 2:51 PM CET, Miguel Ojeda wrote:
> On Tue, Mar 10, 2026 at 3:31=E2=80=AFAM John Hubbard <jhubbard@nvidia.com=
> wrote:
>>
>> +// CAST: every SZ_* value below fits in u64, so `as u64` is always loss=
less.
>
> Nit:
>
>     // CAST: Every `SZ_*` value below fits in `u64`, so `as u64` is
> always lossless.
>
> One alternative could be something like `sizes::u64::SZ_1M`, but if
> you expect to mix `usize` and `u64` often then it may not be great.

I have a slight preference towards this. It also shoudn't be that bad if we=
 need
both, as we could just keep the prefix, i.e. u64::SZ_1M.

> Regarding adding the constants or not, I am ambivalent. On one hand, I
> see the pain of repeating it; on the other hand, adding these only
> works for particular values (i.e. we still need the safe casts around
> anyway for other values).

In a lot of cases we won't need to go back and forth with those values, as =
all
of the DRM infrastructure works with u64. So, there'd be quite a lot of ove=
rhead
if everytime we want to initialize something in GPUVM, GPU Buddy, TTM, etc.=
 with
one of the SZ_* constants, i.e. we'd need to repeat u64::from_safe_cast(SZ_=
*)
over and over again. This is the main reason why I proposed to have u64 var=
iants
in the first place.

Technically, if they are not needed for anything else, we could also make t=
hem
GPU infrastructure, e.g. gpu::SZ_*. Additionally, we could have GPU specifi=
c
usize and isize types.

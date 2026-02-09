Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42146326941
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 08:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627519; cv=pass; b=KNo436nAeul0Q/ZQq5G7MNrQdW7fTA4Pgu8109GiGzwaN0vd758ZlW25UGduCyChzWNFJQur1yFfleTtvCxpmLWmOfIxl/H6JCsfIXiD0yOZNQt2rdfWjIJMIiDpwYidTb1M7eEkResFXa+gvUKsEPiJUfgCNJ7pqq+N8sUzaRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627519; c=relaxed/simple;
	bh=sZF8QioVPx66S52+o1qVUemA5DYc+9Uk6M8KZF1VQAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdaZl8us2mPNcZYPvKuiTjY1xeBfXr2QxABcmTkGIHgT+igte2OTrXMKZb86W6ajWY6V4Gd2Nm7lFdJcHaZLMzNaskLTbcl8z352Z2yuk+ZQHkiHI4oti+fKJKGU6B/biswUFtVZD2Wg5BcbXBrbx/b7oDrhwAmSw2lsSh+bChw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NhiJO4jS; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NhiJO4jS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43284ed32a0so2774379f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 00:58:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770627518; cv=none;
        d=google.com; s=arc-20240605;
        b=O1bss0G8OKDZJ+nR8MP0xLR76qZZdodp6wXM/tpx/23vE2k/XW0IH1WEbwOYwJwAk4
         7wt9hspIWSptRZPLKkzS+R3SJU17RK91e0285rgF+9gma1nxJ23ofra5Z/3wu27+tZwT
         ghxveYzmp8mSV5rhBX2/5HamHHeH08tMVr7ixjxl21wSPBqEbiGVyI5P/ZEqidR3lTod
         H6pPjphsgHq8n0k9TbMEn9OTTJCArfOQMEMRjk5l7Pmz4Z59bzYrTDJz4y10acA9dfy4
         jco5+LLDZhyhRS2vJw6KzoCRAViLJOFvvLWnVHYFYJVR+4ewzmCyONFZxGPMy6NPvy/t
         5BvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ep1Ke8qT73X8duJEqzvT5xFlLYeklNidWaAFB1OordM=;
        fh=fh3dIAZQbr6IKlXBAbtHWuzbCKSER4QGz3eV28vpsI8=;
        b=K6xBt4tyZYzNrtTY3C4Eq8ffCK0zZWqfuMGMlUgr9DI7tUy82Tx6njMMcP/OOAVkZY
         6C5sVT0LoTuu5imPYu7V5yF4Bi0Mm5s/W4GHvxNRkkaHsFlPX8IJibA+wHc3v3UQnbMP
         dT9zNY0rxC8PuwnPq+iY4sG8scqNZ++xQfNNsj5U3O6fSuz3v5zyVhwLCGRNnlh2qVIi
         urUNb38RGNAJ1nQHc3w0A7ptNPqMl24dayy+M6y/oHz7s+vc0k7dupJSHLud/U5lSLeX
         t2SsHgD0bIBvszdjFFRL9FwO1aOPeATBbKLBpYK0dZCfTdBE0aVpnnS/KoJ1gPvAmbiF
         fg8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770627518; x=1771232318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ep1Ke8qT73X8duJEqzvT5xFlLYeklNidWaAFB1OordM=;
        b=NhiJO4jSywbvNigbjXvWXF7o2yVlEKcYX3sHTf29i0QcjC57wYSAePLgnuStTfwDLU
         o2RUpD/VeHB+A1ZwY2Rexs1FulVKuUwTjcQ/6MdP+xqdWgHd8BFEiQXBmFJBwwxeA0/Q
         ns//tRa0qUSsy4drXsY/d1pSwB+z7Tt4/06FsjZSYXluueZfjNnvvLCoDi82KU7VRYr+
         6Kwou991CH1mNJa7NHCHXJLHtVWkfcdKZQMtOhQXU6I9VCP7O8bm+ACY9FyLk0DQdJOo
         fID0N3g+22rWlWFNH/6FKPJdB+N5flWCMz9a9V72HZAuZG0ghju/G8Fw1v1t1++sWNVP
         q9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627518; x=1771232318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ep1Ke8qT73X8duJEqzvT5xFlLYeklNidWaAFB1OordM=;
        b=v9T6ryy/mBwJidNxZNzjGgfdcsk9IxcN8SZF4j9LlEj72G/GIpHgwarbCaIS9CQAtP
         Iw+wV/C6XRSjmecyez7y3ojLDgqrE9euS7kbZnLYDlrQlSB8oJodf4Az9smJLjhX0NaN
         NEnm3uQxRVJPrnVGtguFLfrYy/lRwYFRjUIcclDdKFC7k0FfGpnT+EpSTh1m0OKD5vEL
         ALIK4/EOr3oOIV+zm1yTdc//ts0dtJwSEEVaN/CTGOZxu5aIQnbBwARiC2QZdVM01fQv
         RCZEPCG/W8Tx4db2vd3grkxfkoW+QEJ5Rq8q8lf7RcPYTXtCYqYd+qHr4uJRvUtXEoW7
         GHNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMiXWhKbJJmR6YxEuxUKOUwvvxrmuTUMcxFatmjA33kWpkzHl3NiTuFWSMxDBpIzWadLsGdPjZyXzuAeT7SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaZvnS6iEMIPZMOGMpbBtCddjW+xJjqk6HVR/IP1VRQyJyAOav
	2WpTt4/hVFlydlxAqLe7Pz4qxQcG6tLLInL/4uusZNqiLagQL156m6CNQpb33QpCRx29XxOysxL
	GjCTmltsPMOT3PmmbcCLlsMjXZ1b9/NVRkAEJhvvP
X-Gm-Gg: AZuq6aIe7GbYfwgYlDVGRMxQYuhDNDUfm8g/TXnrsgivhEJ2HGbVvU86VYgEHLZ5VdL
	bzJTRC5ii70d8eNqyYxwc9JlmDzGfZb9hefEYaaeAqQjguhngmqPM5Tl92fvQA1XvcfWM5P36jF
	74M9TeNTOzT90Ip45KoZLtXiExbtF38JWMOn1oomb/MrSDkvPJp0D559wRh2kQ7/PLCmiILqots
	+dQqH2oyIlRREMW7JyIRsKxbkQPPuZyfufAIqsUoMqxA2GnNIDQLko+gDpVoonDBUdDfeWI9cLu
	RC8RVNFcBMP/Q5Y877eOh3jF/HZOYVsE+rrSNwDP5R6vaJDHWzCrLAoNEA==
X-Received: by 2002:a05:6000:2889:b0:436:1116:fea0 with SMTP id
 ffacd0b85a97d-436293b267dmr13879681f8f.59.1770627517365; Mon, 09 Feb 2026
 00:58:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121183719.71659-1-ojeda@kernel.org> <aYmgjEWaLrdsubKM@monoceros>
In-Reply-To: <aYmgjEWaLrdsubKM@monoceros>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Feb 2026 09:58:24 +0100
X-Gm-Features: AZwV_QhznCYpnYoMY4YW_2SZsrqqWinsdT88yHc01cus7270kufkaww3dM4cdl8
Message-ID: <CAH5fLghHM7Wfe6n0FsOyEm2oHLUdLOf+OpZiXWnS+yRH4kJdCg@mail.gmail.com>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 9:56=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Miguel,
>
> On Wed, Jan 21, 2026 at 07:37:19PM +0100, Miguel Ojeda wrote:
> > The Rust kernel code should be kept `CLIPPY=3D1`-clean [1].
> >
> > Clippy reports:
> >
> >     error: this pattern reimplements `Option::unwrap_or`
> >       --> drivers/pwm/pwm_th1520.rs:64:5
> >        |
> >     64 | /     (match ns.checked_mul(rate_hz) {
> >     65 | |         Some(product) =3D> product,
> >     66 | |         None =3D> u64::MAX,
> >     67 | |     }) / NSEC_PER_SEC_U64
> >        | |______^ help: replace with: `ns.checked_mul(rate_hz).unwrap_o=
r(u64::MAX)`
> >        |
> >        =3D help: for further information visit https://rust-lang.github=
.io/rust-clippy/rust-1.92.0/index.html#manual_unwrap_or
> >        =3D note: `-D clippy::manual-unwrap-or` implied by `-D warnings`
> >        =3D help: to override `-D warnings` add `#[allow(clippy::manual_=
unwrap_or)]`
> >
> > Applying the suggestion then triggers:
> >
> >     error: manual saturating arithmetic
> >       --> drivers/pwm/pwm_th1520.rs:64:5
> >        |
> >     64 |     ns.checked_mul(rate_hz).unwrap_or(u64::MAX) / NSEC_PER_SEC=
_U64
> >        |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider=
 using `saturating_mul`: `ns.saturating_mul(rate_hz)`
> >        |
> >        =3D help: for further information visit https://rust-lang.github=
.io/rust-clippy/rust-1.92.0/index.html#manual_saturating_arithmetic
> >        =3D note: `-D clippy::manual-saturating-arithmetic` implied by `=
-D warnings`
> >        =3D help: to override `-D warnings` add `#[allow(clippy::manual_=
saturating_arithmetic)]`
> >
> > Thus fix it by using saturating arithmatic, which simplifies the code
> > as well.
> >
> > Link: https://rust-for-linux.com/contributing#submit-checklist-addendum=
 [1]
> > Fixes: e03724aac758 ("pwm: Add Rust driver for T-HEAD TH1520 SoC")
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > ---
>
> Looks good to me. I'll wait for Michal to add his blessing and then when
> picking it up tend to drop the Fixes line. Or do we also care about
> CLIPPY-cleanness in stable?

I think we do care about that.

Alice

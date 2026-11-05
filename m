Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914958;
	b=pDAbqtOIse8nkOjUkVb+6HiBAALkpQylvY+g8t6r8l6JESghrbZ76VzokwOy1gE1ONrr
	 r7JH3cqKHINSN2h8zdM9J0A2dxQrLKzYNSvzoqpjH2NYTIdQyw1ctHMh9t77IHsmhStM9
	 PGV2tp5njD4OFvfop+JXMu+qtVt7Vg9UNMg00yQ4aFm3t+qIv8PXTDVsM8OmAsiIAmbzV
	 PhiDwGiYfSH1DJRep4mPqAXR/8DxC8MlioQPVOrc1tKgCYhIIcOqocuwp5yxR+2vNbu3m
	 w00SMlCygZt33FaeVO9D9OgsHjVdMyLgIhtkpTIU6vGIYFpu1abDOIqXlYvqdSvN56Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
	b=wNZPsfQKavPcHD5OqQ0cDFiKKQboieGf2owVYds06qvsaVJttHMrIsJHrwhRVVd7r7U9
	 XNfUR7hX5hsbL6i6vYQ1laRK+Bqd4n+hgStcE1kuf+oQUhcQNYw+eznChxCx0VU8jZL3q
	 YFrn9NptxTY1jSsfXIju7NNgxqZG4htgFqR8Jz9PQwS7VnGtem2kx5/qx6sNjnUNtKErQ
	 fWnchPXj4QeaONpcxEzApDlMA0kUt1tS18jbEwOzvtrjlYR8FGN3dzzXYYweg46Pmu+gY
	 FwWiJnerOorDK2M9X6VgPFqtW81ZlrqJk48w1PTJSOb5HwAraZg1r5w2lORIBEqTJDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FOKXZ2N4;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15DA606A31B
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 21:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FOKXZ2N4
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40f29667e6so374639666b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 13:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793914956; x=1794519756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
        b=FOKXZ2N4Gzjv9OWvuQNEzSsQtPGNw8m8ICjNuJ7NRjYaoF4SLxBKFU+jLXUe1MDnoa
         kz0qoXqenznFzy7QiuJlJyx2wmIJ/yZBeTu/r509z0dPYdZVlB84cNm8gPiGLTAVtbJm
         Q0k1DbDEnslSLGeEd22QdyfqAVW1Lw5wsd2fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914956; x=1794519756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4SrHx4NDmSwFFwnd47qpoIo5tq1c/z5dpWsYBRL0Ro=;
        b=GxoVcuVJcYVJ+Bkr/aX283xWvZsuVL+R4uF6Grti3GePmO91W/Jqq2l88gtLdCpm+a
         gpyLQhyFcClAQeuUpC2Y+0+uYYmuQiL2tQt7JdUiu8iK6+6yqBRqQEeJ1A/B63gzN/Si
         4UHpLqwWAaAX+nug3TDeQAiKTlCw1WdSm6rFVlUExcZ9erpnwmOE04oT379dKMeVMuPr
         f9jNgBray17z3vyZ0kaY1Kh8O/4+xDbL0sIFOxEVXtD7mjQGJW1+OqpZYAQom5UBMB8B
         s7Fqw9DBn/64TpTELdXJh1Yi0ZkZ8C4e7vnUFtwj8wTdLy+MR811i5/1y5wXyANQi2XA
         v26g==
X-Forwarded-Encrypted: i=1; AKwUvBzwFqKZArCyOSyv6XESJZi6Dtn0asDapTVI6NsJPKtQZlev3FshbY1MQwUhkpL5CgcY5ZsQcl7uX6IjqSKLkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OzULKMu6wfqQlSBm0QBw4dGeglfbyNJiJKaeGivIq2avKp5/B
	L0rnO+3aofa5AbOsbWH1NCZtVbU4IaYCHd9Ro5c1Cqo45dV36KtHXMxynrns8NQvSsL+VYoREBo
	5R0xkiamk
X-Gm-Gg: AYBFou1XxG84Z/lCG9i6Zx3FIh4wpLYvP1+8bNZDC5s7P/c+UxIM5TbgSdi4jOSC9Df
	x0ALP7vOWUXG6Qxlw9nsdRfK3IWt7v5b6qdYw7ofZu2kOrncFGCWvy9oDaz5u9mOkxU+v1cZOzz
	vg+ogDOQxSoCtGfZgLDRT2gpNjMWMpchRp7vnBkup23xKF/zyQmz+lpoh4iyxxUajI4ZuONJOel
	LJLihwYPZFJpYNjV1so8aXKEhNtjctDYJqH4C3m/dKE4r37HlhWHqUNq8gcEm2jCRpzPqt+S2YP
	WzfKydrs9K6Uy1dQPyovDDor4QW9LcZrXAprTj/ZEbJQWRCc6myUW36eWrTTbJwPmq4aaI3e2Ll
	DkT4lbz0FqcCHf9OaC15Gl6HUhNlk3dPXql2KZhZ+NpOLz+bz3E3hgR9QScxv6FtxBmpXzLjQ2u
	wGVUe/o0kzuRkEI90adFeJ62ZQcUwc0b7p5pH976uBocyjphZew38UF2xYOXMObJEL43SIBbmzz
	JPIMYpAPT9auebZMrAKHtS8lQVRCsnVd6UHnLdgpkwDFElzLflAqgbki5LCIZjD50NdsbrJlN7T
	/HTC54smIjd2FT0RrEZnJzL/vUF+l+Z56kufPcKG3tXCFzhBbfoo79UpBuZc6vDJjoxJ
X-Received: by 2002:a17:906:f5a1:b0:c4d:906:e979 with SMTP id a640c23a62f3a-c4d35262ef7mr60840866b.3.1793914955978;
        Thu, 05 Nov 2026 13:42:35 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3562df86sm19285966b.24.2026.11.05.13.42.35
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:42:35 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40f29667e6so374638866b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 13:42:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBziHTa9BHCy61CfSsDfdfBLNtVk5NKLly8LxrfKxGyXCCz8DQKl54zN2kkG72HVYDT/G03GgaCi0dtXa+sBxA==@vger.kernel.org
X-Received: by 2002:a05:6000:385:b0:492:b1c5:6db4 with SMTP id
 ffacd0b85a97d-492b1c56de6mr417579f8f.26.1793914590008; Thu, 05 Nov 2026
 13:36:30 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
In-Reply-To: <CANiq72==m058rRQfZTLSsSSSRhNLgSEkLnREmAo=52Vj70yWdg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 13:36:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XbBPOmuHZBuQVPQeA876CA7y79rGc4SL43e+At2+nMMw@mail.gmail.com>
X-Gm-Features: AclHuK_BAv4LnN1aXcM3KqfNxo3MqIMIcKw4DlHvuup3PEDMGIp0DVrOUgx1RpA
Message-ID: <CAD=FV=XbBPOmuHZBuQVPQeA876CA7y79rGc4SL43e+At2+nMMw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 11:47=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Nov 5, 2026 at 2:46=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> >
> > Enable LLVM stale profile salvaging (-salvage-stale-profile, supported
> > since LLVM 17) for C, Rust, and ThinLTO builds when
>
> > +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-salvage-stale-profile
>
> I double-checked that the flag was introduced in LLVM 17 as the cover
> letter mentions, and so it is likely fine given the Rust 1.85.0
> compiler (i.e. our minimum) supports LLVM 18 as the minimum major
> version, but if the patch goes ahead in the end, then we should make
> sure it works well with that one (or probably you already did, in
> which case, please ignore this!).

I haven't extensively tested the behavior across many versions of
rust. If you are worried, I guess we could remove the rustflags part
of the change? ...or, of course, we could just fully drop this patch
(and maybe add `-fno-sample-profile-use-profi` instead) ?

-Doug

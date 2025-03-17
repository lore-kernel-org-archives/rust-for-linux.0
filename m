Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF62222D2
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208345; cv=none; b=ksec2wRThcc7fqpmjWsGoZxl2AG1KhU/GfWVcCVVyFdzNwlw+4QGAHGpQcrzP8gk/e14IFEeRGkL+Ponfus589UeRZdbc4l6f+kSNcacSvXXEf8iWJykJRdeenqn1YdPrweqJ6BJqEJ5HLahsq4S9wzsIEz+/CrQieotFn28NK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208345; c=relaxed/simple;
	bh=qEUsMqL0xbq1BuNSIqcD/cL1QjhMxfBy0vCE/OsOcSU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=llX5DXbU11JiuUv7Deb8Fo/+SGKQYJCzA4SvSXYKczUJJL6XQAVF51jfDp/4YnSMRiLZsVMSUKdfTsrdPh6wnuxoq8VAIpEItVTPpqWjmRacbLVD6/4VeMsFOyeY5s6OBf2XGqrZq5bCvymYHT9L9Qt5+wdbLA3H6wBBi+ZkXig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=f9hRLIZU; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="f9hRLIZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=jk32gevgy5cmdiaxj56sdk6bti.protonmail; t=1742208335; x=1742467535;
	bh=l/3rpGFXqKUZ70O8CF/LgCCd/v+/i1KdDvKgkaAMmQ4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=f9hRLIZUet2TqYfjN2qdkwMdZ9VpvK58LyQP7eTjJsNrrm1YTDgZ83ZAFfwMxyHog
	 DPGBFrOerDRma3ft2UJofrnbEL9uql+wv0g63IoOZve/BIjrqWYuJh65MXXlGhxQO9
	 d8QMh7FOs+KHmK368JfJ90MIuufPgss+bsunzlggUNH56TQ9SuAYsz2UFwdXK94/XN
	 YHQUv5XIDSduz+WZcqdzcmH5942T9FqwzR07jJGY8PV3gdB8fooi7VBIokRWjoblv7
	 kb1GcFFBZrGjLoSgb4Jd51Fk6jJzBEh9bFxbDFxpevzqIHs8lGjG+v2QN5onqZWKW/
	 hQae6qrN0EKGw==
Date: Mon, 17 Mar 2025 10:45:27 +0000
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 00/22] make pin-init into a standalone crate
Message-ID: <D8IHB1O3SDZB.1YRPCTVFR5YXS@proton.me>
In-Reply-To: <CANiq72kg2-5PC4T_ieFTN9dqeMnZ0H5TqqPhW+GxB7fPV0COVQ@mail.gmail.com>
References: <20250308110339.2997091-1-benno.lossin@proton.me> <CANiq72kg2-5PC4T_ieFTN9dqeMnZ0H5TqqPhW+GxB7fPV0COVQ@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 5e1e29b6d6615a96fc5091bf73a2915437748fb9
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun Mar 16, 2025 at 10:07 PM CET, Miguel Ojeda wrote:
> On Sat, Mar 8, 2025 at 12:04=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
>>
>> Special thanks to Miguel for helping me a lot with getting the series
>> ready!
>
> You're welcome -- I hope pin-init's life will be easier now that this
> is finally in :)
>
> I had to do a couple re-arrangements to keep it building (and
> `rustdoc`) for every commit on top of the `rust-next` we already had
> -- please see below.

Took a quick look, LGTM :)

---
Cheers,
Benno

> Applied to `rust-next` -- thanks everyone!
>
>     [ Remove the `expect` (and thus the `lint_reasons` feature) since
>       the tree now uses `quote!` from `rust/macros/export.rs`. Remove the
>       `TokenStream` import removal, since it is now used as well.
>
>       In addition, temporarily (i.e. just for this commit) use an `--exte=
rn
>       force:alloc` to prevent an unknown `new_uninit` error in the `rustd=
oc`
>       target. For context, please see a similar case in:
>
>           https://lore.kernel.org/lkml/20240422090644.525520-1-ojeda@kern=
el.org/
>
>       And adjusted the message above. - Miguel ]
>
>     [ Undo the temporary `--extern force:alloc` since now we have content=
s
>       for `alloc` here. - Miguel ]
>
> Cheers,
> Miguel



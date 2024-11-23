Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9299C2309A9
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732399022; cv=none; b=HdjWI0QDNn2a+nKe0adomGlkqnJzoITnkIREHfxAgoMKMwWiQRKw+3y88BOu8mi6RFEs0Vy60AzYZrFq1sBZ6ua9jNH6wdF6uEr/eMPPV+/rnKC0XhaFmC9ihbbx2M3ZclpTvraUQEfrDmbFQF6y8Sp224u/UXTm679YttcEALI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732399022; c=relaxed/simple;
	bh=sS9Wk7Ic4C9TsRdcOlXtgwbS5ak7x6qas9H7ov7MmTg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OpJL1t066ze6qMoYZV7Tda0lRu4hSVSpPF9NM/pyHjj6h9ZFM/lODym7UAhsZLYi9Yd1LkXRsoBaL1AimL+QXT2NyYUEUlY7JqLSCCPSQlPvNA8orRUZOAlIkhaqpzuL9TMpB8mjgGYLdBJCrw8veME5b9VgOpNUHNYgJoWFPnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io; spf=pass smtp.mailfrom=mandragore.io; dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b=c1QLe6of; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandragore.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b="c1QLe6of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandragore.io;
	s=protonmail3; t=1732399010; x=1732658210;
	bh=sS9Wk7Ic4C9TsRdcOlXtgwbS5ak7x6qas9H7ov7MmTg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=c1QLe6ofIJvlmSFcSs2s2AiY8qEK+eYcGs5o9yH8cRh/TCfZU7nD+5UgXW4KjZAMH
	 MjJ0j5d8kEVqiKNCOUpukOMHh0LjCZjx5YqAzSSMDiJglTWNQCNGu8b8HyWOigelp4
	 lUhCwMnSDU6ZLMA7bCEsHAgioEsYJM2alTQMWwM1S/3vYHayDedXaugGeSVbtDUwQb
	 fagOMPL4ltsXh+sN9h10jMNpo+PgkChcYyzZcVWcflRVzrfz0N8fkbuhc2S4Pp/hlH
	 mJImlQM+5yR/r3Bi3JbPkGGCaxRuVQYSe1VzX5RIEHh/3/Q92nc4hE40QD1HZ/baun
	 HQb9AVDu9/qPQ==
Date: Sat, 23 Nov 2024 21:56:46 +0000
To: Rasmus Villemoes <ravi@prevas.dk>
From: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: add safety comment in rust_fmt_argument
Message-ID: <caEePXpz3dyKABs5ReUO5NGlpbqf98_Aw_8tz9ADE6c1c8hYp523uGk7l9EcfSD0u-YLtozTD4wwgLEytbzzm6gnd3r6jQeXqr0Fo3YEYtM=@mandragore.io>
In-Reply-To: <87ed34ly80.fsf@prevas.dk>
References: <20241118031225.38080-1-kernel@mandragore.io> <87ed34ly80.fsf@prevas.dk>
Feedback-ID: 125704292:user:proton
X-Pm-Message-ID: b25e1e53015c71da5d14de3d1f397ee7eeb29c7b
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, November 21st, 2024 at 10:42 AM, Rasmus Villemoes <ravi@prevas=
.dk> wrote:

> Nit: The file implementing this is vsprintf.c, but the actual workhorse
> is vsnprintf() (note the n); all other *printf() variants are wrappers
> around that, and I'm pretty sure no code path called from Rust ends up
> passing through sprintf() or vsprintf(). Yes, I see that the original
> code said vsprintf, but please fix while here.
>

Thanks for the comments! Going through the code again, I see that
rust_fmt_argument is directly called from the pointer function in vsprintf.=
c

But pointer is not only called from vsnprintf. It is also called in
vbin_printf and bstr_printf. Should this be reflected in rust_fmt_argument'=
s
documentation, or are these functions unreachable from rust code?

Perhaps the docs should just mention pointer()? Maybe the original comment
used "vsprintf" to refer collectively to all these functions?

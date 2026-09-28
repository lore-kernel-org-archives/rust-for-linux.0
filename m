Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2CD1F5842
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588243; cv=none; b=RknQkvGiZiR4VsRqE3QEMSOWBqmZ71hCf6c3NeVF1dZI96QZSYhh1iZ0kaLdAy5j9/WTncocftWGIkQWPsMDY5rkI3QmkmLUlzHJxb7BOeijKjZ/dB0FIW8bHYXFBxl0xsXECoX12c74FvHoNswU/BfNzc7chMVKW5iBDhYJqGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588243; c=relaxed/simple;
	bh=WrFBtu7RFclaoHFiCG5CNeOesRF1Pa/X8J77td7TvOw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CavBBk5UNMrOgkjVje4UHVJ3hPhuSizFekUHHYMZQt/sOFY/WUvD8QgWug17pbfYPZTPt9zbxLmJEj1No/exNtGURx0AosLp83D1iDqmtMh+DwOrZ8Lw/ScTE39iZCkOCswaWvauPX6LEUJFxqj+Utn236jRw+clDjxFvwIE/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1AnKZXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1AnKZXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F63B1F000FF;
	Mon, 28 Sep 2026 09:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790588242;
	bh=o06OlmiglmrAzMJUZZ73PvZm66McFHQXzeK/yiF27YM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Z1AnKZXlUKn7RFz/esz1B+603f0z/s8zIV7mvdGq/lEG4KNJAdzpfNT2UzYPIkHyI
	 TXODi4H2L07a5f1s0T2TsiioXr2BbqXbm3EI53Gk1xUQFfbEiSbGtFNu97FyaY0n6E
	 JwZ94RNi5/kXfRPB1JSccXskHXwnIihRI71+H16ZvSGZ33Iu1dJ2HetAxPcTsc9Ptf
	 t+Zg3JWlemrDO5xw3p6W1U4RRN+bFweiJOaWVDujpEb3SJDC5LIoJWzjYmadsk6/gA
	 abSmA9g1U30jBzZ0qUUSGmiFaaelCJRuxoti+U3CfluoBxAXayd465cZyrqMxYnA04
	 KQfmaLSFI8MEw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, FUJITA Tomonori
 <tomo@flapping.org>
Cc: gary@garyguo.net, ojeda@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v4 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
In-Reply-To: <CANiq72=iYeD0AZCRb6X_1BMR1OBxGrzy6j45ZAq5C41+giG5dA@mail.gmail.com>
References: <N-9g7-JCEv-O-X7-hryv99BRSZvftBvpmaAmWdwRp9b9Gi64FWr6GAtnUToRHlX86lCBJgEKPQine1a1NsJcUg==@protonmail.internalid>
 <20260924232530.446588-3-tomo@flapping.org>
 <87zex52224.fsf@t14s.mail-host-address-is-not-set>
 <20260925.183924.808421603238938986.tomo@flapping.org>
 <CANiq72=iYeD0AZCRb6X_1BMR1OBxGrzy6j45ZAq5C41+giG5dA@mail.gmail.com>
Date: Mon, 28 Sep 2026 11:37:12 +0200
Message-ID: <87qzidu37b.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Sep 25, 2026 at 11:39=E2=80=AFAM FUJITA Tomonori <tomo@flapping.o=
rg> wrote:
>>
>> I think that the reason is the kernel image size. From commit
>> e74b7a3f5aee ("rust: tests: add Kconfig for KUnit test"):
>>
>>   All the tests are compiled unconditionally now, which adds ~200 kB to
>>   the kernel image for me on x86_64. As Rust matures, this bloating will
>>   inevitably grow.
>
> Quick note on that commit: it wasn't really "unconditional", i.e. one
> could still disable KUnit or make it `m` (I should have probably added
> a note to that commit message...). But some maintainers prefer
> fine-grained options, which is reasonable (though overdoing it may
> mean a lot of Kconfig options that most users do not care about).

I would prefer to just enable the tests as soon as kunit is enabled if
that is OK.

Best regards,
Andreas Hindborg


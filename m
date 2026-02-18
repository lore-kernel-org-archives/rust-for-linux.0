Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C85B32ED37;
	Wed, 18 Feb 2026 14:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771425749; cv=none; b=CDuu/lMEM1PMnoaHuWj+TvThmGpgRXV9F3dkRWN48+pbwmJ+yybxpmo5vMm8x5D6f90d8vtpSIGQ4GCPNJcGulq4itSm0xXDwU0PbSndWmcqnNo4+i1+SNgGh26NOV0JvEpdb+1wnmLs15Jl5znHasL5nnyE2dbuFyCFikKUaX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771425749; c=relaxed/simple;
	bh=6GPMVdt+2peIzfNOCgaGLfLM2Thd6H8NgtP6G0RDwEg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=iCdFpt6qFszcLo5+D4Lz3/yS30o1WaXtHvGZOasvoeHT49VLjGEruAOMerM5AFxyW65t4TvQe7in0AboUSkSGBgHAkH49x8n/MBleSivn62bHF6TmQlnTO4djtm9rKZjxUj8D7WXvXSG3BEEh16tNfSRmL6SSzsFpPSEmQHfuYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOuraL88; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOuraL88"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538D6C116D0;
	Wed, 18 Feb 2026 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771425748;
	bh=6GPMVdt+2peIzfNOCgaGLfLM2Thd6H8NgtP6G0RDwEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOuraL88EbRfrvLI1WBAyqV6X1XC3KTqovM1+IdLWw5Rcd/bInss17hx4iZLH8YzR
	 PdtMHLan4I9P7JhvOvEhDqv4mVBgfhaKg7Ceh2KaQMs7BSfXxt8Z2FRvdznrzwDxA2
	 nVoZSFzVtHd7J82khdVqpnmsHzKxOMM7z0g70b2hAhRwuUTvd3ej5omsZ3zXcphzSQ
	 o1Au9Ip8mxgLVlblTAo647x7SRcp6PtkoGiEcT4HysQW2j53ecV4CBhVWivu8KMv5+
	 Z8BE+o/9fHcQVjyBT1C8n9li8Oyl4qZhAQQT8ukbxUuY9qbcOlx+TfH2VvJL3LXh+Z
	 EqqCOHsOty3bA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 15:42:23 +0100
Message-Id: <DGI60O54OUA2.3ULIYWOL6YO5Q@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Will Deacon" <will@kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "Mark Rutland" <mark.rutland@arm.com>,
 <linux-mm@kvack.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
X-Mailer: aerc 0.21.0
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <CANiq72=5r2miRm6GWszb2gDNi4k5-RZUzvdOdFQ3yyndvmHbAA@mail.gmail.com>
 <CAH5fLgi6NVagOPA_=r7Dmk9MFXrvZVuq85D9bsJfUqLNOZjCaA@mail.gmail.com>
In-Reply-To: <CAH5fLgi6NVagOPA_=r7Dmk9MFXrvZVuq85D9bsJfUqLNOZjCaA@mail.gmail.com>

On Wed Feb 18, 2026 at 1:00 PM CET, Alice Ryhl wrote:
> On Wed, Feb 18, 2026 at 12:57=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>> > +    /// - For the duration of the call, other accesses to the areas d=
escribed by `src` and `len`,
>> > +    ///   must not cause data races (defined by [`LKMM`]) against ato=
mic operations executed by this
>> > +    ///   function. Note that if all other accesses are atomic, then =
this safety requirement is
>> > +    ///   trivially fulfilled.
>>
>> And, for this one, Benno said perhaps we should introduce a shorthand.
>
> valid for atomic reads?

Yes, in particular it should be folded in with the "valid for reads"
above, since that would otherwise be conflicting.

Cheers,
Benno

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286E14F70
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Aug 2025 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756046467; cv=none; b=bTW10rYrVDSGIzqWsBkaChf6uEwwpXufkbEY9QlyrfN8dOc6oIazfNIi6EpnkDAewgPreGZdOkFF4WIDKg4rffo4YSCDmOohgUyBn0yP3h4lua52Mz9riRZ7mx9/lWJLdbXh2iTudjjhRy1uxM7pyRn6ST60phtSWFYOjG5eXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756046467; c=relaxed/simple;
	bh=owSm49TeC5mzqgkZby36h3+WNAUl4LBe3qXcknyIcXI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=YpOQRQ+lYuETl01l0pyj6gUfWHoZFiRyhW9PThhY7AzdljeA3Kpms0fu+hUDe8ACSr2OHWTUbGBBx6uo2DqrD/o9GlgaHr03KmCvm9taXI0h4ox7RTCWAVMJ5tFxZDOvsfKCOnQbs8p+rvVWdsPxNgjW1Izlw9rLlkHjYwIdwtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Muzr9Hae; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Muzr9Hae"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464A9C4CEEB;
	Sun, 24 Aug 2025 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756046467;
	bh=owSm49TeC5mzqgkZby36h3+WNAUl4LBe3qXcknyIcXI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Muzr9Hae+TODCvU0qdHFU2z1+151Zf07za5TgVHmnxNO3qDjp427SN/S+uf6bmAjq
	 TIUSDTNXYCE7Oo9cW0GhN1PER96XXwLq0ymbFe+vADiSCOM485jAZMBjLWPGNqNxLM
	 I2bFBnYweYfjrI4AbyYij/8cBCdkKdtnmmWEpJ0vVYdeeypEJ22mR0lfm/PNqYsg6C
	 IgOeVa3DLOCrGcjSRd/qvrSZBW5Dl1J644hQ2mocwEJIo5nnTB4Ye4Y1/mpRtNGmhE
	 cH55ZRa9OtCVmskG6FwxcjvDxi69WaNKVNYl69lolOhaICkWcGaCSjlzL+74FPOEiy
	 V11ILETVlIstg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 Aug 2025 16:41:00 +0200
Message-Id: <DCAQIN9545EF.3JSBD6IQI1PXW@kernel.org>
Subject: Re: [PATCH] rust: alloc: add missing trait item MIN_ALIGN to
 Cmalloc
Cc: "David Gow" <davidgow@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>, <Liam.Howlett@oracle.com>,
 <urezki@gmail.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-mm@kvack.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250824120656.208978-1-dakr@kernel.org>
 <CAH5fLgjkqcyzoZD7PP2i4g4r2uqpdbDKVW5hLfm6c9ysbxkPuw@mail.gmail.com>
 <DCAOH44U57K3.2CVDYWF8MJBWL@kernel.org>
 <DCAOREAIJOR9.2N5JW0SC9YT93@kernel.org>
 <DCAOZLKAFK8Y.43MJ1XPUJ1OG@kernel.org>
 <CANiq72=Xp-u16fboZJvdRZCveRtAJLSTsiJMMDXsd2saKCU26w@mail.gmail.com>
In-Reply-To: <CANiq72=Xp-u16fboZJvdRZCveRtAJLSTsiJMMDXsd2saKCU26w@mail.gmail.com>

On Sun Aug 24, 2025 at 4:07 PM CEST, Miguel Ojeda wrote:
> Yeah, since 1b1a946dc2b5 is in the same branch, and David already
> reviewed the main patch too, I think it is easier for you than trying
> to deal with all this otherwise.

Yeah, I also think there's nothing to backport.

I.e. the fact that Cmalloc does not provide the same minimum alignment
guarantees as Kmalloc and Vmalloc is not an issue for existing upstream cod=
e.

And fixing it for potential additions to the rusttest target in downstream =
code
doesn't seem worth the effort.

> For the other fix I sent that you already applied through DRM, I think
> we did the right thing, because it was not `alloc-next` and it was
> fairly trivial, so it made sense.

Yes, that one is correct.

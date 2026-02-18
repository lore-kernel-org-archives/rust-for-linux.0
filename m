Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABE12E1C7C;
	Wed, 18 Feb 2026 19:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771443092; cv=none; b=bVtZOZnKsZE+jAO5Jzh6SPgfEIfADbM6MV9q+YLGjm32fHVm++w1/HMqB+eLZLEY+pDoZQ/1z5YAsKJTMRx3DY828t6p7P5hB8zr7TqEBCjC/97IO0f1Ou+lhmZl5XiSy4IVBXe9bkhejn675FGbYfT32JbECQE03aKGmSTNSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771443092; c=relaxed/simple;
	bh=w1+gNmcHaxBC6fteJPcr3HuPAHfHBQXuEOszRg4xdjU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lB2qr+5S2L+gxS2RLTRituFUhm7pELnrXwZd5y8cB0WNh2ujeEcyzE2imebL2GTasjEF0A9y/Y+51CsUxssvCdB89C9AIE+83duY6hb4AwOd4ThFc0aqrKVd2W6pz+YWtT4pp6tQ6rhETMY9gPpnDtAoSqoKUuDwHKJUkssXJwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzKmFwsh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzKmFwsh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4985C116D0;
	Wed, 18 Feb 2026 19:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771443092;
	bh=w1+gNmcHaxBC6fteJPcr3HuPAHfHBQXuEOszRg4xdjU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IzKmFwshWYUV4fzrW23ewqAH30LHnD1/WiOyfUXGIrJ5TRo2kDUfQihskJaCkr1il
	 uEnrn+X0x1AlIa76suqV0IbwEiD9p4JLUXv0pybup9v37ohPFPazsrb8GnhIfiE7Jh
	 fJHtphDR5Spqu6PYDs8uhA2q2oZ1C8dYdIZsG48gGPyBZx/gPdad+IiCMQnVeMmPJT
	 Xsyqz+UQIft6zYiS+ehP3U/v9WdAEl5Ak7HOy7Qu/c7ej6l5wXEg/C8aq8IXXVeQke
	 5Vdqg3GFM3+p0ApB3YD+mWJIxJc8Aw51QQH1rae54cNfCla74LNvyzGE86T9Ujmchk
	 dcRFmGNmf7pDg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: hrtimer: document handle based design rationale
In-Reply-To: <aZTV6QPLDlF8_2B2@tardis.local>
References: <20260215-hrtimer-docs-v1-1-bff6a6c0d923@kernel.org>
 <w9M3-nQUCPZaiu1NQjuNk7nUcX8wlTLnfQULL71We74g3tq8548tFeXI0Cfgxe6wEhIHtK5xHaLZbke1PzJTKA==@protonmail.internalid>
 <aZTV6QPLDlF8_2B2@tardis.local>
Date: Wed, 18 Feb 2026 20:31:06 +0100
Message-ID: <87ms15c0hx.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun@kernel.org> writes:

> On Sun, Feb 15, 2026 at 09:36:04PM +0100, Andreas Hindborg wrote:
>> Add implementation notes explaining why the hrtimer abstraction uses a
>> handle based approach.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Thanks for adding this!
>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
>
> However I feel these are not just implementation details. They are the
> design decision we made because of the limitation you mentioned. Maybe
> make them "//!" doc comment and just put them as a separate section that
> describes the necessity of handles? Thoughts?

I don't think these details are important for the reader of the API? If
you just want to use a timer, this is not something you want to read
through.


Best regards,
Andreas Hindborg




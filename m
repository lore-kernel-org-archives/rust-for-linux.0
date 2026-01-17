Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98F4135A53;
	Sat, 17 Jan 2026 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768680591; cv=none; b=Oe0hbeGokgjcyztKL5vq9KoLv8iGt0YmZggFCVSNZikpqcCclsIgEYK4H1p2jYM8HmaSYlpT7L5MM5bt7UuknrtlR1JepbH4Iw3iN9D2J0rdFM4VmJHw18s0qp4AMvcj1gR2ehVF14moD2p7nMKu6wujcYRQ3/L8N7FjexC2ZWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768680591; c=relaxed/simple;
	bh=UzXnGiD6HRRAze2nlepz1dov1cWD85qtAN8gtEQ7r6I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uTGb9u3g9bs7E9XkZqeX0bfnUNGnMX2HICCNniQX5vWf+j6/F2FPZpkXkmFXFcCzY26y9rEuLigPDNQaSoPOAKaXA8kFUCOpgdY1T9xEWaEFjtokypQiVt4U+FVWX3jjr9EZYGeuDqSvLj6+X7kbJfMbRFJnRva9S9MV5msXmb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJePd+Pv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJePd+Pv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBC9C4CEF7;
	Sat, 17 Jan 2026 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768680591;
	bh=UzXnGiD6HRRAze2nlepz1dov1cWD85qtAN8gtEQ7r6I=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=FJePd+PvHwjvzDbXy/W/F73KrOZYxE3OobW0lWpez7E2CW7mYKhzvWl43w1SIwLx2
	 4L/xL9kZyoyDj80Y0iCcNdQvZ6FWiHIRNYcaGJsEy9W309I0FwDWs1EToao5o7KdD9
	 P5T7oB5mtDnmqBPMfq+RNf6efSvZvLam8VMv7rhv9GMLJpYrV59btLINDUjpQsW0DT
	 7vmpfF5+/2rFVyN02TfCTO/R093Gu3aQNzEDXCWcFtaDhRM7MQ+9Lwlo0rJaaR633U
	 TcoQqwy0MMxqWen73utKTkmXtx0d9UMsIBZZF2J8JahVC+vg4ZLQkwketV1qEp7/yB
	 AMxQPd7i5frJA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 21:09:47 +0100
Message-Id: <DFR4XWXUHLN6.1L05RWCOBEVV0@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: macros: support `#[cfg]` properly in
 `#[vtable]` macro.
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Tamir Duberstein" <tamird@gmail.com>
X-Mailer: aerc 0.21.0
References: <CAJ-ks9=CXCuE+NDnu_SsFwQKLsc4yz+GuRh4pD=DQ-7KFdaOPA@mail.gmail.com> <20260113170529.2240744-1-gary@kernel.org>
In-Reply-To: <20260113170529.2240744-1-gary@kernel.org>

On Tue Jan 13, 2026 at 6:05 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Currently, we generate `HAS_` constants as long as the definition exists =
in
> the source, regardless if it is cfg-ed out or not.
>
> Currently, uses of `#[cfg]` present in both trait and impl, so it is not =
a
> problem; however if only the impl side uses `#[cfg]` then `HAS_` constant=
s
> will incorrectly be true while it shouldnt't.
>
> With `syn` support, we can now implement `#[cfg]` handling properly by
> propagating the `#[cfg]` attributes to the constants.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  rust/macros/helpers.rs |  6 ++++++
>  rust/macros/vtable.rs  | 13 ++++---------
>  2 files changed, 10 insertions(+), 9 deletions(-)

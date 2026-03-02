Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B2A3563EB;
	Mon,  2 Mar 2026 18:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477834; cv=none; b=t/irSLoEewpupd2LQADYSxAAMT0SaOtMPjrrLgs/+rv0tL48Rr2ZBrZI25SVeTluOgg2ihroqMc7/FKkMYRfkL0srz1GAeqwKST8rUd8Ko0HYlnnCCNFVfeUERjGcCHlROMqZ51i3/z7LfvzTivKtKzi4kHpQAx8BR3TJg5WapQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477834; c=relaxed/simple;
	bh=tLe3zQF3kIxrz3jMpM5RUk7otC0FuIBOV2TUEhwM/qk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=pm5UMP/rKvFPVpprs//INlMtVqLRfNqBxasJgHHlujV6gk4LIsHd3/j6wccP3mOHJZkzIG3B4Gi+J4IiYXlneC/68coErxOks2PsrtfYCDhe16h91w/di+kWYBUgdcIAX4ThXdjABmbUT/UKB/hbruG8v+NFNRcAvyGuX8UJUw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TozDleE+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TozDleE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA7CC19425;
	Mon,  2 Mar 2026 18:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772477833;
	bh=tLe3zQF3kIxrz3jMpM5RUk7otC0FuIBOV2TUEhwM/qk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=TozDleE+u5Uk196VGVD1f4Kz/Q7paM0WAai+fhXbQ/cz3MvQMksv8NK9y1S21P+2E
	 NZ9xyK6vFtjXSdUfRbcBh/f4JOeL2oJ9gIksnyhT1EmgTa0l1OVLEGf+Q+ZB3ibHmc
	 Ojo0eGbaUXDoMZ0aoOC8HErfGzioXUqVhhrNczluWRyf1hqXgz5GwdA/gC4StthXM1
	 WfEXN9e9D+kDHwpZcOYV9+M5RIbeguhWUfhFV1ZAtYya0RD6LNSEgihRvW+/zDegfS
	 Nqq15hQNjwENtvreQkhlDT4GF3aNKbF2r4Sbd+bm0a4AttpQOC8lYdqBVov0ira4MX
	 OZEPrEqYG0/fQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 19:57:10 +0100
Message-Id: <DGSIYA7A879T.2XI2BBJGPRC34@kernel.org>
Subject: Re: [PATCH v4 1/3] rust: ptr: add `KnownSize` trait to support DST
 size info extraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302164239.284084-1-gary@kernel.org>
 <20260302164239.284084-2-gary@kernel.org>
In-Reply-To: <20260302164239.284084-2-gary@kernel.org>

On Mon Mar 2, 2026 at 5:42 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Add a `KnownSize` trait which is used obtain a size from a raw pointer's
> metadata. This makes it possible to obtain size information on a raw slic=
e
> pointer. This is similar to Rust `core::mem::size_of_val_raw` which is no=
t
> yet stable.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/lib.rs |  1 +
>  rust/kernel/ptr.rs | 27 ++++++++++++++++++++++++++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3da92f18f4ee..510cc7fe4961 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -20,6 +20,7 @@
>  #![feature(generic_nonzero)]
>  #![feature(inline_const)]
>  #![feature(pointer_is_aligned)]
> +#![feature(slice_ptr_len)]

Oh and this is also missing a stability comment.

Cheers,
Benno

>  //
>  // Stable since Rust 1.80.0.
>  #![feature(slice_flatten)]

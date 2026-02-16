Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71534278753
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232120; cv=none; b=UJ0iPsYXQIwmP7Dsl/5YxuYQLgsMSQhk2RUwFSZ1IPwoBN8XR13Nfz6gjMdmFVDtqLrNNVb9s0LmLjILtP//aC76EP4J67Nr15DBlgFnOTcVA5jLhn8zZfUQt7xteiMKZhIWenm5n4EiADf82fVrRjc6bcM0hppS7NWpkSfdBbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232120; c=relaxed/simple;
	bh=G0NPfAeu8frTb2xM/sLVi66ElRp5GdIAOsIFOBjaDAo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ezJJdO650SQWaQ8e+CJYFo7OmLdLYw4pAgMoEdT7lA22PWkmdJNy6l2vahK/osr7ghwmz/sDNPnWLU//hnvtLoiiUBOUEnm0dYmBY4e/IHyV5Jhqxn9YFi/a7HajKPszQkZfSEf53vKkB54SW/wM3LkM0yD3IM24ilb2A9n7lwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Je9P4tRo; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Je9P4tRo"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-65a2e81ce8aso2767921a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771232118; x=1771836918; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iUSN/imqpTffN3xHSkVDCNUkts/L74YOZ3w3u+fOV08=;
        b=Je9P4tRoyi5xLmP138Fi9B8DI//tVj4s12Haup+QR1vmk0TUPUcKa6/jUa05HfU1wb
         mZrgJJAanAFBaXdmeOWPKxvUih71G9F85vtaYzuoNu6nwanW6lNMXYpLyu0D6mNlPQan
         xgbJ9+um/e6bmxZpzU5k1yxC0MsEUZV0JXggKwENRRa9alRvgwMi+i1Gz2FMKCwnDWOL
         IzM+PQkWkIBEW/K829TKb7YXv1zjkaK2ADaKj9/+5Hts31hKRg4IFc4gtUs+kc9IK2XB
         5P3eujm1jc4uv3LoLKaiCBWpyke33G6Td/ilUUmaT6h2pe3R9swQrnsHVArCChdqb0yk
         G5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232118; x=1771836918;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iUSN/imqpTffN3xHSkVDCNUkts/L74YOZ3w3u+fOV08=;
        b=DV1ZtzWsNrOHQH060oehLZ3b+qpWPjV4NFzRikjeLos9Jn81HG7qRQ3AnT0wB5Zys1
         zQdpqXQwwvghk/e4Rcrd9/HowACETR7gVruKbpio4KYclW6PtNRWvGBwyk0IX4jfEwoW
         uHMJE6jzrNdSCNyyhx0hsFivPORX0Sxb3p2I0I8P9+Str9Sq+3ELjpp7SE6fpTeQR4kU
         lcy/4iYB3CH1GEp27xQCRuBsSPBD89gZd4J3yrvJcB2SxdX3FVpCmbjpufPGhNG0yoh9
         KPiK7vEoy3FGdJLBUwEoSKs7IYJ+BktazxJ6BQUL1/Kd/AxsqPkP7emuNh9HVcHOLMcP
         xE6A==
X-Forwarded-Encrypted: i=1; AJvYcCXboavGd9sES6TfK4J/ymdaeBIrqHVFdKMw43pLwW/GJOwylwSnMWJTBB75xRNbl+QIuUpfk2TQe3xPUCsv3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4UxvrXd66zfAgsyjRWQifvveuhGiioKEsYTsR4bcyDHxckfhw
	xld+oOw1DQuTTrblIodI5Ucj1rgETYkF2Kt+SZ9QLB5TTJVofhZ1jwBt2N+zyoUXv4Gd4fyU6JJ
	6xhVYLSUX4jxbtmmiGw==
X-Received: from ejcgx19.prod.google.com ([2002:a17:906:8a53:b0:b80:292:d4f7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:208f:b0:b8f:deff:a019 with SMTP id a640c23a62f3a-b8fdeffc44amr129833766b.0.1771232117755;
 Mon, 16 Feb 2026 00:55:17 -0800 (PST)
Date: Mon, 16 Feb 2026 08:55:16 +0000
In-Reply-To: <20260216-register-v6-2-eec9a4de9e9e@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com> <20260216-register-v6-2-eec9a4de9e9e@nvidia.com>
Message-ID: <aZLbdGHHee-UoEs0@google.com>
Subject: Re: [PATCH v6 2/9] rust: num: add `shr` and `shl` methods to `Bounded`
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 05:04:38PM +0900, Alexandre Courbot wrote:
> Shifting a `Bounded` left or right changes the number of bits required
> to represent the value. Add methods that perform the shift and return a
> `Bounded` with the appropriately adjusted bit width.
> 
> These methods are particularly useful for bitfield extraction.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/num/bounded.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index fa81acbdc8c2..7014b5be66db 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -473,6 +473,48 @@ pub fn cast<U>(self) -> Bounded<U, N>
>          // `N` bits, and with the same signedness.
>          unsafe { Bounded::__new(value) }
>      }
> +
> +    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, RES>`, where `RES >=
> +    /// N - SHIFT`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// let v = Bounded::<u32, 16>::new::<0xff00>();
> +    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
> +    ///
> +    /// assert_eq!(v_shifted.get(), 0xff);
> +    /// ```
> +    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
> +        const { assert!(RES >= N - SHIFT) }

Perhaps slightly better as:

	const { assert!(RES + SHIFT >= N) }

Alice

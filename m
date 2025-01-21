Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCB1DF96A;
	Tue, 21 Jan 2025 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737464804; cv=none; b=Fml6IxkUyMgfSrSXh4MSwupHAsqXFGqGsA4NdkkVXsUmCFIoBKs9Z8rOOGbmupx1/L/zH9JhHs3apILev+xsAA9XC+YR8evgglQ/SSr2qzOvXS/AbNLB6AmZKx/PoSYgmUiLiw1HvPdTu05OLsPKVCe+m85qh47l81nxOO06/mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737464804; c=relaxed/simple;
	bh=a+o1mesPZt6DSfIpVVxJCvzYChO+ziX1sIXDkg/G2kc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DXi1qxTWEVPPxQhnNR/OAAcJKNdAj84Uec+/hEi2XCKlWZ84vXktH/pDoU3UunnAx6dOvYVs+rGZar554AneymBLoWt16+yndYkttC1gWzVd1CC6SjoLzoCGmv2uQNNqMAQruC6QynGo4aDDYhDQgI90dpJtIDU8Fz1O+hHQUmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOFcdC4j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOFcdC4j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844FEC4CEDF;
	Tue, 21 Jan 2025 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737464803;
	bh=a+o1mesPZt6DSfIpVVxJCvzYChO+ziX1sIXDkg/G2kc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LOFcdC4jClHFaCifisjB4pAD+8xOfDdyw0E2YR2vMgLTefSlqj/tid1nKQbm9qNPO
	 v/2Fx4MXXRj+PWjgmqoOX9WOcTQib0Vd8BhA4scBMXq4e2n6V4/pj80PDoWKiyA6+z
	 HdneBfen4DfZ7w6sWu5bj98aMxhw73MX3G6wCM+Vs1uGYuunieH8CP3JGRyXzTBPrv
	 m0Kkz0N1bYPSWK3z8Vc1CvoqC6jeXbRIHJJQKVySequIUf+6hsKkT+HqDpAhSNbWjW
	 QJW4LZt2Fyh9R9TAkgg68FKb7teo/bNajOVNbToXYa8VFW4GWZEKekufYivXhrZhfa
	 wNO0KwvaYEuwA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Trevor Gross" <tmgross@umich.edu>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] rust: list: make the cursor point between elements
In-Reply-To: <20250121-cursor-between-v2-2-1b24cd377618@google.com> (Alice
	Ryhl's message of "Tue, 21 Jan 2025 10:14:24 +0000")
References: <20250121-cursor-between-v2-0-1b24cd377618@google.com>
	<6c-lqS7SqtjYIJSau1MmUmSkdUXMWx6fKT5Omj2RFcjCUu809WPfOf06K9axlV0kUebQo5QoY3l4Dyz3hK7ekw==@protonmail.internalid>
	<20250121-cursor-between-v2-2-1b24cd377618@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 21 Jan 2025 14:06:32 +0100
Message-ID: <87h65sb9k7.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> I've been using the linked list cursor for a few different things, and I
> find it inconvenient to use because all of the functions have signatures
> along the lines of `Self -> Option<Self>`. The root cause of these
> signatures is that the cursor points *at* an element, rather than
> *between* two elements.
>
> Thus, change the cursor API to point between two elements. This is
> inspired by the stdlib linked list (well, really by this guy [1]), which
> also uses cursors that point between elements.
>
> The `peek_next` method returns a helper that lets you look at and
> optionally remove the element, as one common use-case of cursors is to
> iterate a list to look for an element, then remove that element.
>
> For many of the methods, this will reduce how many we need since they
> now just need a prev/next method, instead of the current state where you
> may end up needing all of curr/prev/next. Also, if we decide to add a
> function for splitting a list into two lists at the cursor, then a
> cursor that points between elements is exactly what makes the most
> sense.
>
> Another advantage is that this means you can now have a cursor into an
> empty list.
>
> Link: https://rust-unofficial.github.io/too-many-lists/sixth-cursors-intro.html [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

If you for some reason find yourself sending a new version, it would be
cool if the example actually executed the functions and made some
asserts.

Best regards,
Andreas Hindborg



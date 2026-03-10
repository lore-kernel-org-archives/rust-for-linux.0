Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97529359A86;
	Tue, 10 Mar 2026 20:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773175679; cv=none; b=lAHrBDf+UF99ciwmne06xUCWK5uu2CR03/RfUw/UyNy/0xEbxBtiJP58qkxIkuBetS/6HHxLP4tJ1rMVG2TxVihM5tGIQXUmd+kRYrcsa4vIVgn8Q7XBkFxT5V7ZaPSv3sETOEuwRIz2TmFpALhIpT9mvKiA7o2b5z8DIQ7W10s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773175679; c=relaxed/simple;
	bh=dJeFCuLj7QyzlVY9/NLAdYxwKt05EWwMvV2R1yqzJk0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=eQw2URieCSRPsKb/io6KBmIHDxoQgM3WumAF0PQestUd4bR2YsWIRppqVj+YFQWfoYLxvAuwyCLGY8AtV969ATVYk3XxODaXpZ/uPRo/4H9Mysbggl2U+OSfuxevh7Q9I8pEUWknjb+XNXspZEeHguEf6Bc/LeesJmEQeR3C5qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfxcIKzg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfxcIKzg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F44C19423;
	Tue, 10 Mar 2026 20:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773175679;
	bh=dJeFCuLj7QyzlVY9/NLAdYxwKt05EWwMvV2R1yqzJk0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=cfxcIKzg/T/lcUYmn96pBuOWkxMGQca9P2S235spbzj/r8x/nTpboyXXNhDYC/U7i
	 w+E95aZjhNgDvKAYmUu3B6NyDfuQ2nbvKnv6Nwi9Dvfzst1ItxNPeW3rzgIbUVaEgL
	 rGiQaqgzUwEKQHFtvUyPSIMkxR7FdnmvfKz5S2asPKYiQEcXgIdplQ7hRKUogEA8rV
	 tr4lkgz9iLA3KNdyJ2PIOiss+eW9o+2ZNbvRdRqCYcYfJYDnmWoYP1kGBI4zIgQYkq
	 dsfQ5gXJSvDawZnl5+yHU8O0nfPsVGVAk+iqdS7F4DgH5KjtdB6PYzusVTR1J7RxZ4
	 /cLrGS6qDdUVw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 21:47:53 +0100
Message-Id: <DGZEBEPLULOZ.2GT5QV8I8VBXJ@kernel.org>
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310023145.120037-1-jhubbard@nvidia.com>
 <20260310023145.120037-2-jhubbard@nvidia.com>
 <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
 <CANiq72k45b+famoLjUyk+UFnZbEONLNSgiwDDQCgUoV6U2m1uQ@mail.gmail.com>
In-Reply-To: <CANiq72k45b+famoLjUyk+UFnZbEONLNSgiwDDQCgUoV6U2m1uQ@mail.gmail.com>

On Tue Mar 10, 2026 at 9:20 PM CET, Miguel Ojeda wrote:
> Whether we go for `u64::` or not

The more I think about it, the more I tend towards not going for u64::, at =
least
not directly.

The point really is that we differentiate between GPU (or more generally de=
vice)
address space size and CPU address space size.

So, I think what we really want is an abstraction of a usize type for GPUs =
(or
devices in general).

A corresponding implementation of SZ_* would just follow those.

In any case, I think we should implement those with a macro.

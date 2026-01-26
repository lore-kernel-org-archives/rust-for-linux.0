Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FABD33D6C7;
	Mon, 26 Jan 2026 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437499; cv=none; b=KN18VKL0M4q3Q5I+i70OEvzwzhqseIRHo9tI6o1/g2DF20LpnwRUErfKSSwwh3E7MYAwDNFC/jVMigSPZC77mgjc8IL/TNusI1AKhGthSpsq5vY7hw5BZlWSLPBcm1k1AGcKI2g3XGre3EcHnH9v1x1KcULl4+PZ09gBUA6ALrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437499; c=relaxed/simple;
	bh=iMJtGXEHMxpFsCUhJf/lAtP9ObmCOjWKtuvptRv1qVY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=mkkCoZ6fHuPmIXsPv05bJcxO7bQLBkQIuqXWws7TLrH8FsOTavNTjYwOE2W9YMeqaGtRbiLqBTn6wSncEi1dTGNZqLIGmzSOI9Ol51Cr7PhQBdYC3HTpOkRgdpwMxMIp2lv+6GP9Ep5y7lK5NdLiLdoMi4wbO+nJCQhXWkCLMZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfuDpDjo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfuDpDjo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC49DC116C6;
	Mon, 26 Jan 2026 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769437499;
	bh=iMJtGXEHMxpFsCUhJf/lAtP9ObmCOjWKtuvptRv1qVY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=sfuDpDjodWrw/As6ni9pABO+smO1edmN2rHtXlKUFIjX5cfrwp+a79H80Ffk8lfR7
	 GS47jMS1tZlJMfqamufpYHyZqaZw/WRKYX/WQO6GGJmoMiSt+ADZss09KuqcMC+Lm5
	 +f/CAIExvyKCGS7tzQDsNy1ARQFMw1U4BfJcxHet1ozyo38KjDr/M2N3IejKYInM0D
	 PbWcByaHVn/Q/VtbRi5XtpQ89FudHKjs+yfT5Dxba0O9ZLWZNrSJiQtACVGwJqB7mK
	 rp+TSfRonLo3wkx8X6I+pIW3DRtBasVH0pY4AopVWIrkLVTtvxzS4rVjGHxpd1sl3r
	 GVX6Kn7yj1EPw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 15:24:52 +0100
Message-Id: <DFYL8QGPXY92.3NPF5MTDSUZNE@kernel.org>
Subject: Re: [PATCH v3 0/6] rust: add `register!` macro
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260126-register-v3-0-2328a59d7312@nvidia.com>
 <CANiq72=AsoyN=+K8Tg3+zrK95ET0SyKaLFjzukxbMR1AbSk9vA@mail.gmail.com>
In-Reply-To: <CANiq72=AsoyN=+K8Tg3+zrK95ET0SyKaLFjzukxbMR1AbSk9vA@mail.gmail.com>

On Mon Jan 26, 2026 at 2:56 PM CET, Miguel Ojeda wrote:
> On Mon, Jan 26, 2026 at 2:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> This patchset is based on `driver-core-next`.
>
> I think in the end you wanted to pick this through driver-core in this
> cycle, right?

Yes, if the series is ready until -rc8.

> I have sent Acked-by's for that, I hope it helps.

Thanks!

>> Note that it also need `rust-fixes` to avoid an `unused_unsafe` warning.
>
> That sounds fine, i.e. -next has it and Linus will have it before the
> merge window (unless you want to get rid of the warnings in your own
> branch).

Exactly, having this warning in the driver-core tree intermediately is fine=
 with
me.

- Danilo

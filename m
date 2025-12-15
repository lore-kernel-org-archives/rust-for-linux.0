Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F12DA755;
	Mon, 15 Dec 2025 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802245; cv=none; b=DNz0E0p0yHGqD0R2Xfw3443ta4gotWUdYTzh92jzCGz3noGWqqW/BUoy2ydLgou+GJREKsbhcNylfmKDoBQN2sl/3b2z2MKJTQWwSedh22EeRdZwefKhQ2pxlVXjFC7bFFhtjtbPaYAGjJ5SWTbE2cjYsnksa1aMjx7NlYZyJUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802245; c=relaxed/simple;
	bh=DNdnOd4P5sWNON2zmeFggXzf7tVwNpdRM5XNmaNeP9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TDAKT682Dk6Kg4PnqvJp/6ZKpL71nS1qzxkRwZg1DDqnSkz9wMZwL3+xN9Pp90IUlWv+UjwF8/q/2Yqc43eb3ay/oyKpPV9JJ5VVr474YT7wWwUkBqtrv34YkkAalXzesT4tyAU72vKqD3j/wImu2fzT0W3EIjgHFqUv9mE9Tng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYjxk9Ut; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYjxk9Ut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BD8C4CEF5;
	Mon, 15 Dec 2025 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765802244;
	bh=DNdnOd4P5sWNON2zmeFggXzf7tVwNpdRM5XNmaNeP9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tYjxk9UtoSiso2I3BAeiwi0H93MiqJEoCR27PhiLvAEJi5FLBHgsE3H7MSEo3Gj0f
	 I9Vm0hQfhLMhIo0OdxvFotGZLGrJtLb5d86UXmccqYlfd4ZcJEriviYSmSXPj/YQK+
	 C3bEfQlFjmr4+b2CujmlSxW/bK0VLbqLuWaem1sD4pS62RY2csL3EsN654in5t7EH2
	 1+pJ+Ynycf7djl1qv0KtzGWY3brhawzoJOUjZffrSLSRV9GS1E9EnbyUo5n0ZYGAEm
	 bQuy3F2w+8m1p8hF5ZuFHrWUuim7h5WJrpyWma0YSrsCu/IoKeEy8NMgNX/qGoptgP
	 WydxBI87UFx9w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: conclude the Rust experiment
In-Reply-To: <20251213000042.23072-1-ojeda@kernel.org>
References: <NZfJeMiIn4as63Ee-k3kjSPfv8kqnVj5MwgelwV272LQ_0E7Jl35Hnd5OPyoC39sNxyUEQEWykl9I-zDLg03bg==@protonmail.internalid>
 <20251213000042.23072-1-ojeda@kernel.org>
Date: Mon, 15 Dec 2025 13:37:08 +0100
Message-ID: <87tsxrvs3v.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Miguel Ojeda" <ojeda@kernel.org> writes:

> The Rust support was merged in v6.1 into mainline in order to help
> determine whether Rust as a language was suitable for the kernel,
> i.e. worth the tradeoffs, technically, procedurally and socially.
>
> At the 2025 Linux Kernel Maintainers Summit, the experiment has just
> been deemed concluded [1].
>
> Thus remove the section -- it was not fully true already anyway, since
> there are already uses of Rust in production out there, some well-known
> Linux distributions enable it and it is already in millions of devices
> via Android.
>
> Obviously, this does not mean that everything works for every kernel
> configuration, architecture, toolchain etc., or that there won't be
> new issues. There is still a ton of work to do in all areas, from the
> kernel to upstream Rust, GCC and other projects. And, in fact, certain
> combinations (such as the mixed GCC+LLVM builds and the upcoming GCC
> support) are still quite experimental but getting there.
>
> But the experiment is done, i.e. Rust is here to stay.
>
> I hope this signals commitment from the kernel to companies and other
> entities to invest more into it, e.g. into giving time to their kernel
> developers to train themselves in Rust.
>
> Thanks to the many kernel maintainers that gave the project their
> support and patience throughout these years, and to the many other
> developers, whether in the kernel or in other projects, that have
> made this possible. I had a long list of 173 names in the credits of
> the original pull that merged the support into the kernel [2], and now
> such a list would be way longer, so I will not even try to compose one,
> but again, thanks a lot, everybody.
>
> Link: https://lwn.net/Articles/1049831/ [1]
> Link: https://git.kernel.org/linus/8aebac82933f [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

An important milestone. Congratulations to all!

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg




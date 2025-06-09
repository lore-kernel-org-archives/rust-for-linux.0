Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD3910E3
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Jun 2025 19:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749498770; cv=none; b=IqQZv3u+233P9Jd1bfiLJ19bku1V06YnXf6NooRByNjVIaScmGlN8tkkOhlP5VyX6dvWiTqAoMQCXoxw+36Tm9dZJYdQ2rdH9YvRDp9PCkU5lWJZevy0ghKUMnFRAablaokPlIkIa7hZVavTTlSflM4Z9EAS8kNuiI8KKjsDxq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749498770; c=relaxed/simple;
	bh=xbV9x3j9JihaujQXKGsl43d5YeoFmu1ssdvsYL/MenY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=IjLYdwLrGXvKXtYq2jvymtbPT961W5YJGzxKpyEQ2H0lJeZmIYz7BjaK12n5TQrSMbBqIO6aDQ3dIDP0Zf5tkLTgik3hhmq2MfAfdcs0bvSeLboslMrCXnP+0wqXTir4kVJru/U+F5bRw1rSq+BP4RJaM6qQrK0lI0a9F2RaltE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htK3cPQ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htK3cPQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181BEC4CEEF;
	Mon,  9 Jun 2025 19:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749498770;
	bh=xbV9x3j9JihaujQXKGsl43d5YeoFmu1ssdvsYL/MenY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=htK3cPQ8DphLGIHZECPy2ifv3z/qWsJeIbDYaQvhd+DAR93JgF0vkRAxARJ+ko0Js
	 4gUFIFI/fHpCQv1KsAg+y+kCEE+cONytsKox80Hkzwm97u4/E20231Ty+Tp8exrE6v
	 P6ndI9fayBcAz8gFDZ9vJVn83G1i+/vfPuFKIx+Rm0f/6UtwPGRVBvJKoon4CrS772
	 hNJ4cqzR0IZFW+4yg20Dbs0mKlz5cibuF7DwzOhyTq6P92t+v+a213qlZJbMjTWmZO
	 AsqzJAQj5fgR9uBP95GJyGECpDVrwwV0uNA18TEU37g7EjTj+KT5bvyvkGWmHdCXN0
	 OGXy+YubJ7quA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Jun 2025 21:52:46 +0200
Message-Id: <DAI9JXTOY6JN.31JF973Z48GOC@kernel.org>
Subject: Re: [PATCH 0/3] pin-init sync: test & CI fixes
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250523125424.192843-1-lossin@kernel.org>
In-Reply-To: <20250523125424.192843-1-lossin@kernel.org>

On Fri May 23, 2025 at 2:54 PM CEST, Benno Lossin wrote:
> Several smaller problems I found in the CI related to enabled features &
> tests.
>
> Upstream PR: https://github.com/Rust-for-Linux/pin-init/pull/50
>
> Benno Lossin (3):
>   rust: pin-init: examples, tests: add conditional compilation in order
>     to compile under any feature combination
>   rust: pin-init: examples: pthread_mutex: disable the main test for
>     miri
>   rust: pin-init: feature-gate the `stack_init_reuse` test on the `std`
>     feature
>
>  rust/pin-init/examples/big_struct_in_place.rs | 26 ++---
>  rust/pin-init/examples/linked_list.rs         | 10 +-
>  rust/pin-init/examples/mutex.rs               | 97 +++++++++++--------
>  rust/pin-init/examples/pthread_mutex.rs       |  5 +-
>  rust/pin-init/examples/static_init.rs         | 75 +++++++-------
>  rust/pin-init/src/__internal.rs               |  1 +
>  6 files changed, 123 insertions(+), 91 deletions(-)
>
>
> base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3

Applied to pin-init-next -- thanks everyone!

---
Cheers,
Benno

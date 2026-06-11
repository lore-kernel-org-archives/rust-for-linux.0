Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D827FD4B;
	Thu, 11 Jun 2026 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165745; cv=none; b=eSwJOaVf+892EvsDpS7kbz7LQ3PWR53vIjWrz64nFaiO/tjjlGL+TDeNLBxsFEuuRPG7rVQyDUSdnynRbppuk7w6fZX07lFybZFhzIW6jp/0sNGOx+uIaotFk2oWWDJlR+w0T+N2z+C3WxRXx+rSzVROOy/FF/XO9LpyI2n8V04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165745; c=relaxed/simple;
	bh=KLPIwwjITcJgft4py9tnnAWUVAYplAyxhk8KIxXc5qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tccAD4UOVwSrumFrCDj9W/BTDpOkzkVO7cno/jnrgKzQX0gzoQOTTteyGaCGFNVB0CFxY7Tt2A8avTwIMbCp8O3aopGjyVbkmsy32kZmEjLsRjjBFVc+MOllbeaWPvSNyTwHxmxljoyLQPGdsD4lohsVHt4v2y2djZtgO+y1ZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVCX4mqb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVCX4mqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057D81F00893;
	Thu, 11 Jun 2026 08:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165744;
	bh=kBSh4lop9bqlOwiTk8fdlTTN3IdaouwSWMeBOC07Vrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JVCX4mqbars7d+wZtu8qwPnLuYLr8Z+2WgbQocw7vcqmw72Qn4yFzXjjtuRo6zdy+
	 QK1rJ7T097ee0asdvn2/EuG8KFuHxR9+EBIzkjRmNWVHFcNvCVJARMrF+D9K3mpAtJ
	 9Uk/q12IPNA7wslVTND9ClTZhiESR4PRxmsWS9trFQOG0+ZviUnWATOGP7mmex4PYy
	 +lTeuoB1OorhKh/eISrQGtlgrwRTvBfXOhp2IIPA+PkmOl0Xw1OZF+ta2ULIMNmDma
	 Z/6p386ROuMjCDt0OrP8BxBiDr4tQOwp/voYdGXEjcgfMChvvgJIr5uesWhz7ArUSn
	 6cT2yzw075kBA==
From: Miguel Ojeda <ojeda@kernel.org>
To: gary@garyguo.net
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	dakr@kernel.org,
	georgeandrout13@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	ojeda@kernel.org,
	paul@paul-moore.com,
	rust-for-linux@vger.kernel.org,
	tkjos@android.com,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: Re: [PATCH] rust_binder: add ownership assertion to Node::add_death
Date: Thu, 11 Jun 2026 10:15:25 +0200
Message-ID: <20260611081525.73734-1-ojeda@kernel.org>
In-Reply-To: <DJ5ETQTN0B4N.G35D5N46VX13@garyguo.net>
References: <DJ5ETQTN0B4N.G35D5N46VX13@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 10 Jun 2026 14:39:46 +0100 Gary Guo <gary@garyguo.net> wrote:
>
> pr_warn is probably a bad idea here. Given the code relies it for soundness.
> You're either sure that it won't happen, then you use `debug_assert!`, or you
> are not sure, and use `assert!`.
>
> There's no "I am fairly certain but the code should keep running despite
> invariance violation" for this one.

[ I keep getting your emails way later than they appear in the list...
  I spotted this one as well in the mailing list. ]

I agree that continuining in this particular case is quite bad, and you
know I would be stricter than the C side for this sort of thing -- it is
closer to an indexing gone wrong where we panic as well.

But to clarify, the `pr_warn!` is not the important bit here -- I was
giving the general rule that if `debug_assert!` is OK in a particular
situation, then as usual we should consider a `pr_warn!` as well, i.e.
that is the Erroneous Behavior combo for us.

And if it is not OK to continue in a certain situation, then something
else entirely needs to be done.

That is what I pointed out in the GitHub issue, i.e. that the original
`debug_assert!` suggestion cannot fix a soundness issue.

Cheers,
Miguel

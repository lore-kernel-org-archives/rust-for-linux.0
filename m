Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59DD1D63DF
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 20:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754337756; cv=none; b=HdYKOZa6LdwtrhGgBEJ5hFRenDQhAjVC6H8vn8ATexuL9ka0XplgNXWfeH2qvm/cCpmUyF87pm23gNLTNoVNnfBdbIE9tXYCync8i0mNxkZWnatrU2D47vNgSopMwrdroCNFHS8w/Sh417wJ2Z+J0/H6nViyRYoymZ7lWr0Nln8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754337756; c=relaxed/simple;
	bh=+5gqKAnUpKpc6zhS1wl3zWk8jmDW9RCfzxXYGO0ICj4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Z2ZDDpyIh1H3boCEJCYHOMneb7tueLttwhvujm8loOAWxCEO+kBAS9JAnBt0e3DOC/B0UNDinSi9ZAESyspySy+GbPVyoynOC5B2ytQz0skLesdqlHaP60QVTC2rqNfeD6XXswkOq4aWFs0yWWRSwL+K93/wYBjWgE4v2dPTDlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Js0acztK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Js0acztK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136A8C4CEF0;
	Mon,  4 Aug 2025 20:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754337755;
	bh=+5gqKAnUpKpc6zhS1wl3zWk8jmDW9RCfzxXYGO0ICj4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Js0acztKwabSmWHF/aiyh7Gsxmh4QLp1CvFD9lBzMuZ1bEleuThVklqekTPFJPHya
	 nF8utKIweqVBrH8W6QXR8Kl3nTfXaPkBJKbQ40HYgZAf7sQk1CJCJnd9ZUkp8dp5Rb
	 h+cxyBROLCctDncXGJNyyy7hPCDuyuEMNqpyoPE/sHtkjFfnW0b5KrftwBYKZO+c06
	 2B8wnarjsv3ukvGpNAh7XagIcdwDRHh6SOmhH+++4thBOQfMvJPolii0g5py8+P5yM
	 Yb+blxWcBYaDv8J3pLIgPTff70CogmqahYu1zXP6OjH9vQ2opVYRQAb1dAQKvSD9Jj
	 Ey8UjyN6d5WuA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Aug 2025 22:02:30 +0200
Message-Id: <DBTWTWOURECI.1I8XPYMDDIIBZ@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: page: implement BorrowedPage
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1
References: <20250804195023.150399-1-dakr@kernel.org>
In-Reply-To: <20250804195023.150399-1-dakr@kernel.org>

On Mon Aug 4, 2025 at 9:50 PM CEST, Danilo Krummrich wrote:
> Currently, a Page always owns the underlying struct page.
>
> However, sometimes a struct page may be owned by some other entity, e.g.
> a vmalloc allocation.
>
> Hence, introduce BorrowedPage to support such cases, until the Ownable
> solution lands.

Are you going to replace it with `&Page` once that lands, or will this
stay?

---
Cheers,
Benno

>
> This is required by the scatterlist abstractions.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/page.rs             | 83 ++++++++++++++++++++++++++++++++-
>  2 files changed, 83 insertions(+), 1 deletion(-)

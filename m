Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9261B3D8908;
	Wed, 30 Sep 2026 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795112; cv=none; b=LjhrGrrRK+7VEsq4lWt9d1+jbronYav25zAtaJguUH+dd/m54VrhE7E3goSEOJFnJIo9rdx+Y4zX4nSmJmcaqTbG8DtbX6sHL9zt/cGcM8i2uHut3wXAaSXHGG8hsbzy4L9I9/RvTNFWMWOkN1xyrlfqmSEJL5mp4Oh5PYtIt14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795112; c=relaxed/simple;
	bh=j0iyWtEmC+gE+BU3uxmQOyXtoN2UW+jRVO1W1C/nZSs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F3DELvxJePbxf05EFPMdCK32o599+2xVdb3S8KlHxZRmRLAjbCS56QeavHfoqgkGAuzZ84BZrUbEcUiqE6zpx0yR/H60SRyzyb3LvLQcu2dkTo9ahxz6b/SXHiqWlGFg2klxdMhWIeDR+1yn/6sTYv8ZN6GWhwsSJyWUXu3nZec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8w+k9YJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8w+k9YJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC53D1F00898;
	Wed, 30 Sep 2026 19:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790795111;
	bh=j0iyWtEmC+gE+BU3uxmQOyXtoN2UW+jRVO1W1C/nZSs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=W8w+k9YJTnUpTAjUkNd0EYgiDgmfgfxT1HmNgsaj2EVFkaYyTkGct4MsXGXMN+gXV
	 zVhBknqG2QBv/+ldmwSLw7gwdh8RWISqSpAu93I7W4TOg499kXyvvE09UVW+Mdr0ww
	 t5VqxLF0sguyFBWSePVGqUIr/ympITx6ZQf6yfN7J6jZFSsoQih+jPHyUJPa47xlEB
	 c4KzYTZulG09S5KZsVC3bgEXuZOCME+OwnKHMEV2tjls3/cyLg4sL1x2EObSm1eWso
	 ho/trDVyb6E/RyyElFScNdjEBOi3VdJ9zw+9OD6qaHcnGxthsGTb/uCzVGPM8JsKgX
	 hmE+dDpMlVCFA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: mem: add `Align` type
In-Reply-To: <20260610-const-align-v2-1-ccd12f0aedb7@garyguo.net>
References: <eRI3jX3VQl_XVpGWePCscmGQxnPzoyvjKCoL7SyZeFXcSs4z6PhfNFvMjn37p2l7wShyXUhnt2lNddpGT_ndbg==@protonmail.internalid>
 <20260610-const-align-v2-1-ccd12f0aedb7@garyguo.net>
Date: Wed, 30 Sep 2026 21:04:59 +0200
Message-ID: <8733uqblwk.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> Rust's `repr(align())` only works with integers. Add an `Align` type so it
> can also be specified via const generics.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

> ---
> Andreas, could you see if this patch meets your need for cache-line
> aligning?

Yes, with new type wrapper as discussed.


Best regards,
Andreas Hindborg




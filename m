Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500C423909C;
	Sat, 14 Feb 2026 13:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771077109; cv=none; b=V3NCxNOLVVR87TSHknh8Qc7Wauxzcl6dg6aDWtWDu6FMUwDDR4NzZDY6kzdQRt538ipfDp61Hppy2k9gq/tHF/rSC2WPhpgURhDUnl9ZXyZCVUqvWxEMd0E6WcDodufJ8DxwhDCfaJ5w7dFHRDLmReUQGiZSJKqHbNN+l7D6qhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771077109; c=relaxed/simple;
	bh=XDLLgoR3nEKyxvRWPs2m6A6yIOW1JmDtWwcJrb9VKUs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ImWlHN7MoRpmzN9/wNZrI7OUH2uMf1xJMmI4e+/R1MoQ4Tu01qlH5q1NJu3lBkVVGsrKUFTQlghuk1a4jxherapFCQD94YPICarOmCPywzi81eXFiKqAghWnBSEUL3/Yt39p1ZY1p7tt7DR/idaAfQRu4E3+vpLTV7PnvWHo9zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOBSAx0z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOBSAx0z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEBFC16AAE;
	Sat, 14 Feb 2026 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771077108;
	bh=XDLLgoR3nEKyxvRWPs2m6A6yIOW1JmDtWwcJrb9VKUs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=DOBSAx0zrxnotiCOk3Cq+XAnEEjB7n9F3/oDQawEAw5bulW78pBx2bxb5XNS3hRWW
	 3UBhVZQQ0dn9lw5SA8oMqs7Y8LUaI31zDYS3kVJx4CFXWUUjUvkB21VN9MXz4uvh1S
	 FPZ4SsqmkSOInTAJBx8RpMv9obcoC4GYFanfHQyb8wKvCJpIggBljci8c/qBhJpkKN
	 /FINjMMvyaQ1m6nc5l+yJiqubUAjDNCqMNTPyut8iC9hs4fcfw92KR+leyvB1NPES2
	 AP5dXVf9HNEy6+KRNgmpdcsh7gx/pLwlFrMI/pDqr+1XcUqdWmNtjk8+NHOiewq2ES
	 xd4Lj8yUIcp/A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 14:51:44 +0100
Message-Id: <DGEQFPUDVYZB.2DE9JW9CTR1T5@kernel.org>
Subject: Re: [PATCH] rust: irq: add `'static` bounds to irq callbacks
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260214092740.3201946-1-lossin@kernel.org>
 <DGEM0E00MCEP.130GP2WIISA3V@kernel.org>
 <DGENZNRDFU2U.34JH68EN7YK04@kernel.org>
 <DGEOG8J4CF1U.3EVS9UT98ORYF@kernel.org>
 <DGEP3X3WQROR.26BFH2XI3XO0R@kernel.org>
In-Reply-To: <DGEP3X3WQROR.26BFH2XI3XO0R@kernel.org>

On Sat Feb 14, 2026 at 1:49 PM CET, Benno Lossin wrote:
> With a fixed compiler these two would also still compile. It's just that
> the callbacks will only ever be called with `T: 'static`, since that is
> a bound on `[Threaded]Registration`, which stores these functions in the
> C side. So from a purely no-compile-error perspective, 29e16fcd67ee is
> the correct fixes. But from a "good API design" perspective, we could
> choose the two other commits.

Makes sense, I will add

Fixes: 29e16fcd67ee ("rust: irq: add &Device<Bound> argument to irq callbac=
ks")

then.

Thanks,
Danilo

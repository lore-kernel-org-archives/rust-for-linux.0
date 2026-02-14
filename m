Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448AC277C86
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771066824; cv=none; b=uPPq1BqwZwv0KoazAqlefFf4bNX4/K5aDEeqezNuN6UmFeOuNOxjBRnH/5Dl6c+Fy2pI4/LZ9QE/KlKLijfPHO51Tt6l3l7245vpSHn0on322EiB+ZokKRXCG1SCwlgPwQ/cj/QpD0N6zqZTc6hbCuObFJT2GY65CrAHkLprU9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771066824; c=relaxed/simple;
	bh=dLnx/eOcIW0gzYnN6JJ+Z5RQSeOvWVy/cQ0LQuRj0j8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=jg8GdBiHNJQlqLySbpbyGhwOdX4ODSxGxhQQDHh8z999Yb8WyoFcFzK24XwMsVPhD7VYFYN5tAQZ8cwDnGkS0yY+TkSCvBQ5TY5YYifneZyouf79vDlP8ZNfv94k9of6hOdFTwqmbom2Dk8Hj5YeW0DjRkpdn0HX0Rpiv7zwr/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lIU20L91; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lIU20L91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CFDC16AAE;
	Sat, 14 Feb 2026 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771066823;
	bh=dLnx/eOcIW0gzYnN6JJ+Z5RQSeOvWVy/cQ0LQuRj0j8=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=lIU20L91GxdNgAnTnbGR6RR1c57h1xWS7lFHN5SZuuCqndASlvnFaLQSyerANnSYz
	 +EtToLF5HULqhlRo66MWZrF5an2CWxpTOVBUNyMPHMyV1C/nrkbkKyjchXl0Gf+o3i
	 nFzJeg0FC2fIP72AZ0HCi5y65l/s/9/mCjY88iLUWh80kZMlJMNLcc0kOK93eEt8D9
	 vVtehHkj5+S6q7gD9wA1WSCtUnzGBthiPjsGB3sIW2zNAZ0IQ/LcgV9tvq5tkJufwJ
	 vNLdhlV0BTkHO9q73Y/jiGpLKqREljCLMDZgAMH8qyh0wKLc/w0tckMjmxd5KtigrN
	 ML+AFjJ8luuPw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 12:00:20 +0100
Message-Id: <DGEMSH7DHR7W.247ROXJFREFLS@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
 <DGEM8AITP519.149B3IVELY7HA@kernel.org>
 <1aff48c8afbd0965946dc69f5e10fb5a@garyguo.net>
In-Reply-To: <1aff48c8afbd0965946dc69f5e10fb5a@garyguo.net>

On Sat Feb 14, 2026 at 11:50 AM CET, Gary Guo wrote:
> If you think it's fine to take them via the driver-core tree without caus=
ing
> trouble for drm-rust tree then I can squash them in next version.

I'd take them through -fixes (as the soundness hole is technically a bug) a=
nd
just backmerge the corresponding -rc into drm-rust-next. So, squashing them
should be fine.

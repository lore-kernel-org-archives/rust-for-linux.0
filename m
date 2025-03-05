Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BFF241115
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741183034; cv=none; b=VxSDI5LL9YNBZA5F9Xe2z/mGNbvfwSXO0q+vP2m7twoUnzTGpM7+hBvMIBBj3A9qTMOIIulwnaG5oqkK/xsYWQjhxJiaF+EALPfRd6W5yXgDsUexg06PXLsZ+g0iaZqLSbZka0ekzDY5xpLyT4GR3BNAaR1y/sIEjowT7TBZWBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741183034; c=relaxed/simple;
	bh=pQnzrE+IY7PXmhcEFfOphnXEDgabFSmGwBr6lL9bbcs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Rik5TLFB+VV7Ict3OacHTHY9b4GfuYhJYhpcTe3RMGMyELVvIta++5wpAJ+HyrIRFPdawq5nWj04VuYkc6ysMNCf1KUou8DXunNsbB8TiLUTz0tTbwThUVoSLP72uskkVcggRSxpdhoP1zw8krjosKlhbPAbD4P7lWT8zct649U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVqQllui; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVqQllui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FB0C4CED1;
	Wed,  5 Mar 2025 13:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741183034;
	bh=pQnzrE+IY7PXmhcEFfOphnXEDgabFSmGwBr6lL9bbcs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eVqQlluizOy/T9S7dBNd9cDkKfpdCXOWiO0nDwcAEI62ZPGXY/qPFwTV+5kWtciyu
	 ytnhZAMWlwU9CBcNcj4F+ZVTSu8AWvve+nO01U6yuPKXul7x7XL/k5JWxrdqeuCfGj
	 8jnh5wnERjDN1yyiAsr12aT5zDqo2pxSnMMCwnufeXrMBXl8Hmtsbw2NBuveizniWI
	 1wSBA6sakazaS/OZO9FLhpu5S5PwQ5bOFSulp1AnBRaEWthZLoufZRc0eKqLr77W8v
	 093qgBZYeiuPxz/Ou/9u1wZWfGqT3xlLuBr5VEwCkCEBcW8si/lyfsZhGwCNqC3D6X
	 tir+x0Zq2TuFw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <benno.lossin@proton.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>,  <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 00/22] make pin-init into a standalone crate
In-Reply-To: <20250304225245.2033120-1-benno.lossin@proton.me> (Benno Lossin's
	message of "Tue, 04 Mar 2025 22:52:55 +0000")
References: <xn5HRPkxO91lsoIUAwMnnAvQRCAgmw6nzTZX2DsODS0viAvz_g6B8l3dpYNtcL2jBXySi0DQrVi04b6MY8GbMw==@protonmail.internalid>
	<20250304225245.2033120-1-benno.lossin@proton.me>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 14:56:54 +0100
Message-ID: <87msdza8d5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Benno,

"Benno Lossin" <benno.lossin@proton.me> writes:

> This patch series extracts the pin-init API from the kernel crate and
> turns it into a standalone crate used by the kernel crate. The reasoning
> for this change is that the maintenance burden for me is too great
> maintaining two (more and more) diverging versions of the same library.
> At [1] you can find the user-space version of the pin-init library as a
> Rust crate.

[...]


Tested-by: Andreas Hindborg <a.hindborg@kernel.org>


Tested with downstream rnull driver. The driver is 71 patches on top of
this series. It required a handful of trivial changes to patches that
touch pin_init, but everything seems to be working just fine.

Reviewing this series made my head spin. It must have taken a
significant effort to compose the series. Thank you for making that
effort!


Best regards,
Andreas Hindborg




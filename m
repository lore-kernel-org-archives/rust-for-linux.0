Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A372DEA79
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113516; cv=none; b=pJ9D/49ozYXNkKDH7DkCGyGM0koYX6v7AjGzs340hCndSu+KS+wXWggwPniEoq0kqQFg42hu6km7MIOX0W7Nrk92ualA+pGHmPfwCVEg7mpqQYJ5RA8jSP4lm0OE7HKNegmLmWOPnavEcwzDAC5Mjkbj6ZAnZYdZVs11obrOoRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113516; c=relaxed/simple;
	bh=qbo+xEJPaR932zCk7aWILg7Tb2UFnLbvc0NVwxP6vLg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=LWrlnonDB93h142mMuv6ELVCfQKMq2lInPk6058FRZ5UTaJ7WoWuUcSPh/rfTKZaatQo8cQQb3QNoyasMlM+BfUOAizo1anTfctWlWiv8Cb8+vH0ameIy5k9auz8w57ceBxfsqxYbhklz+XccLi0BRkkCTqpL5FeMi7UacPvQDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EACw0aRG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EACw0aRG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98093C4CEED;
	Mon, 21 Jul 2025 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753113515;
	bh=qbo+xEJPaR932zCk7aWILg7Tb2UFnLbvc0NVwxP6vLg=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=EACw0aRGC0BeyYgwfKl6NrQGRv8HDvPV0+6fMUTOGk4tc7h9UW5ZhDnA5RRDQQ+Qv
	 maBolzLwqQxqv4t8LWKXspIHyVKmll/TmDSd9IeOZjmeNhmqGjupcLrVfrcSIRNySP
	 pNZReBNAbgPD1osPYRIXH2dGgonn/18ow/1j2AVymINyBxbxG+sQmePA2YOzuHo3uw
	 nTpZ85A+WK5ySMz8bZ+XN7fTOyQsl4KaJRa2PqrutXPeQ1yLO+qmVWn4KO2th85ALe
	 0Hk4TkBWBlWX5l0ofSQ95eQrvnKGIbnLcj1J6Ps9yKMa3/VgnCik/MfBq1tSzVcmbx
	 4RH56viDlZkTQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 17:58:30 +0200
Message-Id: <DBHUVGOM4AN2.6JKUWB03D5DJ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl
 arguments
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <aliceryhl@google.com>,
 <daniel.almeida@collabora.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <alyssa@rosenzweig.io>, <lyude@redhat.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Beata Michalska" <beata.michalska@arm.com>
References: <20250626162313.2755584-1-beata.michalska@arm.com>
In-Reply-To: <20250626162313.2755584-1-beata.michalska@arm.com>

On Thu Jun 26, 2025 at 6:23 PM CEST, Beata Michalska wrote:
> With the Opaque<T>, the expectations are that Rust should not
> make any assumptions on the layout or invariants of the wrapped
> C types. That runs rather counter to ioctl arguments, which must
> adhere to certain data-layout constraints. By using Opaque<T>,
> ioctl handlers are forced to use unsafe code where none is actually
> needed. This adds needless complexity and maintenance overhead,
> brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Applied to drm-misc-next, thanks!

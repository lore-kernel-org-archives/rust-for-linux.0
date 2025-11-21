Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE2623D7DB;
	Fri, 21 Nov 2025 19:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763753497; cv=none; b=WGeFq9Fco5LsgO+XEA/44/ECWGHtR6oUSnQBoA7bugnCbFbgpiGDATEAWJl11o8ZDUHkw+tvDDRaPBIYLuY9O4a0ZE3An71Ctag78ZJ/eGf2gBow31l8JedA/BN8mQ3JS9FbuEJC6LSOgH2xhvTjGBBrbYIKI/7MruosKbh8aTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763753497; c=relaxed/simple;
	bh=deGH/JRsvF4B+Jv4UpNqaRuz3ogBDLMz3x9mmxDoP6I=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=TC8a4E44iKHh63FFM45DckmUWhcggXdCuySrYmLPgC8p629KPXM61pO7zca80ARc9xQ1xtqZV5wSEAlKBe4VwmtBs6FLU/PGPAtIrtPaq3Vk5uVNuMDqxqZQZM7+rRO43ErAEoP7i5j/5cXy41whxdMQozUvhkg/f4o6sWNDn7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYpPgVjN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYpPgVjN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB73DC4CEF1;
	Fri, 21 Nov 2025 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763753497;
	bh=deGH/JRsvF4B+Jv4UpNqaRuz3ogBDLMz3x9mmxDoP6I=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=bYpPgVjNRN7dFUAhVD77sxvV9Fu2qL2H2lMhdA0wVtNqzopm6P4Z+PpHProUl8Qsk
	 WJsIgT1EDnskoGqws+yW+aw4jYD/uNSBAk1j0eU6XqCNNCqLP7tticMMLw8NTpugwF
	 c1GN1ONs7v5AWDvWEoOt+AKnIE6qvVh1OLMf5N1zaRUdy2fEfMqpSIX87xJ6Mb5cVO
	 QnndSGm7TyFmadwP7tz8x7pk78co+kUdF9aApJbAxZBLXAwf3M+vRcyMU5pncdy/LL
	 95mDh9x3d/XkzGjkoRoj/W5XwuDauOeti83tT6EDyVbypRMjMLvtL/nyo1cY1D38ae
	 Hy9OaG0xPEnlg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 22 Nov 2025 08:31:32 +1300
Message-Id: <DEEMFKQB93BC.3GPOHC1II0ME@kernel.org>
To: "Peter Colberg" <pcolberg@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] samples: rust: fix module name for Rust PCI driver
 sample
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20251120-rust-driver-pci-fix-module-name-v1-1-430cee310dc0@redhat.com>
In-Reply-To: <20251120-rust-driver-pci-fix-module-name-v1-1-430cee310dc0@redhat.com>

On Fri Nov 21, 2025 at 5:06 AM NZDT, Peter Colberg wrote:
> Replace driver_pci -> rust_driver_pci in config SAMPLE_RUST_DRIVER_PCI.
>
> Signed-off-by: Peter Colberg <pcolberg@redhat.com>

Applied to driver-core-next, thanks!

@Miguel: Thanks for providing the Fixes: tag!

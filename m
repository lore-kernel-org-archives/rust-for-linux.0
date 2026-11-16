Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839943;
	b=r7lE6bOyYQzCrTO8WJEBsxwmK9Jr7CsoEpWOtuDKVUXkc90uY84h1xhC2WsP5YCrXoTQ
	 d84nIvpSPR7zY9xORaclNp3OpreZZx1co9vZT2sXGuXLqu9BA6xBrM1HI5I10HqurKYRJ
	 vc0gyZFWnA2QXLGGkYYhcH2zQQWaz53/JsAng+pgHWIWfNPlnn7KQrOM7zA2xurtm6Vjr
	 zKjc0BOGyZ7wEm6vejuM0DHTKIiLYpi0NYyMyJ1PGUcctHuP99ug2lfBdLzU9M0TZetI/
	 f5R+av5o1Ohxprj6vBMYAaMN5NLxBxzNk/Hbz27uQb+LF9oaq74vFEFOCbunRCVyv8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839943;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=a4RVFnW40tIgP+A14RnYbG4R7E02jcPalUi+wNICCI0=;
	b=EpB9jtKiL/lFp2Fp8UzePSlxmlLYLkCSpfpdYk5c0F6Q8nAvgX8OxuZ7AHc62onr4krm
	 545x2tCxLktO3NDdAF992wCvq449cd9zZcCgZqWeSqUJj7/AmI4mL+s45z/Lr66Kz8z3m
	 J0M6QRWvVGhGlJCryoJFTye4q32RK02AIGgAYES5+X2IbgXdwZIh8e0epAmFzlGTXU19i
	 oLdX5Alft3twIJUBAMjyYYQtIb4nATmpJWrMmquZ5t6pNAJKP2/TSj6O2oGsMu3qXiZgY
	 i4wEoeShMu1sT7LVszrZEXquhpWGLzW/2rCYgdOxQOBiWOU4Qg/tsbFCWPGV7DgnhaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxK9c8eu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F40B606A32F;
	Mon, 16 Nov 2026 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxK9c8eu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73181F000C8;
	Mon, 16 Nov 2026 14:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839943;
	bh=a4RVFnW40tIgP+A14RnYbG4R7E02jcPalUi+wNICCI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QxK9c8euAWzXRsLDFjPby0hAYyh5iCkQKcBe05mgP/2X+g0Vkhykk0kae4BRCzs+d
	 yClPLbAktxlFEiUa06wlaGY5SNzq8AHsRpOL/vmLmVLBa57CXX73HGotKo66ju6bdN
	 jHAcizVBx5rJwT7GYDJU1rr2IWeVuwlx6xLEtH3tzBlVO+a+PIK8+G5ij7O/L/nU5f
	 qRlt0XlmSlN6OrGzqLKO2TROen/iCNJLo5VxHqVz3AGp5n3W+CwcgA5Kpcu1WMi4TZ
	 an8CgnMxUjt5AniFGMlV9fjywSs/QL4Zau4J7mEvrpdNnNQmxqYzSDEKV1rkrlqIqm
	 gO+YAE2WXb6XA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, corbet@lwn.net, ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, lossin@kernel.org, rdunlap@infradead.org,
 skhan@linuxfoundation.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] docs: rust: add guidelines for Display and Debug
In-Reply-To: <20261115214025.2122718-1-tomo@flapping.org>
References: <wMC2tYBzaOkqEnEQsq9wrD2Pr6zHx4Cg7bghaMBfvI3yyXOlWUlxHxpEdUgJ1lF2NA0uhYFkChJ4Jl7iOJ_geA==@protonmail.internalid>
 <20261115214025.2122718-1-tomo@flapping.org>
Date: Mon, 16 Nov 2026 15:38:49 +0100
Message-ID: <87ld6svo1y.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> The kernel crate has no written rule about when a type should implement
> Display and when it should implement only Debug. This came up in the
> review of a patch that adds Display for Delta.
>
> Add a section that follows the usual Rust convention, with one kernel
> specific point about types that correspond to C types.
>
> Link: https://lore.kernel.org/rust-for-linux/87se19qgeu.fsf@t14s.mail-host-address-is-not-set/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Seems sensible to me.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg


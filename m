Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D323B0595
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361406; cv=none; b=VfYzUkpjDBu2PzEfeUz8n5+QrURp5Yp7aR3hZD+MJ4DrLKDwz0VEstJAJtLhV1CfEfD+zozqWgA3xjtzosLwUaDBAb2SPrMWKKVn9zXwphy8CIyB8yZ9HFs/0gGVFf1QjrwCMjSFSiUKOE/qKWOX1i7zXjtXoEUBwCrl/TF7ZPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361406; c=relaxed/simple;
	bh=0eC9IIY6KpD+QO03meGz057HA0uozty+R2vDSFtwLAU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mlb10ascOgseRyqJtesz7UO9GbzELpGWHBP1qpxK8P7OcxDfgZjBA9dD+iVfTPtv4xY7OzpD4Q+54KfxdxbxfaMtb7sV8BaXzX0Awx+y50d9xSpr/5OsoiM+5A73Jg8jNbE/Lx/CYXXFGlgC2HBgHNIggstBEos7F+iILgbMzJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loPlk7S9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loPlk7S9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EA61F000E9;
	Mon, 10 Aug 2026 11:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361405;
	bh=0eC9IIY6KpD+QO03meGz057HA0uozty+R2vDSFtwLAU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=loPlk7S9oqYL+uBUeG0adaEbRACOigIH/bVI2MeSVsHgxS/byd0yH7icIEOMWQnXe
	 jIFYAp6qeoyzx35uVMEr7hKaH8mii+Vw4VbUioCpnxOKqo2JMrA48+FZgyx0RnsZRN
	 0lyrXeKBGqlRx2XjLcNrzomhx7y9yYdCzTexX2iY0hH+Y9LEjp2G6sEWzrgR3ixzj6
	 0oJghR40HG/DBLV7JyKM8sCCsS/p8FxhsmOHcQ5i7XMTQCQDd8CH+OZR/dfg2xu4Y0
	 L3/QO3CDL+rM5HOk33lp0iExhvjbtwBuS9C0jjlyfphJgxRFeIjjuuXjV83jCok3ne
	 KZMtM5gz8+d0w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com
Cc: acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v6 3/7] rust: time: add Delta::as_millis_ceil()
In-Reply-To: <20260808062839.1159990-4-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
 <20260808062839.1159990-4-tomo@flapping.org>
Date: Mon, 10 Aug 2026 13:26:51 +0200
Message-ID: <871pc62p38.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add a ceiling variant, mirroring the existing as_micros_ceil() since
> the existing as_millis() truncates towards zero.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



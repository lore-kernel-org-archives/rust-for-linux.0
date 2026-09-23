Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B9C470136
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 08:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151744; cv=none; b=cTPLyslXVr317G38uHB83I5XxJuOKUW01Ho3l50zMGU6K0dtdxcAqMj2v2Khue+U7yf/RJXokHcahOhl/pM0wJGGwzHmzKxxKVW1cIQT45C7msGdCT4zj8ud8QSsrCNAq88hAoh+EVAeJzeXFgbkbOqp2vPEZeV27/0zZuXUJF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151744; c=relaxed/simple;
	bh=2lL5nMTnXjRNUQiCz4uyJpYjbOlhYjONBVi7yCXuHRk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G7bdcnUyxW5ugj1vAm/TppFF55ZdnjclVkh6taAF51mXpN0s5ne5P0HwzWzhQZ7Jgae5ApDix+1Vay5wQpe6nyYaORXUgMHZP4oo8Hc73iJ97sb18cRot3VJwScoguNYVSPfDIfAPTZf+zC+nXTLd7KFk185ywHqTAkRAaslGdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McaJUFcI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McaJUFcI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB811F00893;
	Wed, 23 Sep 2026 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790151741;
	bh=2lL5nMTnXjRNUQiCz4uyJpYjbOlhYjONBVi7yCXuHRk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=McaJUFcIQ7FDhLkWaTQTIj8M37GATt+e3hiSxrLY2xPzeRfwvySc9LWWSXGDdGmFv
	 4C7waiw2oZKb7UDSzNCjwiZRSBltmuBgGtGQrZOVArxfnV6lCvmNs0oH5uikz3J2cn
	 q7AqfSKioVv/5dHwMd4g/qwrNaPtu4QaTPjM+kRtSOeOMAjJ64cmafM2Rf9SIkOxbb
	 Do7j8SAf+HgTvJfUI/kXgznU04ZzNCgIpXQ2C6DJ9uC/Th67IC0kjtqly0rRgqEnMg
	 hL+JproRFUIqJT+2E+uTZOHfuM4pvalXvg4Vm7Od6UwNdLJ+bnOXb9W0Kq/NguD0I2
	 aLB4cv9fCJ2Xw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3 0/2] Add Delta::to_jiffies_timeout()
In-Reply-To: <20260908230445.2430296-1-tomo@flapping.org>
References: <ecZSyn5iOGZxLQdeadMYD0WYwv1yJFnIc0PLl8ULc8k4LJrT2wwo1dn9jSFXDORi20jKY0IpvWoVxrNZsSaOnQ==@protonmail.internalid>
 <20260908230445.2430296-1-tomo@flapping.org>
Date: Wed, 23 Sep 2026 10:22:04 +0200
Message-ID: <87qzik2x8z.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Tomo,

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> The first patch makes bindings::HZ resolve to CONFIG_HZ.
>
> The second patch was previously posted as patch 4 of [1]; patches 1-3
> of that series have been applied. It has been reworked.
>
> [1] https://lore.kernel.org/rust-for-linux/20260808062839.1159990-1-tomo@flapping.org/

I'm waiting for some review tags on this series so that I can stage it.

Best regards,
Andreas Hindborg


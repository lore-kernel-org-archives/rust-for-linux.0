Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CB24A207F
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464591; cv=none; b=Ml4w1OPRYXK95Pzf9XxB3gIp80nj8f5XtUOtJ4yyXkZ49rEZKhmYGqM8HRzvVr43Ar7UywUsfLBFASJW7Rc6FOSIkthLEU7d9C+Yitjzq9KxeNPl5R/YAraSDb4/f6EtCH3gip6DE1ixS+UwkxWr0Bj7ClHsABEWySN0k7bYATE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464591; c=relaxed/simple;
	bh=YO65iETjpWy4FSYV/eWPapVMyFjY1FybT4084iGz7pk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o9AOGvVOKmS8YGq+7hHs31hRHQFXEtgV7vd/0V8HVk1YlMEERPMGsreKUJzCP7JPDz3d5YYt8xuLpFSbx4nX2BwKs8jW/hc0pjOVQIK3/84KsQX3V3CUmezcHgT9zsLL6RIEjBtKy9VLtruZ/F0ZLRj6g2ksMVQHsgaMjg3lhfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjvHVcmo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjvHVcmo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8381F000FF;
	Thu,  8 Oct 2026 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791464590;
	bh=YO65iETjpWy4FSYV/eWPapVMyFjY1FybT4084iGz7pk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gjvHVcmowX41X+RhtzpgG25SyGDH956ed26Nx4z0RyWfCfZPOjWuWlU7qo7iZsfyk
	 9y4A9W2CGDil8lYrU5b/86bTQm1YadOM480chnbtzzDfDW06MK7X1EXtZRE3jPACR2
	 OchoQRKZjzh5vcn185CFgZ+HF40HH23UerAhGTGIJfGXCkLqphsSUswd/6oO9rYhPv
	 /fyG/VIZoRgL9qzFHdmcEByJLTHNBqsNmTMjKFCnE3QCOHR7891/pKT8C+5uF13DwQ
	 HoSJoVP7AF7EWwwwLCA8RrHQDTnx0iiFIeYvfzLlKf6WLxmzvE0Wp+nxnM6/7XvuMc
	 z5f2YYCtOZ9SQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tj@kernel.org, tkjos@android.com
Cc: acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, jiangshanlai@gmail.com,
 markus.probst@posteo.de, FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v8 2/4] rust: time: add Delta::as_jiffies_unsigned()
In-Reply-To: <20261002050428.2746277-3-tomo@flapping.org>
References: <20261002050428.2746277-1-tomo@flapping.org>
 <j4oi2nx4gTrAXuHNkSikEojPIZb_3DCm5KFGhm_xanjipZh0c9dduW5VWaVhpfH9_a6lxLmiBUqcxiW6rYqcFA==@protonmail.internalid>
 <20261002050428.2746277-3-tomo@flapping.org>
Date: Thu, 08 Oct 2026 14:55:26 +0200
Message-ID: <874iewe4ht.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Delta<Jiffy> is signed, but some C functions, such as
> queue_delayed_work_on(), take a span in jiffies as unsigned long. So
> each caller has to clamp a negative value to zero and cast it before
> it passes the value to C. Add a helper that does both.
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

I'm not taking more patches for timekeeping this cycle. Up to Miguel if
he wants to take it through rust tree.

Best regards,
Andreas Hindborg



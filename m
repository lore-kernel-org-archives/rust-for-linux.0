Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD03BE540
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967948; cv=none; b=cTIIoWdqWJJgbdzNA7QQAIMPjzi4YC6jbT4yxo90hrzyd5iwfgp47IC15zxWKtecPzsKzKWg7Hnr0crO0utLLco/JO8kn+hprnuNpA3HzC9EPjf3Q38DXUnN/MWosTUT5vzyt0qdKJAu4Swp2SZ5qTR2usHos86aZjR+/nZjF3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967948; c=relaxed/simple;
	bh=eNyZ5jDwakTETEvETPAySLqWndyCSfr7tmMIaiizT7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UmHP5wHp0N7NDqlSo2wyB/lc4WPuzz6KUWhx4GBhCliWboR3HLsxQexsUZ7lOEtE6TLxF0BgRgSWQfnrw5Bjb8Atvgj4u6V4ezb4e1uHIo+T7MxC0sKudpFzEmLzgjwQujK3UUlLzpnEH9tdr4euOneqgcLp8ee2LNf7iuhnmWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVnwXXG0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVnwXXG0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21A8C4CEF5;
	Wed, 17 Dec 2025 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765967947;
	bh=eNyZ5jDwakTETEvETPAySLqWndyCSfr7tmMIaiizT7g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rVnwXXG005MRXNzxfgv0CiXTA1cvqe2vdwKnEKHb9xPdkwnPpxvSeCWC8re6HJYZk
	 qxox8w+c+t+i7+KjC7UNAzPHOCwAPYHaBPZyPl0JqEZoC+gU1hgvIJ+hcajEPb6g/H
	 AD2sZHXLMSqDA0NHXN3sqovGp7LhnLAoQjaduNl5qZS4YfdORpsrn9PTliFmXZJVAZ
	 A4BRP/k8AXfALXaRVFgQDqH1L+jEjCTqwdOKUT0Atd3EvMmyxNxIpR1+YwG9WAzSkg
	 vVXFPD2XYvnGPNFNQeaKxPX9G0VXhH/LVKhNZ+BjnfmCmmKwdoMQtx70GBwgvKKVq7
	 MZ7EOdRSMLO2Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org,
 gary@garyguo.net
Cc: aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, lossin@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: set_once: Implement Send and Sync
In-Reply-To: <20251216000901.221375-1-fujita.tomonori@gmail.com>
References: <M2WR1VEvXZ1Q6GMTaONdJJTInO1AhDjAHfEKH0smTXBb9W-NUBo297K6Vzaubm_onBroEaFLIrzsgMDQbU0pbw==@protonmail.internalid>
 <20251216000901.221375-1-fujita.tomonori@gmail.com>
Date: Wed, 17 Dec 2025 11:38:54 +0100
Message-ID: <87qzstv1dt.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Implement Send and Sync for SetOnce<T> to allow it to be used across
> thread boundaries.
>
> Send: SetOnce<T> can be transferred across threads when T: Send, as
> the contained value is also transferred and will be dropped on the
> destination thread.
>
> Sync: SetOnce<T> can be shared across threads when T: Sync, as
> as_ref() provides shared references &T and atomic operations ensure
> proper synchronization. Since the inner T may be dropped on any
> thread, we also require T: Send.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg




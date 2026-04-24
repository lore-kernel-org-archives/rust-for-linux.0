Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8333C3BE17B;
	Fri, 24 Apr 2026 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030939; cv=none; b=jQvhtTx06orCvpnBT3Y7w3ShGKHglUbQ3go1H+6xrCPJjOGwN+NfY40BRaxc4QbjiJSUZrdL62n6UCgiVub+Tv6/ofmpVqJAa/Q5qt08on8iRLLXjDsZaWpY5fDDKCn7adVWLr0dI2M/ICQPF3lJlowqnusxfQzUGhO1h8fj4Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030939; c=relaxed/simple;
	bh=tZKPR//23lfAsoiQUaKgV+4UP22jeYkcw+uzX5CkTWY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RteOZ5bPk4eGaQ7/GwJTBzKCQefvBhFliDPcF0zuFHw2Q93wVY7cK7ZDmYUMoEOcE0JDRkasm8an9Y85/TnJYxWZCeDsK3v9P2hEjlt+guKiSp751428MZaJKfy6Owd9eHMsFey9KAx7yZFeGZZRkj/TIl+VFGD/ag0XcZDRT/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kgu550Dk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kgu550Dk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEA8C2BCB2;
	Fri, 24 Apr 2026 11:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777030939;
	bh=tZKPR//23lfAsoiQUaKgV+4UP22jeYkcw+uzX5CkTWY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Kgu550DkK0b83LfyXC1QrLfhE2FbAOqLtlQMYk3DkK7gO4khSFcFbSKOeiSYgAmIo
	 rDFH4Ls19dcBs1eG2h/hrd9hynMntVd8izHKIfT0EXeFBbiWxu8O+8AbrI/jMPRuT2
	 BVxVj2ymMo/J41SYAs3dMAQ/mm5tVWWscicTSrqj7nKvaIK3+uDglaFvPYRihrQYXv
	 Jiu73jNOhtiBzJHZAfMy6DiwyNMhpMXZp2Q6aRn9kmk2tMV/cxG1/u9izW4Z4jVbCm
	 wHE+UmhoxAVxDmyevAUgG/O/hM34WLG2+RpUgvg82f9rQwYaAmagEyRAje11JSmEkH
	 QV21uAC/FU4dw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>, Alvin
 Sun
 <alvin.sun@linux.dev>
Subject: Re: [PATCH 4/4] rust: xarray: Add Guard::find() helper
In-Reply-To: <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <1TcoEoC6DnctfKo9mZsuxSJtZ02ujRRd7O0Jxu62xR0JPeJcq2hB7XD1qBbjleyTBRMWf-uy0HLh7lWkYXbaMw==@protonmail.internalid>
 <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>
Date: Fri, 24 Apr 2026 13:42:06 +0200
Message-ID: <87se8kh9f5.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alvin Sun" <alvin.sun@linux.dev> writes:

> Add a helper to find the first present entry in the XArray.
>
> Returns the index of the first present entry, or None if the array
> is empty.
>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

I submitted a similar patch a while back as part of the dependencies for
rust null block [1]. Could you check if you could use this patch for
your use case?

Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/all/20260209-xarray-entry-send-v3-7-f777c65b8ae2@kernel.org/


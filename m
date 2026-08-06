Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F47B435AB4
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009677; cv=none; b=Vxyq0GEBnwRyFKTPvoxnE5v8uHk+FNnEglbyYKf4I6aCbtmH91e3xjnmw/2PD5p1gayFFFgAU8RVxgiylevSQ/QdCj5nBnKbMVcJ+3nePyjxlaHmn8ZngZjC+30qUwNWR7undmZvcafRfWGyZi2UtFtqLwQOKj9uEKuvf9P87b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009677; c=relaxed/simple;
	bh=RLeoXUGaAjqszXNBsTAWA8aIf14JjVb+aoH7lvL26Co=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AQc9eL94tSMTG9rvaUmIJ3tsXAatrR7DGDuppo9FwZk4cM9X4mI05ceLLPRj49M08BQdxiow66IFCnKqG+4oKdg501TJXDdFOSWXReuJacvP+RqF/R4p71vDAksXkqChFweCtANIL4p5aModpVGKgCrLG4WklRzINhg9JuKAOzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENWS4GVu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENWS4GVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A611B1F000E9;
	Thu,  6 Aug 2026 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009673;
	bh=RLeoXUGaAjqszXNBsTAWA8aIf14JjVb+aoH7lvL26Co=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ENWS4GVudFHJ4xdq1bzBhJTAKJ4IDgprWbxJyHnduZa+EWZVUuTO8mRk0fA2AHqhC
	 TlcUDY72znWYN3s17ewh4tjuiRg2tT+teaVQdnY2bSyAk6rkiEOh7R00IxU7nzWIHD
	 CMV2TA1FDwy5/ytmLg2wxDnoiTkiHsGFBkP0Pq+Xw0KXxeuywa4E7YXWQ5Zh+CORDA
	 mtLYYBeg1Si293f6FZ8pZXQVPsCmZGg8Hyho1+zv2/wSpKPOP0fYJdK3PpopunL7Uz
	 0uGhfiNUH92kNXymaZ2EgvPcFXKSkMlkNA9XP7WZKCqYFDIAXCyGAVQI6bcIMrYnzP
	 e/db80YkCKrag==
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
Subject: Re: [PATCH v5 3/7] rust: time: add Delta::as_millis_ceil()
In-Reply-To: <20260806073241.1024319-4-tomo@flapping.org>
References: <20260806073241.1024319-1-tomo@flapping.org>
 <20260806073241.1024319-4-tomo@flapping.org>
Date: Thu, 06 Aug 2026 11:47:41 +0200
Message-ID: <874ih74m2q.fsf@t14s.mail-host-address-is-not-set>
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

Did you want to extract the common code between this one and the fix you
posed:

https://lore.kernel.org/r/20260723120907.209643-1-tomo@flapping.org


Best regards,
Andreas Hindborg




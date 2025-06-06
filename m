Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5200BA38
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Jun 2025 19:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749238492; cv=none; b=jn5JvSBI1xqhRHsrGxLYO/vQ9UTjp1Zc3KUMZ7TtuIZ8BvypRnAK3sTpvgmNZq6TuYE37l5FILUKj/DlYJxyTuKAfx+WTKQxQXOl7WpGV60qfDdiQKxDUMyAyc90StOfeiqvs77v5afA2yb27nOZAiojROcK56HwPtWTZbeP7QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749238492; c=relaxed/simple;
	bh=bx48aEfwR+fn1MJpawARdstji2mLJDCq/NMl37XNBQM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=o7Og+ypmB3nMMHGLRZk8CcSRzTpqQ1nSzIQyxTeDKcdAMvJburli9qOf6617zfRwRrzppIhG7PFksPu+4JxgO4GUWkI+nCgNv1WFG1upc53b2l/q/V2B22EfStW3u4fG6n01s0T4pgS27tcLl/KAF4HphH277UYMi7w83zCC0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmD9g+vp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmD9g+vp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C386C4CEEB;
	Fri,  6 Jun 2025 19:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749238492;
	bh=bx48aEfwR+fn1MJpawARdstji2mLJDCq/NMl37XNBQM=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=GmD9g+vplpo/1uS0IlrouFU5KtUQSQMwUXsFQbZGFcYTPAcKOBNjta0n5laRip5y0
	 79Pthm+HlCWDSb4bDLTqw5suGRW8voO7RxKJM9xXNNxvJjhfCm07owsLdDfk2rg/+R
	 i8GEshQ1OexUUAyKWci3yiUwJ3mcD31o7TNEEangBc0ZKVe4DL5xOLj9QO7XQE9cYF
	 JcUDqL8UFIDEBN7DeXxuEpYqDDEmPC5dFKc4K6TzZ12zClsTzmq0zJRBlWoReHxway
	 +vqMNs04VWe16xgsCLIUDhhULTcC9hrHtvn9g52xz98bKKzcgkngfMYW+t00H5y3Lu
	 fTBEkf6+sDoRA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 21:34:48 +0200
Message-Id: <DAFPAJVGHFAT.DI2E2NA94KM8@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>, <a.hindborg@kernel.org>,
 <alex.gaynor@gmail.com>, <ojeda@kernel.org>
Cc: <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>,
 <boqun.feng@gmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <rust-for-linux@vger.kernel.org>, <tmgross@umich.edu>, <tamird@gmail.com>
Subject: Re: [PATCH v1] rust: time: Fix compile error in impl_has_hr_timer
 macro
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250606020505.3186533-1-fujita.tomonori@gmail.com>

On Fri Jun 6, 2025 at 4:05 AM CEST, FUJITA Tomonori wrote:
> Fix a compile error in the `impl_has_hr_timer!` macro as follows:
>
> error[E0599]: no method named cast_mut found for raw pointer *mut Foo in =
the current scope
>
> The `container_of!` macro already returns a mutable pointer when used
> in a `*mut T` context so the `.cast_mut()` method is not available.
>
> Fixes: 74d6a606c2b3 ("rust: retain pointer mut-ness in `container_of!`")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/time/hrtimer.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

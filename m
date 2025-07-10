Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352D372636
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752159672; cv=none; b=dEICHl2Oh3F3YUVEg7zLJ1/3YzEWQH0Z9s3fNv5KCfrCmK6bmw4a3/1CC8MAOMyWS9GPePpUSA8Hhr/pMkRr76glTd+YizhVrTfmBkjHhy0cPqqL/jmx+zoLtM4OwsPm4pDSDT9Leefs0dEb/A4H7YGMWIcHKRqJw3nJiItzXmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752159672; c=relaxed/simple;
	bh=yGgiDwiXUmMY8WXQMntvzeCtVNQLE0pt1JlKAWGsKMw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BgMFA0F2hmodbUVGe38kX03a6W54+jrO+snn4MILHey+G+/ofObje+L0hI45VUo0Qkgd+bRo35dX1vQO5E27VAC3Q1m+xdZtBca1wkkNnxcZ3y9NLCdVKfVDCi9R4Eh+R46dWPmesmzzKoSx+sDpYb7To5/lqP6o2VNC7dngxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=moidodam; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="moidodam"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6B7C4CEE3;
	Thu, 10 Jul 2025 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752159671;
	bh=yGgiDwiXUmMY8WXQMntvzeCtVNQLE0pt1JlKAWGsKMw=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=moidodamoh52bGJU2OfsfHCL2jBUK+PU5SwLkqPd1xnCK3CPuTPv7HOOFoxKAbWwX
	 H0MjrxomtbeDmlJDxhijnGK2EMb1Ls/jnNjkTrHxC2A63UZwdGFe4IFHOAD4IXJv1d
	 +X6GCNkRdC+pBf28ioZ4sSGfLkq6PoQhOCo8cgZoCU6EVXjzv0BjPLjiUEPZTdyWSc
	 gslhX77AXuWDlNDbbi8vj7CVxHTEUo7u2V9AkK4n0GvJG5IXvSBiENBueSAnFtC+18
	 mJYZ6vOeeAxUljd1wRurbDx6KoEzQkLMU2czq0VllY09wu6JSxDxb7mUQKNRCC5LmG
	 fpR4XszNifRZw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Jul 2025 17:01:06 +0200
Message-Id: <DB8GRISJR5MX.3DELQEG2V8SQK@kernel.org>
Cc: <yury.norov@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>, "Benno
 Lossin" <benno.lossin@proton.me>
Subject: Re: [PATCH] rust: cpumask: Replace `MaybeUninit` with
 `Opaque::uninit`
From: "Benno Lossin" <lossin@kernel.org>
To: "Ritvik Gupta" <ritvikfoss@gmail.com>, <viresh.kumar@linaro.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250710123836.146825-1-ritvikfoss@gmail.com>
In-Reply-To: <20250710123836.146825-1-ritvikfoss@gmail.com>

On Thu Jul 10, 2025 at 2:38 PM CEST, Ritvik Gupta wrote:
> Replace unsafe `MaybeUninit::uninit().assume_init()`
> initialization with `Opaque::uninit()`, which is an
> abstraction for handling opaque FFI types.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>

@Viresh when you take this, please use <lossin@kernel.org> :)

(it also is in .mailmap, so maybe it will automatically be fixed?)

> Link: https://github.com/Rust-for-Linux/linux/issues/1178
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>

Thanks!

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/cpumask.rs | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5E327F010;
	Sun, 15 Feb 2026 23:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771197970; cv=none; b=O8eujAdl4iNoHTsAzwtq4Mn419Zp5krYzJ81ASa3zndPSb+OQuvE92R0Drx8vBoDL22Nt5bnrIUjMyagE/XoJ07TBfKZPq2VFGCkSXWDGtAeps1QJtq/KaLxC36aB0tDbEnO+eQi54Q2k3Vv01CkV8CZJlfAh1V5QNfpwRTwWZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771197970; c=relaxed/simple;
	bh=IDQrgHU+6bxNOt9sKhUZszQ7sxXBQyVla/OvhAk/1QA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=k+l5cyfEgh2OWGdbnBwi4ok6R9d1AZt2Mn0X4lYssdRsF0kAgUHf9mHqhpcbqWmZ+c7EI6U5Cl6HGrQHU3GIgY2hVHPv/IiYldPSHVW55h3sof5/ue99du3Js2bPVYy/So+6t+GAnI+ImX0RSfDA1bpOJzKKBYSbL6OLTUm1lBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8RNtXKf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8RNtXKf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C123C4CEF7;
	Sun, 15 Feb 2026 23:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771197970;
	bh=IDQrgHU+6bxNOt9sKhUZszQ7sxXBQyVla/OvhAk/1QA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=G8RNtXKfzgZ7sQzaJiMM//8JACy9iot3Apvq8oeOBQo+KL/91rkfMaqlkoSm8ntCX
	 XyraMvNbr9oDm3dqAp//c30crZMMXmkll95TCCxE/SNR43sNt/UWw+UHGOYB1yasUg
	 FTrA0cxRJ2cTui27ZbINsjByZrpSrhzY3fgPnC8Ppjv5VosGYWzJcHXq3VGnjM8G9U
	 wd7+6+exmQg/+HcI/26vcvgesNLGyvtF2FZZ9TN9nMdzjKAiIPWxUwiUmsyvHLBjzj
	 0neW0Fz+CiEjSxiWp22XxZksKTRef+QNu0FRuImVPc1mSuBSNxDBJJvlbSe8TWahLh
	 MsBvuL8VSPqcg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 00:26:06 +0100
Message-Id: <DGFXA113B8XT.2IPBLCLYT1X5O@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: sync: add `UniqueArc::as_ptr`
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260215-unique-arc-as-ptr-v1-1-bdf4b3174475@kernel.org>
In-Reply-To: <20260215-unique-arc-as-ptr-v1-1-bdf4b3174475@kernel.org>

On Sun Feb 15, 2026 at 9:38 PM CET, Andreas Hindborg wrote:
> Add a method to `UniqueArc` for getting a raw pointer. The implementation
> defers to the `Arc` implementation of the same method.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/sync/arc.rs | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 289f77abf415a..9c70fdd39bd2f 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -770,6 +770,11 @@ pub fn new_uninit(flags: Flags) -> Result<UniqueArc<=
MaybeUninit<T>>, AllocError>
>              inner: unsafe { Arc::from_inner(KBox::leak(inner).into()) },
>          })
>      }
> +
> +    /// Return a raw pointer to the data in this unique arc.
> +    pub fn as_ptr(&self) -> *const T {

This should be an associated function instead of an inherent method.

Cheers,
Benno

> +        Arc::as_ptr(&self.inner)
> +    }
>  }
> =20
>  impl<T> UniqueArc<MaybeUninit<T>> {
>
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260215-unique-arc-as-ptr-32eb209dde1b
>
> Best regards,


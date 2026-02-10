Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6C63242AD;
	Tue, 10 Feb 2026 16:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741926; cv=none; b=s0xvS2gFjuZ8aLOR1SuqEYfkfuLh+zqgSVOXokPBNSRsdFfgF3nptRCNw2geOKzkjQbRQdmXQmjeo7W0WMXoE7h6dLvhzx4RfztGu61P5H2eF/s5PQVkL2mzjdkOFtoYDKnIRtPRSqod3sa//Wm4GiY9WUtUH9R/VFDhN45Z4H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741926; c=relaxed/simple;
	bh=z6X85SYM9Ks0D7DNZwibsEE5BEUD7xuH5Tdn2cTjgtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b99QcxHGHiI5OHFgbBpNHzD8b6b4B/tWRfbkKPw+1F1ZCAjpsKnF51mTpA/LGRmU3RqohdUSbCsGpOmCVc6APUpOOXdpQrJBiDOI9OkzjeQ3FECf9Y1BHt3Qsrri+AN0HOUTWqp7izJeDn+4LTOLI4giKDl4Qi+nMG39mzDk/BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j90n3GiS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j90n3GiS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B3EC2BCF4;
	Tue, 10 Feb 2026 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770741926;
	bh=z6X85SYM9Ks0D7DNZwibsEE5BEUD7xuH5Tdn2cTjgtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j90n3GiSWKPdDxGXUVbFfKf9EITsQEjJCxQRSZiCqI00qhYrfpi4zqSfKh0ftNrOb
	 2nYUv8VuKTrCeP90jwgd+SXMrIHrI7JWD7eaDdmJ9TaPgVVW6/bPNLlVBU9tBoJ5KA
	 2A3eL2lC2dLQmT/XUJFQky+tWNE4irQTei+O6Or2mqpGBYuvBZBwatlPCQGEkSwRlP
	 lYCVqHWsf5e0lvgh4uEaZ5uXQfPF6Ka5u5xA+UybrqpQokKU0JPvOQxDgF15wtaWZY
	 gqx/d8FWvF16fc6FLVUVRW+LA68yGglb4ErwPCB8gMNgqF7dMbM6ULSX86WwhCTc4e
	 30yfgCpshWLWA==
Date: Tue, 10 Feb 2026 17:45:20 +0100
From: Daniel Gomez <da.gomez@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v3 02/12] rust: xarray: add debug format for `StoreError`
Message-ID: <aYr-gyQN_AaIJkSH@macos>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-2-f777c65b8ae2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-xarray-entry-send-v3-2-f777c65b8ae2@kernel.org>

On 2026-02-09 15:38, Andreas Hindborg wrote:
> Add a `Debug` implementation for `StoreError<T>` to enable better error
> reporting and debugging. The implementation only displays the `error`
> field and omits the `value` field, as `T` may not implement `Debug`.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Acked-by: Tamir Duberstein <tamird@gmail.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/xarray.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 88625c9abf4ef..d9762c6bef19c 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -193,6 +193,14 @@ pub struct StoreError<T> {
>      pub value: T,
>  }
>  
> +impl<T> core::fmt::Debug for StoreError<T> {
> +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> +        f.debug_struct("StoreError")
> +            .field("error", &self.error)
> +            .finish()
> +    }
> +}
> +

Is there any best practice for when to include use core::fmt::*, so you can
avoid being verbose here?

I see other cases like this, but I couldn't find anything in the code
guidelines.

Reviewed-by: Daniel Gomez <da.gomez@samsung.com>

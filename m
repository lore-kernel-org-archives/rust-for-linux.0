Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0807B176FB6
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515626; cv=none; b=AYvge8DNXdZcLVI13uaeZQ1ewojPLlVQSXJ7/HytxJ7l0Jt81mExhOErYNnqsPTDB8e1kPwMLkFk0LtO6pWLXIiUeIZRC4W5+iQnSvx0k8i9JGsGfneWZtNH2grlumvgGFMpXwkfFAeC6qengNXdePqOe/y2RJq68XSsr4RrT9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515626; c=relaxed/simple;
	bh=4akmvLPECkHEI/wk2nFwYvUYy0lFB0J/tRD7Py6Dlh0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K0W3iRNvpkQZpbDsV/R4rFyBWk1l/UrOk01GZ8U3cW3LQRHwCMmI62Ea52gHfoAXwF9HiSsGVmqj9tCdgNbZDGbuddoSTRH/kPRXS6UPgY8yVYzjquFauWFriZRbToNhF34kP1hVgREbVKuF6tRz9qRUY8IMwGzTqh0ZQqSTH5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5A2fGms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5A2fGms"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4731BC4CECE;
	Wed, 18 Dec 2024 09:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734515625;
	bh=4akmvLPECkHEI/wk2nFwYvUYy0lFB0J/tRD7Py6Dlh0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C5A2fGmsQwKt8QA8Is8AqlSTJyVqGaXYRm2ud9BtWGn3EIE9wHHREcUTqICQtIAz0
	 lhMhEWQH5Ydms5Y6EXAeMTMTCopk5iUVGNmhcWk4MoihoSSMwzqNeOchGIVmxNUy8a
	 7/HX4hK2wZPXjlw6UfTjPmgnTFQ2BIQdsUIC9HVNF6gOxDj0xmc/n7PsKLgauZ1mPx
	 veeIiObJhtPLSAsr4GFiLqqoPTn5nYEWC1n+vEL6vI3AC6fWom0/MKPk3CtoDFDHlo
	 W86TxNrbHl3h6apik5PsDEN7y1THJo1Vx2Tj6uAeznAEVC3+BM2WDL4+hnwFt7Cdd2
	 YFwBrTi2BEC9A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Yutaro Ohno" <yutaro.ono.418@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Jens Axboe" <axboe@kernel.dk>
Subject: Re: [PATCH] rust: block: fix formatting in GenDisk doc
In-Reply-To: <ZxkcU5yTFCagg_lX@ohnotp> (Yutaro Ohno's message of "Thu, 24 Oct
	2024 00:54:59 +0900")
References: <ph7VkicLU4yMQL4FUVSCq45yCb9emV-L4pvLSth1YHZVJpQbj5hm9WTimoY8itOXmT0_lBYTWsUb8Akemdo_Gw==@protonmail.internalid>
	<ZxkcU5yTFCagg_lX@ohnotp>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Dec 2024 10:48:01 +0100
Message-ID: <87ed25miem.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Yutaro Ohno" <yutaro.ono.418@gmail.com> writes:

> Align bullet points and improve indentation in the `Invariants` section
> of the `GenDisk` struct documentation for better readability.
>
> Fixes: 3253aba3408a ("rust: block: introduce `kernel::block::mq` module")
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
> ---
>  rust/kernel/block/mq/gen_disk.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
> index 708125dce96a..c6df153ebb88 100644
> --- a/rust/kernel/block/mq/gen_disk.rs
> +++ b/rust/kernel/block/mq/gen_disk.rs
> @@ -174,9 +174,9 @@ pub fn build<T: Operations>(
>  ///
>  /// # Invariants
>  ///
> -///  - `gendisk` must always point to an initialized and valid `struct gendisk`.
> -///  - `gendisk` was added to the VFS through a call to
> -///     `bindings::device_add_disk`.
> +/// - `gendisk` must always point to an initialized and valid `struct gendisk`.
> +/// - `gendisk` was added to the VFS through a call to
> +///   `bindings::device_add_disk`.
>  pub struct GenDisk<T: Operations> {
>      _tagset: Arc<TagSet<T>>,
>      gendisk: *mut bindings::gendisk,


Acked-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7318A17995E
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 17:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742060679; cv=none; b=SQkYvZZ7sl9ckxvmwKIEal1KtbFxBRw3ns4hq9xyhWh6OmqUTmG6BMxt4Xm5x4Agm1I7/HOaBtCnicKD5kAdZa0/6eaN879EjKAbGpSug9+jfiVAI5YqUTpIyXwdjVh+jqJCB3ijTppWRh45tURfPkQRy4cyY8qH0ylF3mxr45c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742060679; c=relaxed/simple;
	bh=gp+OYV78qxQOV5B0sc/yS7qdmrOMhYDOjFjXHtYkWDk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VEsqxaVQjVG/h9xMJElQGLnepMuduLXixGl9+ihxbmUK2cN5xUiq92IdyOWk0Xt6J+0ZkAZK+wzTsQAimRI5y8MA3bP3ZwgwoKfYIKq/xloh89Raj+j6r0TGf+B/A2d347Nr/GJuJgTfcNdFyl9BPt0GBfMRtkz/2Hxa3oOsrkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=SXUMfsVy; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SXUMfsVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742060675; x=1742319875;
	bh=HYmPdda2s3kQLQWWvWsR2GXxhy8jZi7aVFeHmTkzzI8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=SXUMfsVypqE5s3HXRMUfGI+2iJ8lQTIF2eEidUhcF3QMF4/xpMLR2YZLF7BbvjADr
	 a68zMmrrBTVaDsolrGTNDVia8UjauzRVsUCYGYiYek6b3AJWeL4Wd/e/FaDuEDQFet
	 IE9TCrczYrt2M0J/XGc0+eqQxkJOyUwf6LJ+ztVj50+xH/iGv3jfAWiWIkuKx08jmE
	 N75Zm3+Gr40DqtCwfCQu6qBVpjqSs4s5nFy9vRMSJyWWdj9rdn4Byu8eQQvZFhFkPC
	 HYNgaOTA0M2qCvJj6moqLk0TfSC28pVfQ/HBHVJFe8i3uQrhDoGtcYDWJ9VKsI2KoH
	 3Ld96Maz+qFlg==
Date: Sat, 15 Mar 2025 17:44:29 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
From: Benno Lossin <benno.lossin@proton.me>
Cc: andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
Message-ID: <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>
In-Reply-To: <20250315154436.65065-1-dakr@kernel.org>
References: <20250315154436.65065-1-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 2298fc2b3e92df9cc6244a7e37f7846990984947
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat Mar 15, 2025 at 4:43 PM CET, Danilo Krummrich wrote:
> Extend the safety requirements of set_len() to consider the case when
> the new length is smaller than the old length.
>
> Fixes: 2aac4cd7dae3 ("rust: alloc: implement kernel `Vec` type")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/alloc/kvec.rs | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ae9d072741ce..8540d9e2b717 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -189,7 +189,9 @@ pub fn len(&self) -> usize {
>      ///
>      /// - `new_len` must be less than or equal to [`Self::capacity`].
>      /// - If `new_len` is greater than `self.len`, all elements within t=
he interval
> -    ///   [`self.len`,`new_len`) must be initialized.
> +    ///   [`self.len`,`new_len`) must be initialized,
> +    /// - if `new_len` is smaller than `self.len`, all elements within t=
he interval
> +    ///   [`new_len`, `self.len`) must either be dropped or copied and t=
aken ownership of.

What is meant by "copied"? I agree with Tamir, this can probably just be
"taken ownership of".

With that change:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

>      #[inline]
>      pub unsafe fn set_len(&mut self, new_len: usize) {
>          debug_assert!(new_len <=3D self.capacity());
>
> base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a



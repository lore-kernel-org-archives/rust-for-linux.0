Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA9384CC6
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Oct 2026 20:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317915; cv=pass; b=I9TBUgnQHldUTsT29Bz9V8lX7KndNB7MwfMoujtlgOxmgbhWwxFYCduDQ3I1sQB/giUi/nvh/Rzb9A913lxodrdcCHkXqSBuPev4lgpAiuCohJM/q0VZ0fc8f0M6cjzhqSv/2kfpuLbuylm6r5TvkBLBLaRkqnx3tScRH7PGRSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317915; c=relaxed/simple;
	bh=BK00ZnsjwSE3rrqFWgg6BqhBupuehgDHjlJRfgelxBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgjbf5I+tdnRHN/MOzqvaJPQbyYk3kq6EBc2yNVZxlB9ansLkI5sZ0shHGb4NZ+zqTlmZzT+YA0cGbX0NdjznCoWDzJLMxi3ih9FPWUoy8RpzLJhTMMJAhqbLf6aNr0oP3KJciINYLHxe8jS8doqVp7WHud+O8EAMdNumBaaM6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXsNrqHL; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXsNrqHL"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so688718b6e.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Oct 2026 13:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791317913; cv=none;
        d=google.com; s=arc-20260327;
        b=WnK3NCopgz+up58TvCrx2+tAglD2oL2liO+qFl0WhExmfFNDpV/KZns6oVyWB7NQ3R
         fN50paWGnWuzsEL3T42a/1W9WHRMBAkLThd6mRstif6VZPyeyeiHQUKm1xVoQCOpvYKo
         4CG42Y+HIFWTr+2DWnfU3gR5bkWj/OjbibUwS2qkIYxuHXWQWGEPX+2GHrIp7RvGouHc
         cZKZFE2fF2wWQuqMKglcjRowUxubS2qj456welHXO8suNn7rK9arWXw/FtlqZ6eTFNPn
         F6Ghw8blklffpFyMJBYiwnk/iHmcIcvlk1wchbMoTGsc22HHywJ3XB5j/SinAJ0p8iE8
         OQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=unGpZuoGwCp6GPULGSymBEsnbWZmuDDCaGyAtdcZdsE=;
        fh=BCV/BfIxKHc+naUrwDY+zehPQqBOpaDvRE3LPlk8Xs8=;
        b=eupmZ41J+JsRAf2C95a2w1eqMPk4m0B0ZzFHS/pnt+1wDWny5a9+WyXKygvJTYU+2e
         DZ3Au938zUBRU4h5iVF9sLPrPmgYS7AC+bnsVuTr3NMN0G4JAjkDaTm2qCTUYwuhu7jI
         Wo9BRWIIxF6Kt062zrAX81ji0EGB8Wwr+YumQOU+WiVY9+je/uerz6GHI/oDd5NzJJAu
         Z0M79jTMvSxSUgZisrO909bnBC0P3MdLILknmjXYJWXTDfmewbouE1fcUdeEmN25Geml
         WlpD4kr1//PvvcByUeD0nDW6gUJh9FVE4cgcjCrx49mfq4gL8rQ7IySYijamzTV0+wvb
         2pOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791317913; x=1791922713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=unGpZuoGwCp6GPULGSymBEsnbWZmuDDCaGyAtdcZdsE=;
        b=EXsNrqHLEdxE2FTiUY5G8quk30QbyG/rW64eitVU4VsTj3pVoMspWijqVvlp97Eb4P
         3J7YmVrTcSIcX55u7RicXPGZDcLXs8kOoDfxiIFAOxZ2muKv9g4/DizTK1AaoOHAW4jW
         WhOjuxNIu4gFdxyEGm97YI4cml04HgpEnGxLzRUVkrbf/Bp8o5EFKSGasKuH+SChu5FU
         m53ZpLVcmgUVO/VLrQdP6w1VbEGFR0DDiG92lA6ebfANbrqT1eGx89YvJ3xtaqlWgl/x
         60vml9R4RmiYyJAyZa4at047nVrxstCc9Zp+eWIWV0r1o31TEpB62WpCZP28mnZmJ+1z
         2fVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317913; x=1791922713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unGpZuoGwCp6GPULGSymBEsnbWZmuDDCaGyAtdcZdsE=;
        b=0ObQtjf5ef+LTRCIMhkERd5U3QMp/DyPfVQQwuWtx3dfxW9cf/79wXEezyWdAD3971
         vgs0tDt+Q656kingIcH2hBpR2EaeQ76zdBcYZ4WTfm00X8W+jz7fSN7usu5ZAYPIHfNG
         xpxKQEPnt5e6rDr2JXTARm8TrYOQRUF7j+l16IY5mCVmPsnX0EXWzSex4PLg1TKwEmXU
         wuGzPMjy8vE0v1+WWmE6H7BjylP37v/vCZ64HI/P3b2CPHzPzX7V/5IBknYLR54HjMy1
         9J299IdBlsU/RdfHMLnycWgpEjspQzEKGGvdDJvVv3cY+ctVP12diF0WrDwcFDzKvaRv
         sAIA==
X-Gm-Message-State: AFuF++kbQA4A5gGJWdehgnXYP2Fr+NJr2jOcD0iU0TGvdeRaQPeT3Lo3
	hflbb/3qrWGozZXXwVua3O3xeoDwR05sgCgS/Dlm/H6OnNsB1S2M6yznMtQT/rNxfvM+iAgl1oT
	pdXxEXcZUW1onT/u+T+AlHVhaNOpmwKE=
X-Gm-Gg: AYBFou1qk1zPcuNFdKZOkd66IxvOAJXdfPxNS6bUesh/fjPmBLAGhC8CEJ7t831dW6C
	FSiZLVB2Bs+xIGe0aGIHOZzPOloYTd4tiZF00N0An88bLv3VgGvyUSLOpnsEhzX8Q9aN5PhzpNL
	wC+hocYski2+jxxYyBj0FDxDiz71T4YPDRJitramnNnbGZRwYoRWWAPSHnt0+3nXhTIoNTBVQo7
	8mPm+24dq2voJERWu/jO4qxp/l+gQSfm919Mlha1mGaWTQDh9we83kIOpDY1E7rKYb5dKhFiCoT
	1WSy9i/OvwknnZE13Xf1cEyi+WI+IrMPCVPmz0/+hGI4WBDSnY9W/cBgwnB3xug28TQD41sZ9WY
	vz8AvS+GrFvTuXA==
X-Received: by 2002:a05:6808:2387:b0:4d6:9283:1df2 with SMTP id
 5614622812f47-4fc46f919ffmr310232b6e.61.1791317912873; Tue, 06 Oct 2026
 13:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006191009.143707-1-miguelcorderopamphile@gmail.com>
In-Reply-To: <20261006191009.143707-1-miguelcorderopamphile@gmail.com>
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Date: Tue, 6 Oct 2026 16:18:22 -0400
X-Gm-Features: AclHuK_D1Ft8dS8r4Q5saUVZyksw6dF2Gg3tGCiBGgGW45JIdFNVxXA19lWW69g
Message-ID: <CAESH5ocS7C8utN+jcRt0EqBmHOFhYJpshv5p+cTorbewV8TEag@mail.gmail.com>
Subject: Re: [PATCH] rust: bitmap: document `next_bit()`/`next_zero_bit()` panics
To: Miguel Cordero Pamphile <miguelcorderopamphile@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 3:10=E2=80=AFPM Miguel Cordero Pamphile
<miguelcorderopamphile@gmail.com> wrote:
>
> `Bitmap::next_bit()` and `Bitmap::next_zero_bit()` panic when
> CONFIG_RUST_BITMAP_HARDENED is enabled and `start` is greater than or
> equal to `self.len()`, but their documentation did not mention it and
> stated instead that `None` would be returned for that input.
>
> Add the missing `# Panics` sections and clarify when `None` is returned,
> matching the existing documentation of `set_bit()` and friends.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1252
> Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> Signed-off-by: Miguel Cordero Pamphile <miguelcorderopamphile@gmail.com>
> ---
>  rust/kernel/bitmap.rs | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> index b27e0ec80..5da8b12fb 100644
> --- a/rust/kernel/bitmap.rs
> +++ b/rust/kernel/bitmap.rs
> @@ -459,7 +459,13 @@ pub fn last_bit(&self) -> Option<usize> {
>
>      /// Finds next set bit, starting from `start`.
>      ///
> -    /// Returns `None` if `start` is greater or equal to `self.nbits`.
> +    /// If CONFIG_RUST_BITMAP_HARDENED is not enabled and `start` is gre=
ater than
> +    /// or equal to `self.len()`, returns `None`.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if CONFIG_RUST_BITMAP_HARDENED is enabled and `start` is =
greater than
> +    /// or equal to `self.len()`.
>      #[inline]
>      pub fn next_bit(&self, start: usize) -> Option<usize> {
>          bitmap_assert!(
> @@ -479,7 +485,14 @@ pub fn next_bit(&self, start: usize) -> Option<usize=
> {
>      }
>
>      /// Finds next zero bit, starting from `start`.
> -    /// Returns `None` if `start` is greater than or equal to `self.len(=
)`.
> +    ///
> +    /// If CONFIG_RUST_BITMAP_HARDENED is not enabled and `start` is gre=
ater than
> +    /// or equal to `self.len()`, returns `None`.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if CONFIG_RUST_BITMAP_HARDENED is enabled and `start` is =
greater than
> +    /// or equal to `self.len()`.
>      #[inline]
>      pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
>          bitmap_assert!(
> --
> 2.50.1
>

This duplicates the patch I originally posted on August 27 and
subsequently sent as v3 on September 8. That patch was picked up into
bitmap-for-next earlier today, October 6.

Best,
Georgios

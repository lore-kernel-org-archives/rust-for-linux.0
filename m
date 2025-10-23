Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D5C2FC86F
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208214; cv=none; b=OUVwjggkgiNHU355tOHgRf+NmKv+aRQSDI1STjCnnaKC5haKFpfslUEkGP0ROsUt7rdCv1eSsok9U5SY9Z9j2kxERxMEgBMiBITyK+K7saw05AM5qwdIz2IDOyIRvMQePULgsNlfkYeCLbMO1rDS1mYNlVJdUzvCMfgBtm/f+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208214; c=relaxed/simple;
	bh=+F0xWxetq0uJhy7xzwMN209SUUvvEBc1Vx+dg1vIZ6I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CmOikPAVjD+fafGhjDUJeOZyTp1TVUkc8FoxzbAKzqwnQ7qxroXOHMEGwhp6JmoMxeWdQhLKctd0+zUW5YPOGlY2hHoFJsylcf1f2UHUtEwMsDPTmuxHiXqKjqt35/8Yk74rue5RXaqUu49Es25DYJpqYb74sRuqACq252hb4fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l+NiMcQ2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l+NiMcQ2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-471193dacffso2406595e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761208211; x=1761813011; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dn2WRikqhcE3CQH1RfFoKYxVs6WPSYK+duqO3DtgGIw=;
        b=l+NiMcQ23EOrHbSqr3EVLabTwaWU15oxC4D4IOrxBkW71iH92toCJKpBl4/LCGEJKv
         fdbVt6QXdYDSfgbOucBBiElaE6+K37+oMQazgsScnmzIahRvw0ygnZqlig3rWo7u14W5
         R8aJZUrBpwqgs2Of51YOhx1RoNwjYuoh7YSsdh1g+MbjBZek1MnJWszv86Gar5qPKwdY
         vQSeeBakL893AZbFfzKPvg6oNsKIkh/byj5CKUA4jGjM4L+CN9O13JXHGmviGnvPHz0L
         3bwY/8xw53vr1q9fHZ4+2RgbMPPsFU9KFTGVH9IM094sn+2mrhWzhhEcsv63W3zVVp2k
         nqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208211; x=1761813011;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dn2WRikqhcE3CQH1RfFoKYxVs6WPSYK+duqO3DtgGIw=;
        b=Y9XHk6QEJV3Y5HcciQ0oiFa+1EFyrzo//QMBh3yF4kSzxLvXHYWydwvPpczM+BDMHT
         jNSosXh2bedsHsPUcnb/B9HFA2w0uwTZz3LRTBIkQjvNo7WgcKWDgMVjQ2g9y0aks0iP
         MXAKw8s6aGs1+gZ37CDOR8eyFsfiZXGJ6dC+JuMXp+3T58+ua72/EoImkIjOr4RUDeMt
         xXgEEuA8gKCazOmdQUJLI0CKz8zmfy1cFkmf2jU3B58Vfz+HMR8jJ6DwKlU2wf7mFrkO
         QLgCwhc7FEfCrAWkb3KWgHiW8QuF+XTrCFidoefTZRqut6Q/08sqhzzmQxWOXoYv09fB
         ZOoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr64IEumQMTEhsqPjNUecZKMdi8/oxVM8++V0YjSUmFcLD+Gfv+d6O51HUmw8OKoYwUSv5icR9Dr+DmQFqxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmCiMWZ5QCZggidyAyH4wAR3EZK6d09VJakKjatarFb/6h9uO
	oLPTb+vw+HPct9BeexO7YGzw9Wg0ikBR6iPPHENa2It9e9vdCNxM8rG5rWG5comsrZkUibhw15g
	06RaXEhZka1cReM4HrQ==
X-Google-Smtp-Source: AGHT+IGg+LSnQo6vibvjrS5qWozQjW5MNaffdqRfjcCBQJ7iPK24ykKjp0cY1RmxyPOafr+mGOXCfbkKf8lcCFU=
X-Received: from wmcq10.prod.google.com ([2002:a05:600c:c10a:b0:46f:aa50:d706])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37c7:b0:46d:3a07:73cd with SMTP id 5b1f17b1804b1-4711790c31emr141389685e9.23.1761208210774;
 Thu, 23 Oct 2025 01:30:10 -0700 (PDT)
Date: Thu, 23 Oct 2025 08:30:09 +0000
In-Reply-To: <20251022143158.64475-6-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-6-dakr@kernel.org>
Message-ID: <aPnnkU3IWwgERuT3@google.com>
Subject: Re: [PATCH v3 05/10] rust: uaccess: add UserSliceWriter::write_slice_file()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 22, 2025 at 04:30:39PM +0200, Danilo Krummrich wrote:
> Add UserSliceWriter::write_slice_file(), which is the same as
> UserSliceWriter::write_slice_partial() but updates the given
> file::Offset by the number of bytes written.
> 
> This is equivalent to C's `simple_read_from_buffer()` and useful when
> dealing with file offsets from file operations.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/uaccess.rs | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 539e77a09cbc..20ea31781efb 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -495,6 +495,30 @@ pub fn write_slice_partial(&mut self, data: &[u8], offset: usize) -> Result<usiz
>              .map_or(Ok(0), |src| self.write_slice(src).map(|()| src.len()))
>      }
>  
> +    /// Writes raw data to this user pointer from a kernel buffer partially.
> +    ///
> +    /// This is the same as [`Self::write_slice_partial`] but updates the given [`file::Offset`] by
> +    /// the number of bytes written.
> +    ///
> +    /// This is equivalent to C's `simple_read_from_buffer()`.
> +    ///
> +    /// On success, returns the number of bytes written.
> +    pub fn write_slice_file(&mut self, data: &[u8], offset: &mut file::Offset) -> Result<usize> {
> +        if offset.is_negative() {
> +            return Err(EINVAL);
> +        }
> +
> +        let Ok(offset_index) = (*offset).try_into() else {
> +            return Ok(0);
> +        };
> +
> +        let written = self.write_slice_partial(data, offset_index)?;
> +
> +        *offset = offset.saturating_add_usize(written);

This addition should never overflow:

	offset + written <= data.len() <= isize::MAX <= Offset::MAX

I can't help but think that maybe this should be a + operation instead?

Alice

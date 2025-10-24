Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F3A3101B7
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302354; cv=none; b=eQuloqf+hrb1fM2KpBbzHSi17q5Cu/11jI7EmiTni9zhn5/mFmAWCFnaTyQAbrB3oAlWmlycNcwEJdv5qpc9wue8E94tkKgJr08ZQMGAHVJiH/6fZT6dU3f3brB9cyAFf+REuiYIMrO145HZHpjYldc4A6x7gEVYZYWlSaX3cjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302354; c=relaxed/simple;
	bh=hLqLEQW//H7SR70Dq2KNBUCQqAo7BcQp3/CyUvMooiI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kqrj5oaHp2adCkpI0NPeebexuShKNsKdz/ROoxFtKYspsUvtIAJyhVlJlQZV+Ej9hmAa8AmXIb8qI0+37mkZBcfZKTL91Dv0EEctw3Ts9PmXP4+gn/KKjZN6BrCTvr/6/m07sZHHAe6A8mdoMqDfh3Ue2rAL71br7Az0mOuxAdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vLESs5Xv; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vLESs5Xv"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47111dc7c5dso12841395e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 03:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761302351; x=1761907151; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OPF1f85/FJM+wJtbt8GtXxyRXGLXZOfe4gspjYrW5Wc=;
        b=vLESs5Xvgn7efmeOlvp6xX9blc8ilJaQ9lJdvkq5HWqacHjOosORm+SSGVgmGH8RZa
         TRADfzW4mWJPKxmCJ+VwVQwNYyBSKnN/vhjNiyziagbkfPNiU9bH+jwOAVxyKP9Zs/Kj
         RaREpeNgLHzMyILrC3BxndzX03slLFdvNi9eXCGvR3QzZy9qwXZzRHxSwnD0BG2AQoo4
         LuzCmnnH1YhvwMBg7HtusMgYwb/eRRJf/TJTLrzLnaN1dA0J9JNZ4tajR7e33ssHQhmG
         WBfr5dflYR0o0ArgLufYrd6L+fFQuP/wh/0WMeYvg30B877F/x/Zg+00xFbA9eVmFfqj
         P+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302351; x=1761907151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPF1f85/FJM+wJtbt8GtXxyRXGLXZOfe4gspjYrW5Wc=;
        b=OyB4TCNnFxWBXgjAf8m0Lx2/9MExUxCRL4f7kgptXTwvAEHRns8htpiclFtlMpwDR4
         uiht16QLx8+Zny3y7/GSSlAS8ZKMjicChFP14zc9qBfd8qJHu/RwHWooCfQ24eteHtuR
         aYuCyb3nn+8RUODj7UIZQUrLjwFr0qc26RFZ3/jY8tA4yvzeIhaKk8rxUwD2u9qktASM
         0tCcstzh++dtWg4WoY90MUyAVuiM5koXCAgFGtZxXS6IR2bDfGiJ9ctluH/KVi0oTzp1
         7ryMHtZONN4YU0JTmJnQ5FI6J20WosFzt2BaB/m3XbQ17rxdBZz96wJBdcEiYIM+d+7L
         8jWA==
X-Forwarded-Encrypted: i=1; AJvYcCUckU1aPCgNTUOiO9iXrUuRfA5zJNuClnfThALcCK87kz6KMy5dQcIO+YotzTOpAA7Ay5VOWentWTYdqUsOcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhW+OiXOuEatogncZTInrXDgqGeu7mviux/h8cimnId3E3APgl
	v0oqvYn8SPg/dEKim51CFPIGHFtDR6w+e65uIkF4fQss6uf8b/EAcINVKU5B26evk10zVxI+SNJ
	WCTssvFLg9Kc7Up2Mmg==
X-Google-Smtp-Source: AGHT+IEjUBMQGoVxUfyDuWsIaZh++ce8Z93gQtTGPdxEJaJNt3LFU5j/zdaAt8Gsv0XYS4ZhQjjGAb/v4s3GhzQ=
X-Received: from wmgg22.prod.google.com ([2002:a05:600d:16:b0:46f:c7ab:c8ce])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:295:b0:46f:b42e:e362 with SMTP id 5b1f17b1804b1-475d244d6f1mr13867525e9.19.1761302351572;
 Fri, 24 Oct 2025 03:39:11 -0700 (PDT)
Date: Fri, 24 Oct 2025 10:39:10 +0000
In-Reply-To: <20251022143158.64475-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-3-dakr@kernel.org>
Message-ID: <aPtXTsbU07VSGDDT@google.com>
Subject: Re: [PATCH v3 02/10] rust: uaccess: add UserSliceReader::read_slice_partial()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 22, 2025 at 04:30:36PM +0200, Danilo Krummrich wrote:
> The existing read_slice() method is a wrapper around copy_from_user()
> and expects the user buffer to be larger than the destination buffer.
> 
> However, userspace may split up writes in multiple partial operations
> providing an offset into the destination buffer and a smaller user
> buffer.
> 
> In order to support this common case, provide a helper for partial
> reads.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/uaccess.rs | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index a8fb4764185a..c1cd3a76cff8 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -287,6 +287,22 @@ pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
>          self.read_raw(out)
>      }
>  
> +    /// Reads raw data from the user slice into a kernel buffer partially.
> +    ///
> +    /// This is the same as [`Self::read_slice`] but considers the given `offset` into `out` and
> +    /// truncates the read to the boundaries of `self` and `out`.
> +    ///
> +    /// On success, returns the number of bytes read.
> +    pub fn read_slice_partial(&mut self, out: &mut [u8], offset: usize) -> Result<usize> {
> +        let end = offset
> +            .checked_add(self.len())
> +            .unwrap_or(out.len())
> +            .min(out.len());
> +
> +        out.get_mut(offset..end)
> +            .map_or(Ok(0), |dst| self.read_slice(dst).map(|()| dst.len()))

Same comment applies as write_slice_partial().

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

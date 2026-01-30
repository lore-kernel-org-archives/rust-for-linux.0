Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC2E26A1A7
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761886; cv=none; b=XyaOLhC+IJbPyv7TPg7yqzTjaCFhjaKFjsFj+Ad57W2uZWu6rCuESoKD6LG0HFWvzjXEbO3wHt3r3Sq87FIDHhtORJTVYPE0RronBJIgX+QX2YMaxmmlly8TdcQUSoBWUr8C8tlLEJsDxpcyvvahLCtOMObUme8laTyequCfN0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761886; c=relaxed/simple;
	bh=GXWk2TRQnngFJd1T2mbUu2+hOBBUBMnOiv3Ms+k0LH0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CxLSDt4zx6hEKYgkGBBWWpmj++im7DxOPb0YhjO8pLWMINuRWkPeQpnMmFBdivEqrgFOOWibdC0cM1bqKdQ3TnQhkJKwarBg77YkvMaaddz0KMI2EIYJ69uHTT2x4jsqWZu7hQNtexNTqz+URnm5w51fo991NZMi6fCAdnI4w0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ASIC4wQq; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ASIC4wQq"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4803e8b6007so13172795e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 00:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769761884; x=1770366684; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n+GzpbkBojeUlEtJWlBKw8ZsdLYodfMK2fNmjvVY9hE=;
        b=ASIC4wQqb94VhzsDcQcgDb4bkkgJ51pajBxNqNTm8PQS+IUnyBFehEVwzDQWHYE4hH
         qe7JhqDFHpR83EI1aSMLFCYldpyywL3drVYms0plrlc65uaRjlwZh2vUmFRl8jJiYcSF
         V1ttNKgV4YFvDs+IhI4WgJKDVqPUGYC235saDai+3BvMz29LFg1THuQqrYwN2Qn6zEhI
         Ir+B63Yxd6oHKffM4x6FipKQAK+bdgg3XrJJp4N5y2D/LJWMISJ3/dH+Ii/JlygwJVsi
         uCOim/JB4WgdUZoqeLk+VC5alZevEV5M4nJSlYuAxKMce//J5YWAfy7pZ6cXzYuB3yCW
         chOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761884; x=1770366684;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+GzpbkBojeUlEtJWlBKw8ZsdLYodfMK2fNmjvVY9hE=;
        b=FpUtqxjOi7D39fWhN7tIPhDaMqYyHF2/C8669ZUSx/AyTDplTTrzWFnjUveX2+FQiJ
         GEuiVSib+ZlDYGMz9DkK1dM0kNlIxXtfxFRVirwRMc3vDZLN9pHHQplVn51mAHG9tk5w
         cH+V244HDKTcc5rFfXO5pUQKf9RCZjqsvvwZ0Xp9vhOPXmcVudfPz/D1+CrvQYkGbsCf
         F1mWjT6k7D4WU8R2H6KGNa/Ld0Z0e5rXodWMd66Q1dAGv+eSWGF50HqOiiwfKPoWS59g
         RGvRmsnVHCoOM39/PrJK1awt9xEKxb4aRfv4iOL+IAOo/LVk8uYJIqpCwOcFUcwpKB4/
         bxZw==
X-Forwarded-Encrypted: i=1; AJvYcCX0crmlOkf10qaxHAL6pPYbvrC6GbHkksKnOHP2GAd46ExO4gp1uJgD5gpabmTjGyNx+4rZITfrPc1bNlZpSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdtFEpVbr/p4ag4oM1cuAd4yTGoNmCH1gas4afa3/yYqvZqDTq
	w6he3Mg//XdkPdO4SZylfad0AwaHCiATOFp1R7YBqNkCAEd6nWJARUVgFE26kYhKaR0fPD9qQ55
	sihAMjaoB2e+aqneGyQ==
X-Received: from wmby7.prod.google.com ([2002:a05:600c:c047:b0:477:a678:a39a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8a:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-482db4992famr28105065e9.35.1769761883601;
 Fri, 30 Jan 2026 00:31:23 -0800 (PST)
Date: Fri, 30 Jan 2026 08:31:22 +0000
In-Reply-To: <20260129022837.4133832-4-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129022837.4133832-1-ttabi@nvidia.com> <20260129022837.4133832-4-ttabi@nvidia.com>
Message-ID: <aXxsWuuV9mlAEtAJ@google.com>
Subject: Re: [PATCH v6 3/7] gpu: nova-core: implement BinaryWriter for CoherentAllocation<u8>
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, mmaurer@google.com, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 28, 2026 at 08:28:33PM -0600, Timur Tabi wrote:
> [PATCH v6 3/7] gpu: nova-core: implement BinaryWriter for CoherentAllocation<u8>

The commit title says 'gpu: nova-core:' but this is primarily a change
to rust/kernel/dma.rs, so it should say 'rust: dma:' or similar.

> +// SAFETY: Sharing `&CoherentAllocation` across threads is safe if `T` is `Sync`, because all
> +// methods that access the buffer contents (`field_read`, `field_write`, `as_slice`,
> +// `as_slice_mut`) are `unsafe`, and callers are responsible for ensuring no data races occur.
> +// The safe methods only return metadata or raw pointers whose use requires `unsafe`.
> +unsafe impl<T: AsBytes + FromBytes + Sync> Sync for CoherentAllocation<T> {}

This change is unrelated to implementing BinaryWriter for
CoherentAllocation.

> +impl debugfs::BinaryWriter for CoherentAllocation<u8> {
> +    fn write_to_slice(
> +        &self,
> +        writer: &mut UserSliceWriter,
> +        offset: &mut file::Offset,
> +    ) -> Result<usize> {
> +        if offset.is_negative() {
> +            return Err(EINVAL);
> +        }
> +
> +        let offset_val: usize = (*offset).try_into().map_err(|_| EINVAL)?;

If the user seeks to a large offset, this leads to EINVAL. But the
correct behavior for a file is to simply return Ok(0) in such case.

Alice

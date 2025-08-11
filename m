Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CFE21FF39
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754905180; cv=none; b=lnrwhlh3sITCi7VGEyVnwjCdHvRWlQYHCp0RkW85kmmACcDAiwJf9O/Mx/Ss1FxK0cVi4mNYivjuS5oiHIHY6Xjc0N1pNOyi3JnQb3Rwp/2Y2pG5vtMMLya1nJWvhX8znr0WNGGYy9wkS3pQJ+kfKAfnkuBRNLNV8hD8ZZTthKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754905180; c=relaxed/simple;
	bh=y4j5CDX+twNfOWnSZDQeS1iNPT/a8KEGUcdjXqfrqzk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kFwI8rOYKxIJ367q4IAk/uBeuE2xKZ5UU719kJzH0dkDQQl2QxaXmzn1MBaEtkzuE+XsIp++MRAGiDn5ENb5PDfNsWN9io0GxzWa663EPB9k+h2jUp2/qCCTjp5VPpk+/RHg/oUhSqLo09q/CDgWnrecx04ukzUF3aOLwXYX6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RKQqgeNc; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RKQqgeNc"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4538f375e86so31588165e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 02:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754905177; x=1755509977; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EMnTZa0hu09hQK4MHqHVVwoEW2DRyBKmSxuuhXJfUcU=;
        b=RKQqgeNcNmWxbtzOe6OIjavx+iKtD5p6BP6WkcGpDxV3wBTODw7mqTI1C5yO5He+mp
         dXeDHSp7a1Q3GExl4cU664g/ZYhWVyhQIPwZydCqL4DjgfB3c5fKWUxjAapXWeDzqL88
         qsfzGUQcVj/H94v13ck+YnF362UftZ2Pn1ilaauQ7xt9hrYCEDf492PlE/11hWouIIgv
         1Lp3jSY2UZvlNBeCzD0KiBipDvuNsZVgUIbzXCGRnJBulA8mMxQBuAdxkTQ5dmeB5QxK
         nZQEUMdMHe1XTKY9TY2O9ERoJTWODE0ONFe9ymdxxhR9egzHaMW1eFcUsZ3QJu0ZZKpw
         70Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754905177; x=1755509977;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMnTZa0hu09hQK4MHqHVVwoEW2DRyBKmSxuuhXJfUcU=;
        b=VrbiuhFE7FjXk6nB2VMPt4oFDKlcd/FEIKouGxylMASZS7VH37GaFCLU5YOknSfONT
         kTW3sB1ruEzS5D3lBNsN6367KLZRN+Ip85L7TRplB9oGGHF9kIIsTsDSyhrWPGD/nGv0
         iMEBbb9MToT0VTt5+SmQOH/Xax7kI/3Cdirv+nM51BHiMjpjAo6GOszx70/hN5I+zPPA
         I1RRsxlm9AbOsiTAAmO1W2eTEaz+T7TzEwoRUkVPKt7TE01pOH63HGlTquSi53CKZN/b
         6rHHoeMORezuZzhWDiCnEf1M1v0UMzOLi0lXt7OG1ReLSPUs5W2bTIx/W48C7DpVXFGX
         Oqtw==
X-Forwarded-Encrypted: i=1; AJvYcCVKW3v4Yk/ttNr39CFTeo4BTwnnlmIhUh+6JVa7CnYH6EXP3HRb9HW/eE11dt313zns+DzziOMUkGwiBxLN8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkJg3Ad4rn1o7BcaLNq0GDMFrNrfMx+VZzAQ0OBCJ7dliyTbf2
	u7ZFp/O4sA9YBlZgQ0TFCSbTwVYcElXi3OH7L2XxR7mJuwcDANeFUMUaudi61QskqWRfO2fJnX2
	MHrO9t9/ASZi/xp/kyw==
X-Google-Smtp-Source: AGHT+IFT7h27MqE6VDgXteUcy3w8jAS+2Z96fj5nuIKzzs6pQOCqQDyObRy1nNyD3X3uF9z1SCe1X+iCSK04QMo=
X-Received: from wmrn35.prod.google.com ([2002:a05:600c:5023:b0:459:d3ab:b232])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b93:b0:459:d408:d890 with SMTP id 5b1f17b1804b1-459f4fc4a95mr102409515e9.33.1754905177426;
 Mon, 11 Aug 2025 02:39:37 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:39:36 +0000
In-Reply-To: <20250811041039.3231548-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250811041039.3231548-1-fujita.tomonori@gmail.com> <20250811041039.3231548-2-fujita.tomonori@gmail.com>
Message-ID: <aJm6WGaxITeIxtJc@google.com>
Subject: Re: [PATCH v1 1/2] rust: Add cpu_relax() helper
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu, acourbot@nvidia.com, daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"

On Mon, Aug 11, 2025 at 01:10:37PM +0900, FUJITA Tomonori wrote:
> Add cpu_relax() helper in preparation for supporting
> read_poll_timeout().
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +pub fn cpu_relax() {
> +    // SAFETY: Always safe to call.
> +    unsafe { bindings::cpu_relax() }
> +}

Let's mark this #[inline].

Alice

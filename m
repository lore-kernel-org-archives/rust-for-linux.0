Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276984039
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 20:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773693965; cv=none; b=KDwlnF4Pe6JeUm1kDsY0CutXstcpp5y9wKl2e8RDR/JjVM2zWnbwap67Fmj1BeWcJACljVNyC9iDOOfJkJqqz5zMwLtYsoKkYsRHsphvYYdHGiWu8NZf0rAaxvHZrw81CwdwWgm0TqzY2NPidOwEceUvsbDuJPigP2D1RIKRGkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773693965; c=relaxed/simple;
	bh=hXl3fWJeSVkJ5TR+pTzfuFuPE1hJjcrKfVStBjf58h8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BbcCig4GWkPAV8mSsXoWIt4sLAL7PRFvYzIwnfZhK2R15cSIBGNLzvSfcuA8ceHJoBS1fanJ3EmXtwzHetCs65uemJwvYd3NQeg8syO5VZBOcfUfq5qY/4SSUfYhupKAymfQ3lPRGf39Ov6TRCwto2HA5kAJETg1M+i8aicdMAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wbE3PnY5; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wbE3PnY5"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48531e8ae62so41347785e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773693963; x=1774298763; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yoa+gKPzDXlz+Q0iRsqBoD9Nfhh8J2LaEjALAe2eNXE=;
        b=wbE3PnY5Jd/0aLc50Co1xBT+fbJEeZdHlivnGHF7KZ+xpEibd/I67ro6p+YzR0qIuj
         4QXl7W5OIsTguHtHfWu2a5nphztQvR/icQZFG1dTz1MUYqo0tVtx0sxIVx73/L1IOYKm
         jE+xAcZKdbBRsyV+Au5Bv2IkalIKXnEPZw0B5WTxzONuHylFXdnZQh0eIDYUj+hCgg0x
         WZHS78jhFJBdthn7nLEukTbDy3fHl24eAr3twTur2Iac352a0QY3Mtqw82YC+BfS9NcM
         vmnPNxQh3RX4p9JX1BWmwhRuxSkHUu+EBW59K6RYW6/Jd4WRJgHHOFsqkI2+nOAhxsic
         lLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773693963; x=1774298763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yoa+gKPzDXlz+Q0iRsqBoD9Nfhh8J2LaEjALAe2eNXE=;
        b=MqRnjoYhnejzls37QhUfbhAUKkvmmswNkng2mS4hct9cARc/txfKmne2uCpf/Iz+wQ
         5erQKBC8JYXFQzpTyMoe60F0fBnaRqLaH55iW6a24yGHUXWfGpNz2isXn5qkiXha7CVw
         Wp+d4EnIwU5jj11ZYJvl49qPmGpC2WET6PrCATiDt5vLUzm7eTvaJ8iZqdgMPwJpFVQo
         X34EOSrWISajBVCACNg6f8ZsKAnmXRms58OzW4AUUe1bf7GgXIs0If35v9bnP3FxdjyA
         BwRcu4RcfoIw3OhS8LMxAYvv6WnO/AfZfoaysKACsWFZ0BJ9f3MMRk2R7KNNfgJlvn7v
         VumQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+d29+V2BiKjdaWgqYgweTC/gH67Xgv3Hlbpi90ZNI4tWEcdXYkxM9ZLaWJjS+aRaX+MRs1qmOyAIeKDTK/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynoltu8VXl+I6O22am2bw0+VynsKcCO5eYDkqflYg+ubQ0U0HO
	1PTXnh86cmHjkPAA/fPvstBR1IWE1g2l12ZuHGlkQzd6lilFnydUs5pU/1G4fWdhAkI4yD8yfT6
	FHvRzjm8O4komYRpoMQ==
X-Received: from wmcn3-n2.prod.google.com ([2002:a05:600c:c0c3:20b0:480:2e46:31e1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3494:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-4857f02b07dmr2155295e9.13.1773693962955;
 Mon, 16 Mar 2026 13:46:02 -0700 (PDT)
Date: Mon, 16 Mar 2026 20:46:01 +0000
In-Reply-To: <20260316055736.1690546-4-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260316055736.1690546-1-ttabi@nvidia.com> <20260316055736.1690546-4-ttabi@nvidia.com>
Message-ID: <abhsCSOuS3pi9qrh@google.com>
Subject: Re: [PATCH v9 3/6] rust: dma: implement BinaryWriter for CoherentAllocation<u8>
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	mmaurer@google.com, Alexandre Courbot <acourbot@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, ecourtney@nvidia.com, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 16, 2026 at 12:57:33AM -0500, Timur Tabi wrote:
> Implement the BinaryWriter trait for CoherentAllocation<u8>, enabling
> DMA coherent allocations to be exposed as readable binary files.
> The implementation handles offset tracking and bounds checking, copying
> data from the coherent allocation to userspace via write_dma().
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        let count = self.count().saturating_sub(offset_val).min(writer.len());

It's kind of weird to call the length method self.count() rather than
self.len(). All other methods called count() in the stdlib are cases
where you get a length by literally counting with a for loop.

Anyway, not a problem of this patch. LGTM.

Alice

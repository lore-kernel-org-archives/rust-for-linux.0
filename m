Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66645472F73
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143466; cv=none; b=Bp9L8r3aYG8p2/QILfCRv4XFyynSCIynTvDT7RJb6/oK8Qv5jp6gSoWRKtdcJKWCjtNp+CaC8EqnSqzu8P1/Ykcm20qtaLT07f/wpxOoLRIqe2oMKpTEBbLyLXzk7+/WDpSaFTBbNhnBfu3/HR+JttObvlfSHtPmuoj4VB/QAAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143466; c=relaxed/simple;
	bh=aWf3ZT76KBCFlOQaDqUu09Hkj0qW9ZCXzQAxxl/vbqE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wp2E4zYCMQL5V8bnF7JToQf7WnKi0ayUPf0wdWFRAmYkoslDTz8KEg07qBy/P07Vx87dQaRv3c3AA2hmEIbN9+wifSnS7vvaEEvIA/ygJZT1rXznk7jELcjhUP/+MCcu+I9Mg2LwEW0q1Q24wMCeOfRljV9Zw9WbE75hUXVNyGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FamZtorg; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FamZtorg"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c210c66672eso728169766b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 02:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792143464; x=1792748264; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkFwVtE/2q4IWQT4lJjpaObOEOcr4IQSF2aZLb9aFIE=;
        b=FamZtorgdwscF5mDuR6+Gczc+O7RVZIyvLj5Y1htTOOmuebDOGV3/1ZuOZJDdJnbFA
         iGJO7+au4LphHH6LQBYtZc5cJnijUcmCkVDkDhv4NXwUOpcHmfWofXdMaJ++4sqi6Wed
         DHcqVSGrNB43msGv4Z1Siydhto/DNxuHni1xf/HgyPy2ti1p/4BB2ZHMSkJ6VuTHCUoL
         SacGTMpcR/GcCYZqnVA7VA66qefBg+bbIu2/f2hy31Tp7EHwN7WgYaoKTHoZqviYMM/z
         PmEwUP3zwlX69HquR64CetN+GjOv37vC4hjNttQF951hMY45QKgKexQBbLTlHbA9D17F
         fMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143464; x=1792748264;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkFwVtE/2q4IWQT4lJjpaObOEOcr4IQSF2aZLb9aFIE=;
        b=t/gsddvYSY0cu95rrsop0sxScsMZzrejpI/e57xyOTn6eRP2K/edAO5gcHzcWf1Crw
         eRcHf7CVIiUE6TNdHICuSECQAx9ioDzyvpyh6cy0JlnntHDsR8KsKYfpQt+GvKigr/Oy
         FyqV6KuRTyNOlf1OTJoCSMZTkcL8+3F5+hpNU8xk3jaYI6/0jjyoLW+y1fI2bG+eEYhT
         +xfAxGaw02xxlnqePqF1NhnWcl6lp7FGuvMTfuzAS2zdIkLKUX4yRl84oloHiVJX0ixi
         5XZ4os1L7jHZSxQIqmwHZvPo0+RSprq7EJXK2qHr/IFj0tJSifXAi3766Pvqw7fVIscI
         vsPw==
X-Forwarded-Encrypted: i=1; AKwUvBw7tb1daLIoD/73BoDJjCbRneqbR7KxiP7lMGUgvPPZdMuH8onuQG5rMON/zymMKbKxGn+Fq5TouDNGNJIyQw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKsdByc2cmKLN/Q+1IwqNXqWo03Lj/3nFmUtWjpDy1O9gbODn2m
	RL5j0lmfaZPuGpOK7JPV3QXZuu8vu3WItq/I3klIM0IUOEXFlTQ45dMkBHojm0qwxv/12k9O2vf
	V/BX/9M9NrZsRlBKflQ==
X-Received: from ejux4.prod.google.com ([2002:a17:906:4a84:b0:c3f:d648:42e3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c610:10b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c378c7ca8d3mr619539466b.18.1792143463574;
 Fri, 16 Oct 2026 02:37:43 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:37:42 +0000
In-Reply-To: <20261015-b4-dev_query_fixes-v2-2-e3e6d25050cb@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015-b4-dev_query_fixes-v2-0-e3e6d25050cb@collabora.com> <20261015-b4-dev_query_fixes-v2-2-e3e6d25050cb@collabora.com>
Message-ID: <atHwZg245MM7l9Ty@google.com>
Subject: Re: [PATCH v2 2/2] drm/tyr: allow userspace buffers to be mismatched
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 15, 2026 at 11:35:21AM -0700, Deborah Brouwer wrote:
> +// If the user buffer is at least the minimum required size, then
> +// copy as much of the kernel object as will fit into the user buffer.
> +// Don't fail if the user buffer is smaller than the kernel object.
> +// If the user buffer is bigger than needed, zero out the remainder.
> +fn set_uobj<T: AsBytes>(usr_dst: u64, size: u32, min_size: usize, src_obj: &T) -> Result {
> +    if (size as usize) < min_size {
> +        return Err(EINVAL);

Use `kernel::num::casts::u32_as_usize` here.

> +    }
> +
> +    let mut writer = UserSlice::new(UserPtr::from_addr(usr_dst as usize), size as usize).writer();

Avoid casting to usize twice.

	let size = kernel::num::casts::u32_as_usize(size);

Alice

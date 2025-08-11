Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1FA15ADB4
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754903468; cv=none; b=YmACSdpAdN+WEGo3pFzvKMc+YTgCB/f+LOmMBB1oJsKKEBN3KnXH9AhWvQCrxONpNfSXAK4ED2tl7WoLZTAMoW2BHPNjfR5HKTU5lyuarLhQNspVkRAb0gCnS0YdhRIsmN5PoEhkVZZY1cz0krGI26Q8V1KAaf+K3hsDlVXruRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754903468; c=relaxed/simple;
	bh=1PY3I7jqJoADLIPiVo3qIFPMW++ixeNrcE7UitJIb0U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fh7JZJXMucoOMsaA/6WxNdf4Obqyv2axyw5bmfHcwEA64B678LZMsqQMi6SCcJYul/EGF4JCjtBtixFm3JDcH10orBVR6mCp1hCQf38kU4mK7MNT4v4LMAtj9ph9Iq3xFARn7lml54ZVixLhXBYgddhlI1iGFXYri27AgPppyGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b+QH2t+/; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b+QH2t+/"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b8d8935418so2692311f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 02:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754903465; x=1755508265; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9IOEuspoRhRwqhDQEw6MYsS8JsGipudIDeN35f6cb0E=;
        b=b+QH2t+/j8J3uGjx65L9JfB2ttg0J1s9dMi/DqAMp+0pBbVRiPTEf+jPGvk7uxighj
         CuINEeb4k9ND3QK/qSyjPM+Zz1yyN4dnE9JbiyqLhX3tYGQGUhBNjLRWsiq3jIxAb9vk
         8lxaMsn3x8rJOOdjxxBXjML1KF6o4MeCsNijHl6FjMAYwDV5c0cD4YheZmPWrUvKZh+2
         3H8/nOgoSi+HCRVbX75Sl/qJfgYiweAvuHvFbMtAcs7sLbiAQEztodlcfV2h6zhInY6v
         urnGCEPlGrYAxQVLY+dq0tz1b0X3cNbZtB2TauYA3PxBo+kS+SI5/vhE+vwN8FVVECGW
         FDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754903465; x=1755508265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IOEuspoRhRwqhDQEw6MYsS8JsGipudIDeN35f6cb0E=;
        b=FM8VCU8K9EF7Vmj9NxQlgkGYh4VF7Nlu+Ie9YZom7Vyc/lcaZLEEVgOevk9OK52k3l
         Vdkhjevw/x+CYPgNfpLU8fOA7wEBFaxEOnGqc3RMmwAyjIrWJXhe8PvX23LITjheSn05
         AXsq5ZzbiC5Frz+Z2AKODTANaShbsXcuLRDuIEuQ6oq0trghD318tsRaaX1uRL73txkT
         pIgIr0Puy7EVyGhcXg/HLz31D2MFNUd+CnrCS7qhz+gFf97xOYD42QD+uCH1LJG0i5ox
         AhOJ6XO3RQm/ltlv66XQJoN85aCHugxLiW3sczNLGI2GJFe+oFM7AdqUnLl+F909Wx1J
         +iww==
X-Forwarded-Encrypted: i=1; AJvYcCVB/rQfZJka3WXpwkZlrJA0PZ/cvcjlA0djOL2gFlTydY+Z5NpXm+vLzQ6rInkZG7aHt8zz88zyZQflzZ4I9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2NlHZvSgXHxgiImrsUMsC1rERZ1gwISaLFFr9n3YF0oxV+0h3
	jTYFP31jB9Md2+CxcehBJOA2YaCsJ0vNoJZJELb3alzdYNNuftn6PNIajoMkyJjieH9xSXBhAgm
	6di+IGIyMKSkgJWRHBA==
X-Google-Smtp-Source: AGHT+IEd4w758WR6Zpp1tbmffvm43WYQq2Im5+PJtfBYvVst4sNRvyeIaEjcfWLiePwgFX4uE/o2dg7fDawgllE=
X-Received: from wroi10.prod.google.com ([2002:adf:f30a:0:b0:3b7:8b1f:cd5b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26d2:b0:3b7:90df:c53e with SMTP id ffacd0b85a97d-3b900b7aec0mr9951976f8f.28.1754903465030;
 Mon, 11 Aug 2025 02:11:05 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:11:03 +0000
In-Reply-To: <20250808181155.223504-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250808181155.223504-1-dakr@kernel.org> <20250808181155.223504-3-dakr@kernel.org>
Message-ID: <aJmzp02oJCxBwaEd@google.com>
Subject: Re: [PATCH v3 2/7] rust: alloc: vmalloc: implement Vmalloc::to_page()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 08, 2025 at 08:10:16PM +0200, Danilo Krummrich wrote:
> Implement an abstraction of vmalloc_to_page() for subsequent use in the
> PageOwner implementation of VBox and VVec.
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

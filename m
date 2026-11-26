Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795706171;
	b=rIc2dUueI4PgRckMkIxFI1AGLucmNn0NcEfNST27OOTWgpK6dMH2uNutIJFhigrEjuFF
	 bzwuSaW4vmq0M4LvnTksP3lOHS6CRepM7lMBwaHL6tdWNVIJIZWKRNx+10vSrhzPNaqkE
	 IeGxgWJn0HFbb21HiefdmPLDzzD4gwevWY+vrEWKjmKIPkg6E/lqGSfwcHqLDngAkMSXY
	 WuT1FDCLsoyIhrCp/8pzKkE9X5it8rERBznuiM7Jwr1BMK/Tn993czfU0Fzjgcyg9vh0S
	 cwDCTU0UfdblIRLV6aduQjvWC1eWjLGB6qYOenYFf7GSJBFqBUKKuXfDkcJ34P041Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
	b=FOhifiZQmt+DuAIMGBxSk22xGlRKx55R00ch1xvwb1Miudh54v2dWXxOg5HU7TjErRqY
	 yawOUroKa/p1sptQLoHzqNcPnN2IHOzHBBdM+lJnC1o5uHv6zywIJsqffzZpknCicupx7
	 bzMtOKiPp74H/4SvBO9k/0oHVxVCkvrtFWMLUhQVi/xwHKgrDaCH59H3LYIAjmnp2wZ/m
	 TPtvV0q4bgOPt6IaSlaZJHc461qUz8nIHyszu6YyKetyVQj4UufzXyqZ2Q9saMck0SjrR
	 qFdmGcSiW6ZW2JI7qevXDCi8SE+NLrH1OjqXiA9K2PiZpGcLB+mMjU3QAk/4TMR6nHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GhoTT+3h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F5C606A32C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 15:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6F5C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GhoTT+3h
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso71116395e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 07:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795706169; cv=none;
        d=google.com; s=arc-20260327;
        b=Zf3dUCbCsVsux0WykGT2yeEJenduZ4XQUQbPoIB+wdR7nylaraOKRdE5Y1MQNdm9td
         5mrkInbOlqbMmexcg/4KHMCOyT2WyfzahFPQRkgEIIY8P6iTVLm/pEHeXTlC+gFoYInG
         Vin3acyiaFW7HlgUhkoAqlghVq6t4skOeahhdktnEhJYhulwKLY57FI3qehE0rVPhVH4
         QMwQ1lCXazqa/2jIz43wWTqOrFL1afMEUmFLoCQttSOpx8RNDoiUPdb6TVpiPw4u/68v
         E44PrlK50kayZAssg5k382yErZKuwS4keL2XMbgCqaOt1xZC4VIAoy1iT2pONS3stghH
         X+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
        fh=zaAoOy4UyN9qnPP0TiOkH1qFOVleY6ovLaUHE6Etw0g=;
        b=IyCkY2qiv2h4PvkgVtJvM6oJ78yzjhQermC60njmpHV0x+VbVLqrfEQ8jCZ5X7KE4R
         pe2vkqJNZmix2qVQ6Rz9mBDT3kM1EXw1Bfyb26P8F4nk8QIooYVP9hISbCS4TyaVWxyF
         rAdAFijmzBrYM+VIJYGn54cS0hu4oKcMnuY3heLB/EwUMHlkWptdvQo/4J8kdDMgkw9j
         HTDTANxIZENacQD+P6SGT4nLHK/j7PNVd0w76KBMAcg39X2a5sJFE79wNwXTvQlhMbTR
         QmljyiaCiKfNtAkJs2gqvbbFAAud0WT6LujzWP15N7KSjrDZggWXwu29Ssv4jExBX9TK
         8CUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795706169; x=1796310969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
        b=GhoTT+3hqhyTVwyAIWWrKhhvS3ulJ3gnLZmpoO8ekmItLfPnswvDvTb1d9fxSE6ODK
         qbifDHjnqj1LYSaKPeFKR/bKkcyOsXV9khDMPqKx8EhATt2qmZ+UAUJfF1Aw/JaA/+fh
         HcgqFxa26KkfxEzmerkJAymeRBm4huWFkkX1T6fnTZae8pq5GCUe/dt5h6QgmU2uxKTE
         USj8hNiuIfDuRFhTHvfAzTq9iJ8CPvgDkIQzlE4J5lOYX/YWKbNikkf+iDWCn/EuWI9s
         H71z0k9M1ab2zlQOVd/hiwXjMpT83N0jDbdgVatlCoMUYfjwt+5tyY+dw5mrugVQeRli
         R9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706169; x=1796310969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBvXmBLkI+5ZVDxMnAotYXXXMOB1nSxF2QoCNRUPkp8=;
        b=SD93FigoUgDmM+oNjVsThqitcXXsiq0m5Jk3uOVXhAU3Jhddkuf/uVzR0ay9CVZWGW
         XcFHooZGvk6MUqevD5JXDdhmvWP78NHVnTAOo5IUSRT/xQj9XTsuZYoX/ZqrWq/KIfYF
         QDM/YCnCnZJeL2MFqcTZzU8OA/T25SPKEzgSxpZpskdkgCBPBiXq9LGsSZAYWUJdBDbb
         RX5zAgr0sQypIWLV58SWxUfYFGmaaO29xAQW5/bwe81eUr+1gAdrdqEKELluDv/m2imO
         G9onJ95acxGjW5nZEUyiZdy5KzNmMHOXElADIQrTXnsgBMJxX7Pr1IzdjGqA6hskbUFQ
         dteQ==
X-Forwarded-Encrypted: i=1; AL+hErH7q5jvvXdauKDSQGWobKCMh1qgjME+VoFoL4Y4PKeHZG8KESDy0rsUkPPM954zYBMo8/TImpZAgmzU0QpZZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/dabIfBEsAKHtGlmtL34pxTspOJvN0xItGddodGBjJNG8S0gll
	M4tPGQZWGokeT0A2+h0pNlD/7aFqTWSyyD93V4JZMxibxj/ZcnQBV2uofbpYT/nSeL5BiTwDD+2
	kdp44J3wMJKYC5w+nRBb0hJUzslnmteVipAofknnHbPaFjRA0sT+0qw5pshSE3g==
X-Gm-Gg: AZFdTZcPuHguqcnwOAgrersXFk6M10oYb5tEdhHKfPgf3UdT2qh5+Ha/qaKio6BQ8UB
	hDiCDh/dTFIUPCV4jl6O6GRm5JVbjv0zyh7DMTjrdNaJupBecSZAmTyhCDk3jWwtvrhib+hRYro
	Sib3uWTFRteqivu96Ge8touw28jtSJkTorZEXcrUwc/Afa/zQI3SMcTtnLjsM9lvfXkD0uc0UVD
	Rj41WMbLz4/EtCLZu+GZV/OUFasix0nUw2PpMjUMtXnLSANZVnmApFYftkbhWgMumeelkNBZXl6
	cP2ddg1xCswopry6zAfbtvPLbaEp0WM6BdZyhpKDgiN33LpnZmDIn+NOcduZDN8p232tDG4VdIA
	c5POylIgrxVonVcA7pEpGxHHwCV31vGAmoGh+WWcqwGlZAnn0UxhDQxYu2VdbWTMUZn8e66p5KW
	0hMhmRRWz9cxeIKCNcvzd2CjUH3yXDMPKUANC1MgK5PgMe
X-Received: by 2002:a05:600c:16c9:b0:4bb:7ad9:311d with SMTP id
 5b1f17b1804b1-4bb861692a1mr332818735e9.19.1795706168571; Thu, 26 Nov 2026
 07:16:08 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119215046.2892839-1-xinmengs@nvidia.com> <20261119215046.2892839-8-xinmengs@nvidia.com>
 <DN4P1UAAVP8G.2TUW0Q8UEQVCG@kernel.org>
In-Reply-To: <DN4P1UAAVP8G.2TUW0Q8UEQVCG@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Nov 2026 15:15:56 +0000
X-Gm-Features: Aa3M54o7yVaAHH6adwEWSabFuYapgO-QYKd3fskOtzrfMLGKtESTl7nq44reziM
Message-ID: <CAH5fLggYpTiLKDXMQ9UYBGZ9VuZBWbNfCZn9fs=i82-xf6A-1g@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] rust: vfio: add PCI variant driver abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Simon Song <xinmengs@nvidia.com>, acourbot@nvidia.com, kvm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	linux-pci@vger.kernel.org, alex@shazbot.org, jgg@nvidia.com, 
	yishaih@nvidia.com, skolothumtho@nvidia.com, kevin.tian@intel.com, 
	airlied@gmail.com, simona@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	jhubbard@nvidia.com, ecourtney@nvidia.com, cjia@nvidia.com, smitra@nvidia.com, 
	kjaju@nvidia.com, alkumar@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, linux-kernel@vger.kernel.org, 
	zhiwang@kernel.org, zhiw@nvidia.com, boqun@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, work@onurozkan.dev, 
	jgg@ziepe.ca, bhelgaas@google.com, kwilczynski@kernel.org, 
	dri-devel@lists.freedesktop.org, peter@colberg.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 11:51=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:

I suspect Mapping<'a> should wrap a VmaNew instead of VmaRef.

Alice

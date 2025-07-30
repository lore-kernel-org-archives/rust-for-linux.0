Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4702235046
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753862527; cv=none; b=GZJXNMzMtSnY/MWfAtGMCtw5szcb0D6XXcDgmc3zIxvghHtPhXucWdXNJfl3wctBIvqyTxAunXbW9K608aO7aWoVTPRcvJVVoDDwbZd+wcCc9k84ftLG6JWy51fmfZsqH5OWm9vfYfwT7PAHqpdzGfIlzqT4ynnNwji66WTW+gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753862527; c=relaxed/simple;
	bh=AWV+h7GtbUUWQrkpvl3RK5EU9R8uRXZMwkOyhHs5guE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L9BIQQrN8WIUseK5sydQQCU/zwb899IMsAiFU7JFhqJT60pCORHRG4WiDFZO+VOwUrQ07rcdnXqfGM2oS9CLuQ1wXTln9RFpeLEy6IiSFMNdVXKH+83WMJKIKJJxCo2VmpcdU6VNmxYJGNT9adjY7wLl4Pq22jCKFWSSl+o94RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MfhlLVHS; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MfhlLVHS"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso2262378f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 01:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753862523; x=1754467323; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=maHpwqRfH05zCcXrsN1/QSZuQRbVjyLNGVFRFiWdDAY=;
        b=MfhlLVHSIY6ylA/ofgMjd8CeT0EHbUPgnlJLd9hk1E7nE+m7782wWMfQBTyGPiQq1O
         ny3NdFJ8h4Oc7nBs5BXposMvurRuPNeqXV7m0rgXConTe1vsgcJieBh+H9TD7tp4jbcY
         VLOmO0rUVpxhRtK+JCALo3MfSTaDqJtsKzSaviV/2KYPoxa3mX1mSRiggLyjcH9zQCSg
         GsrljQJQvzI3bh2CDypPK7Ps0jwWKBrsyA7zRK0TBFODgQmt9n5isq9sOvKlzXOX6YGo
         eSOplA0jzsRIa1ijgRjZUu8ELOM9Xu4hKiwzLKB3bAo1HhM6agsLmL6wGTmvK0faTlUR
         6BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753862523; x=1754467323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=maHpwqRfH05zCcXrsN1/QSZuQRbVjyLNGVFRFiWdDAY=;
        b=PmvxajBdbP6cduqomjZ72hgy0yimzVhtOg/uqhaAbkm9lAfktsGsC7wmqdFipjYHIN
         h5dvyn7cgVgHpOP1Rk0d3I7eT/UwgNEVIYtHkNwL9cWiOxg8YZ9Nd/ra2Ql08jNabL9m
         GEOtbgcL4Z+3TS9KH3sQp9Gqse12uJ6MiNPWc1OA3jS3Qxc7inCA6S+2cJY41pENG+25
         k1ZX+Q0fgZfq6U1NyJiIKk6tyZM5TusLCMTq/TjYBtThIXGuxMaIWVNPgqSU6G9gMsFq
         z4OnTnUEIPVN41SxGA4YTGZ1V5EuS17x8Yg2MwRWf0jwY4WoF48hhrG5SBHWcy/w0Ses
         RIgg==
X-Forwarded-Encrypted: i=1; AJvYcCUjsrcETPRuWRVnq6/biioFq6ybkZ0qMoJfCR6cq5vx1yZ/uc2TC3g1Fc0/wGNktBEyHeiF7YlQfrDVJh+tVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW43ybbnQr0n2CHjBUnDuCxv2ApbniYVvMk+xbiwhSGIVKUsn+
	PEzTHa9f322yoMEdFEQtZC3vRCnTV+KeCOKS7GE71fpphmwSsgOptoRPjzi8CF5T9VDK9o3HilN
	z1Pgg/f0L+SdHdkT9Aw==
X-Google-Smtp-Source: AGHT+IF0KVaoBRgCbjblHtU/EbaZVS66QcMLuHoFPs/5vxV3nHt3QbFo/GSP1KyUaryjD1sONnJ3e/BtDZ7atTY=
X-Received: from wmqa18.prod.google.com ([2002:a05:600c:3492:b0:456:1824:5884])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d0e:0:b0:3b4:9721:2b32 with SMTP id ffacd0b85a97d-3b794fc1ac6mr1865294f8f.10.1753862523091;
 Wed, 30 Jul 2025 01:02:03 -0700 (PDT)
Date: Wed, 30 Jul 2025 08:02:02 +0000
In-Reply-To: <3ad14f15b6d2639d6e998ecd03158313414b69dd.1753841900.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1753841900.git.zhuhui@kylinos.cn> <3ad14f15b6d2639d6e998ecd03158313414b69dd.1753841900.git.zhuhui@kylinos.cn>
Message-ID: <aInResSO2TDAn1-4@google.com>
Subject: Re: [PATCH v6 1/2] rust: allocator: add KUnit tests for alignment guarantees
From: Alice Ryhl <aliceryhl@google.com>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	vitaly.wool@konsulko.se, Hui Zhu <zhuhui@kylinos.cn>, 
	Geliang Tang <geliang@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jul 30, 2025 at 11:35:21AM +0800, Hui Zhu wrote:
> From: Hui Zhu <zhuhui@kylinos.cn>
> 
> Add a test module to verify memory alignment guarantees for Rust kernel
> allocators.
> The tests cover `Kmalloc`, `Vmalloc` and `KVmalloc` allocators
> with both standard and large page-aligned allocations.
> 
> Key features of the tests:
> 1. Creates alignment-constrained types:
>    - 128-byte aligned `Blob`
>    - 8192-byte (4-page) aligned `LargeAlignBlob`
> 2. Validates allocators using `TestAlign` helper which:
>    - Checks address alignment masks
>    - Supports uninitialized allocations
> 3. Tests all three allocators with both alignment requirements:
>    - Kmalloc with 128B and 8192B
>    - Vmalloc with 128B and 8192B
>    - KVmalloc with 128B and 8192B
> 
> Co-developed-by: Geliang Tang <geliang@kernel.org>
> Signed-off-by: Geliang Tang <geliang@kernel.org>
> Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

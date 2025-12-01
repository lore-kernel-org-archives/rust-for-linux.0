Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392E03019C4
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764583679; cv=none; b=RwkMVbAUKEFDrcaT6KG0bzJLgcMh8/4JNe1pKW2rwmcI2sBl2LhH7MqIg/KsXq6V2Cy8Ra+dQh1Rd9TnFWgBRXHzVw4ubfWA8eeT/LjRZpB3ZRCAugebKiIj5LZgtv3KMVYv3BkstcJsF0uDq1WVbieo+PYb2aGqvnEKFjcY2QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764583679; c=relaxed/simple;
	bh=/tOIwCXkCHpEc853DZjChDkaxfhNn+7tc33Ws0sdTrM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sAQtKNmOQ2FqOA49/AO3ZgpWWrF8zHViQT60tlQOHV3whR2i03y/NVHHHy37lo2tIc1WDc+hv6KpuK03q6axxCbq2e8btbvfOMCOa8s8f/aCmhViYTxbqIdNo/2LheopLxiycB9RhZmIujNo4Y4nnLX45IeXln/v0YS/2HcU3MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iJjN3fKm; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iJjN3fKm"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779da35d27so49616185e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 02:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764583674; x=1765188474; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=guaiVnq5wSGt0j6wYWbgKuppdOTiHe+D0rabrZE79JU=;
        b=iJjN3fKmhzaUknEUcBlvOYveYiaIvRamK3+ZfiQuiM+ZOvAMQ9twHRM+etFu/DZiQw
         4Jzpvr1kRDL+US7A11AntZUrZRrpegAXcegfvuXOnEryftBzW+R2Jpjvy0fAPHnsc7Du
         8SRFGnjniAtp3QZX9uB5+FwhKnseUrjOA0rVZx96SgpFNtaNooAqlhpeCjuFjA5WcD8i
         f2uhLnYvIbwbAMUejNb3pyKRYyFJv/aFTREC2kVn86Y/cekfJnjohJrxZCH1684xYRm7
         QlKdhtaVwGcYRa/DeRa02oP9dWPn2Eoaf79c00gWQYCNxqYoIS/V7wqlY8ZyYgZkJnEr
         cORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764583674; x=1765188474;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guaiVnq5wSGt0j6wYWbgKuppdOTiHe+D0rabrZE79JU=;
        b=ATz4VMs5CavvbyNl6f51IvZMBV8gDFeLd3aaBESqL0rjP01T4LjoIT4FJnLR/JxudF
         +kn3vfLLNOEpfkazUh4avBGhWizJWS9HpoxK4JvLAAu261RvkgXwQQDdupNHtdbYj3NN
         aeleDGRUj5zq5LCBrfAkfdNH+k95TRm3OfTIZIhWbzyLqY7v3hZ2B8LW5tP8CXSdrbUn
         DZRkezqQWv/WCUeRADoabBE9ZjQgtj07QiQ4pH3Mzo4q9HpVBuR+AJSuEAkHg//+wpgQ
         56fAbb0XlKint0z/3+fD2UEpqUhspCL/9PjR0Otb4fRBbDgx2Ej8oymf8RqpU3xzP/jZ
         cyhA==
X-Forwarded-Encrypted: i=1; AJvYcCXAICOiyW9SRxBDA161Lpz0sdTIz59AykNne6LO4QPe2XkBZ7Yhi6WLTddkdcrtMmIpfBBq/cxY/z3OhrqW7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG2fkuIraUhMvuGLb/UGqtkl32M0dJiargJUNXXxED4AdOesj4
	IcrRhZ2Wy7zDFQG+x9I9DW2vTRRvguCpMxBbInCIv0184cNFZzXHR8ahcvFwLE6ZA9bltrQ/kts
	Oq5erGMUqxNU2K/tmSA==
X-Google-Smtp-Source: AGHT+IF+F04jPnA8raxrrj0to7TSZ7tXuzclteHchQpMYkH1WruuUrR180MkD+2drBszGe2sUCH4YjcIrlB2WME=
X-Received: from wmlm9.prod.google.com ([2002:a7b:ca49:0:b0:477:9e14:84dc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c8c:b0:471:1435:b0ea with SMTP id 5b1f17b1804b1-47904b242eemr260534545e9.24.1764583674469;
 Mon, 01 Dec 2025 02:07:54 -0800 (PST)
Date: Mon, 1 Dec 2025 10:07:53 +0000
In-Reply-To: <20251201000949.1626363-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251201000949.1626363-1-ojeda@kernel.org>
Message-ID: <aS1o-f-_2s1QI9ja@google.com>
Subject: Re: [PATCH] rust: id_pool: fix example
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Burak Emir <bqe@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 01, 2025 at 01:09:49AM +0100, Miguel Ojeda wrote:
> When building with KUnit doctests enabled, `rustc` reports:
> 
>     error[E0599]: no method named `acquire_next_id` found for struct `IdPool` in the current scope
>         --> rust/doctests_kernel_generated.rs:6722:24
>          |
>     6722 |     assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
>          |                        ^^^^^^^^^^^^^^^ method not found in `IdPool`
> 
> Thus fix it.
> 
> Fixes: a5726454470c ("rust: id_pool: do not immediately acquire new ids")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

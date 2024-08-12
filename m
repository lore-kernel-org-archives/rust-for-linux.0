Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97F17E0E8
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Aug 2024 23:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723505559; cv=none; b=owtQSMoHJKWEISQOGR46ttASypcfiFqXssVEymi6Kwglw5vWkeTGS730QmRPpFlUy4g48LUQjO6FvIhCCneNmQZj7FjCAlOkbX3viuKlKUkzQVJypWCLNvrTQwLluTFnaVNQRGh5YNIIFiJK8eKpgLlsLvnOb6oVVBhRhdq/SJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723505559; c=relaxed/simple;
	bh=MSiFb2/sRe27Cyt3msuJTOjMgO2mFhCD6nQQ/Olor4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FkhzBlgpccettIrVU95NsE8ifW9e5ZpXwb234vAqw/0DAo8xzzBisQ3aeetQaYSwM1PFKqt2fUSmWW1kPrrD26JB60yN/9oOTUQHeQfhfNCDttyFm9duJWYghT6U2/2w1l+FEq4J7gmcJNa7PB4Y1M4XeFKsAsorxkvVL3XVw+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZooSa2WC; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZooSa2WC"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a18a5dbb23so1513a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Aug 2024 16:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723505556; x=1724110356; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WINgTrCjEBL3+Nvcrrvvezt+JSvL21kHSKavfKsKanw=;
        b=ZooSa2WCmlM+f1MyZLflLZX43cl1JWujJ0NnalV3yFlKSxQY10EkVNfqPGU4AUx6E2
         XLgrjigqTlAIIdRQrol9anym7bDwJAIfI0z3kJkozYP3h641FofUgVmjpvXktREzRgDV
         b68CRrdyMuS5ctiw0AqZwLjBBm/yrmlMvAkFHnlSpG6SzTvDDF/Atqw+7ezojXcqtEx7
         h1CLrGpml5dbRoQ1ZIoTIVzlGG18YhJJgf5DpAP5MUr8LLnGxEg4flUiQkNJteiuNxF+
         rNXHSmFIhIPPmkwYQXBoQ5fP3P60yHB5vs4d/SdnS2Qb5g629a2dImxSKvS+fBpoCFFs
         4hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723505556; x=1724110356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WINgTrCjEBL3+Nvcrrvvezt+JSvL21kHSKavfKsKanw=;
        b=ZqdjXgrAPP/5jG4Hmn01Gnpa1vlh5bFkodyXIkg1apvUzpq2l+4/Zl5p1ENMPQ/pI6
         XAdISUNwpXpe8Mpb/pJIijaR3rfQw+FNlbhNNkPl5GSo058Gp3lrpTSLsNWyBA061izj
         YhuQfbZAUgw0qHqy9i+zdQb87iON9Q04SSX1zESbJd+Hd7hwnc50T0G98wiNRHSFEXeQ
         2Vf+Z+prP04XyDBEDPrATz6CuwsrlFKr1XUebpfOGg2ZTbTtOpQT6d6ZqO3MB0dKjuCx
         FV4lhmME8GVoHVnUFkcM8MjGHAcUInvNfSpfOfQbOhpiLvhy+8+Ew33DkbqSc+TnwDXG
         Hl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVil6kM66HMJ0e04Nj0OefT3nE4c5vJO3cG1/QoDb6SqI4tbUB6NQcneq8oYvG6rEI1wzLQ9QR60qzgiPAI7YGPXgbKi74Gqk5Uln7nh64=
X-Gm-Message-State: AOJu0Yx2b+ZcOYVnIhJBNtnsdXLDExDfIw/eZNt5CzvTs43x5uwt72Z/
	wGLZZj2GeKx4Xe3v60dNLrmu2bENenlQOtFn3Z8+pxDjxJHsQvjhlfqAQTu49Zl1h7sO0Oawepv
	30Co5hLGX/HO9C3Wog3loFA7QnRTBjryY1N9n
X-Google-Smtp-Source: AGHT+IH1VwXhHaZFBtsvf8zgZNCNPlxYCt9sfhXPfzEyA01KGjm/YIu1OjxgUUJhYkiEUOMM3UafU8NvB3Dzs25JDK4=
X-Received: by 2002:a05:6402:3496:b0:57d:436b:68d6 with SMTP id
 4fb4d7f45d1cf-5bd73d1681emr17857a12.7.1723505555723; Mon, 12 Aug 2024
 16:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812232910.2026387-1-mmaurer@google.com> <20240812232910.2026387-4-mmaurer@google.com>
In-Reply-To: <20240812232910.2026387-4-mmaurer@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 12 Aug 2024 16:32:23 -0700
Message-ID: <CAGSQo00138fombiueBM-4-OF15afzx3U63Uu17K_wvh9mkFAPg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] kasan: rust: Add KASAN smoke test via UAF
To: dvyukov@google.com, ojeda@kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: aliceryhl@google.com, samitolvanen@google.com, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> diff --git a/mm/kasan/kasan_test_rust.rs b/mm/kasan/kasan_test_rust.rs
> new file mode 100644
> index 000000000000..6f4b43ea488c
> --- /dev/null
> +++ b/mm/kasan/kasan_test_rust.rs
> @@ -0,0 +1,17 @@

Realized right after sending there should be
// SPDX-License-Identifier: GPL-2.0
here. It should be added before merging, but not re-sending to avoid spam.

> +//! Helper crate for KASAN testing
> +//! Provides behavior to check the sanitization of Rust code.
> +use kernel::prelude::*;
> +use core::ptr::addr_of_mut;
> +
> +/// Trivial UAF - allocate a big vector, grab a pointer partway through,
> +/// drop the vector, and touch it.
> +#[no_mangle]
> +pub extern "C" fn kasan_test_rust_uaf() -> u8 {
> +    let mut v: Vec<u8> = Vec::new();
> +    for _ in 0..4096 {
> +        v.push(0x42, GFP_KERNEL).unwrap();
> +    }
> +    let ptr: *mut u8 = addr_of_mut!(v[2048]);
> +    drop(v);
> +    unsafe { *ptr }
> +}
> --
> 2.46.0.76.ge559c4bf1a-goog
>

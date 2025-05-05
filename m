Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A956D13E41A
	for <rust-for-linux@vger.kernel.org>; Mon,  5 May 2025 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437038; cv=none; b=uARKmQyl41iBhAvtgGERTQbT+baerm10zjh4XQBEw+AmmEMAsNuj8wuwsUPja5pKoHj/uwfouCclBuoGd5a+UFvHFZxdBLuDY79pLJ1YClmHvQ0OX1lMr4uhZlKzNgpUXMsHTEayuY7Hemv8UIkaOSHa/UnIHMEq9u3IMFBGK/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437038; c=relaxed/simple;
	bh=2xxpj+2ReE48KbP5KJ11PgdY9Ly28L5Z4eGb6xFarec=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ac6cuu6qswRAA/6U5B+JDuMnjjPGVYBERov0k/KW8ajolzZh2jkM+tBtzZzAlpu/nn7kSRItvilACpQ2jz2bobLIprTbdCcoScqDas2nZ91qHcbve2Dap9VX3X2KhdqlvcUpyu06IZa07Fq6ctr1TnJH1ZfgKTZ6MMh7dxcDHKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4FFtXfNH; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4FFtXfNH"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so18833505e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 May 2025 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746437035; x=1747041835; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNKpSETC3aRoWs26slbmPYaRhZWnx/HOj+OMKwfNopA=;
        b=4FFtXfNHVOpQM7Jr4isrJSe+z+VDiBnIBysQtpsEP13Bs+QuNDDQ3nITnhu1f/p8NJ
         l/SE6uudP+jxg1nXQnETYPZdCnQ7ewTIqU4jbu0rm0jn6RMdy5oXSUb/Aw7r4L0rmP70
         kOv7A7mTXGxSLlkQTC2FUO4e8lswCGjgJ7iaddAe746FTRkKatN0oqi4yW5lx6dTEioE
         TO1cBJybvx9NNOtTAJPmp8ulcDNMtXcU2fobHRcnWc78BXpvcWvZM9z/KdpnzUUNfiGE
         HnrTEJ6qR7ADZvtPyVFpwj9Nk/0WdRQ0f0NfYNawWcKeAUmuZ4MqCU4bFv85+WEczNfc
         J4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746437035; x=1747041835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNKpSETC3aRoWs26slbmPYaRhZWnx/HOj+OMKwfNopA=;
        b=csJJyqKeOlOFqkdhzDbAMnCfaxu+nqc7TGFv/LBhBSwj/+E7rENRGX3TwbrCyUOWYG
         o68ZbMv5VXxYogyQTdznR38Znxi2yr4W/qDHXNvQksG+dixD9CmtSga+iaDs7DtGf0jc
         ipdZZHz5jrbZkMSEXvLa2nmBcIhp5lYTr6PyYnXVpRrn3QE3B0NvNrF1LzdPQR42j8B2
         GzA+r5DmlGK8tczl8W7NKkt4cUEuqFxLKqcAO6HOLD0Fj/EuJ0lvgzzzFc4r/4hJRTeC
         FnfJjaGXQDqkrNlDztz3Z74GHbBZ/jbVs6I/HUkcOrGVbLOCbOoOB+vR6WKXOU4LqY87
         q8DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcQl4FPRoooXxIzkVcvt09e7p+3h+IWKs5I23sTlEPqsfcNww3Uwney6I53OObHyW4MiQPZ2AM+yDec6/uiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgql5EBO31hI+ORa1HvT9JFcJnVQVfeeTyCAeLO/EZsa+ZcdaO
	61/WmB5leZSnW21JGjO7W+RZDSoPB2CHBiD0dAG/yoyoUr9GiP01qydQDyag3jyZyTUAtJE0Hnw
	YZM3I0bG/uNad7g==
X-Google-Smtp-Source: AGHT+IHD25Gl0hnIcuOchqaJj6jrQJy3Tcy1tSunT6kxPFMJLsXGIsx+DEdSlsV661NRNl3V8hAe7ZryPPG14R4=
X-Received: from wmbhh12.prod.google.com ([2002:a05:600c:530c:b0:441:b3fe:b95a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3548:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-441c1c70782mr68477705e9.0.1746437035142;
 Mon, 05 May 2025 02:23:55 -0700 (PDT)
Date: Mon, 5 May 2025 09:23:53 +0000
In-Reply-To: <20250502140237.1659624-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502140237.1659624-1-ojeda@kernel.org>
Message-ID: <aBiDqQxAzTC4N-n-@google.com>
Subject: Re: [PATCH 0/5] Rust beta (1.87) and nightly (1.88) lint cleanups
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Fri, May 02, 2025 at 04:02:32PM +0200, Miguel Ojeda wrote:
> Now that Rust 1.87.0 is close to release, clean up the new lints that appeared.
> 
> It may be that one of the patches is not needed by the time it releases, but
> I prefer to not wait much longer since I would like to land this for -rc6 so
> that it is clean for release.
> 
> In addition, clean some nightly (1.88.0) ones too.
> 
> Miguel Ojeda (5):
>   objtool/rust: add one more `noreturn` Rust function for Rust 1.87.0
>   rust: clean Rust 1.87.0's `clippy::ptr_eq` lints
>   rust: clean Rust 1.88.0's `unnecessary_transmutes` lint
>   rust: clean Rust 1.88.0's warning about `clippy::disallowed_macros`
>     configuration
>   rust: clean Rust 1.88.0's `clippy::uninlined_format_args` lint

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

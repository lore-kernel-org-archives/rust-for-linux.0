Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DDA3E022E
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669765; cv=none; b=BCeMa7PQ8NnHBWL93gxqHLZ6mcZn/aMYdHHgroL0dw6Qw/cTIjHeTeE5qtlSwyPIKHc6k4u3jyGbtQuxWPP53MrdYaiMG/N2/JaB4meuSTo9pNvRbDFeRpGAXVAwIaZxRa4k6G1a/n1jsMc1vZuIh4nWIQqg290JpRZONO1TDbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669765; c=relaxed/simple;
	bh=d1m+Lzrp0qYSX3W4AuiA6Jz0I4PHykT1X0pK6z48cVs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bRpCgmi8zcB9dyG1+Io3YQk/AN2pM/InXid5tLRhwSVgjAAuhTiZrkHPgSVJiEkSOLcOwjjtP92ZOPJSbIYEpB6kdxkKg0BH3Y0SN83dWjxhdSQILzHHjr5cVjGjpJ/DN3g2NN/MpqjEsrPRg0sWD1KnzhFX2BYv2iq7okH4ZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O4ZmuexY; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O4ZmuexY"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6983880a958so725063a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 00:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783669758; x=1784274558; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ItN/sunimC+/RrP651cJ8WKZMpjO29uLDUG00P9AZII=;
        b=O4ZmuexYFYCOgUZvY40QjlfisO6qTJf1S/vTjZ3ZLstj6HFM/DMuP/IIAYYSPfOKxA
         N2qdYWmDeGW7lTBwgDMH0d5wjST6b9MYz7nLFxohVJsdp7wFdyCCAvRkhqz6Rx8s6VWr
         UNvpdSpk3ciFK1r8BVUeIpBNFUROD8h2UYx9E2FqWiIc0r1nYrOrSxzgyGLqERXbkqZN
         xOidxQuNQ7XvMaprnwlKdOXkjGRm5b9ZBN+ZUUkwfmZsj/3FWkUYE6fi61fjB6bqpFb5
         IOV7zrhgBTmAg6Yhpr7TUuUDj48DaUyrFI2OwoH0nWAqa84XSPnHCc1ssc2WkKXbHN3s
         RGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669758; x=1784274558;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ItN/sunimC+/RrP651cJ8WKZMpjO29uLDUG00P9AZII=;
        b=VEOJ+at2fEtMP8EQjwuZNfbFLDfK8Cudak2plTDI0Ysw6WW/Mc3ZihwVz3BWyuw5jJ
         QroEbdxEv57zFLS3GHJHJONGwMABrmxztbiuBIhAFxki0kPkEHCFSDIH8PqhUNxSYYc0
         XwDH294VCljSpym9hW4Bw1dpSTh6/026UPALVzgFlOScnKHwwUYPaE3pGiDEkZTig40A
         9/8EZ9QueRQVWelCZkAAKI5qUhGrtM8ds0ecDAxchQsaPNeWZXReNY3HgsQELasDU3CU
         LXDlQK86Frh5nvunfb2d8XxaNZHI1nVoYGgCTX1VCXDOfRFXQl+ttITkg7nXdU9xHALA
         /RUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMjnLnkNBk7nUI81Hr8fKdrXZ5BDcgpoKIAZ1dGwpnJBG+ugp5iPHpGwwOb7pgHiaySq6hPOgs2S5NvKAQBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRYTJSvS1RCk2bfOjy+/zlLWziKrXRyPTGeNDShtjbb0pxJWMP
	iqz0d+8H2YTN3H0nfHhNG6PAaPW5LSlwJQIv0evQHFYrO+X6erK6auPctfn5Hg+9q+Ml9uFha97
	pgRtJul0plmuzdrO1gg==
X-Received: from edcl7.prod.google.com ([2002:a05:6402:3447:b0:698:6d8f:3d41])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4586:b0:69a:4372:72e1 with SMTP id 4fb4d7f45d1cf-69ab4470343mr4325935a12.18.1783669757492;
 Fri, 10 Jul 2026 00:49:17 -0700 (PDT)
Date: Fri, 10 Jul 2026 07:49:16 +0000
In-Reply-To: <20260709211311.142544-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260709211311.142544-1-ojeda@kernel.org>
Message-ID: <alCj_NiIR48QWEGI@google.com>
Subject: Re: [PATCH] rust: zerocopy: update to v0.8.54
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	Joshua Liebow-Feeser <joshlf@google.com>, Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 09, 2026 at 11:13:11PM +0200, Miguel Ojeda wrote:
> Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.54.
> 
> It is a very small delta from v0.8.52, and most importantly it resolves
> the unexpected lack of inlining [1] which triggered a modpost error
> under `CONFIG_CC_OPTIMIZE_FOR_SIZE=y` reported by Alexandre using Gary's
> suggestion [2]:
> 
>     ERROR: modpost: "_RNvMNtCs5wX7wwEUCR9_8zerocopy6layoutNtB2_8SizeInfo24try_to_nonzero_elem_size" [drivers/gpu/nova-core.ko] undefined!
>     ERROR: modpost: "_RNvNtCs5wX7wwEUCR9_8zerocopy4util18padding_needed_for" [drivers/gpu/nova-core.ko] undefined!
> 
> It also resolves `most_traits` being unexpectedly documented [3] that I
> reported and adds a missing SPDX license identifier [4] that I requested
> to match the kernel version.
> 
> The following script may be used to check for the remaining differences:
> 
>     for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name README.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.54/zerocopy/zerocopy-derive/src/$path |
>             git diff --no-index - rust/zerocopy-derive/$path &&
>             echo $path: OK
>     done
> 
>     for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md); do
>         curl --silent --show-error --location \
>             https://github.com/google/zerocopy/raw/v0.8.54/zerocopy/$path |
>             git diff --no-index - rust/zerocopy/$path &&
>             echo $path: OK
>     done
> 
> Cc: Joshua Liebow-Feeser <joshlf@google.com>
> Cc: Jack Wrenn <jswrenn@google.com>
> Reported-by: Alexandre Courbot <acourbot@nvidia.com>
> Link: https://lore.kernel.org/rust-for-linux/20260708-zerocopy-export-v1-1-2bfc355853c6@nvidia.com/ [1]
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/rust-for-linux/DJT6235B3DOV.222XR5O6VHG4M@garyguo.net/ [2]
> Link: https://github.com/google/zerocopy/issues/3466 [3]
> Link: https://github.com/google/zerocopy/issues/3457 [4]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

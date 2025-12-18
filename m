Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4031C2EFDAD
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766056724; cv=none; b=NR8w0WHvjJLV4fr+Yrkeymxw2rwMFdROhnN7H89t0z4H+ul55hTF6oF+EI9Qq3KMXAai8c4o0VFDHlaC7cfIZJ5zOX8O92el5IGFhA82drYdsiKS9NiKRRF/bCDZRLfMPvbU5U8k5SqHwnrQNvG/HtGTlsNcoAirYDfF3k+IrNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766056724; c=relaxed/simple;
	bh=euKtXRYH4o/4T0NBglfFwMog4cjPdtIP17OR2kgYRwY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dYQSGyKvMDjlSqy+EcXjRT17EWe9dzEB4GMeVbvWDFRfXWQPT21jdHscmmFDCOtaXMcLR6OTdTzYZiuZZ0vNI3iA1c1BUKzRCuAsFAx6z+QBzh0ZiL1nP0vd+bObeVmljSWC4h6sugQzD/v10c22KrpLg6JaXL4iEi8w/n93T4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/ENGBxm; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/ENGBxm"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a137692691so6207075ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 03:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766056721; x=1766661521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uuH/49O2LcfUVfCTB1lwuAZRUx49TlplwkJ4jI5Wbc=;
        b=g/ENGBxmBrABrxj4MfK8zkZZQl+9ciE4s7j1CC75wX8hbpb89jUml8PEYEI2Qz829p
         QicdZLHZu9zx8oFxQQgB3GdvNi1b/vh1hu8iln+3leBz+2aO69J8sWjGgVnYWeGN7p1O
         WDMX3vzfzQpi4I7UBJ1rEc/MQkk/XTt+OfzwGQG6O4b1D9FdcfR0MvTYU+CKulQ68FHU
         8SnO5tqH7yAhQ++03/c2equ+BYlitUvzAkvAZ07RvUZPOQvSupfUT95bCxwAdHOuRX20
         PcBvZ0HYsUwCU41TPHfVfHI16YpLRC8enGNHGsatdZr3iMYzLxCzjUjsD+3foejZJtPq
         91Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766056721; x=1766661521;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uuH/49O2LcfUVfCTB1lwuAZRUx49TlplwkJ4jI5Wbc=;
        b=t2zt3ylowzSZsl/4Gj5O6wKFAsR6n6JxvzcoKc8+pntBqHF92vcX1PVgciapPlu2fr
         yrKkpRBXOdqaIyOJukRhJ4fvGLc0tX8JXfsinlIGZYRtLRSzaY/goeQVJaU59RhLWWet
         qD0eu5xRpj12MRDdpcPAXw4XmdFI6UVkkiBHOxoOpRc1GBrGVejYLKwChJjg3qOehIm2
         YNNR/gqc2u78GxzpZuyQu27PcmVmJNu0xmDxN/lNrk0PEi0TK0rfcDMVUH7cvpdAtZZm
         NFMtNp6yu6TXNjqVwBs1s8HZ6JuER3H54BBqYT5F5Jq9ClMuQVbZ3EQ5BEk+8bz3XPha
         MFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsS+IQOSS81+BMIlLXbZ8geJ7DgrJ0AuCgIKkE4tYBm8cVytp64YfcZrcbsz5hdgEHfJ9tQW70vbeMu4WGOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE46+sTTV82TsfzSmEsWRN27lPEB8pmwhOHEOPaWmW66c9dYbh
	Hh5nrNCsb+xtH2UjKhdvEFl5dlPIVWFknxq646ea/Uyzac2mkD14/abj
X-Gm-Gg: AY/fxX6ZxhXOxMQCUraf19d7iiz3hV12avqiCzphv/Gid068arN5KkfyzvWCEB7wZZ0
	vLf136ePH5KGf8aRvy+MaloBYBjUJ11BHUp3rNajIgFafNo1nKmi/hvAC9FF7619t6ycl2gxSKT
	dQiLJSc47LI+SwPSLred1KimNSUrOwqT0A5BmbYqeAiAyWqzQVRQx9oH/Jjpo2W1LDGLpZf/sUJ
	0jnoGboNzKhGB/r8S5jgTE2ziXM38oiAmq9o5bo9ilEP/kncMJV1qREzjLhWuaJHzODC+T4lNsL
	VcNuCk2VmwljT4X/mrNyeximYDMgw0BjCdyIIZjSwoijou8WKDqkuUjJ49GqKw5C9XwzyMTloJ4
	+NtqtQ7WDNEhIcCMcqhZ8GycJ6YXPS2oV8Ck41V4kkldBfRzgVEmWpOxNgsGt2WAuusI8Ntmx40
	2c9T6mRqxjA0xgySZVO1o1bdDqjsGikqPfE5juqvlAYAa3UQDaAvhImA97NtiImMTsLHkIRwzBe
	+Slng==
X-Google-Smtp-Source: AGHT+IFmfGdZ+nE52oaeqnU4eASx6R88E7viFiW7uZupbkG3KKVU9EDG1XKeXiJylOCdQ0X43GlUAg==
X-Received: by 2002:a17:902:ebd1:b0:298:3aa6:c03d with SMTP id d9443c01a7336-29f244cca9emr233962105ad.57.1766056721452;
        Thu, 18 Dec 2025 03:18:41 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d0ba4918sm22524955ad.44.2025.12.18.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 03:18:40 -0800 (PST)
Date: Thu, 18 Dec 2025 20:18:30 +0900 (JST)
Message-Id: <20251218.201830.1172540487586114730.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org, aliceryhl@google.com, boqun.feng@gmail.com,
 ojeda@kernel.org
Cc: bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v3 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 17 Nov 2025 09:24:50 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> This adds the Rust equivalent of the C's DO_ONCE_LITE and pr_*_once
> macros.
> 
> A proposal for this feature was made in the past [1], but it didn't
> reach consensus on the implementation and wasn't merged.
> 
> Unlike the previous proposal, this implements the C's DO_ONCE_LITE
> mechanism using a single atomic variable. While it would be possible
> to implement the feature entirely as a Rust macro, the functionality
> that can be implemented as regular functions has been extracted and
> implemented as the OnceLite struct for better code readability.
> 
> To make it clear that this feature is intended solely for
> print-related functionality (just like in C), the implementation is
> placed in print.rs. If an equivalent of std::sync::Once is needed in
> the future, it should be based on SetOnce rather than OnceLite. Unlike
> std::sync::Once and SetOnce, OnceLite only manages two states:
> incomplete and complete.
> 
> The do_once_lite macro places the OnceLite object in the .data..once
> section, which may be zeroed by memset at any time. While this means
> tear reads might happen, OnceLite only manages two states (zero and
> non-zero), so no actual problem occurs in practice.
> 
> OnceLite currently uses Atomic<i32>, but may be changed to use
> Atomic<i8> [2] when it becomes available.
> 
> [1] https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/
> [2] https://lore.kernel.org/rust-for-linux/20251115050305.3872412-1-fujita.tomonori@gmail.com/
> 
> v3:
> - add relaxed load before expensive xchg
> - move OnceLite to print.rs
> v2: https://lore.kernel.org/rust-for-linux/20251112131619.3585510-1-fujita.tomonori@gmail.com/
> - improve do_once_lite micro syntax
> - move once_lite.rs to kernel/sync/
> - add comments (including ORDERING)
> - fix rustdoc errors
> - use vertical layout for imports
> v1: https://lore.kernel.org/rust-for-linux/20251105054731.3194118-1-fujita.tomonori@gmail.com/
> 
> 
> FUJITA Tomonori (2):
>   rust: Add support for calling a function exactly once
>   rust: Add pr_*_once macros
> 
>  rust/kernel/print.rs | 153 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 153 insertions(+)

Any feedback on this?

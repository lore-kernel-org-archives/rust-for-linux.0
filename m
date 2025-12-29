Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B9CAD5A
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012975; cv=none; b=qZvXWH+6oBkb+npPutzdk3X6thP6HVxSK5QkYC+9DYhUdTj33kxJvrPaW+Osm4YK8f/BQTbAh/3U4rW+Z35RD2aqgovfXAfNZzwX0gokNniWAeBbNztlicobJtxVpPVNRlgRY3ZIrsCEoV3PYqAT4osDnUFVpXkbQTsMuD9ocsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012975; c=relaxed/simple;
	bh=tee6VdvlFEm6Uv3axyApSiS7QpUBnPGjnoyMGf8BiJ8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Kj47jDA+N8D6VliKOV8Vw9BLCU33gTADH4kG/gdujT5ASjZ0LKowUsmIRN4Oi/2NsNaLWIfZrqto0o0r3xGxX5FBv+Mny6DMKJzrnmUmX4P4C2rXttFNv2D0llOSpp+YrMFSNvjv5ObNKo2Cu5MtiAYXJwmmiWTS83+SVtfVjAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BB1mGMvQ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BB1mGMvQ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c565c3673so4621623a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 04:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767012973; x=1767617773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i30eW66LPFBRKvJvSquZtVLn6ykVWMM+OPHaW6Kkm8o=;
        b=BB1mGMvQcJHROs2hn3REDyQB9XBlDVjVnFFgO1npO1oEJDabYWXIkKmGY/uOU/2XS7
         bvOoGb5Vitnatr3jO7y7Ak0aQgHeWU2smcgcwEf2i4dO+xUmNJpv7EDQbhMsCf/todXc
         mR6WWvU+1P6RzUsnIsNEpTBfTXbIhZ/0qRO7mlvbJ10dsfGsXAXZcZR3ES8pNctmg9CA
         zzc4akusZ45AK9miU/BT//vtPdND7mMSeyzYBltSI+xfcXpHC3qrF6au0SiF8U3/2kwg
         gOygvrt79Iu/IUQhauvbibPqcR6JscwqjxOtOyT5sFJz0HFzcys3vkOiRqmYHUXig/Xr
         hZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767012973; x=1767617773;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i30eW66LPFBRKvJvSquZtVLn6ykVWMM+OPHaW6Kkm8o=;
        b=G1D6gmSDM00QztXAEy0PQVHr7GX/Ix7SHtZ8/XN+GeVxAB0KEjsncaDCn4zALaJpuA
         YKBnhB8TQBvd7nfvHq6QH4A7MG+zPILgEyj7kN90UjQvTAJerqzcUFXBCkm+n1aNh1sE
         cXZnjyPsQE0LQFl5TA/ZV5tJFXeo1qRWGb3gDZERtpzFUDxGeirnNqf9FC6Z26Q3q9Rv
         rtMboj4T79agmibBXsWHN6U2Y8dOmtLqSVmZ9Rk/UqLOFrLuItoAovFpsEqPk8DyRu8f
         RzcE6pxnMlfKE76SEtiQr0mNMY1fJIKWagCTYHzIR4cwBYo7xoUD6y3nkMyt2UdJDiEc
         MKEw==
X-Forwarded-Encrypted: i=1; AJvYcCVFqyqYW6fXoAp2bfZcMVAez1G4TvO6l6mOzm121qJ93eXOEHnTWfdNhyR1OnUhwfOLoFzN7TzZbwZgnvV/qQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyymnfC3HzdfPbz/4pLF/3IlRFrBjb3seJRaN0G+ii/IiHVLf5Y
	0fT1HP9bMG0N18iYYp9Xur7b/jsIriXcCKOxwEQArMItFCSyDkUs7UJj
X-Gm-Gg: AY/fxX62N2glWzP6g+MjCvRzpG8/iTKWwRS29vqexWFqCJJ9jhYoxnOzbjpdxeSbQFk
	vyeI6Vj9Rvx0rWHjoA8VX+cw3obPizBFt4ivOxjBCWLcpebLLfqrXT8vvCV5uRqfrYF3vL4Vaow
	x9eQvW1OwTMLBn2IMnslncjzuy3KfjsOuHuFY2vUOP4OmvGXCqMBGP1DofVe4hcl23NVMIkHHiN
	NKhWlcRWf0B+u63Bq56B8oHUCF3WVKFXqQtv1urm7PIorPVcQEYI3wHZVL3xWL0sqWNhfcFkhAu
	s+Y1LFEzNkWVO9xBaJEOVPj6GVWTmCZQAyElhNhdj9Fo1nPGeDxo9LNQr3Uhdz8cmUG3Py0vQb6
	dTd+s6CKTKSrisNjHiUDxxx2QtNib4qhWz7s/MsY4a75vGrZhzO01CTzMVj40QeiLQiFuVOmujb
	czHpTht6pvCoV0RXl63DzUh/18TkhGjJKk4UQ5oheqJqQT8Htaihetq2h6rbXtX4DcVB0=
X-Google-Smtp-Source: AGHT+IGmYZ5Q3zIr4+NVsiGSQ1mj+575GKZ2vvEpvzpiHGqXbKEWyPPUny7/9hQuZgY3dpK/c3/XUw==
X-Received: by 2002:a17:90b:1d0d:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-34e90d6980bmr24541421a91.5.1767012972898;
        Mon, 29 Dec 2025 04:56:12 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e920c9a7csm27386716a91.0.2025.12.29.04.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:56:12 -0800 (PST)
Date: Mon, 29 Dec 2025 21:55:58 +0900 (JST)
Message-Id: <20251229.215558.697746619121630518.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 2/3] rust: sync: atomic: Remove workaround macro for
 i8/i16 BasicOps
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aVJs-D4V1IpfzR7z@tardis-2.local>
References: <20251228120546.1602275-1-fujita.tomonori@gmail.com>
	<20251228120546.1602275-3-fujita.tomonori@gmail.com>
	<aVJs-D4V1IpfzR7z@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 29 Dec 2025 19:58:48 +0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Sun, Dec 28, 2025 at 09:05:45PM +0900, FUJITA Tomonori wrote:
>> Remove workaround impl_atomic_only_load_and_store_ops macro and use
>> declare_and_impl_atomic_methods to add AtomicBasicOps support for
>> i8/i16.
>> 
> 
> I did the following so that we can drop this ;-)
> 
> 1. Change function names of [1] and [2] from *{load,store}* to
>    *{read,set}*.
> 
> 2. Reorder [3] before [4] to avoid introduction of
>    impl_atomic_only_load_and_store_ops!()
> 
> [1]: https://lore.kernel.org/all/20251211113826.1299077-3-fujita.tomonori@gmail.com/
> [2]: https://lore.kernel.org/all/20251211113826.1299077-2-fujita.tomonori@gmail.com/
> [3]: https://lore.kernel.org/all/20251228120546.1602275-2-fujita.tomonori@gmail.com/
> [4]: https://lore.kernel.org/all/20251211113826.1299077-4-fujita.tomonori@gmail.com/
> 
> I also reorder a bit to make the introduction of helpers are grouped
> together, please see at
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/log/?h=rust-sync.20251229
> 
> I feel this way we have a cleaner history of changes.

It looks much cleaner now, thanks!

Maybe, you could consider chan ging the following two points:

- change the first patch subject

rust: helpers: Add i8/i16 atomic_read_acquire/atomic_set_release helpers 

- drop the following comment in 12th patch:

+// It is still unclear whether i8/i16 atomics will eventually support
+// the same set of operations as i32/i64, because some architectures
+// do not provide hardware support for the required atomic primitives.
+// Furthermore, supporting Atomic<bool> will require even more
+// significant structural changes.
+//
+// To avoid premature refactoring, a separate macro for i8 and i16 is
+// used for now, leaving the existing macros untouched until the overall
+// design requirements are settled.


Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0EB2D7DE1
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755863110; cv=none; b=rfpfi80YgdaPx0QKfyF1PABnKo26tANWMj0Cn1iSIC5tIpMV5NBAhVRfI5uv042mAAtq9uRHQJyM/3VDNoMK/iK2UPJwEORUaEUeIU9r0DNjKa0k1EVkms0zm7mQDgjUu0LcNt85AQqzd1ZwGD/SWeUN1K9qNUppC3v4t5snCzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755863110; c=relaxed/simple;
	bh=U1YHheloJqb6BGp/2sNURAjtBLVCXUBMFFtCkTffVcw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r7KfIPbBcUvmg3Ki9XL6rrMbWEQRYw6JVmHHMWh0hPgjGLM0bJGGyxEY8VD6vh2GP3RKTJqJZEgRz64tdjbDu2Ld9EHLa+LoqcMq/TogaiMGrP+FXld0f0sy8ZzowIhsRUJnF2fizuQzMIDNWi2VXTSuLEH9tUOszaFqMTCE6nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z10TyJcP; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z10TyJcP"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45a1b0d221aso9789435e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 04:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755863107; x=1756467907; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvN0DxLG2S+FpdAhVPJYSHpGARrWQ6jqYGMXDUXsF7M=;
        b=z10TyJcPUSiosUGyHtrcjQRLF1AYrCC9f5tGn1kCB0zzTCXZNJtCI9s4MUaIQOV4GR
         NTaJaZLnx6m9HSosG+e8hiRe0ZnSf+wxZKFNJvvHyBxUKLRJCuMH/oTuA8t2ue/sn/7l
         EHT9MSjOjx3wrP+Fz1YzBil7fefg7TECZvI2hhTaw/vx3B+Lc5GSYGz9jZqEaEssRGr8
         DbOCoSDOT3c+KvOwrm7zRZmR2m48OIjgmIrdgMqjywTd+C9d0SqFQOIefDx3AhN1uP8L
         7s3BKfCdT9b9kKpTdpWfb0UmrwDGbFDhbq9jL2FwdaOovkETiJG0tQbc/PPwaIl1hcJF
         r4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755863107; x=1756467907;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SvN0DxLG2S+FpdAhVPJYSHpGARrWQ6jqYGMXDUXsF7M=;
        b=jFR4GOP195m6hje1X5Xu2k6ffTygZ/xCFT4zdUVcEs/cSsW6omTea2arMozuSeNYWw
         i2NWwaqcnRha6wb+nW1Fda9rMc5JaE7zBitkpXR1TX6xm5xL6fPY6Cp+MBVZ4Ihrwu2Y
         NPv5IRTE4tktZuAqXdEr8wsirQcHwtxbF0Ij4oOrLL1jj2Jen5B08kU8Wu0OIrJpCUjm
         sYqNAj1F0eR3Clhxes+8b9FUQ5LZvcJpgr+fgGybPh+MPFnDqcrkK18avX5l1srmNYuS
         friEle9YdP3nzthI/G42MxdR3+HQNhYpRod13fjl57H6ys9Ir/D1dILGOgJ0L4rv0lQQ
         2SHw==
X-Forwarded-Encrypted: i=1; AJvYcCWvrn1VkUoEBqkeh/Z3Nz2v0eskn3S1nAmcX+9wQn3Y9/1zz5WPaFKy9ApW4xIDk28krU163G5ekl7vbgoPGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvpjTg9/mmuZ3S8hN6xFEqI1b/1Mu+RdLPt0i8oLk23mbT4udy
	jo9yQSgJHAMlng95nOIOg/gpu23f1lGdaYDolqfY1Bq0CWNEvZ6bDTgi7ifurEFtfRQ5Ohm5i8U
	8SZPGBZP5XBAfQwBNtA==
X-Google-Smtp-Source: AGHT+IFIi0WPgKw5kAsACAPzf0/by98hL6yM+VynYOHVU4l0iuksAHqrV6mFxKfOrPbbaxoWlpkMsBY/YgkdG94=
X-Received: from wmbhj14.prod.google.com ([2002:a05:600c:528e:b0:459:6a64:4582])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:630c:b0:456:2b4d:d752 with SMTP id 5b1f17b1804b1-45b517cfe7dmr20998725e9.20.1755863107090;
 Fri, 22 Aug 2025 04:45:07 -0700 (PDT)
Date: Fri, 22 Aug 2025 11:45:06 +0000
In-Reply-To: <20250820165431.170195-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250820165431.170195-1-dakr@kernel.org>
Message-ID: <aKhYQk46u_uHUwwR@google.com>
Subject: Re: [PATCH v2 0/5] Rust infrastructure for sg_table and scatterlist
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, jgg@ziepe.ca, 
	lyude@redhat.com, robin.murphy@arm.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 20, 2025 at 06:52:54PM +0200, Danilo Krummrich wrote:
> Changes in v2:
>   - Switch to an enum impl for DmaDirection utilizing compile time boundary
>     checks.
>   - Add missing Send/ Sync impls.
>   - Rename as_ref() to from_raw().

Thanks, but it's still as_ref() in the cover letter.

Alice

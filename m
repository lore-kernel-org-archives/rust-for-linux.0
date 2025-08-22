Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B22257820
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755849542; cv=none; b=E3TfXIAiREVbDW5jyUDvus8tKwxlVw2SU9psnRYTTyQ4MkiHUOswLsKPUY06hPUCQzxYXiPoDKsD4t+yJwMCmrDKA6b8SyXf0oWtQgzyjcEzJUf/RvYHTfvA2UgXJhFj4nghJODBy8TF5VgpvE/5cx6Yzd+x86NvLy32ybFkmAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755849542; c=relaxed/simple;
	bh=ZSQnUiBY+QjVWejECl7qq5B/ncsHvvBk+pJI9WWhJ14=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=af3d+I5y5PuFxdyKERL6IR8DI9Og1QOxAPbeIoys2hG62I8NoUESjuxhB/fUGjJFE7u/6byERInCRxDgRqdgxbGHo4Sdf6Y+fjQaehVi1M8GIniPKluD9Zoh+sCYZ/8DQrk0YBX2/LseZADP5lgqK3rjaGbCW5dc7+0RyQuSSH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ePcWKAly; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ePcWKAly"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3c630eea496so216700f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 00:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755849539; x=1756454339; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OcR2vTnWvdHWsTxe8C4S1nf6KTHkxOneetmft7WPD4M=;
        b=ePcWKAlyd6NH3t/t6bnD3PFKLfRGfImvC3RUidWoW9fND1QrccadYRUIFhBvLuUrPi
         1z0Ue9GfuDy/KNWa8BEoiGFtvFqNmhEUTY9y+D3PzJ74RWauKyeLYfeewp5qzsNRZUqS
         bIdUQ0XcJoKixgiwfNliuylJPblnZOj3Dy/V7TKxxV+DwnPDjZiB5faMhOALFsCcJHV6
         4C5ffRZULjmQoWVOnbYds4qrLrkNJD/ifxpbbDbUDF5Rprija7rTnCwHUjJbYV0eI7Sm
         IJYiApmAZveZKooYwPjEpg1f3A2poSM8EDp8a6T3nmpL5tNLqJpnPe3IhNtbDYhcO6aq
         v2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755849539; x=1756454339;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcR2vTnWvdHWsTxe8C4S1nf6KTHkxOneetmft7WPD4M=;
        b=WDRicsm/RJ2+2ol2G41kc+a/jhvP2ovCSR++BwN8/JwGUKALE+cjtUAVJgKfYCFD4Q
         B49ECA7vUohu0bQYGAQiu6Ca1Fj+YJoM+TJRdmJtZXqW1cN3K4O7Ikg3dNRKP8po6j4k
         I4pkemFCKucrItW5X0CGfHupiJHcXNh0+8LYU+1gnq6Xv7sZG6ztov40fvztE4lZtnVr
         G1KNuD6v4UUgkIrnnBRmKf7eme5TERhpBlaYKoCMJ9W93RrEnLv63vaKM72CxYt+mw2R
         tHYTsQi+7ZiC60psW1UZVlqii15wC+IltMmjeAP3Al9tKo2zMVLgcDJAhmucuXty8BNn
         vA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfXP/I2Ozt9FP99slrYx/+HNJ/71gMdidoPo2EMrq3ZoznA74Xw4O123InWRkRX8vQsCpWu8DM35pLzqnJ7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIzLhPTTFN0DxHtLI8tKasGunLKIeRNG+DU6eL4BTB0SpkTc22
	BM90rz9cUTtPzsuZt9bswseR1WFo7Xh66j2H0IoQNbqwXaT6pqf0c3iNMP9Vr17hTLcHgQwDpSJ
	fCkMUPjJEaAWE1um95w==
X-Google-Smtp-Source: AGHT+IHHa6Gwb6EMwcReUb8w20SMBOY8HUqXKfoIIJGVFOjuon7/sYmIEhsZh0RUa04bS92rGVC4oCZ2kKrrErU=
X-Received: from wmbdv11.prod.google.com ([2002:a05:600c:620b:b0:459:dac7:4ea6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2583:b0:3b8:d893:524c with SMTP id ffacd0b85a97d-3c5dcdfb74cmr1360982f8f.53.1755849539448;
 Fri, 22 Aug 2025 00:58:59 -0700 (PDT)
Date: Fri, 22 Aug 2025 07:58:58 +0000
In-Reply-To: <20250821-num-v4-1-1f3a425d7244@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250821-num-v4-0-1f3a425d7244@nvidia.com> <20250821-num-v4-1-1f3a425d7244@nvidia.com>
Message-ID: <aKgjQq9tfRuCq-cr@google.com>
Subject: Re: [PATCH v4 1/2] rust: add `Alignment` type
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 21, 2025 at 09:42:17PM +0900, Alexandre Courbot wrote:
> Alignment operations are very common in the kernel. Since they are
> always performed using a power-of-two value, enforcing this invariant
> through a dedicated type leads to fewer bugs and can improve the
> generated code.
> 
> Introduce the `Alignment` type, inspired by the nightly Rust type of the
> same name and providing the same interface, and a new `Alignable` trait
> allowing unsigned integers to be aligned up or down.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

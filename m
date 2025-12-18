Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CAA139579
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045016; cv=none; b=caRwdpExyTdj9HzzEEuFUlmJt0Z0fDp3h9/8dsxIwmFAgrHsGBFdXX27cNldj94JmTwMC7mhAp9GckrOx8STT7ieNUsJLV57Bzg1X6nyIlTPYpfVkpCP6knHm0pNO7KsDyu8jROGTB3iC05s4q9FCuAX7btYkHhK9NB80LloUjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045016; c=relaxed/simple;
	bh=hEtOKZYYAsXhYEft8TBJnVi2CbEEtBpu4DD/8wO8ND0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZU+QCYaO+MRJtZ6PSGcwuYNvsyePkjdbeBS5x+Wjuk2fAIxyGgSqvAgDroRELi9q6UW3zRcgQ14z9WRU/337b1aygYOnT0zXDJykn+WfondysKKh1aiqhzdRciae+qWS6iuAKLqdHQNuVdIVKn62nwZ4hyEqDTgqPabjUw/ihUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZQvyNQvB; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZQvyNQvB"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477563e531cso2101185e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 00:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766045013; x=1766649813; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OeUQvDyug4deLDcKvQ5rDCM+MiU8d/B/npkqosp8WtM=;
        b=ZQvyNQvBZgw3dC49xLlDr2VdtrhXI+SaGCWogNmvOqbDFJWOqvs04yH2ySpJDynF5X
         wZTYWySUnRfBPcXmpO3Q3QEZ24C7DDz76bl97RNfUtNjKhxQyke7gzlUp9CaxQjI9Okl
         Isp19sh2Xb3OCm9bEUOZpmRHyk4G1Ww7QVTqoFErwiqWW0YxIoFWXuFNwNUcH0KXBt9e
         9RHkXWJfpfSvLZ8GF2BsX8PjSupjr9fe4xN0sslSwfsrAuPfIeXkkSAx68pRKP+O8oS3
         Jread8CK9KrHAXq+u9bIsy5xlRQNFZGRBpaG15sDchrkk5Z4YhAz4h4M6aSf0vJTyYg0
         UIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045013; x=1766649813;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OeUQvDyug4deLDcKvQ5rDCM+MiU8d/B/npkqosp8WtM=;
        b=YlqWus+3ASG2slqVX31mOIutbank3/ehV5dBAeeXz+TRHqdcHhcORboMnzsx10X8lL
         uXFhUgycEURM3QP405eiB3iHE2HeMS9aNAEj6sn1m1glV7J2UazB5mUo4NxC6irXpHIX
         BC6TqjmTMvhacoSCJkYxiEpNCAqHd5oe0gbAA+PudCxQRO79gNErn8nCovJvkdLn9lNo
         JqP24ifMS+Fuqv4PO3wByjyt6Ehxfg1lO7YVlThKVN0A/tQhMraWxyTG0+pekMi363dj
         d+odzGGDtpQKrnZV1KEFYyTo9R4sQ4SpTYevupbtkIWxbnwYRwIMv3qK6wVU5csDLbmI
         itPw==
X-Forwarded-Encrypted: i=1; AJvYcCUQnonO2zIwhvbHg6mTZW0l6PCLbNYf/Ix5SEoGfFitnEndYiIwLKizeKQou7n60hLHEJgU5BEM8pgmzW8oAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoDc0QBWVmKV0jrZYxKcUeU0GqVdaj/ND1Yc6C0sqjDQXHqNrm
	0ITC3nO0YS0hlIeR86OS/2M/MvKXMZ3HGravCClRNqRmNjmTvUuSmao3KWTCOVZf5X9IZqpIE8f
	cyu6dwO1cl5xxacpwiQ==
X-Google-Smtp-Source: AGHT+IGghGHB0Wc/NmNnQrqkLZVUY1J17wGrWmo45jjNzo+sZWroV6wyDZX02ieaajkASj283m9h1S04r0acSMU=
X-Received: from wmfv21.prod.google.com ([2002:a05:600c:15d5:b0:477:a43b:b532])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6290:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-47a8f8ce390mr259208985e9.16.1766045012831;
 Thu, 18 Dec 2025 00:03:32 -0800 (PST)
Date: Thu, 18 Dec 2025 08:03:32 +0000
In-Reply-To: <20251217213742.639812-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251217213742.639812-1-fujita.tomonori@gmail.com>
Message-ID: <aUO1VD8s_GOsyYP1@google.com>
Subject: Re: [PATCH v1 0/4] rust: Add i8/i16 atomic xchg helpers
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org, 
	will@kernel.org, acourbot@nvidia.com, a.hindborg@kernel.org, 
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net, 
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Dec 18, 2025 at 06:37:38AM +0900, FUJITA Tomonori wrote:
> This adds atomic xchg helpers with full, acquire, release, and relaxed
> orderings in preparation for i8/i16 atomic xchg support.
> 
> The architectures supporting Rust, implement atomic xchg families
> using architecture-specific instructions. So the helpers just call
> them.
> 
> Note that the architectures that support Rust handle xchg differently:
> 
> - arm64 and riscv support xchg with all the orderings.
> 
> - x86_64 and loongarch support only full-ordering xchg. They calls the
>   full-ordering xchg for any orderings.
> 
> - arm v7 supports only relaxed-odering xchg. It uses __atomic_op_
>  macros to add barriers properly.
> 
> FUJITA Tomonori (4):
>   rust: helpers: Add i8/i16 atomic xchg helpers
>   rust: helpers: Add i8/i16 atomic xchg_acquire helpers
>   rust: helpers: Add i8/i16 atomic xchg_release helpers
>   rust: helpers: Add i8/i16 atomic xchg_relaxed helpers

Looks ok to me, and it compiles.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

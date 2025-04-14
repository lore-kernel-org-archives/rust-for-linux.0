Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1612820CA
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 14:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639480; cv=none; b=a8TQ5J9fb11+tiZv3PveF4uejcihrm8vBNwB8iKvoojxmR442S7qHRipApAy9KyutkBQo0FzqDZOO0NRhnH23HW8V1mZrBUCZBnt07KR4sg560QnAO+bemSUaLUZV9xpMu4nPSEmr46eAJHJjSeEWeLM/XNvEBASAMveH7DQsjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639480; c=relaxed/simple;
	bh=cAQaJe/HKDNu4fkD6f+s9INtWjky3IgS/lTsrXj+WMM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=beE2p5+Pb5zWefCEkS2bVBM/dBSFx45m83LjqL+ihCg5Pu0NYdKnqIymA2SHb3wC7nr2o+V5IV/2EcOtKo+qVh788eq58KZDtpxYGPhffiKZA0jP3aGWFzB8CsE8yOilTEpyo4uHO1ItN+4NLnQBoffBpvq7NOjhKzQYZYWkjt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DfU7DjdZ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DfU7DjdZ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so27716185e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 07:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744639477; x=1745244277; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Oo2kd9XzAmT0u2UlzNebEIY8q5xVMeKjaSsxHJAfG0=;
        b=DfU7DjdZuc1apK1E9YzJmVxjEAJgtwsaeD85A3HlF9WaH+12LEK3jQbHCsuNjwBMCJ
         REf8jchjBBAQNH1AEAGxIKmMHVvqV97JZveo9+bwpobpnMV9qyRTzZaREywul5C6Fmqq
         wxSByw8CYsR0hNqWELmZxYkUSfyjF1q1tS5tY1QPAu2Sd+Da914dR/j0R/kvlIwOIN00
         +XY9CxpZmVexneF+QjtzqdRC69Uj/Q4eWYpaQiQCTPqPSIgRf06nkAac810G6Onwp9o0
         ePmIPcwuRGe+sTO22Z1L9/a78eNyFknYK3DVITRxVejkTKhivkhK7QT/MLqBrv9meMno
         Q3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639477; x=1745244277;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Oo2kd9XzAmT0u2UlzNebEIY8q5xVMeKjaSsxHJAfG0=;
        b=AYgJgoWclA7L5Q/Ip83bVzNLndAgDT4VFFAUqmu7sC0vO4G2d8eJHrFXHCRLz3dF+G
         LUDlXS9Intfz6yqZToveHh8Mss5ELyuQt3VL9wEwRvC9Splnk3SsmBlhkIe3FS9Euggc
         qnECxQG7I4K4Dsl5EX3sHOA0giPMh/fkdYVvKZXOjj9VzFZBYh/J2ghCE93oP8nNAWvm
         P1piAdtcmzs39LAEY/PIXpcw5IXvVMt+Q/lIyb6TsrgBFlnhW3B9cTX2FY4hyEilyOoW
         +X9nCJJmaiU+5TewOINnyfYr1wmThzuCDsGHnPv68uwvp7TQ4P6mE6j5upXRkJFmgDS5
         4qZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLqKAIKu23xghddEwBaOrz20QyOADg1Mjvp4UfS4drn8A0w32yx0Gou/QLAGqS5FgYeoowSWDeY1uj0IXtag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvYCiWLi9C/tDEWTTnYz43qfiPBg1xTLVLV6YYe3mJFtbtMcmM
	xuJMyDTgNzeiqJmMutDAfqqAoMBf8r6+JmXe/c1S/ZOu4zN0hdxmN+KWkpwGpL0wKaqgSVumsrO
	61sX9Pwr2AY3QZQ==
X-Google-Smtp-Source: AGHT+IHuEh0PHsblUmRpudvQyFJnWydTJl4ycn67zlZjeRLQa0PjIHRx7xRfnVI+/QHeDLPzSmmHSLuK5qL4i40=
X-Received: from wmbeq6.prod.google.com ([2002:a05:600c:8486:b0:43e:9aac:5a49])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a08e:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-43f3a9aa66dmr110937825e9.24.1744639477678;
 Mon, 14 Apr 2025 07:04:37 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:04:35 +0000
In-Reply-To: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
Message-ID: <Z_0V85LF2d4EquZQ@google.com>
Subject: Re: [PATCH v2] rust: check type of `$ptr` in `container_of!`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Apr 12, 2025 at 02:16:08PM -0400, Tamir Duberstein wrote:
> +    ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{
> +        let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
> +        let container_ptr = $field_ptr.byte_sub(offset).cast::<$Container>();
> +        if false {
> +            let field_ptr = ::core::ptr::addr_of!((*container_ptr).$($fields)*).cast_mut();
> +            [$field_ptr, field_ptr]; // typeof(`$ptr_to_field`) == typeof(`$Container.$($fields)*`)

This evaluates $field_ptr twice. The `if false` avoids bad stuff if the
expression has side-effects, but still seems sub-optimal.

Alice

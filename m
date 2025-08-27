Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC9734AAFF
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756290549; cv=none; b=efFLKUFERZJAxrl4YEKaMbPsHxrsIzb0LXv8PVDQhlp8rIUZqGEzoMGG6vvHvwIDs5ngV8EIcBTMtJwcWWGkFcVS6dWhGew32eeTccfV7RJAXdhTDoMCA4Hi1rRy4B5qq6DPWtlwrf3mhxtd+gLk6r7Mq1Jc0f9i+cTdmUwPdQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756290549; c=relaxed/simple;
	bh=DbugaNq7mw+QeA4tq4x7xb5bzz98n6JA5YpKeCYeWas=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VDZFTvUYL2j3pigbVG07pd30lYrmYwt9CBTHYMK0KuNZlbVENzLpzCSpvyQ3P9FCkYYgye8XJOZj3HNFXtcCBOh1xq07fIDieiTTX7AMcbu3FXT+zQ+6EM1hNZuVukVBguWdb5TB8sAo/KqHif9v67+6zM3o0tKKx2l/XBJrdp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aX/WSJZ0; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aX/WSJZ0"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3c75de76caaso1771788f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Aug 2025 03:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756290546; x=1756895346; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdTMbmCHnU1+nnbvSuLC2PYO7bL7HvLUcM04LVQPTsw=;
        b=aX/WSJZ0HjSmBRQmwgx9DGkl27MPgUqvbcwCBX6xZiRL2RPe1CWiwJPw+tRSmXFPx5
         XR2IEb/p4QJsq0gpw0KO/ZYgaAOGZfd3Ke7RNrzzgM6D3mlp9LGfDO7Jv47iTzJxocgj
         vMsdcJynV+B5ECAnoXlUK+LNTW9NUWLPtCAxaTJ8M9Y2QoGaFXKZN7b9uUG/AxImL4Bx
         ry/AmXaAC9rRjLYKhvWOe6ZfpbMl01daqtYFnfOTvc89SU05ysy9MVTWrEtlBAWEjrEs
         YVpT9Q8guWYUkp0jH6obyYT7boGMYkh0A37/tncPkX1/YwV79n/NO+Zopya6WwZr7r6y
         JHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756290546; x=1756895346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdTMbmCHnU1+nnbvSuLC2PYO7bL7HvLUcM04LVQPTsw=;
        b=UYcSJYuARCOjQZLrpkwxoqmIv2NtHQOgcPViQo+i5oaM8UHTpwtUI3vx58VGJ8PZe3
         vKPjuOoRxn1MyZ9NjysIXzExK6V7uCLOrK3MVCNiatIEtOqPJYR+TmCh/J7axSYOPrwg
         Cir++WFZJxSiGytKaoeH117j7mBep4BPrxfYlhDn4/TZ4lXykCL4QbRQKWizsZ8x0Ftw
         ggUrUYLeVcdoMg6ymrhDhuJF8cCu4y/Q96VbL/jN/6Ut9jrVnEo5F4DT/jIrN+/WdbX5
         IkMGNM95QzXLvLTrj5cY2FUuZdJLvoXnXsh3c2Oh/NgfBlLNwM5webRjERgN5lQHNK/Q
         QG2Q==
X-Gm-Message-State: AOJu0Yy0gHFK0NMitl1c3dRnFKVrSXXUTn6Zk/OqBywdyWz1dHbYkGNr
	vuomc2zS1F5trk/QaOQnZBuTs+4xL58/0+ZA8SNaz2eD0G3EL8vy5iubtTUAC9AW4HXzRhPQ2K5
	7EDNOUjwj+gKeN5O/Hg==
X-Google-Smtp-Source: AGHT+IE+i5as7l2IL1Ep9tnUjG3XXXVjqFk5D+5CFrrUQG9lsMRMMWvvPUy3uavWhqYg4E3oRO42xiiKsr9T3yw=
X-Received: from wrbbs25.prod.google.com ([2002:a05:6000:719:b0:3cc:ca6b:efcc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1acf:b0:3c8:c89d:6b5b with SMTP id ffacd0b85a97d-3c8c89d6f7dmr8728213f8f.48.1756290546251;
 Wed, 27 Aug 2025 03:29:06 -0700 (PDT)
Date: Wed, 27 Aug 2025 10:29:05 +0000
In-Reply-To: <20250820203704.731588-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250820203704.731588-1-lyude@redhat.com> <20250820203704.731588-2-lyude@redhat.com>
Message-ID: <aK7d8SN1wckZDZ6v@google.com>
Subject: Re: [PATCH v3 1/2] rust: time: Implement Add<Delta>/Sub<Delta> for Instant
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Andreas Hindborg <a.hindborg@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 20, 2025 at 04:26:43PM -0400, Lyude Paul wrote:
> In order to copy the behavior rust currently follows for basic arithmetic
> operations and panic if the result of an addition or subtraction results in
> a value that would violate the invariants of Instant, but only if the
> kernel has overflow checking for rust enabled.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

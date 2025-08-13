Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29521D5CD4
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 07:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069501; cv=none; b=AuCdxNx8AjqJkWwbcfhtcc4cSRnFGr2YB2ifemvaMXld83a/lHJSAOcDV506pJ07D04b9FclqzL1a98ISRKYf8VDo1ltzEnY1D2Byvbmvk5+jx0Ba5WVGZd6ydhKgW8kNgKhCn4gbSYAUvZqacqkhfM0ypNx6nwrqCtu1CgsY/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069501; c=relaxed/simple;
	bh=76//572e3GuN8QuIbbgtVsmbxe2c+f4YWelOTwIFWV0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BjSiuLCErMXE7f16Zx49qqSq91g2JSi6mWBLtC7SqNbg3DMvfbpZy0RwNccmWIEJdHDFhUBYn6J4FLMvSIZoAMd/i3cm7BHM81pLCkaRPeASb7XGtztpMOTZFOLchUSthz1r+G/TfMz3QoMG6ZriXdcFNEe761QmbUE11aCEwlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KqgHbZBF; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KqgHbZBF"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-459dfbece11so31964935e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 00:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755069498; x=1755674298; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b8PGywyUjn2jqIoFYcL6q2Rc5vzcUYBuErIM9vPcqig=;
        b=KqgHbZBFClClymRWFHGpdQ3zgru0hEd4qaEYJ9byi2OWidZ007wpmXOycXSf9qAfZ+
         K2SupGndWP11nQhEtgjUX2v2fkeqMW/1hlVjUhU2uqfRGdWXCdDr4OZCRAqZcOz6JyCI
         iIfOSc5oiDbjD7Koh9EYePbrcmEr/UmVYcAziGZgumYBsW6lpmU+pj1cSjckvOtiVY8i
         vdL80RMUEgLO9qciKMZrsUhYpOJONJutlJ5471ItBgy+fbC2qp/fK6RUc8vBubvntgeR
         Jm1AL7Inm3dchEFmsGLyH2W/8GtG0vgmHSohFqc/tlp19Qvmza4IrruwTM42IEi5KAhN
         7t8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069498; x=1755674298;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8PGywyUjn2jqIoFYcL6q2Rc5vzcUYBuErIM9vPcqig=;
        b=Oq3joVIjrdZacpRwqLBHxr7C1Fs0GJT6SEgVKtnVmvMKP1A2N4S/ALLQMTyhifFh8U
         HYAYAOtT2EKYeOITAoTaub0lPOxp1uCWjbsg86vd3ASie+Aqet1FZoNExJU8zaYBUae8
         RF6mIW1AtEuHcueZ5ZbeFlAXJMy0hM0umJiPWqEjtXh3mcV340dU1jtfNHbKqVDXI+pT
         P1+jxvBjrhnKAEpTm6V7VSytxu2mSltyoQ/4cuVlmVtWyj/NAoxYHZ61bNALGsTkNPlN
         4SO5ehyIbHNa+km/9rYJQF/6gNRilTELswlvjSev4IcYOhVqIR5VRli+AEzBsi7zVQV5
         DAKg==
X-Forwarded-Encrypted: i=1; AJvYcCVH2LpV9uN5U0OAGUQr5+7uFu2XEE+9masmvsJWaTk6fcv2+5uWqlFogRV039rYu/P6oSxgHMOrguZSnUeiew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwehQnNXzZ0u846WSjiceoKgcu+luLYfQ7kVVjgz90u505gs6sQ
	+gv9K857IG8vsLmE8MfqRZdbQqExfQ60ngk13RLGioNccIkFGr/1vDwagL0ozu3YNaVf0kb4dxk
	ofkVUlliT3ej0igTDAg==
X-Google-Smtp-Source: AGHT+IFYAm0EM8LGqSZmqKj4g6RbZs5uWJ6zUvXyA5Y9b4tkpBxnEvOrAIIuhQP/5o3wMcKMghvX9znN7995pOQ=
X-Received: from wmqa2.prod.google.com ([2002:a05:600c:3482:b0:459:dac7:4ea6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec6:b0:458:bf7c:f744 with SMTP id 5b1f17b1804b1-45a16609bebmr14368275e9.32.1755069498178;
 Wed, 13 Aug 2025 00:18:18 -0700 (PDT)
Date: Wed, 13 Aug 2025 07:18:16 +0000
In-Reply-To: <20250812-rnull-up-v6-16-v4-3-ed801dd3ba5c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250812-rnull-up-v6-16-v4-0-ed801dd3ba5c@kernel.org> <20250812-rnull-up-v6-16-v4-3-ed801dd3ba5c@kernel.org>
Message-ID: <aJw8OO4v141gFBVy@google.com>
Subject: Re: [PATCH v4 03/15] rust: str: expose `str::{Formatter,
 RawFormatter}` publicly.
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 12, 2025 at 10:44:21AM +0200, Andreas Hindborg wrote:
> rnull is going to make use of `str::Formatter` and `str::RawFormatter`, so
> expose them with public visibility.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

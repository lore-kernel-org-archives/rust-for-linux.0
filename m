Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D285523C4FD
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609194; cv=none; b=bxoTaAfX34TH+1WI/pF4uEj3ypF5YstKriuWM/xTOCtvnP4uT0jY11vX5stpVqTlWFV7snGR6Gl0Crlc3sEX8x8FhZV3kdPvT+XbVT7ACxP2WZU+V6GBki0cL9qaY25YnRDDfCZEP2tiTpz0F5EVMVSXpiQlI6AwuXJc4DCkxno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609194; c=relaxed/simple;
	bh=Iqqt9fEh3pnuZ95sJ/nRyJCiHHTMbAeqA56OBzkTxPw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ve6/3hNfYqj2pNQ/rcgDJcKhff2ahx8OqwqM9cBD3E0YIP8YVAnbG3YnAn9g/aM2g/7l6Tlu//JQm2DJt2aHdF17E5CRltVWTbfMgp3IGB+UrF/OQe3sqyOyHde4+AoGmz2kOqdjtIN2eCoNr/l7ZFH6zAKb1uG8reVXDnv/ZnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NfagYam0; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NfagYam0"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4806865a01bso14689205e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 06:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769609191; x=1770213991; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=527vz0HOgwx+CJEZZYxhdzRZwfuYQLYu7N9m4EL7y+0=;
        b=NfagYam0tqy6WaFzAU4Bb1kLjO4X4R1Jb1uW90OUYl45J+71VIpHHo37PzF7wf3fnV
         IInVem6lOnKBzXpjwekXMp1mwc/I7WBPBwCisspBceSx46xSn9zV8cdGGpKdfstr1xcC
         YZg+pK1boeQf4qDfOBr5Tszh5/iY9MlxQsVfbCSg21feg21iZ/RugnrCNy4OUWc63oDn
         weqW9iw6frQmZNNS2rHgKDuYUq7e9ljC3pxunac+BMW7/xCxFTNbAgOvMinTz0aQXtwg
         +pDwXKRYLUijMxnAqEgxWlpZ3D4ajBwnL00F0FxzhOhLs93VElczvqiS0U+c79tv1ZHC
         peCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769609191; x=1770213991;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=527vz0HOgwx+CJEZZYxhdzRZwfuYQLYu7N9m4EL7y+0=;
        b=JYoLENDzDbiuOIja2gy8lhFhW/8TA4rRMHpaNlgowb+MLs2M1bJ4E0531wcRDFAuLK
         QvWoU+lI/ww72dLLhpJBjqkU9RieY9KCQkjsti5IaEU8QoVpcBk1GruIC+zOmD7Fxko7
         n2lt7cCrAbBjzqvlPZeJP47IGthmsFLTNpcAX6mcdxDvNdGlCUS3HE5PLpia0MbwEGVL
         s8KEE/imhnANgW1J3Rx1VSymfiDRwKlD1PvWfVP60UsQPgrTTmVzNcwF7kWCsXQ0K4lT
         UKL/eY5xsuRm+GUiblBLeHEGYv70IIEpqJD/PeTegF0wgZTPah1464BZc9QcenouWhgS
         9hdw==
X-Forwarded-Encrypted: i=1; AJvYcCWiacpLqR1yiLbP36EwLftr1Hj8gNoCigInzrJ014mIgUG1+YmA/+UGQBEGpHJbU/m4G65KSmCA9g23f/2Qyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsgrKB0xd4rEUS4QSp5GeoNUZ97EFRlxU1R8CXQf53QpQ7zJe0
	bkiN8zT4TFRLCTaORqLggmVk9YJ9+EEB5NJWW6vuxkU6STgeUBIRTZYOhU1P/jDGeVa+TtLzV5A
	puSWZ8d75TvdIVcBl/Q==
X-Received: from wmbil25.prod.google.com ([2002:a05:600c:a599:b0:480:69a4:844d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e16:b0:47e:e8c2:905f with SMTP id 5b1f17b1804b1-48069bfada8mr61979845e9.8.1769609191359;
 Wed, 28 Jan 2026 06:06:31 -0800 (PST)
Date: Wed, 28 Jan 2026 14:06:30 +0000
In-Reply-To: <20260128-atomic-sub-v1-1-f8c6abcbb067@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260128-atomic-sub-v1-1-f8c6abcbb067@kernel.org>
Message-ID: <aXoX5ixoQYs0cUU5@google.com>
Subject: Re: [PATCH] rust: atomic: add fetch_sub
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 28, 2026 at 01:47:11PM +0100, Andreas Hindborg wrote:
> Add `Atomic::fetch_sub` with implementation and documentation in line with
> existing `Atomic::fetch_add` implementation.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

> +    /// let x = Atomic::new(42);
> +    ///
> +    /// assert_eq!(42, x.load(Relaxed));
> +    ///
> +    /// assert_eq!(30, { x.fetch_sub(12, Acquire); x.load(Relaxed) });

These asserts are a bit confusing to read. After all, the fetch_sub call
also returns a value, so how about this?

let x = Atomic::new(42);
assert_eq!(42, x.load(Relaxed));
assert_eq!(42, x.fetch_sub(12, Acquire));
assert_eq!(30, x.load(Relaxed));

Otherwise LGTM.
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

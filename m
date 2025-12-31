Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE68C225417
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 10:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178421; cv=none; b=SF8jRX2ED/Po6wOFgHiGeslFbaE8nRlWA0rxs2BasO9qRCXCF6K2dtoTGZ2ZkwwrZpQqxxc5McjNCIAvnB5ASYZwHUmKU3rL6SmuBeSfTC/CLewjcQFxLmjldJo62k3Wn6xnLfCDr4lTTjpfCpgkjfcQCE7YOyq4ORmkkhNN9ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178421; c=relaxed/simple;
	bh=5HiwPfr5EDACjsdZ9LTjVqmXWR40218VNmWOEbmcqZk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BCzJDDMHADoJmdlmWx7iyXyzQ3MuLVZGxSk6wbd/7d+BL4dnFc5fz3jNDVek01vR2bXmijhQx3cQc3BFTdM96rWEQ4H28vpkuDmo6leZGxNv5vzY75Z3wYPfvWAF6zTqDTqDF0QsILpOVFvZn3k/y1ZxLnDUBexeY+JAA2L6XSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PBr7K11A; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PBr7K11A"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477bf8c1413so68847785e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 02:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767178418; x=1767783218; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sxQTFlhIro0xGnySpTUp+NxSclq2ToY8KZYYl21WmSU=;
        b=PBr7K11Au+nmTPuLRtILrXjE+Nnm/4tx7W78qIq7jxIjjsLBYdxPLlIF6T0CwEBl2O
         0/eBaRNNGmEcD8Qk0PfFODKd5Rf+/r0m75wmv3diByya4V4LIakV9VcRsqPZHZBGjmJ6
         fTCd8LOay6oRDqy/blAkwrOh61k9AEQLo6MX59xSxY3nvdBBWfmYMjSKo+QHWnnAC/US
         ALKlbVmFD0boN/yd4fbdusY8YK4HLs2lvurof3wVohYtZvFFrWjsGt2WkDm3zNgewlfc
         CsAwRUD6X36y6JI52rgyapCdf9zV0KciNB7hPKJTUmwl/ZbSqvSXds/RJ6Dmp8DoPnzC
         uC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178418; x=1767783218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sxQTFlhIro0xGnySpTUp+NxSclq2ToY8KZYYl21WmSU=;
        b=NezRAg9RaLLRkbcuckzwAn9b5LdHLB53NHlPpw66KIH0rq3i+i81iGY9NsNWbC3fcw
         Q+DAAN2T/Qee76Te4sOev8mQCmCcFJRvvLGAiT/Geu7ZVvoQfMyENDgZ3McQ/6EYeyBf
         Cj4sP8gRsamFYMmUz9+1WuhjRndm3Y0F337eMkEXbMAknYBIGPdeu5qbGwYchkyol64/
         aPvmrPcqGq83CFsEaEnRM8hBrtPndVqGeCYXOqNHHnJgTiA8x3hee/MjSjaJSGuapiUF
         FJ3/0vukt9XzMe41FpUwI7Ws7DMqY8XM7ac/4DChvmhPFfQ2oOmf24uzT9VOrmKcc3Tg
         oPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmcCQH+pxtFSqge+WbbOJP2mUwxcelWA5/pj6hojbShPY1hj4WFkKjp39MdrzQVqQ4bT6Hb4jAs/Ia6qlZfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2QoQbNR3GElXuhgLxBaMTMAtqLpfhigkD/EIktkC2EMQro4tI
	POsPf/UrEJeAILSsAL30w8dFzyC2x5eIDcqiwnwweuWFFZ6NFi6vzUWJK4E0FR2ywqYqpTusevK
	7uoDOM8APPbf0CpsLIg==
X-Google-Smtp-Source: AGHT+IFfpoBGKtu19ZCJJtG89ijZN76WBXCdWYqweh86nauulJdQLOmUjZIksAtG0f3w4KJYkNzUTQoy+hvpbhw=
X-Received: from wmga3.prod.google.com ([2002:a05:600c:2d43:b0:477:76e1:9b4e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c086:b0:47b:e0ff:60f9 with SMTP id 5b1f17b1804b1-47d19577114mr295082305e9.20.1767178418222;
 Wed, 31 Dec 2025 02:53:38 -0800 (PST)
Date: Wed, 31 Dec 2025 10:53:37 +0000
In-Reply-To: <20251230093718.1852322-3-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com> <20251230093718.1852322-3-fujita.tomonori@gmail.com>
Message-ID: <aVUAsXj1lbgUodyg@google.com>
Subject: Re: [PATCH v1 2/3] rust: list: Switch to kernel::sync atomic primitives
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 30, 2025 at 06:37:17PM +0900, FUJITA Tomonori wrote:
> Convert uses of `AtomicBool` to `Atomic<bool>`.
> 
> Note that the compare_exchange migration simplifies to
> `try_cmpxchg()`, since `try_cmpxchg()` provides relaxed ordering on
> failure, making the explicit failure ordering unnecessary.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Thanks.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

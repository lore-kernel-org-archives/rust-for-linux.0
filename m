Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8C9228C99
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Oct 2025 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178798; cv=none; b=QLaE/5mmGBPhOEkrimesGkhob5WjJOHy7LuPcIgyriYajZZc39zBXzsw7uKtYu9G36czn7k/maxrX1fbSGK/EyGjd8oFq5QYGDZAl2amwzOMx1HjuAoMtHgLwc0xXWgdWNisLmVZZWLLakomNH5Kohfl9ldZBWZSDgoLQssJtzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178798; c=relaxed/simple;
	bh=KWJNoifW9mKZ2m7atmfernWYiEqoHW9QI0fSKHHtBbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CNLbOcVpzRTYnxVNEK5j7VMJRsiKkYd8/pGnvy6PJqtWX30MwAmYyKGPE9M+il4hPHHwXOUF9ZJc9lJo/U/O3jVROOP9yHWkJVuoaI4LKW2iq9p+n5x2QDzXNKm7Vhm/zk4lDfZyaAPR3OOnNcDTEs1iyNPst0ZYeIbywVbhef8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m7JDfBnb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m7JDfBnb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e38957979so14771495e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Oct 2025 03:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760178791; x=1760783591; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEMAqpRvkk1CnOEEkWJ/ybbuyMvUoPKtuwUvs4qymvU=;
        b=m7JDfBnbU4E9OeEKfYdEAV/J8LniUpq6spCzUl8FcswFo+uHZiikqGCAToF+1XU7t0
         dLTn1YLfYyvutnQSLnfZRiy6CZwJkGHD/2SapnowvRdCvSFWBZZQJwjCxT0ZmOREnzt/
         2acm0S9QfcPxyX7eaPrecIy245LfpdKRVlnDXB8qm/kcRHXE8BtSZSnuopKVs6DzDKZd
         qcXlrJkxI0xXKYCIr4QqFMYQLoS8+jxGlkQmbNX6xX+DJ/3aFC0UA2tqkBsORbh1Musz
         LYO6y1RV1MgWe+DCvu7he2ZUoWMCgM+kCBU5y12dBYxrfKZNbw1XaaFYzHay93C6nXQU
         e/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760178791; x=1760783591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UEMAqpRvkk1CnOEEkWJ/ybbuyMvUoPKtuwUvs4qymvU=;
        b=r+MzMBgDlo5M0qLAyhuTJjWU58wLEm64PM1bBVuCvuniiYThnNOjGD3cUH1XBY4y6k
         CfSBHMw5mQExrQVvnQJnWpwWhkUvj81rCqqKgGE+OT+1/sBohMFmyL+inTc0UkB8UcqQ
         t5ABJ9//y1GKg5m5soLEEvV5nTb1H5lDTUPlfrQXsdwGNv6GSw2NyQmqrV1O64+754qu
         thDjDfJvMOglikICK2N0ZtzBZet7hSPSZWMj87vSXg416E6RcOgRqBV/RFrSc6L2v/1p
         O+/eSwUFJze4FWRf/VehL196PTYeKw85PqJRXz4gbTzMXsLkVdwvaISSth/3siH8XI0l
         TRcA==
X-Forwarded-Encrypted: i=1; AJvYcCVronnFqJMZmgjwdOGGuHKhDlfsBKoKellzRYB5PKwtBWVHEdWtduivMSLi4aybACM8XKS02VJgtSoB3MfGqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuirbkWVJaQix+/TKFUt265HywQ5QuVDQ53cVzbumlNRC0QSm+
	O73ByJyv4poGc9I0DVOfyfxXCtlXgpXLdC4W1R82mSGkdEeoE3MmjSG3LXMEgcEMHpplRdvV7nE
	zoHdwBRnOdsqZ+FWNIg==
X-Google-Smtp-Source: AGHT+IE95szyP/U8+8WhwLLID98VXllUKscYx6ym55wS0AieLc/ikoex6vLfoIyhhX1iRrMI6+QUlbXsF49wksQ=
X-Received: from wmcn2.prod.google.com ([2002:a05:600c:c0c2:b0:45f:28dd:87d9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:416b:b0:46e:3dc3:b645 with SMTP id 5b1f17b1804b1-46fa9a87f3emr103546595e9.3.1760178791259;
 Sat, 11 Oct 2025 03:33:11 -0700 (PDT)
Date: Sat, 11 Oct 2025 10:33:10 +0000
In-Reply-To: <20251009-bounded_ints-v2-2-ff3d7fee3ffd@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com> <20251009-bounded_ints-v2-2-ff3d7fee3ffd@nvidia.com>
Message-ID: <aOoySkWjPcJLVDrG@google.com>
Subject: Re: [PATCH RFC v2 2/3] rust: kernel: add bounded integer types
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 09, 2025 at 09:37:09PM +0900, Alexandre Courbot wrote:
> Add the BoundedInt type, which restricts the number of bits allowed to
> be used in a given integer value. This is useful to carry guarantees
> when setting bitfields.
> 
> Alongside this type, many `From` and `TryFrom` implementations are
> provided to reduce friction when using with regular integer types. Proxy
> implementations of common integer traits are also provided.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

> +    pub const fn enlarge<const NEW_NUM_BITS: u32>(self) -> BoundedInt<T, NEW_NUM_BITS>
> +    where
> +        T: Boundable<NEW_NUM_BITS>,
> +        T: Copy,
> +    {
> +        build_assert!(NEW_NUM_BITS >= NUM_BITS);

This assertion can be evaluated in const context.

const {
    assert!(NEW_NUM_BITS >= NUM_BITS);
}

Alice

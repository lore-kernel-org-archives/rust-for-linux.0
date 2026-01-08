Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1334F5990
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 12:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876914; cv=none; b=EvuoI1rdVEkuN+/F2ab/FrIqdlcCNqprNiccfOtfgtZ6odbkRayyvJCSd9KQwue/PQN+B09Ls5VXzAiWXsm3XX9ABmdm8RoHPkeR0wcKuLy3CW+rLhv3F8cWKniIRzei21chLKUeIbJiCW70FXItwIYlwU+DN/5hgG2TCE1GnIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876914; c=relaxed/simple;
	bh=MpmYXKJernq6nf6J9sV2MuD58KDGeot4KE+1gehDLVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLsuMeFPlevlCwVW3WtTE4bp9vZCyWb0ILmWKvNXwIzn8x/bX4zSIoQuwXjVDq3pqTx4YQsw3LCdWC+d1vXafgj1eiNH42npv01wf5XylDZ2/CXzYZSEnzhphhAEd/VQrCF6EryfgTr+7nOjMNuVk30EmxWaUvZf+1rgZ0f72xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d08fzfcj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d08fzfcj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so34426915e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 04:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767876911; x=1768481711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpmYXKJernq6nf6J9sV2MuD58KDGeot4KE+1gehDLVM=;
        b=d08fzfcjwYLUOJnKmHWBCu2uN+qsOu5bYYqnfYr98lyBn/nLvQh2O+LLAeYaucgogX
         N7NoqF/MWrDWNYg5GvDFZz7zsevkiT1SfBS3Fw61tRay3gnj+kR0iu9X/ANyI/dSNdTd
         BxCrquwLZjqNNWftDA0WKJAygMnUqSck16vW2pPcrN5Ri7YKdupAaVDQLOSLIsaMj2HX
         EGTV+cut+40h8B1K98N8tbYi1gCssaE78r/dRBA5KoRQT7C6sSQPKuE2FrsTwtuvtdfY
         QeY2Zf3bIEakci3i9oAC4JURA+6Sb4z/nwZJ1UCka5QqyKzQLdXdeklD8qcgkWNKJiQS
         Gxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876911; x=1768481711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MpmYXKJernq6nf6J9sV2MuD58KDGeot4KE+1gehDLVM=;
        b=S7Fji8ktbdupUG/Yo4oyT4TLl+inCz4imfE81P7gP2KGow2g+Y0IauoHmIRvYQchaQ
         Im2rJ+0dUOMKT8FpeLW7rOd0+cZFIHwa4OovpdS+wB1Z6PrN5NkIT/3DiB5rDAeUXqRH
         SpUYSmh0Ow5DWh/cGwNBB5P0Y3p7VfXwuZ+gJ3XMasSxrWIvPUhLAaLME8p+4oUmdigT
         6KA210a4EpYovwz9dgnuCJDX7Xf0jIq1UOyvIDY39wkmQ4RSoRdYwQQRTdd7NHc7o02n
         Vy26nQ22xdDK9ikt37CrXw4zNjT3KAtiCO845l98UaaKUw5H0yYyhkuptOL8g/4vxKfe
         H8DA==
X-Forwarded-Encrypted: i=1; AJvYcCWzMJ2G7qsSCZ5fcVYitzgylM6PDaV/r7jGm2bl78GsQZFoFcimAtscvPk2U4e6xPX/vrKrSViHKTqvwgg6Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZJnzR0CJWZZ5gvCL5h9T0tFptRHy/FJKUJyGmQOogmqRqzyof
	7Aeb8if6e7aaLv8Pb8x2dgWzyrCD8bzrHfGNuNbL7q0PIaLzZW61Z4JI1jQP8Khr2DmRdPmgFEd
	rL9uJP7n9r77xVmpJ4otsKJwqyYv/kqN4/icSp0PF
X-Gm-Gg: AY/fxX7S6pNxF4qUaT1LZ5HEKoTso3GSbydOrvSj6ENGfy+bMEihqhmjR5nyEoDLXu9
	Q8/dbBOTy0rCPB+GXOKpwKLqazr2sAjTbmzNFSciDYso0wS1WT2tJD0eF0gK9gXsbZQqJVvegb3
	vODZmo+0apbjbKifVITQPfLC2cSEv0k+BCEV6qvycJOOGwA00vnxcGMcAniZm0ItQhF+ItGFTm2
	Q/boPp+wG9al4uVOF6WEaFqsvD+l1/YKVniJGYmgsML01RAJoZDPoVIDWNImBGs7TOQBGslPq6H
	PYzWNvrl+KRvKtdvzRIdb2O/S4qXGzDQII97LuYqzoEAuSIxTac8rmT+8g==
X-Google-Smtp-Source: AGHT+IFu5tCl1/MOsXJFzje4fSES6O4DmBRG7pQhPuOhwSSDRvgWqAISb/OhqoN2hftcE3dUjoJxP3/diTCK36EMOE0=
X-Received: by 2002:a05:600c:3143:b0:47d:4fbe:e6cc with SMTP id
 5b1f17b1804b1-47d84b179f7mr77453645e9.13.1767876910852; Thu, 08 Jan 2026
 04:55:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108125005.2945800-1-fujita.tomonori@gmail.com>
In-Reply-To: <20260108125005.2945800-1-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 8 Jan 2026 13:54:58 +0100
X-Gm-Features: AQt7F2rAK8ZzcpJq8n-hDLgV9mOwJvzyf9utKiQhCrJBWrGeaoSmbUsAwd1_AQg
Message-ID: <CAH5fLgj5UsFqXpT_RMhsYeKZkA+KgXBDw89q-HQEozQKLwNhXQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: atomic: Add i32-backed Flag for atomic booleans
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org, 
	will@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 1:50=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
> users can use Atomic<Flag> for boolean flags.
>
> The backing integer type is an implementation detail; it is currently
> i32 but may change in the future.
>
> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
> particular, when RMW operations such as xchg()/cmpxchg() may be used
> and minimizing memory usage is not the top priority. On some
> architectures without byte-sized RMW instructions, Atomic<bool> can be
> slower for RMW operations.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Can we have a `struct AtomicFlag(Atomic<Flag>)` here whose load() /
store() methods use real booleans? Otherwise this seems inconvenient
to use.

Alice

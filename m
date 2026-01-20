Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E8E3ACA7D
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898701; cv=none; b=iISxEDw0DM7h83PHbTNyQ07iqgeL7NqUxmu1+jNidMeL4RxgDl3hWoSWHx7mM4hqV5SS7UJhCBwiytDBVJu7HW1qIKELeSsc8GcB/+zEbQbwISKpDMlVi+Bsd9PYbIZ2oDjgAsREykt1nLGuFBajq31r0+F2JGm2Llwkgt0J09w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898701; c=relaxed/simple;
	bh=Qpwd1/M/Rw40FAF33TwG2APzVY3geA2kI8ExRMKWa+w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VIFEGS//LbPLpcirZkuGBMgdzIb/3cIPQFCGml/PeaHJkLKPInHC9iq2oDnpiz6DjJdaImQ2fogCQQU8fG4UgN6tImGg00uzDkMI10gv9iZ7TcDkcNSmrxxQZV0i7NLOziwzzAKjLYEzgtHjoKBp89g/83aRBd1wDupbaMULUK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UPM+mKCv; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UPM+mKCv"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4801da6f5c9so44416615e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768898698; x=1769503498; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n5ylyY+HwRwF356rLJJuDIeDsrdRt//o2P/JF3RJnGs=;
        b=UPM+mKCv2ZLguak0Z4my3VQ2x2IgWwIHDxmvu8PVaQFZTK1EClsl3uv9kLAnEQYzjl
         XCCT4K5JmQPJVyZSz+5g97+d1rJlOMCVNDdJ1KofYa3w4lqaNHxl9zkgnd1fFL0nXJx8
         DGhuUh1p/LPNsZ9MHiYmIHJriJjXQec/rLusZoI8q9YlSkXzdKrnwBUZNFOBwgKkckg8
         LNMH1P80Jeefz9f5eyEuEtEnGWr7bOcaQT1+v7TD17OqG6Aff5ncC2enLwKSekZ3TepB
         yjYe9STOd0sT/oqmH/xyKaW/Jn0bsb3HNsIxx7Gox9uvImof4cMANdp7DL6Q7IAhAB5f
         O0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898698; x=1769503498;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5ylyY+HwRwF356rLJJuDIeDsrdRt//o2P/JF3RJnGs=;
        b=H9pws2WlpeW3PAdiUJFsyjXDryn4ZMG8Qgm2hA8nswyQ/lzh6m682KEB7yUrwSiRFa
         USs/JWDmAjOsjKv0kgVXrx6mwhyQsu/3ll1P1KOKsuEcI/U8KnIwhoq7eM6LYJuhc4mz
         mmsGrcpKjHeQX+D0on9RQemeERy6uwR7A64c5K/DC2r0wcNzKE3sJqm6j/Z+1Bj4xf3Q
         nBWDZn69HPCQbGc8yax6pKAyDv4JKroDlieAUI1Sex7khdkuCB7u4vRppUNuBsXBzrd8
         FtysJ+1U0INB9nAdlech4lui1TjlalJH5oM49CeUWVfh+24x44XzfD1IssdUkf4QYm1+
         gCjg==
X-Forwarded-Encrypted: i=1; AJvYcCWqkDd+QEtbQz07wJzxDwqULqwoOnYJcdjlEceZj8zVfxfNzfyKFLT3Ul///5UfssnLkWSz448F/gmsTe+VAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdbLMkF/7Ss8HZsXbDkznd6J13bKdAZiwTaqTFxnRLwq+bsfqq
	UKe+NzOH64WNMsGl1/WmpQajNOo3qeoZWe0Lg/En6dTjwpQ4P8TJ/9HLhh94YW1eK51snTreHua
	c0BbX2NDtvGYiI9UJVg==
X-Received: from wmco1.prod.google.com ([2002:a05:600c:a301:b0:47a:8f07:f1ab])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1552:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-4801eb0e021mr171763595e9.27.1768898698493;
 Tue, 20 Jan 2026 00:44:58 -0800 (PST)
Date: Tue, 20 Jan 2026 08:44:57 +0000
In-Reply-To: <20260120-register-v1-1-723a1743b557@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com> <20260120-register-v1-1-723a1743b557@nvidia.com>
Message-ID: <aW9AibF0fWNYwRep@google.com>
Subject: Re: [PATCH 1/6] rust: num: add `shr` and `shl` methods to `Bounded`
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 20, 2026 at 03:17:54PM +0900, Alexandre Courbot wrote:
> Shifting a `Bounded` left or right changes the number of bits required
> to represent the value. Add methods that perform the shift and return a
> `Bounded` with the appropriately adjusted bit width.
> 
> These methods are particularly useful for bitfield extraction.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +    /// Right-shifts `self` by `SHIFT` and returns the result as a `Bounded<_, { N - SHIFT }>`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// let v = Bounded::<u32, 16>::new::<0xff00>();
> +    /// let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
> +    ///
> +    /// assert_eq!(v_shifted.get(), 0xff);
> +    /// ```
> +    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
> +        const { assert!(RES == N - SHIFT) }

In principle this could be

const { assert!(RES >= N - SHIFT) }

Alice

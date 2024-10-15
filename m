Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A171318A92A
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728980599; cv=none; b=ITxftNhoXCeDdeqIrjYANMkxmxtB1Oo6aW8QMpalEf7k5d3hgSmv337UMSQCECzl/w1bdslVtCmf5qMDlmqOsOGSuAq/7FxMF5G192IBVGxUx3pr/kr0+JHztXoD2RGEJCfKGPBWjTL0Lc6CKW6Lb4SLpOWbcoNZzTgD+5Z8Blk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728980599; c=relaxed/simple;
	bh=mCCrlw/yEpLXZ1vbGLNLrI1tt3ulJTMqY+P+85p8RWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJUNcfA9umZcxlLxBJPkaNNpubjdPJdCzEWfkl/Vv+NX6WBERvc18Y40GMX5iDbiqNvsYJMu42nNrswyK7W2SLoTX/KaT7nUrGQKBTkanmgeyI3teshE5E6qJagU7mRFyXpjdzcYubkOyce6gozOaNKs5kVWe+OIVuDc7zDzZn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XcJ7xyR3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XcJ7xyR3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4311d972e3eso29324695e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728980596; x=1729585396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCCrlw/yEpLXZ1vbGLNLrI1tt3ulJTMqY+P+85p8RWU=;
        b=XcJ7xyR3e9t0F7X9nq2IPcvdeyYiAeJV/UnNn4Emag33GhJo2dLDemS7VJSetBMava
         psE3k7DESJxCge4Z0PKvA80u8ZqBBq47m2matNtIQ85D1tP/oAeSKtzISqwhZLlGuDIr
         RGMXJBN/eMY5bchXheeZrmfQUlLf+gFpqRv8WRrYytAqxr8J3i23uWGXRRxr+zmm6KvC
         DO85pvoNTRbZv2W7kmXPcyW1Wl73fj3/R88aPDfCOcM1PFMWcf+kTBjJ3d60MEjBcsM+
         SEAp4YetcK5VPn1DE3GhDKBwiiFSiHy5dmaaxadpnq/KeLRVxFV01W19iC+hCdN3At0C
         GLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728980596; x=1729585396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCCrlw/yEpLXZ1vbGLNLrI1tt3ulJTMqY+P+85p8RWU=;
        b=LGDqAn+Y8ALPLhh85RgMY6sok/vpAr2Abch39pkKuShA15XSSBLqelm31qR1cSc3Cz
         x7T9baAEZYy/vaqB5w8T+ravs0NtAILROLQinDRfKHg/TFNXq5+bK3CajnMYFz16cQZA
         1Nwq7suvZVHnFwVpe7ibhzO549ciETBYIfx+rHor7IjGEs9m1m4YHL4yCJj2rjriGQFX
         lcCZFHNXwWq8zb1OllTe3Rxr2udA5tf/ZkF2E297gE4fEAXZT4SKiU4PUz4tjW7kUzWn
         TNItotyMO1ph8KEbGSoOCVjbxN2inrtmhHvXkhelwnasaJrRJiKywv+tVgDBZ77jlLZg
         ubUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgbrGYJ20jmsDTr8JWcIRdFvDmaT/B7Rd6O5PGSJj2Dfbqv7HVPWuD34LeH/Wzr4eHUuhU/xPjZmKGpcjvuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMzW5prVlK6JPjTo2PhXrdq9tArH3c00oWAA8GNrjbOeQesCS
	pTQm3SE/eZGK/2KUpFYYaAi1CUwAQ9qpAbAGEevpc2MiZ2IFYeO92FWioP8E1dVBShtQoPVo47N
	iP07bsVMoztcM/hvIiNRbYZ0F0RRn2HTmie2U
X-Google-Smtp-Source: AGHT+IG02K4eUCM+WT5wVbI7W+sQfu30CmI+/4/ytZ4rrCCw1rQADfDrq9S1SteuyO5So2/j3Q5bGNYihWcFQHmjVmI=
X-Received: by 2002:a5d:452e:0:b0:37d:498a:a23f with SMTP id
 ffacd0b85a97d-37d600ca0b5mr8444900f8f.53.1728980595829; Tue, 15 Oct 2024
 01:23:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014-vma-v7-0-01e32f861195@google.com>
In-Reply-To: <20241014-vma-v7-0-01e32f861195@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Oct 2024 10:23:03 +0200
Message-ID: <CAH5fLgg8NDEynr_dgrUQABZAOoSfsBajDRnipiuGu8tH3bFqzA@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Rust support for mm_struct, vm_area_struct, and
 mmap for miscdevice
To: Christian Brauner <brauner@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <liam.howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> The first patch introduces mm_struct and vm_area_struct abstractions,
> and the second patch uses them for miscdevice.
>
> This updates the vm_area_struct support to use the approach we discussed
> at LPC where there are three different types depending on the kind of
> access you have to the vma. You either have read access, write access,
> or you are initializing it. Each case allows a larger set of operations
> on the vma.
>
> The first patch in this series depends on vfs.rust.file for
> NotThreadSafe. The second patch in this series depends on char-misc-next
> for the base miscdevice implementation.

Adding Christian as FYI due to the vfs.rust.file dependency.

Alice

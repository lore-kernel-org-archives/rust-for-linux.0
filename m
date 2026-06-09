Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFC223E356
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 01:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780970109; cv=pass; b=hw+mXdxJ4BrFYe//r6vayrpuUAVwxKLfKnZNe4uTIPZ/PTp6MckdY8GCHtv64ePl0GI3oN08Z+q8D7675LuDTJSzFC05YSpQOVllNf6gzwU3Zya5RVL5m8/yke3f+OPYSQJCBxrJkIQSKG9nXiwUVLruX/y1WSwXYn6jBdHj4n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780970109; c=relaxed/simple;
	bh=d1Ufgws2QqgBrUSlA0IAeB1pShHP1a3QKfGqElkINXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhWg/nIBJKZMzlrSk2dxoERQT8ENRFrjkgjA28gol0r+60qa9dn/qgCfn4TzezgSCMQYJqdvptTA77sl/3tZGNWLwKITWqycvJShI1U7mTcWfqqNXX9wSBejOJhuGaYa0OTwEGHaIuUUZBaWcuQQ0ZYVyKw3BIkjEj+IL67XHJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GJUY7Wwu; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GJUY7Wwu"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68ced08613aso36936a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 18:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780970106; cv=none;
        d=google.com; s=arc-20240605;
        b=UZklJPoDHRg1V9x/UlhTG0+VvCN15Uh0bThRgwAAh/wFIvk2A0oWvzcB/HgGDiJRZw
         pIKDjxfaYjgs5oWof+SVAZacjVtUDcMAkt3qIx+bocemYxv9SkVPdjVQYo7bUylFStei
         32bMCtXQpXZTdPSvI4CA8/WGTqnpxcVmfGNvrkwtKGsgy1D/2oEwmqVhaSE+JMRuC90a
         kXULUfMUCHbT9FUnH6Kk2TjUXhwh8yxMnax/Gevz4tIW/JhPY3QvrzMMiaqH1h7fP7SH
         GjukSsJJmat3gkeBxu7qZS8Ema9BZo/kUULl0nakUot4ntbcfBq3i6A0dLABk62Lsl+t
         9hwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d1Ufgws2QqgBrUSlA0IAeB1pShHP1a3QKfGqElkINXM=;
        fh=YBXYfDWAKQA0t35Rsh8GigNIlcGOGCDRJuhDA6RoRfw=;
        b=JYhBLMIwf3nIaLNnC6JWZ2R/k0UESg0fJB1Kw6lXBF25xxmVFQ80SGGBX/OD86Cfz1
         eqn0rePWqkLVbKhrmuLDIflszTcvktTVGYPyOreopdzgWrDhk7gw/3mye4iV/Y4zjpex
         cVQzdmsOHJ8PzuvFBky3ZL/jDLM6fGsfnV4FEhFgq/sRNI2cLe7ONHwz6LPjfF199rEv
         soB5EqnrynluCu6fvnqXbNg2H3T0NSq45abnyKq4YxaO8LS00YZCmzLrCGW5VVYvhUUy
         cl0IMaV7uFFmXEuM5AIgSekX8gQEa2zDhCakVPXYTAmswF2DXJW9MJTxjckXXaI8Wc7l
         kLEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780970106; x=1781574906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1Ufgws2QqgBrUSlA0IAeB1pShHP1a3QKfGqElkINXM=;
        b=GJUY7WwuhwgpNIQm/Lyk102IAhbw9GXyAFVDUx4dgPrMTCaaDKy7VZUXR2HdYd2Mv+
         h2BDLucVQI3pWSXYa11iLQIOEtbAav9jrAQOB3rgjQ0YXHSyumZnfojUjHy4vscy2GcK
         1rzIT2ENhwLuoIft+5ZcWqPoCEyxGMiLAkBIs/JQsvLPRB9EGpyHFhx4QPYyjHeghqx8
         2PAccObXzbWocK3gREesmTY2S/xWMTefJO0oP6ZOt05tQSJCXS1PfS6CJ+buTaE2hqvD
         2qMRp0Zo2Z/les2vZKXB4JipqD1UcVnDz/sgpS7NX7GhzZ5qymJRuLQhOe13srfd9I23
         CUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780970106; x=1781574906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d1Ufgws2QqgBrUSlA0IAeB1pShHP1a3QKfGqElkINXM=;
        b=m9I3wbAQnLPmyaihwGKdN0r+KrKgL7W70aZm+WYbTOouhziQ7cQrnw1XqD5Vr9SKdF
         Ic1bLO47i5IqXaor3V4IuB3ojizn8iIsfYGY0Wt2DJbPaq0LM3LitIWXW8wcxFoH0IfW
         OQmY8wo9FX6n64a56o91DyWiL4TfZ22d+6QEMGFLcEshwcbZuNLFMUOkFhXeuY0dep2w
         E5vPkp2DoudcyvVSK8K7VbuikjPYmkUIJM4hW0sZ20QB8sip6bLXLEXm2GaABRzV8Ks0
         meEwxdz8NoIXvTFt8DCUhEkHm9GRjzWSZT+je6ZrLgO9YdPYwCyq3+ltSEy9Da7LioCd
         r/KQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Isd4CVx7EndxYqbvsXuSA7t3M14qjErICHx589vpz1GVaQHLgeRlj2T6Swo5ywePvk1aBdPVRuj41FPeu6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSljxYKmFwUHDIW/cBUq6rrY0PUY3xdS8QOHmmS4kCvO5+cCr+
	PjdGfXjQ7RZggapYyY9LiksSYWUBbJnQoEGPggiLxP0ZigfktpYr47gH/51feMukEL9ef4mE8HZ
	SpW+Gk97YyA20/SWYfY7wdN9U6QiOJAgvudPjW++k
X-Gm-Gg: Acq92OHnnn5QzA5K2dcOccc4IlvSo+tYrjQ/aSn1EZn1DNWjrGk22OIySF7pXl5efqH
	LwmQZ52pCpCGn+g7N2kHb7KpUtYmq5Qi70aYkYWDLellh3rsd8dqpKv7Jo3AqKpzl0n+gyRHeJ0
	G/5qLrxbCiyalxoFhmToir2Rlb3GaW7n0gUh1HBzpLhlmetE29xe2AHPujgqHc+JrNiOJVF+EmH
	5/29qbftUprv+NFzys7IBX6sC+2gUms5nA0uwQ32bhgyBwy/vAcNIQOUBq+CZRswPTbdTONGMT+
	UjFTZkcR0u4JGNY=
X-Received: by 2002:aa7:c908:0:b0:691:ae72:f443 with SMTP id
 4fb4d7f45d1cf-691ae730014mr72827a12.4.1780970105573; Mon, 08 Jun 2026
 18:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609003256.1829625-4-samitolvanen@google.com> <20260609003256.1829625-6-samitolvanen@google.com>
In-Reply-To: <20260609003256.1829625-6-samitolvanen@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 8 Jun 2026 18:54:28 -0700
X-Gm-Features: AVVi8CdUHB5-wdt2Latvkt_2ytBWf4LV-lEVGr_fPw-ajdP5XPKxf5Djku4m0VA
Message-ID: <CABCJKucVW-FF2sti9gVoKkp-StLMof7kSqisbmUvjyEAaKLuTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: drm: gpuvm: require Send and Sync for
 GpuVm's shared data
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Asahi Lina <lina+kernel@asahilina.net>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 5:33=E2=80=AFPM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> GpuVm implements Send and Sync unconditionally, but it shares and drops
> T::VmBoData and T::Object across threads: obtain() can return ARefs to
> the same bo on several threads, and deferred_cleanup() drops them on
> whichever thread calls it. This is unsound unless both are Send + Sync,
> so bound both impls accordingly.

Sashiko keeps finding more issues here. For the benefit of those not
subscribed to dri-devel:

> This is a pre-existing issue, but does GpuVm also need Send + Sync bounds
> for T::VaData here?
>
> Since GpuVm<T> explicitly bypasses the lack of Send on VaData,
> UniqueRefGpuVm<T> automatically derives Send. This allows safe code to ma=
p
> a VA containing !Send data on one thread, send the UniqueRefGpuVm<T> to
> another thread, and unmap the VA there.
>
> Unmapping via sm_unmap() returns a GpuVaRemoved<T> which drops the !Send
> VaData on the wrong thread, potentially causing data races.

Looking at the code, UniqueRefGpuVm seems like a better place for this
than GpuVm. However, before I go add another patch to the series, I
wonder if it would make more sense to just add these bounds to the
DriverGpuVm trait instead? I'd be happy to hear some non-AI thoughts
about this too.

Sami

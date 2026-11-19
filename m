Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078431;
	b=dwPTEHe0YxnTSD/e5saZ2CobjuvevOCuhzb9/uZYtrT1JAzxGD+41ZBxGuFqt6aFthtT
	 efay2U+IKpxJwwUiBzTh6CvgtVaQE1FmvCupXkoYC6j+TIR+CwHdRiz+DVh4v5f/QycJy
	 I6Bueb2qwOMDW+vkNAzu+7rS1jscQjvoy1rmRyPa3qOj7hCFhmyUliTi1tZWz2XmaMr53
	 ujJrEEr/R9ayDvj8iCZgpsAOCzCoWO8E9NzKvYNI8f3CL9xHdzdNd0QVziFCMRhB8CmMr
	 4rypan8zpfRpcQ1+ZBb56GfKrk/f+FyBTUvb7EpFE+w/SWaC0iWSclZa92wiMMc+2Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5QqQji51y3qIauL0ncte9mW5b9mFOt1NrirI6UE5Ag0=;
	b=5gmRv7ANqvl/Mzet+pgGClFAbzO77bKZam2+k6BLCAEb+ihNN6TzKJAYqeglF3kDvUpM
	 vpkhDt3B8T6ysiaVhY9aDUPNgEIllLUPIACIbp/zuPl4qtwMCKbqvsVf8grAGgzF2oP/a
	 XF/E5yejS015WcazSA8LE/zK1B+pIcMv/w4dDRPHTKWqJU5QzTzp3OFUCgaLk/oJ/wt1p
	 /v/ygzXugnDtXRd9peFjOstJXoewuS100ecFflUuI9F9oIiLbzaKL+aP7UMNEvG4CzGH8
	 1WX1SYh8jVDcBGPhzIzsg7/U6VFeUSXp4I+gcPB4+OrTAzTm7sSNbrrxrBK/VbaXzeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=afU9PVsL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2DD606A325
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 08:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A2DD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=afU9PVsL
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso966706f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 00:53:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795078429; cv=none;
        d=google.com; s=arc-20260327;
        b=NOoSbahYulHQfvUAIPe8qFvFYraKszpuvzWzBI+TeuvEeRhANWQgqJrjgTPaQIqSHr
         N451eT8bkzGTLzWEbWYeOyJ5IQvLFE+cJszgr/DEVFr5X2Y3WBPQL1R3ZRkR+rmBZ5o3
         i7rT1zwbaa2ZJXywO+4xttQgcL4Tx9gJIwH27HRU9kKN5aTudqDIhq4fdd4BWr2WI9WN
         mAmVU2pw9LAF9KCXc6gDoC01Hul4asPzI9C+1oOQlx6zyWjAZOiPTb8OZpjI5Ifah+O+
         bItZctbY2m1Mo6nOYb70wyGrO7MxO+nGIJw4dplbaFoaWFlU0svtYgy+lgKHFOkA+3Dl
         TTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5QqQji51y3qIauL0ncte9mW5b9mFOt1NrirI6UE5Ag0=;
        fh=6wAf8AfRhW+Kd4UVoFItQkTnuwd+OyQFc5jKuM2Od4Y=;
        b=Cp2kkj6inwujnjypmKVKhFlSisdHeJUqFEPO2NMHnVjPtqV6M+BghqVNqJb3ZuvXMF
         Z2pprxWFPCxo2q6AJ1foZCxtXFSOxdF6cEJsH3uD7AOpypplmV+osmR1e5XjJOKoWTwn
         pCprh1qpPgBx6YAUXrFw3AKar3y0POH8Uh7XeQX68qeBekZKzXZveukbkAtoUcKGs1JS
         bMoRTsMcNzzhCJHW5nLwF3UD3G2nJTG9l4xafVsWsXrDtjn91T5OzvAUe/jG0PDjfDxS
         Xzamr/DHgOv82Smati/ML8RpYxEor4HOtul/+5The6hILmaIsA2VRXCXi1TJu6qiBwd5
         4zoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795078429; x=1795683229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5QqQji51y3qIauL0ncte9mW5b9mFOt1NrirI6UE5Ag0=;
        b=afU9PVsLC0NI3xdY8WJ6HfzNJAcK2Tjj2SMafl9/urdCxCRefIGe9zfIq6Yd5P4t2u
         7vEHK7HsNH20AcwGI5DRRuyPStcPF82LrsxyxFtNhg4lKSVJmqZ2vvLYIEKj/YmVXnMe
         f81bCYC8TH0ntLMUhePWVh41ui1Tz74tSpuhEA3ex4ZF5iwc2gtXHlxj3SrS5yHq21BB
         B9F0s9zM8bDOvfvnMm6yE30F+qb8mKFx3qqgcK2DFHWApFj+XPrh+dJQLXLA3mWMXGpK
         kwlBI/hOnf1Afrnz4iCe2v/vWY75AYZomjQUxv520epMl/2x3VqcH6GZrHd7/HcdwOQ2
         uA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078429; x=1795683229;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QqQji51y3qIauL0ncte9mW5b9mFOt1NrirI6UE5Ag0=;
        b=mBA3bW3iQKylvOOobCROTsVknbXnNyO7aQe8FCNwLKZdiPmK2rFeHAQHH18cGbO/Eo
         RkraL7cksBShHEjoGbw+SX1c7uDNyBkB6uQEzdxxCsXO9BVITmFIRW7Vt5Dp770XyCNn
         JheMhyrDDAgF+qr0LasPboOHobvb3t4ErM16zbUp8xXqa52eY26f/WhAFsMXbxPpZZ3L
         ePMmH2QsLvhcqbfB4VOcWLVClwsldvpdcDc1UGLiYSap7OwJpRxfA1evzuHLYxuKZwd5
         QuJsEhOOlvyewnk7vmv6XX3rnwC08AccXKijQcIMJkjA/zoAMWJMAYiAf/IyxMd2zYUZ
         XOHw==
X-Forwarded-Encrypted: i=1; AL+hErGmE4L7gJDPFqf8o+2NN8MpeVA14LN2s86kqQKPj4PZwQPySAV9WcGNqP0F7egM+TPNvWsk0qFBn9o9W6eTHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/z0DUz4+Oz1mjTtmTiZx/wf38m2tiCEesbIIKOCfFSpkRvjpkq
	yOUQttJsoisQIWti6JbJi52iK0qMvCvevp5Cyuy8G3Juv2LOv8pkLOJP3O5sIKkNVvMo4Ty0er4
	Ukl7QuHBqglpcuRt/AAufriXuJ1jMtP6T9tQB7qIX
X-Gm-Gg: AZFdTZfkjS4T0Z/5bRZj+UWkOfpKptfJHt+hA/s3p/uT/IZY8dmZ8D09tAlqFDXjZBY
	N2etP3snEUlXHI1q0Zb7Hqkja+6WJRVeRztUn4WtJJ+B9nv6Ttcfptb1xG0OERcN4MNX0JKxDWF
	oRmyV/VYw1dGn+lDngbziAbU9oxd8cceRIbABoJ8L9GdzV9jpAOEa1yExdApZPAn7zih+Gy53wV
	NzC834dt4ONWNalzuFdLSx5/PnhuLuquRXMAIsigSSqY4oo6uUMESSA/WOeHomtExBkujvx50Mb
	NNovxE3LkYTbbJd1YqhaC1Kh+2QRefAoqWbGPqOBiKx26vvRXUkzl74bvxIoxbK5IAeVBnzI9sg
	m2tcnbtsSgAckTpvtCeBs/IEgFbDNgkZhUw5O6u1owBnbM9WV0567Kfe244LW4J0GNPkzXEaLXy
	FEtgQKOk++J+xLsmY4+n4aGlVi02RobQLiPR7jG7nS4I7Y
X-Received: by 2002:a05:6000:4023:b0:4a5:af7a:b7ad with SMTP id
 ffacd0b85a97d-4a62e43a3fbmr12154110f8f.0.1795078429032; Thu, 19 Nov 2026
 00:53:49 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-formatter-lifetime-v2-0-e216d86ffb57@gmail.com> <20261117-formatter-lifetime-v2-1-e216d86ffb57@gmail.com>
In-Reply-To: <20261117-formatter-lifetime-v2-1-e216d86ffb57@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Nov 2026 09:53:35 +0100
X-Gm-Features: Aa3M54qMGsiHV31TkfyWs7_IPL9ZgK6ffsi0k08k8zaNIGS3YlymgVZ3YAzTX-w
Message-ID: <CAH5fLgjLuB6ZdVTK=qUUG+NTBrJEY0cDjyNxZzAZX-NOThLVhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: str: tie Formatter to its backing buffer
To: peder.bergan@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Georgios Androutsopoulos <georgeandrout13@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:57=E2=80=AFPM Peder Bergan via B4 Relay
<devnull+peder.bergan.gmail.com@kernel.org> wrote:
>
> From: Peder Bergan <peder.bergan@gmail.com>
>
> Formatter::new() returns a Formatter whose lifetime is independent of the
> borrow of its backing buffer. Safe code can therefore drop the buffer and
> then write through the formatter, causing a use-after-free.
>
> Tie the buffer borrow to the formatter's lifetime so that the borrow
> checker rejects such callers and prevents overlapping mutable access.
>
> Fixes: 87482d6d9104 ("rust: str: allow `str::Formatter` to format into `&=
mut [u8]`.")
> Cc: stable@vger.kernel.org
> Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1261
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

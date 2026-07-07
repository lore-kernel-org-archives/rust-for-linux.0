Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C55341610D
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430037; cv=none; b=FyGY2gh4tjA0HPqMzNewFAPMMzOnOQ3lQhgQvT3LROVfC65C3//QTUkmzyY6GkdvGjhEG7fambcs+R4dii+E8d/DUrUSrVwcncJ7UH0cZxZf9YwnnotE8ZIOKa9JFqctlaLJoCJ6Z6nJHyfe0xgoBgcFmZZ0FxzVWorbpb9VRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430037; c=relaxed/simple;
	bh=GK7PFm99L/4DqOi76pFbPZ1OFtxYFfFssnW7d/gf0aE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R3WaRSxDltsKOMoa3gEXM6PMWcfw7gBbxWTqyGGaidThIbfP0goE8T0JCCT7510hSKNCkKfdUlh7A/FQcShIx7oFkOeXvRX4PHo5KxFQG6ZYZKWlBOhrkDkrOxUYr1qtvwI0YFzNZ9wW1xl5x3jLudFRUD5/nGrbg8G2O5/er68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R1riz4ia; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R1riz4ia"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-476d52b13d7so3180149f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783430034; x=1784034834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GK7PFm99L/4DqOi76pFbPZ1OFtxYFfFssnW7d/gf0aE=;
        b=R1riz4iaLDtXXX8JDWodfUbgZdOHF9fbtB4toQEfDf9yjzEu+jKLV5Np4jW8hAV4kB
         aFHTRNh5upmKhf+6dhB3dr4KQOfDplKfDv8ZyKH4tCSwrmVnZJLplEKxwPG/ElsTwK04
         5nzEJawAXGR/8utyPFtnumCKQwflyOOkDIMBXfRVLrAOC+AoG+svaYDLxz5uSl7dWhyj
         79u5ZR3OhgZa4b4O0HEqFwuygiUeqIY1N/KxIhoiZFFX/c3MnbvjOJNNYsoFjN0M9a+Q
         X/YTyFvF6KlplOO2Iw+HL18cO07CkHPNxoiCT8C5Myd6Zsf/Dgfp7L/nL1/zHMOjJF+8
         UjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430034; x=1784034834;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GK7PFm99L/4DqOi76pFbPZ1OFtxYFfFssnW7d/gf0aE=;
        b=FsdfqEiRrUKA1bpstsJlONaiHBeD1UkeWt32NgXs8KVDVJX6/BWTdxhW5v9ydIGBxc
         4kQ6B//hccBBQaXnLhFWLMBGBTeggXciwpoZHEJrv5fqRL3G5HGl9GtPDhJENM9Cj7i2
         bD2ZzYMbx5QZB0hSt42c/76bp5NadSQ477DulQnB9qpVZ4CxAynAMzm6jcyPoWY2skjG
         yteZ4Op9yzRqlR0FEQZacCgD9TzfAJaYABpKsr4MF3OujtmETyvMMuB7zW4FPEWG4Nbh
         XcJf2V1vHl4v6E6kM8rlS2sQHNz+FUtdiMCBVRGT4h/HhDHlj60LlFFYbYFq6/t9HH/Q
         6B6Q==
X-Forwarded-Encrypted: i=1; AHgh+RoG6KE7/appoAHuF3mj12PoRFtwJLnz5SF0iJO2o4e4vnbW4EfVQuRnbvDCd22/Fm1TFtJJi16+WDKrdIR4cA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8WujcDElBcM6ciQXpdRsjjrzChkk3BhR1kxuI/9ozpZPYd7nS
	pVrl8EzyBh0UXjmGRAqUgReZBBJoLB8vh/njkDPW1kPS87cSQR27bsivj2rP8t/PIpttLka/cuc
	42JfCSFiere/fakGbsA==
X-Received: from wrmc5.prod.google.com ([2002:adf:e705:0:b0:465:767a:3a41])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:53c8:0:b0:477:6da:1b83 with SMTP id ffacd0b85a97d-47de669f408mr4204803f8f.24.1783430033658;
 Tue, 07 Jul 2026 06:13:53 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:13:52 +0000
In-Reply-To: <d63a68b2-4301-4ce2-a28c-637f4c6bf4fa@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com> <d63a68b2-4301-4ce2-a28c-637f4c6bf4fa@linux.dev>
Message-ID: <akz7kMQEfvnhY3wH@google.com>
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
From: Alice Ryhl <aliceryhl@google.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 02:15:35PM +0800, Alvin Sun wrote:
>=20
> On 6/23/26 23:38, Alice Ryhl wrote:
> > Printing can be very expensive if it occurs often, so printing that can
> > be triggered by userspace should be rate limited. For this purpose, add
> > a Rust wrapper around `struct ratelimit_state` and use it in the new
> > macros.
> >=20
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>=20
> Tested-by: Alvin Sun <alvin.sun@linux.dev>
>=20
> The binder-related patches couldn't be applied to the mainline
> repository. I wrote a simple misc device to test pr_warn_ratelimited:
>=20
> [=C2=A0 =C2=A080.655483] misc misc_test: Opening Rust Misc Test Device
> [=C2=A0 =C2=A080.655546] Rust: 1990 callbacks suppressed
> [=C2=A0 =C2=A080.656102] rust_misc_test: pr_warn_ratelimited triggered (0=
) from
> /dev/misc_test
> [=C2=A0 =C2=A080.656137] rust_misc_test: pr_warn_ratelimited triggered (1=
) from
> /dev/misc_test

Thanks!

Alice

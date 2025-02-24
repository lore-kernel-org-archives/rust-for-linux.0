Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B1B25EF8C
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740395982; cv=none; b=aRsic04X5tq9Fn5zhP1A6XYAkUtayd0oJkUhCmW/sZ9z25QDleYMr7XXokEKVP145n12UT60YpXR/kxBkMaRBSiIPnkkf7b5EPf/J0AFgmE/aDf2mtX0IgOnVP0pRFrzI1QdUzDj4p/NTqCwL4TKAdTYM6DXiZnsaRR4hzVBqk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740395982; c=relaxed/simple;
	bh=nbthR7RhGoVVTUAl39Aagc6UcJUc0m+dmOqj/KUfZkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pz2fi/Btr+pl16pCk13eIF7P7vq9PbKl8nRhyRprh7yt8jv3g5if6IbwhZIc0qPEKJ66zKRz5NtrhEoqwI3h7k0o5aQW34ZuLIQtEDxzt5K02gSRV3FAtM/HnuxJ2Edolj+0hr4iCegKe4IDf2FnXuweFX06T+a1CCAmytlnewg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0VZ4GezC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0VZ4GezC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f6287649eso3344122f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 03:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740395979; x=1741000779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKNwKhh4dEnTxVcOajigIGSRE5tzPUoKtH97+XkBOAY=;
        b=0VZ4GezCHOwKdwLfQ5VDyjZVSCXbOP0WjrkfEAJDlxXvGmbi4j89u6ULlqzWekFGQD
         /RpJSkB/zWldxW2cGeVLX6xjkT96koI3DmOo9BmTmsVlkFJ0EXxVr+LseevM519Ooz7d
         gH3eFRNhS4+E+0j01rFtHiGcyDxOG5k7LcsFA9Wty53FHACDYX5xku8QbM7lJTmdbG/N
         wJmsoTTXzu64C2KOLCp8JvWh0q75bK1YNz3AzGkqNKyI/SCuAGwo8n0d9uePwxhNm+zJ
         wmDWnqR1JHaI99ygIE1AlHk0hSFmdix2n+FhQvnXcGy88RVByyDcoO4sRVSzTJBV3kVS
         +vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740395979; x=1741000779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKNwKhh4dEnTxVcOajigIGSRE5tzPUoKtH97+XkBOAY=;
        b=idzjiOXY138zlIjfWfkBJEP9SbJ5875jQu9/B+VnP03Veq5SEuoM5HqKGqX9XiNuBe
         Cf2MBO3KKAIMjT93M+XZb5WfRTfn+n8APS2aii5rNydZspk3W97qODRBkkLVvhZ94utC
         Mr0oe6G1lLW5Rnla9qmpHXNuqL+eXQOGi4mUSDi0dp2sheIb7qx/MN2/uQq6JsWyyD7G
         f36S2xu5Ipx5aFihJt/9nj3IRInb8k7a5DWQzoOZ9qyvalO18PZlBo0EOQgtUYxpsNNi
         6f48GfEbusR333ECBuxBUjvO5k5VgegIu7CPQN2SFmBzuc6nLVQvyNHGyJWbeipZ+npj
         RLww==
X-Forwarded-Encrypted: i=1; AJvYcCUDyTP3hpxIT2gEiCb9MP2bNKgTsuV6BKG8jOcOXUr+Z8xTqC249wQUELQGbzxAdV9yrf0DqB4toKHRp7U67w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+02AkXENFLKYIwEZMVep0zMErfs9kKgQKR6Ti4BZRHLfzJoSA
	rgLkKxQX4h+z0VWdvB/6aSGMgSdbc9wEKeYUOx9BdHKlLfbSCXP1SXWLa8q9qw3z2Gsju/D8l8C
	IjIMP+34QP9hDas3De7F3lk6WSin3XlMDsojA
X-Gm-Gg: ASbGncuDoueFNE7BhRoMIKqwlgm9qXa04eXz2Gm9tv0P7FZA3QvoGrfjKe6TENX2zbQ
	QZsnxjH/aORebPHNkAWQCsZYDixo07QNmyKZDcTAMUYSSRR5kY6QtjlXnuspu6H3TaCrdYRf4qE
	F2IVmVh1lp+cO/ux0sUCZvm9bk50NuIAUMXTaz
X-Google-Smtp-Source: AGHT+IHfngivAfolpBCcXGBcAYbBekzzGYNr0zyvzMbAGXe+oiu7MNfqwRvlRvu1E0aoJ70PuTQ8YmFBD7fGj1cJG6E=
X-Received: by 2002:a05:6000:154e:b0:38f:4d20:4a17 with SMTP id
 ffacd0b85a97d-38f70799935mr9568176f8f.13.1740395979256; Mon, 24 Feb 2025
 03:19:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250223072114.3715-1-boqun.feng@gmail.com>
In-Reply-To: <20250223072114.3715-1-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 24 Feb 2025 12:19:27 +0100
X-Gm-Features: AWEUYZlG3dBja0S9lUuTrhyjnlqfO-rrsKw667VUMX7yjVkDuivZCQ1hf-oSPHg
Message-ID: <CAH5fLgi2iXKg+Mwze41KHk1rLa1=f7=ofhbq_wz6mxmC4GNe6w@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: lock: Add an example for Guard::lock_ref()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 8:21=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> To provide examples on usage of `Guard::lock_ref()` along with the unit
> test, an "assert a lock is held by a guard" example is added.
>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> This depends on Alice's patch:
>
>         https://lore.kernel.org/all/20250130-guard-get-lock-v1-1-8ed87899=
920a@google.com/
>
> I'm also OK to fold this in if Alice thinks it's fine.

I think we can just keep two patches :)

Alice

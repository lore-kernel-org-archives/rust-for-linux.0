Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2258030DEBF
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 18:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763578383; cv=none; b=VnP65YaR7c7u+RSH6L9TUFeCKMn8lRqNiWQgQSdHfnJlOntU3hHfFSIoMZNjR3w5IU61qKJUuwA09Uv0h4EtHG8pLSr+fakxbODexlpx9XpkEAIGvMJQ3HkTif263nDaH1LVTkObqLJ+xQ5c0aa8rumZyOeVBll0DqwMLvnZ3eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763578383; c=relaxed/simple;
	bh=E9uXQ0JY819H33SH9I6LfIYFKn1vAPEt83QJBC4E+Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xv5j2+ZfCpDpeBBp5WrZS6HbNDEbppmLSkGeBwLXMAujKUFlrlz7UeHqQvZyuFWpaDLVeDObFRGpeusAQyuK6EqlfFY7G8JHFmt1RTpvDF3HyIEHzte5atj3yKS69NIVuZU1ipL+wFLdTiitueJtYHmxtfTWHdhAZADEo3s8z1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QkHzE448; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QkHzE448"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso1090015e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 10:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763578375; x=1764183175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5iwDg8BxWRb95mMBf2Hf9zvj5pFB121qLoC8B/rNF4=;
        b=QkHzE448gHkQH+wdD4B4mPDnH4s7LR60xcEJRt5cO7CeSHHz73Z8Ee2zzRNKh1yXsA
         8NoGisJvhKUOwJDEiMmJKmTxQ066VkTy6Dsn7+0ddcFL9NB7Ml8x8siu/nfRv3uG4FNI
         u5ps4eMbpNYJ/8mfifokAdLjcaZTp8JKLrICQKi/BDoQnlerOvMmtegQZmI1gnr91Uzu
         876aOmtKsvQUgjK/vQPO815ipWQYzchqzGHLN85OtlQDVWpEVxo4J/RLnpeUFRD8SeNL
         T2M6uqurbHAPHH4NUSDS6iPY/zRwDwxOnroq3gwC1LrN1c6vEVBcbhTvsmOT7WA2KCdw
         S6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763578375; x=1764183175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t5iwDg8BxWRb95mMBf2Hf9zvj5pFB121qLoC8B/rNF4=;
        b=X2BZrV+vtLQzwZ8CAMlhHdUpE6gplcn8pJo5clN7vE3RfBqLIYQQI9VrdRMxnQX5Vf
         /F5xH3j3hfQa4MsRmgGLjTNREEnmq6Y2ZfADhqJ4hBJcNyMEPuG7oSoKbKZEkK9x5hv1
         yUKppKDZA0O8bxlNF+f65l7uDD8ht4jOo6p+kO7UrQhpK6RbEEMFiU/jeio8qy3s+D82
         DOwv4uEzuOzdQqeM/a3hfyOHDGZAWTQ9v8HZGXBASZWJALnIdK6P7/zdZ1bqNREtJz7L
         Fl4gohPna6+9G7quN3YBircxuovtaIs1TEJAGyb+hsCcTCAGzbwTm9IqRCC7WAbN176v
         YjfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV2zEzmMbRrcJNVeq3YwwCkBzgmFDVgKJlHBW95uWtIbUdGkE9J9kSC4kR2z+4bss49ERD24ocKaHA3ffSBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxPTg1zuXuJS8Fb1tGTErlbhxEA/iZbSAU1imv5Zuw0aj01HKb
	OAGHi1ybioygHWXomXPF4/etoWbm9PhH3Nl2zZ8Bs3C3gOHLn++ZgOzTJLoY80qKYUsIBJEBzF9
	AcPBGdibss+dbV9oX0IvPIdZ0EQ/Asydw4wDpuQUZ
X-Gm-Gg: ASbGncscGdhXU+Iuyvl75qrRAdv0OAVX3DYtamdfEJFeMFzEzdVF+XVJub4lT0d5v0J
	UTQfw0bKpiM7J5fvnfMC9oFiQ+YtOeeNBz+P6E99tSN1I+Ulq3tC4INv3xWZVVA1KpFOTQ/4HhH
	y94FzbVVkqNIW1rcvRdrnn2bcxiIQCW0NImMVVuoS8IKUY+btJuvaYfDK9SUpGGOQ0DhK4bBvRb
	Hx1Ks6CPInTgt+z4ijNUurkErSWpVWFWL8iv/JAxcwEc/Thl3kB0Uf9SD4isDita5OGbaiF
X-Google-Smtp-Source: AGHT+IGUNWPDbFQdc/ELVI+iQclDYjmS6WRirf5qm5wL5IsXaluZQRoAAg/BbUachfaqe2TairnalVTD0GVTqhqTnmA=
X-Received: by 2002:a05:600c:314e:b0:477:755b:5587 with SMTP id
 5b1f17b1804b1-477b8953b21mr2763095e9.8.1763578375141; Wed, 19 Nov 2025
 10:52:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119185125.1411151-1-ojeda@kernel.org>
In-Reply-To: <20251119185125.1411151-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 19 Nov 2025 19:52:41 +0100
X-Gm-Features: AWmQ_bnL48xO72RE85Z9tspjJcOF3bjKk-8nMyZ8avtpWCtpTyo0amoZN1QcsSA
Message-ID: <CAH5fLgjYhX1jnnSbNX-euXBcdwj4+TN6fiBkr7GbM04GTaq--A@mail.gmail.com>
Subject: Re: [PATCH] rust: slice: fix broken intra-doc links
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 7:51=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> In older versions of Rust, the compiler doesn't know about the newer
> `as_flattened*` methods, thus `rustdoc` complains about the intra-doc
> links, e.g.
>
>      error: unresolved link to `slice::as_flattened`
>       --> rust/kernel/slice.rs:19:23
>        |
>     19 | /// [`as_flattened`]: slice::as_flattened
>        |                       ^^^^^^^^^^^^^^^^^^^ the primitive type `sl=
ice` has no associated item named `as_flattened`
>        |
>        =3D note: `-D rustdoc::broken-intra-doc-links` implied by `-D warn=
ings`
>        =3D help: to override `-D warnings` add `#[allow(rustdoc::broken_i=
ntra_doc_links)]`
>
> Thus fix them by using an URL instead.
>
> Fixes: 88622323dde3 ("rust: enable slice_flatten feature and provide it t=
hrough an extension trait")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

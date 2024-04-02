Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974C658AB0
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Apr 2024 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051212; cv=none; b=a7ql4OuF01UNrsKFbn7u2YqC1ILeVOJ7deLpHx0hY/a6wapHjjZVnEYr0UQ/ZJPOcOBTXZ9Gnv6cKYNK6KykGNnaM/33tinq8E+dODI9bWXCbble8zkXtz2n+LLnAULPmpjkRqYihPo4fMwS/TnWHWo+PI1oJQCJUjZc8OgTK+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051212; c=relaxed/simple;
	bh=5KWH23f+CkrAqT9Dewsp1JwFaTdF1nWGTz25jhY/NPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElOn/LfU1AEtGaUkBj+hzjGJ8EniKUkpOkZGS2UwxuwDJMFif0mWqaKImXdKwsiibJcr/OM4rJEEPE0/TdZmtJWHrd7v2rb4ffdTft3+jXr+Li7U+XqHmx0YQ2lDQC+qfi9HmcnFCIdMoWuco35r55gUsic7uLlyktgf55oWOCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yLhI+zrw; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yLhI+zrw"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4d8e4d0b267so911108e0c.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Apr 2024 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712051209; x=1712656009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57Qln/YxVwij9SZ8Uk2+ZQTIMAfQPcYDAn1WRCFZujE=;
        b=yLhI+zrwtxI3VaK5lxCY3ULGIPbwb04n6jpUe89ytnk0jfN++DmLywBLy/pvBXYw13
         okgEQSs7ACndlT0jwHhTBAzxGz3qMzAMUkAbnlEXveLVARv35W1CtAX2s6k+GaxheO2+
         IzYkG1yi6omVZhxLPrBNfhmnu7kJtPspsx1WZSOXvWMoVfE/IxN0N3+zWV7eQF3afi2P
         S36FMQh/jxHJRilqE2EvM3S3ZKnix75CHNxSEv1GTO1XihECeL1GKPjEHn+6G5pQLWkI
         F8GkqtLi40FpfYZYnp1wFYDhIyuRuJxFv1NEBAcCH3s9xljJpDbtOPBF6bIJ+roAzy+F
         vl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051209; x=1712656009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57Qln/YxVwij9SZ8Uk2+ZQTIMAfQPcYDAn1WRCFZujE=;
        b=aZjrCqcsof3KaDvurJ04TPk6lXHaXgzy3RJ8z3Zg9ZGidn7UTUc5ILdrvM8YgrAPsm
         ffiusgXj7AeOqTwRyAxlP2E159jykOON0A8cFIAXHRgDNklhUgLTQQnbZHxNWsoBza2e
         wnm8VuFhnBIZjhX+LS8JiwQKr8WzDjlTF+kAQXuUzFO3vlzISreSANVCOjKi1jEQ/bEE
         June2F/qWKB1aE+/RPd8NeNmiIOAGxABvyy/KDkAD0NbO0ukGMbu2Pw3knzD7VRd98oN
         wHI4mcwxOqle+koR86ZGjc3+pZ1ex6/DmdMoB3Otq9o9+KZPIr0xQdoC+erRQBy1vJX4
         SHAA==
X-Forwarded-Encrypted: i=1; AJvYcCUJg6ZThLxQ3idrVm5DIbw+CYg4Dpyjkm4c11OwT168bI5R5KlUqnQiLljPUzIt794WVne1Th/bAPBRnYP73brnuFIJ2pClOB/JsJEp6SA=
X-Gm-Message-State: AOJu0Yz3s0BHbF6o2I5A/ITEnqerfkS809qnh1doAD95yq7pIQMrOqSw
	aA8PXszwKSuLa6l10jp0n0ncopEWK8G5ipRRuWwA+1aE2y1JOEwhnfpP8Oc9NkjHUOcFVM3aL0J
	Q3Gdb3mB8tu+EQJBtHml6l7Pv174M8fTtS854
X-Google-Smtp-Source: AGHT+IGQf3QzhQLw9j6incX1IXi9f33qMcGOHachbPjJXSe8XAem2rfd7FCRPcCKfwdQFdRHcq9OG/7bKX/RqoZHYWY=
X-Received: by 2002:a05:6122:c90:b0:4d3:4aad:22d4 with SMTP id
 ba16-20020a0561220c9000b004d34aad22d4mr9329783vkb.0.1712051209441; Tue, 02
 Apr 2024 02:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240401212303.537355-1-ojeda@kernel.org> <20240401212303.537355-2-ojeda@kernel.org>
In-Reply-To: <20240401212303.537355-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Apr 2024 11:46:38 +0200
Message-ID: <CAH5fLgh7jbq8ea4CBJJRPY3gfm6=-_ck2mqArWDG6s+bLfMr7g@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: sync: implement `Default` for `LockClassKey`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2024 at 11:23=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> In the upcoming Rust 1.78.0, Clippy suggests to implement `Default` even
> when `new()` is `const`, since `Default::default()` may call `const`
> functions even if it is not `const` itself [1]:
>
>     error: you should consider adding a `Default` implementation for `Loc=
kClassKey`
>       --> rust/kernel/sync.rs:31:5
>        |
>     31 | /     pub const fn new() -> Self {
>     32 | |         Self(Opaque::uninit())
>     33 | |     }
>        | |_____^
>
> Thus implement it.
>
> Link: https://github.com/rust-lang/rust-clippy/pull/10903 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

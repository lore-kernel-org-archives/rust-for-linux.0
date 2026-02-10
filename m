Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA3342534
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717821; cv=pass; b=nNSPDqNHamh+BfVA2ZWrvLt1j/MPMqXRjnVrLHew56ysYCU/FoO63anCZppED1gGv0pv3WMuVihM1w+inn6XD9hA8DIz0x7VkS1EagURHcGHmMJbHeGbpsapovXX5nWAT6CWFNcn/lnmpvyDay6iAoq1H2snVltBBJOi2WGvvKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717821; c=relaxed/simple;
	bh=eIyyr/Cxzc+0aqoGs2LlvibnSBVJITxlUewRDdlxtbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z1G49Ls8roGMbmjKLq8fCROXXdh5X6ZLbxzda2pCLa98iKfLd1xJuEHWTNPwQ7jFeM/8bhrW6IrCzFShGXQPAyl6G+V39VQlkzI8z1rZxHPKF52nr9M6G3d4BxkRZpLOWhhNgqIJN3qYyxWn9dzUVWDn+Ugv0GVtWpr+VXkABfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XW/qie/W; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XW/qie/W"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba85f77203so134709eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 02:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770717819; cv=none;
        d=google.com; s=arc-20240605;
        b=DY3knlfBb7H8vKn+AdTb2MtlEwvOYlZWIxwTBRscFZbIHAVD1AJ1YOkhROyuOPYyug
         JHk9C0vIxoUppF7pnCDWVRFKto+yZgxAhZG69amWM1Lpi0ONR3eoqa6c/vDcyWMIs7Q8
         l/5PtIFQWRHLk/1p2kzmk7smF4QOZw7YqPZkXxD0KCoSU+AmnI12L2i4Mqemy+lmS5UU
         t+M0cokC3GWTL2a7TblMx7gh3SDuaqZ2dEV9sASx6Cm6BL3FmlMtp3AWlgJuo4EGza1z
         WbauHLbw5JPqApXmQgowuUuIZwtbCxoYhSvUXsX7nzPgPH5s8sEhkjV690oC7zReAU0m
         id2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w8GCWUur7tBgVv5sl1EHlbbdWlhvXGDhvL9GpnLAlb0=;
        fh=SMVN14832AxcFwSJDD9L6HhY97mDgY0PJ1TdT+N+a5Q=;
        b=ZgIhNw2eWaHzsKnLUfWpcaLZ+UZ+tv8m03fZh2Gb0DnN5V1jK7d2rXZdgBa5KBchFs
         EoC64JX9pc71AwHqPHA4+mRA7zCcrcqVvhlpYzwUEnGAPlqJqw9tqDKuOhBr9poqLjHk
         ZDXn8QJyGhbH931+OCqGPXxarOSOtjsreQ7UecXx0RPjUnAhINfVLDvME9sGe8rlF9im
         r6c0h1dXh7/NdmcK2pUAeHs4l/qKoYj4l2NSYPK3ZMJGZoLPuQseyeup1gD6SHR5qR2e
         V3ApY4LDRTnP+ezKPkjBTBaT7LjYlK8jjwrKQJJ7Y8++b6albajgppJk947hLGttA8DR
         efcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770717819; x=1771322619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8GCWUur7tBgVv5sl1EHlbbdWlhvXGDhvL9GpnLAlb0=;
        b=XW/qie/WAjweLDny2iklbIgobYt/Ag7MiA9log5gH4eS5UkiAW2JOoF1qIVJ9p4dsw
         mdp32Rqy2i7gbnvfCZQ2N0IObyEg/OvsPkDvZRzzyKtzajWTp+xdSw/BtTqHjAJRJTJU
         TqFdb/ZELNLo6od6qv8eaKKVNjWsNT0oXM4vlMqyEMSTIdLyAw9ABUAiyN3cAvIhsog3
         uA9+rHLwxWekxYmRWUMqCl7jn02kMFxt24/uWbOzvQOzTgZlVecGodhK9KmPY7bNsVKP
         8jVIj80QVjMtV2ejJiqIcbm6drIycfyJ2G+oZ4eaKmiu1SIxOQYYNn5Pf4zUeQKsrDcr
         Sq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717819; x=1771322619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8GCWUur7tBgVv5sl1EHlbbdWlhvXGDhvL9GpnLAlb0=;
        b=ZFn9NgFo6odn91tsn1XlBQiQ1AcnFv0SnoZQ75B7VbK/wA+AQhvsMNfhHZUCI2i1KA
         S7JSk80WYoTBYP49a4c2dxk0Ww6bf1hfxhFWQtv7cctQn4pl4lUHQAiw9E2qviiXJhAn
         6VmKR4IzKKreveJaT6SDjOggSFaUFW1ao3cKLOq9usDSMLPp2lqoLTnKpiO7634iAMdM
         e29PnS1Q0uJufjVmQGBxLMYb0zVsg04qpOG/SXQAuWYSzQ2miwcda2c+P3oiCwvMQJLF
         Bk5RiZnJ8SNxkeWLNHHgGTOel5+z2aKtuvhmP83U7iyb2Suoauv1z5RczIXDLg1LgoTA
         R//w==
X-Forwarded-Encrypted: i=1; AJvYcCWtppXAcUx1TiCg8SVNyYsZOY4lM7olGsGaFdzITV2WpRwCamcB0azSZgTBZlL8tFCAdF35vJMGHJkDB9wDVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9zLAi3TdIO6x7sjhlzeFDcquapkKV/zypuZxLs2PDEbS9sEpJ
	K2f2m/6jOLfIs8M/CosWGG6EA2nKhZPIXnc5GC1JLuv/4bG9Kh3CbpXWCOR2WEmgyBwYm49V4Lx
	insKz7VFMy780+GiEmf5vxeeMfpBZ2PM=
X-Gm-Gg: AZuq6aIMDRf/dhRMfXftG8s43aPf/Fv88slKBEYkMu8pkeXOmoD6svq6Wvjqp9zPKNk
	J5o4feqTDwgrXvFRjRpD2FaTpfYIk8AXcZy+SfL18pibBVqQlqNtrLHEfPIUGm1+eyzvuTf6of7
	JkNlkS6EQDzG81nQ3gxOz2Ql5pRSp7B1nv6rgaTwVqQwUcfWeRT7N4Vi7yFJTcoQudT4xnmvI2P
	0XNAV1eeXzSPxLRiLqivkNVjxtsHmD48pqFGgAIAA5nemXoP2GaYVJToXM+SnoLFAk64OdN68PK
	QfPGTi6YogXhx3u+ZrlyOe27BCAgiOcgixXBwUZR99yC4GntnNjD6k/55PwGkoal+rCFV9g6/Cg
	F6mPIgLIPzO0SAOhPaoNV2Skz
X-Received: by 2002:a05:7300:5728:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2ba8cdc7a85mr267776eec.7.1770717819182; Tue, 10 Feb 2026
 02:03:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206204336.38462-1-ojeda@kernel.org>
In-Reply-To: <20260206204336.38462-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 11:03:26 +0100
X-Gm-Features: AZwV_QhPIF2ncQlUx_BhganulLkZmnF0NnvRftkUrOEm-6hs9Bwjh5NkwuZCh88
Message-ID: <CANiq72mJvBZe_-Fz5TLZ2gJGhxrC0E1eAzfso-NeZAryW1kXTw@mail.gmail.com>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 9:43=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> `objtool` with Rust 1.84.0 reports:
>
>     rust/kernel.o: error: objtool: _RNvXNtNtCsaRPFapPOzLs_6kernel3str9par=
se_intaNtNtB2_7private12FromStrRadix14from_str_radix()
>     falls through to next function _RNvXNtNtCsaRPFapPOzLs_6kernel3str9par=
se_intaNtNtB2_7private12FromStrRadix16from_u64_negated()
>
> This is very similar to commit c18f35e49049 ("objtool/rust: add one more
> `noreturn` Rust function"), which added `from_ascii_radix_panic` for Rust
> 1.86.0, except that Rust 1.84.0 ends up needing `from_str_radix_panic`.
>
> Thus add it to the list to fix the warning.
>
> Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Fixes: 51d9ee90ea90 ("rust: str: add radix prefixed integer parsing funct=
ions")
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291565/topic/x=
/with/572427627
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks!

Since I added the other fix for Gary (Klint), let me add this one too
already. I may need to rebase or not.

Cheers,
Miguel

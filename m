Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3738A3EFD30
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501640; cv=pass; b=JdHXAEea+bsD2Ikwk2c7ERgKRF/jstgcn1LNBJbSm99MZUcsnxU7hOcJdMFq75EMRSGNtNCLYOcH622zIA3OdiZV859zfM1dDWlF/BBcPyGNGTyVCHX4hejBqCrTxizBWzvJWKWxO1tKA1MZVKyfwgSJ//rSSNuJ/vvlHvbjc9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501640; c=relaxed/simple;
	bh=0lxygLEXSve4NnrQ3v/EgBOxPu2ErB6he8S58LynGMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGsLNBPcJPVniazR4VrsW+ELpl8KWWLs+lCvpo4Cd0UQUZXObzZULuSCkLkQYs6n5EkfU2P0Q5eXWa7JeeB4NI42bcAEa5cBVzx0uVQKJp6gHJzJKDxzYlyQz70vmWJUOsu2PHVQdu0bmB6hsU9D5b2COW2g5aZSaJlTYA/Fzts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X2F0p5dW; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X2F0p5dW"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f703a9d05so595191f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 05:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785501637; cv=none;
        d=google.com; s=arc-20260327;
        b=OCPSNL9yJow7a4v1sBldGeUEcnd+QvvVF0kWHntzTT/p5hzKy02Tp4zVXIakSz4An1
         ld8lpGc/r5MCEt96KRDScxa4mRTR6AJB0OAQXRtNAa8/XL2rhq9VvTga1XsCHYTHjkym
         +WsFkwilZ0YvFEOWlhOaGlmWxa1PfoJ25tCdMPFiI+M7Uk6qRBDBgvpBgwbI3j/K5XXb
         87Ft9dKemOKZNxpXH9ha/3DsNCJ8giy/JM1QUz2w1Nb57suu+EzMhBTNXsuNPysFf+j3
         zz7ZWXDpU9izRPIpZHp15yCkJFTKQZnLr4vWVSap0hoXQcadhGedJ7YjFje8oKaXK0ru
         aKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6sjvX84rg2rWMCCdE2PP1jfCG+hdaHrWhj4tNdGUpeQ=;
        fh=1tYZOSqhH8XtwwELUETLaJgeU7hxoat5C6gctxcKPVs=;
        b=sRLlLgmiaK8/EdwYdWtcQXDFar+cBUu1bxqmBuHY0S5r3oUAoolXZLfWWElY3dlv3S
         Md/Z94JuhCdJKURu1xtkjF1NJau018p9jlxThHlz2qVyqiyJAIZ7/l1QcgAZh4LY7sWP
         hkOsZ3IeTu5eFmjbOPPkSD0hfVpRHVyd6CzC41CJOtz74qPRQNFbV5IPXxHwIh3eeEs9
         Td5c/31Eb2Oe0Xy5St5JIOwAZvZfMh1KKrfzRoUGiFUMRJDx7ADWIs8yS3rsT6mYEg4P
         hVtXE70Y9PA0Zb9fgodpLaFfSyP2hOAYzGBzJZGCUDN2CsJI8qbkxJtftgT97/WDj3g6
         S83w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785501637; x=1786106437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6sjvX84rg2rWMCCdE2PP1jfCG+hdaHrWhj4tNdGUpeQ=;
        b=X2F0p5dWVUhUOvZSkg4tar0hcbzIiAF01tHKnKN4mmRgD35F2RizJ/k0q+Z0RUmy7Y
         5xe8UGqKvafxfto6JzGCTVo36XTLmS++VshjUeSfjC7a3+yhbx82IRjxHGtwDpXKYMiz
         holWNcuWSebk4TRvngB04s7hEF4uOvtbP254yc6lfUFPmaE8sdSyDcvzdE/la0647BPk
         cRsVAzo8//ucnJ+OXNHhIDh0ytAEpAbcsmqjG9RpQGlVoZxbYXIAV9L90tTGZ0zK/XkA
         +DnXn/s1Qkrj86W5a2FtMwbVjoMdvAjgmWGIzJQA3r4EwbSaw9yuvdH3SqjEd/NZ0cyr
         Q6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501637; x=1786106437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6sjvX84rg2rWMCCdE2PP1jfCG+hdaHrWhj4tNdGUpeQ=;
        b=ZoBSDZhEBQGnnh/Zsr5NP8XlZ3pxZtoSmQq6t34fv0ksVjY/RljNvbwIUt2KNq+JZU
         w3k7Jc6OrI69G3fZV4+9/3Dnthbs1tF4KGZLBlC4lY8NvukUz4onATonUQvNey9DuEl1
         rYqwhwHnSoojaCA3wOPtAddi8Mae93/C2pljJ3m3LKZTtg3hgBwlM4x8IpZ8nOuApjoG
         98Zt8oUhCowHcBFMadXjWoQxKKmxyo7jtN0hs58v8rSddP8lv0VhUMHeJx5Rdskmp4Nm
         8EnsA4FTpDC4W4R5wMI5EcCIg+rQOSKgJD0iksgp78m1UW+wOu+ddhuR+4VfYwhgNF5t
         wlTw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7capTEr5X4CuhpnoP2IDHBgUJ4gtzdkpQ5VoBAgfqRKJXHxuE1gDc3GIOVwIjVjidsrGEhzYfhLXltD1VPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsB1Hhh89x9ExeQoojRMKRGDrTES0Xe4Zeho2tvDz1e3rKTHZ8
	fbbKvyEb4x6m1u1ZL/eD4FuoL20cniElA1jdMYZbHXfSrPJYX6NAjwvkAomW/npqnmsnsIgm0NJ
	pWMZCThunWf/mvTAUa/3DI/0mm9KJEW1R7ns1wOr7
X-Gm-Gg: AR+sD10GCFFwQCokQ1Bd5NSgqiWt5NJsC0hIWXUEC4raf/aV0vX3yuqTYiWjWMHYKIM
	IjsqJwZ/W0jLLFEQr8hLSSCTvtIrgbLuhdST526ybf4WFMIkrLdJ6sY9DcKrNzzZqcQXkU5ii75
	kyURQ7XBa8fOyeEAXLXez5KU1nJ05pjIiKytcFpX3JDra6G1sj2VyvFoFK293jxjIulEMP+MJ0U
	nXGTp7nErGQZ2ol6G+ztpIUgZ0e4KYKIiTRyex4BvbC2AA3LTrgn3AkXm+FOiaQijV/X9Ekv1s/
	7gO8YzpLC9oCLnc2aUwvJk06xZC65sxkjM2PUS5KV3N3BQUSuyrrrZP6d2A5qLJ0KIRcrTNAEJp
	9q35d8cRrZiJ1NAfSSvANjqqPZhIxMKc8PcEJr7A66g==
X-Received: by 2002:a05:6000:2c02:b0:47f:9dab:f676 with SMTP id
 ffacd0b85a97d-47fd2b5525dmr4943349f8f.31.1785501636773; Fri, 31 Jul 2026
 05:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728191448.349241-1-ojeda@kernel.org>
In-Reply-To: <20260728191448.349241-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 31 Jul 2026 14:40:24 +0200
X-Gm-Features: AUfX_mw9Zwg9VoLHTT8R79ujD8MOCPF53n-K-Uslo92UfB2J7RxiU37UxP5RVrA
Message-ID: <CAH5fLghop_n+vnBaiN+BuhDZ6Y_FYG840AT=DavmhpXAXxxONw@mail.gmail.com>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function for
 Rust 1.99.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 9:15=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.99.0 (expected 2026-10-01), `objtool` may report:
>
>     rust/kernel.o: warning: objtool: _R..._6kernel3str9parse_intaNtNtB2_7=
private12FromStrRadix14from_str_radix()
>     falls through to next function _R..._6kernel3str9parse_intaNtNtB2_7pr=
ivate12FromStrRadix16from_u64_negated()
>
> due to calls to the `noreturn` symbol:
>
>     core::num::from_ascii_bytes_radix_panic
>
> The function was renamed from `from_ascii_radix_panic` [1], which is
> already in the list.
>
> Thus add the new one to the list so that `objtool` knows it is actually
> `noreturn`.
>
> See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions")
> for more details.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Link: https://github.com/rust-lang/rust/pull/159554 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Tested-by: Alice Ryhl <aliceryhl@google.com>

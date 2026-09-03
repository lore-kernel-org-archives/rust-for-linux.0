Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0744DF4B3
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Sep 2026 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449714; cv=pass; b=oXt6Lp9pz68egXtR0tFYh0d1GLjpsygH2LJgZzLE/qqPL+/o/rP7YmnHAw9UhqW3M2tx0pMcuW57HXvZeENfXTkJa6ddfLMfowIEfJzwSqW1LfIDubQtXZgDUlyPVuzAZxUQ0RF4C4GcZlXy3txnnrRHUQlFAN6D/sAs0QZoq3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449714; c=relaxed/simple;
	bh=Wel+w58EuWSYu3QVdPuqD8C+kXDhkBOx9VRsUEzu18g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r28yegKLX9UzV+xP3uoMQDs/JYqLQaL9DqTYh7eGjX6wlopBpt2hPimg6qwxUh/tKmGNNOa9qs6RLkfMaHbhtzipb+l34bZO50PiPzgwtR9VLWzsBEWjUQVOhCQ1Aj8bl83PU4Vu2L56dN3ASagbl9QSHXO4muBb8WHobbn/uW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=syg0T3nd; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="syg0T3nd"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbe4592c193so3882a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Sep 2026 08:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788449713; cv=none;
        d=google.com; s=arc-20260327;
        b=TgmLM6LXFWSr9nmR0sZb6Y/uBFzm8jbJyS9C9Jb65Xa4dIMi+cz6Qm08YVCJZrRv5E
         uo0RByBu4w2fhp13EE/Y0ojDMv2LPG7D1/OIf6ilwN79rLb7WiikVX61L/WKN9ZVcZM5
         AnjUG2qwCKHWLJzaNSjhJalwlxsJBcfnXxD8BuH2B3w9ENjMu07rtVO5AmDIWNJeG6V7
         W70bBNyqd22orpUNd1j6qZQuGIQnxBeKKppEGwf8QxNQFnBe+Mbr4Nf3kWEsucB/TqYs
         pU/eW4Z3J/ONYHVvOSWd/vPLbS0oHB3FcaeTjzRuRLIG1JzFdd4Jui2RkxCERHS9Hzqn
         z2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5VPKGp4sBNMrvoxmgXp5R0a1UxC9YH7siCg3VciSds8=;
        fh=3XVAcm2oITphzzkC1tJKP128gCZC/BSLm2He7eRcpSQ=;
        b=dM9O6YrpIvnY4jFaea41oHDT4/m3Ao5Ujp3woCPz3SjMkNiWFzRL+1FSS1QDIHC8gM
         4nsVmDvKd0xUhrjt0vYXpcnhO4NoFh73dI6J7f9WfAUuruVVzklYtIG0TQd80E0XWFyc
         2oxOu/gvU5sErVjqAhsDlfKEm3AftWRKd679kfMkt8W/YhDCTMRAkc9X9NYnsoIdpS34
         YwHoVxxdc9jvCKCVFHUFOOge0NfavpIys3Vjids5XUjpLd7c8/Bdpa6bWtkxeL8jrVUZ
         NcMO8mzr1+prwD8EsJVQ++cr0gW88cKIGPaO2NWj4q7xwbnfwj56hXyRaP4aV7MFbufL
         EJjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449713; x=1789054513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5VPKGp4sBNMrvoxmgXp5R0a1UxC9YH7siCg3VciSds8=;
        b=syg0T3ndehRCKW1Qt2UYtGcgdmsjYJmRWKirOcvFY3YJmjK/uGGlVkl9/B23SnnVgt
         OPAILTlWtCeq1lNRjF9xp5LP9UJHnhVse2XxFTLhghbvHICL9hJr3j8SjVFac4dyBVEr
         VQ7LM87Y29pf6jKbCKPeMd4W4cTiPAFD/7aGT++uYgdB7g1hsO+ywYtn15g3IUpf4FtC
         4A5fYytcrjcbM7BNwLoi0d+u+mx4fAvXsVimZ+RwH+AsM/LbZw9RWzrNZMcNWe4LpIe6
         4ID+c7GVKgjmBRIP386g6vPVT6lmMDy5EiInm1P6S1DD3fgvQFRK9pw5BiOOJMDIxeYi
         rHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449713; x=1789054513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5VPKGp4sBNMrvoxmgXp5R0a1UxC9YH7siCg3VciSds8=;
        b=W4qEhef+aNWEsaKd4hfcn698nDp+3kjskRsF6uUG8+3lU9e3pLnhDrZZ2XFvYTTAXg
         1Zi3k+jl3MxRUgBhD6VjU3NmWIYePR9JYXaKLBVOCaIGASurO4dhieQpbWAsSh/z06hv
         N0RVDTVD2WNdA4Wxv9xDrj+Z6/8TiepA2sH6vXN/gCzVFX3GxZOxRLQvwmHG7Zq5Gap1
         zf4kc0AA32RhbuFMd/ctUMV1rfKJIfji6Hsuy/Zm8Rryo92NyqSu1dNtRXLKGqtafg8F
         Zaf4VA3WlJDpofhuUERPaZ0XHy/hiD42VYKctpeuDEVQwwsxm522wkcLeCWvi8ue6yLl
         qQ4A==
X-Forwarded-Encrypted: i=1; AKwUvBwsL4Fz/DamMCAJSS1nz/9kjyCF7w5H8Tiw63ggSQAcBnhqk8JUURMGM89WTCMf3NSrYIB+C2qeQdxNSMPT/w==@vger.kernel.org
X-Gm-Message-State: AFuF++ljk2qTK2eFFl7VAksFjfYosRIkJQgQaTeiCjHmJQmpNrPyBPz7
	51L4Cuv7YYKApl7Asd+4quHENd0E0TElfqmYnEX9fSjlANoJsD2S7tV7Jz/WQSGmN3pHmteqdZO
	UKInfmsqFTSvbSZ7iyM7yU25ncjnrlKU=
X-Gm-Gg: AYBFou1RcAmP0Mq7wxJb9l6jAtV9kCN8vfpHWeZn2kY4dBpy9Mg4qSFDlhaBqDEQ5Y4
	L8Ir4mitPnlB0fEjpLVUmGJA4yD34j2Y+gOFxbMWho00RVyjs9ls2nLH95AY3or+g8DtzulrBzx
	j5j3TRB6GglupJXwKaDZb45w6jB7KPmbB59jH5Tcnp7h8Sz7yvEfZe391ulAolbubNn3tpqpCfV
	Gg+1R6QYTEDtrl06E7GDDs9pbJEX6kAWZSrukTPVcU6jVh+H6piGldgtpQFPwdfGNg3UkP7z0R6
	xlXzHeyimJ6JAYuXgyncprjvKZxYSSmELF/ovHTgIWYXla+ujsT0Pxytd5PbMO9el/0DUlzzA3v
	iBVqUdHHDtHPhi5DOD4qnuotw8HNplN309FcwxvQQ1ZybCdyOF89rCtAqRYGb
X-Received: by 2002:a17:90b:1c89:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-39aee12649dmr11584059a91.3.1788449712766; Thu, 03 Sep 2026
 08:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
In-Reply-To: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Sep 2026 17:34:59 +0200
X-Gm-Features: AcwNN1U-DNvbVvz5zFAU4rKPoamceLKbon3dohS4mdpg2OjXc_prN4YYMGEtrLc
Message-ID: <CANiq72mgqhjAYR-a5gSnMjK++TVc1n6RFpj=Go6QqXtQRX3=9g@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] rust: const_eval: add a mechanism to do const
 trait calls
To: Gary Guo <gary@garyguo.net>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:21=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Add a mechanism to perform const trait method calls, with the same type
> inference capabilities. This would only work for concrete types (not insi=
de
> generic functions).
>
> As an example, convert `as_char_ptr_in_const_context`, so instead of
>
>     kernel::str::as_char_ptr_in_const_context(c_str)
>
> one may write
>
>     const_call!(c_str.as_char_ptr())
>
> instead.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Thanks for resending this!

So I definitely like having `#[const_eval_only]`, because we do want
to limit those calls sometimes and it is nice to have C++'s equivalent
to `consteval` (perhaps this could be called just `#[consteval]` to
match?); i.e. what we talked about in the call.

On `Const` and `const_call!`, i.e. the other two patches: I am not
sure if we care that much to introduce a macro for it, but it doesn't
look bad either. I guess perhaps it helps to have a consistent way to
do it and to easily remove it later when the actual feature lands in
Rust. I would like to hear some thoughts on it from others.

Cheers,
Miguel

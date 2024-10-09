Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901C94207A
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Oct 2024 20:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728504951; cv=none; b=jTu7RHkZPc4iSmudg00rtNcUfI75PYcuh5iWigbxX/Nu/E7qJBiS2quwXiqVvrrEGgZzmlHY+qx8Ucw5GOMbC8sN0LfQa9Df0c8fJHZGE+ZKsb6MzE1cJYdoDMU6zrl2IsWhCxmrR5yHTdL7wcIF/1tcj3j12y82yYPlm9aqXXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728504951; c=relaxed/simple;
	bh=hDUR54sV7mPX+rddCrnMseo+c7xhgh8efJh15DV0obo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gl/qBbGsJTB9R2O26IbUACkn1S85oiJib/dUiXedllTu/LX5FnvJCQfsm0FAepRLt/fbWd5kAqhg9nCKpwIwzql7hO/gvbiImUwiuUzYYUla/ACp1qI6lBqPcQlabcuubEv8+9eSMxiHPN5G+6u6GZ4sQwNy8FFTH7Pky/HARgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I5ZqYUZt; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I5ZqYUZt"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37cc846fbc4so97165f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Oct 2024 13:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728504948; x=1729109748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDUR54sV7mPX+rddCrnMseo+c7xhgh8efJh15DV0obo=;
        b=I5ZqYUZt4Ml6Cuo0w0FAvqA3/TOTqjhfkFFZTTFi+GQPqOfWNgHWuf2IfeDXk63eVe
         /84pTcJyt6S2BIp/Ngq+h3tQVGzX9CJi+QNNpES/Bh9qvK6JfYR+MJbqk6YxrM29hQlM
         mbaCdVKTAhcIe0qAFHrpUdFBADZd0VxtfUoM9T6LbGv00yGLxJvnCqYUCEgsoIbeKTOB
         UoGOBmW+i3RwNxEBcaVEtMeXGcmuS5G4JKN1prModDM5Kwgr7oSS6sY+YgLimbH9MQnz
         rl3xKwq3LKVEQug45h2mjJX81Y81Y7ea/WWpz5Kics4sM5fAmtFNKoBo+b1q334YyVeX
         1mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728504948; x=1729109748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDUR54sV7mPX+rddCrnMseo+c7xhgh8efJh15DV0obo=;
        b=HXG2AQueLp7Jic9H5c5UxcHB6+EEj/zUuVgu6qGWzvt3PrCFybMeUUWncF0FX6etF/
         D8A/Li71gIRk53hYirNwCjrk+9+EedgFd6xJr0O51xCWjtV+salwXsHtnRfSUtg8Kp9k
         Dva/RI1ULfjjXxYzU5ijvfrKpYHmzBqENPiJclFvulkk2/4zshQ+oLLUIQX5RwFlOwUx
         P0VOQ8Jq3Ue3ggrlidCjPINNNHx9V33aWC0qygUrEcHXo6YvvCGP/SbaqyC+rhsnAWg9
         u4SlAGPwgwkIrvExk5dD6Jb04k+R4tSbE1mo2RJssdPHifxbrKagVO3Uu441D+tlU4gL
         J1jw==
X-Forwarded-Encrypted: i=1; AJvYcCXPR/g2Kgpv4zTDh9jHjlUgcPPHDpKH09NfxW6h3i86qu2206wJVYS3NlZzDU/oT1vmtv96bVOcQSHfebyQJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt2EGvGUWx0mxPq0C8WgPJuzvZFF258mfxR21UVCBtZSUVKba/
	Im9shGxIBy0gCv6KvTzsp/mwC5K0qGFN+uiblvFqAD2kNqJ1m+gVEtNlDy5xSb2TPv7kiBXELFq
	A5RiCWSAd9BvpAzHX9kFqrVCLtLKkG7yD/U+A
X-Google-Smtp-Source: AGHT+IG4D5AOPjh6lAXMstFdrhAhrdd7L2vLhW6l3Khj2c6DWfn6O2lqOxYWrYJyoYoq7CXtYj1MgecC9kXuRRTO+64=
X-Received: by 2002:a5d:4b8c:0:b0:37c:d4f8:3f2e with SMTP id
 ffacd0b85a97d-37d3aacddcfmr2403355f8f.55.1728504947756; Wed, 09 Oct 2024
 13:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com> <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
In-Reply-To: <ZwbAvEnrzu6UUgGl@J2N7QTR9R3>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Oct 2024 22:15:35 +0200
Message-ID: <CAH5fLgipBfd5pNKqniXqFudruyGaJG=LDc5MEf3Yxq1yRMmQcw@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Mark Rutland <mark.rutland@arm.com>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 7:43=E2=80=AFPM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> Hi Alice,
>
> On Tue, Oct 08, 2024 at 05:37:16PM +0000, Alice Ryhl wrote:
> > The KCFI sanitizer stores the CFI tag of a function just before its
> > machine code. However, the patchable-function-entry flag can be used to
> > introduce additional nop instructions before the machine code, taking u=
p
> > the space that normally holds the CFI tag.
>
> To clarify, when you say "before the machine code", do you mean when
> NOPs are placed before the function entry point? e.g. if we compiled
> with -fpatchable-function-entry=3DM,N where N > 0? I'll refer tho this as
> "pre-function NOPs" below.
>
> There's an existing incompatibility between CFI and pre-function NOPs
> for C code, because we override -fpatchable-function-entry on a
> per-function basis (e.g. for noinstr and notrace), and we don't
> currently have a mechanism to ensure the CFI tag is in the same place
> regardless. This is why arm64 has CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
> depend on !CFI.
>
> For C code at least, just using regular -fpatchable-function-entry=3DM or
> -fpatchable-function-entry=3DM,0 shouldn't change the location of the CFI
> tag relative to the function entrypoint, and so should have no adverse
> effect on CFI.
>
> Is Rust any different here?

Ah, no it shouldn't be. Sami can you confirm?

> > In this case, a backwards offset is applied to the CFI tag to move
> > them out of the way of the nop instructions. To ensure that C and Rust
> > agree on the offset used by CFI tags, pass the
> > -Zpatchable-function-entry to rustc whenever it is passed to the C
> > compiler.
>
> As above, I suspect this isn't necessary to make CFI work, for any case
> that works with C today, due to -fpatchable-funtion-entry being
> overridden on a per-function basis. Are you seeing a problem in
> practice, or was this found by inspection?
>
> However IIUC this will allow rust to be traced via ftrace (assuming rust
> records the instrumented locations as gcc and clang do); is that the
> case? Assuming so, is there any ABI difference that might bite us? On
> arm64 we require that anything marked instrumented with
> patchable-function-entry strictly follows the AAPCS64 calling convention
> and our ftrace trampolines save/restore the minimal set of necessary
> registers, and I don't know how rust whether rust will behave the same
> or e.g. use specialized calling conventions internally.

Well, I was told that it's a problem and was able to trigger a failure
on x86. I didn't manage to trigger one on arm64, but I wasn't sure
whether that was me doing something wrong, or whether the problem only
exists on x86. We already have the flag on x86 for FINEIBT, but I
thought on the off chance that it's not a problem in practice on arm,
it still doesn't hurt to add the flag.

Regarding the AAPCS64 calling convention thing ... rustc uses the Rust
calling convention for functions internally in Rust code and I don't
know whether that changes anything relevant for what you mention.
Matthew/Sami do you know?

Alice

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035171;
	b=E3t0tzBchJGeBuarfjfR45tYMdKt11jSde5MtDtUDOSQJSCndrucb5kXyGVDJx34GCRi
	 Ro2kwUTIyjAu5iuNc0GGJKeUJzcJGE3+Hf4oIwV/M2Ugup2HE196SquSPjHqID6kdkf7p
	 zRwQRmEoT1pbrjy3tWKqZ2/kyZWPOpQcx0b4+HpXlS045A8PZsZEuqVFHyvUz/CBpIVSG
	 cJ+apFaoJLHYhpxXu5+Llvk9Fpjo8ixyykOPnA/l2Fq85G7xtwr2yJhfMX+U63GE84BNd
	 qut7lOsqW0s0kGXYPtkZeWo4zJRHN5+Tt27mXwoB/q6lxxjA3DX/GmvqKGKgk/bAs9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HD4w72rYSGuIKlDg9sIRSnAtItURqe6N66uwHCQ1Zhc=;
	b=owfGByqlsiq80oSXj/EZmP1QK32R1XA88L6MrTwUzhk7VWiGjxTZwD45v/VCq7OuzbqE
	 fZUMwk8Vz6cEPifnLM9fHngnAJZK3BSJoGVUQGe7lK/K+oNX8fdv8vRBVgS/Ne7QcbAH0
	 amQG/K9gL/GxX5i2ZmMej8CNrXfcR/2hE21hO7RRwO82ky5QF1vD9/sHkZ6npmdttben6
	 c6Brk06jdOOHVf2CIn1hRFo94MbXbLxF09oudCN01Q8ANE6vZPU7p7XOIPW0SUMIG5KuP
	 MilKXAUiv1hBpoPOLYvw3EiHb2eH7Az6xfyNgBNCLOeimtzdz/zLu071925+Bjev5tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="H2l/Eacw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B41C606A338
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 20:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B41C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H2l/Eacw
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a42b34e930so1211519f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 12:52:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795035169; cv=none;
        d=google.com; s=arc-20260327;
        b=M5rqG+ojAygAM1VJIryAdXd92vNr0o0lwxSsNDSIWFPh7P/W6jn740oiAFNCo8dlCj
         BAwgvOKnyU2md1L9RX/b+G3v5HWHXCrJ5MXvXYzypxTONLkjPbyeLtfI0ws1gXMkWq2q
         Upmu54iZ1fXd/UMUSoCjP87Hxzez6JTnmKRJOqn0hHPWIFKQs2ABRZYRfhQX/ZRAEuCL
         KtTEWUCAWsMzHZYGzmsoii/b/zValwc8zesD0byOvoB9W+23+QsBbjV7nZCXT/HKKUxC
         5hKKbnz7DmmszfDIViKBPWRv42LNOGOKqMUm72DBzMo3RW59FuewTKoKiPWkGGYLfxWA
         c3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HD4w72rYSGuIKlDg9sIRSnAtItURqe6N66uwHCQ1Zhc=;
        fh=ZXgLO7yej7ByGZC3ca+Rycx3K7SgJ5rPuXVG7dwFUrQ=;
        b=CvBQRoh1NU8dKXyBpK1WZJDXdDoM+hSD1VBVPQPTNnnOfYLoMBwLStPiT2THy03Id+
         ts3bza3wyAepRDiaatA7tA25U/JgIQ5W4GCgkhWuhXJ7g2W9wpWKJWuwHpaS8D/+qJwC
         zftGopXVKZ3ODMhq1FA2H2O9LIWV0CnZlMTifQohOoOC5yBwmajIeRTfEdxvTzTDvRq1
         sRP0GJGPHChC1qUN96DDh1zlxVSCd8MU7FsMLDq0J0AK2bZsq7g/bIGLsIdcRYhupq+s
         4Jiwxf4gihCASQJZJZwPfGTj4BmHoe85keT63hSwVYrIWyNyrW/4fo/CJClHgXO1c+rQ
         ob0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795035169; x=1795639969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HD4w72rYSGuIKlDg9sIRSnAtItURqe6N66uwHCQ1Zhc=;
        b=H2l/Eacw6fDSJuRyagGbw4/RuWlMy5OepKWyxtVy2uJpy8juzf65wc3aYFnP9JMiEk
         /W7WDWIbJjzMMvaCdhsBmchp/SU8HNWaKJfbunQFgD7cUhH+RpjgIrGjj6Rk4C1G7xhk
         g65b/J6H+q3oEx+iq4+waukNpAXoBOXaRwlprIuBHdPtn4JlL+rg6EjtEVqjX6JhvAXN
         HrqkKJrtsSjzbNt1/wrNKyyrtGB3gs2csnnC09AbPa2QG4bB7U8GA8Pg2xbOydnpHoqy
         Q10bZuug4ffhFuMpehkbGHRw5r3IAz9oFrsz9+AtL4MZ59qukZ5GvBvtKwxKkhektZ1e
         Na8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035169; x=1795639969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HD4w72rYSGuIKlDg9sIRSnAtItURqe6N66uwHCQ1Zhc=;
        b=gNDWdMG9uQvfMKTfp0vq6H4S+22/ydG+8nFnRPEDn7mXHgyKgcu1leORp11Nlt8LbV
         K/SezG5z7hxImoSb0WDHygFzH4Lo8A77VeRHE2Tiedj74BxprLbPUmFRJ685mGMGxRBT
         wsi1YbS1HeEV1sfhXVG4ye09TSNoyIHDhj+KJoNaQUnpPrPzysRPb9+M1YBsrQE39R1Y
         7augfJ/WYyyt2ekAQmQPxhCs40BLbAQl+NKSXIOJVHh5MWf8KVPTziLHwNpF+C4d5YGJ
         meHaJOQ+8eKT5bor060Pj1oEs6tvIzR5wpfOJxZvsvmrKfPzCLXqc3zQc5fHCwjy21Qg
         0CKQ==
X-Forwarded-Encrypted: i=1; AL+hErHG71d+LmOGtTFnf6rr3BurbLup1LP1BVZ+YFm/dt4Yw7B6Mjc4uo+09soTh7hA5sfTGyJFqAvhaT1VrmuZ7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/AzPC97NatAkirnnUUXWQFf7FFlxvEyX/8nSqNzrT4oTAVfOso
	b/4l1KzDS5EmUx0rhSXM9XuL6OiVcbrWVyQu9e7mH9zNqOoX+vnNOyapCZHd2TRDzK5QX9pICkT
	yL1hcBGioUHQGT36vrYzMo89E7OwyxzqgQIDdA+QE
X-Gm-Gg: AZFdTZceJAaS//yw2OPaQKlhIr8eC5FfFbOISNPTv5oFjR4YZPbT6sufCpocOADOUAu
	PwnsV+8IJNPLK5zoK40ucpTPbCXlOMNpgxMKCfxK6nKekWc2cNu8/0kGN2b1JbeIA20ZruFxRod
	jyU+U/TrvIOC1IF2OFO6P+zIjSCzSoCSiBx/SO2AdrgWkrw7kwMkGeb7kP5dDorMBlirxKKs9lP
	vYjWtxX3UbJuCldPj0fUuSUo1qe0lsXiknbd6dneYk3ZfjZrjeHv++PW13Ch1SmR3cKoMJgQcCf
	JnFIMB1Q6lz/qsTHLNLIKBeChIsySmx3Z2zr4BTaGEHgKfq3zIE4eyQniG+k7pdnmuXguz48eJp
	tG4eWjcJwVG/x5wEVzlirQkKoZ3214ln9pt9roOH+DahQ0MeXRlMwnB/+IjPQbUkWsceibmmHZC
	8dYa+3/LnNlTYi
X-Received: by 2002:adf:e00d:0:10b0:491:d224:aa78 with SMTP id
 ffacd0b85a97d-4a63ab754cbmr5872872f8f.26.1795035169077; Wed, 18 Nov 2026
 12:52:49 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030020209.3833766-1-tomo@flapping.org> <20261030020209.3833766-2-tomo@flapping.org>
In-Reply-To: <20261030020209.3833766-2-tomo@flapping.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 21:52:36 +0100
X-Gm-Features: Aa3M54rngdCtBdUPlOnJq0DxmarMXtgp0TWIs8Xtsb-fHR_p2_LUOAVjCPSU0as
Message-ID: <CAH5fLghd2at_rzqi6YU2MWFHK-r7S0VfpxrJ-dFsu0P7=2egCw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: math: add div64_u64() and div64_u64_round_up()
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fustini@kernel.org, guoren@kernel.org, ojeda@kernel.org, 
	ukleinek@kernel.org, wefu@redhat.com, a.hindborg@kernel.org, 
	acourbot@nvidia.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	chenhan0017.work@gmail.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	gary@garyguo.net, linux-riscv@lists.infradead.org, lossin@kernel.org, 
	m.wilczynski@samsung.com, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
> +#[inline]
> +pub fn div64_u64(dividend: u64, divisor: u64) -> u64 {

You're missing #[track_caller] on both functions.

> +    if divisor =3D=3D 0 {
> +        panic!("attempt to divide by zero");
> +    }

I suspect the panic built-in to the / operator may be more efficient,
so please move this panic inside #[cfg(not(CONFIG_64BIT))].

Alice

Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26680331A56
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026882; cv=pass; b=tCwujNhpb0ww8bD5P7zpCsyKLu0h+25KCc429GxoJoVfSwQGPEUze/UQ5ybsSgcYCnEwJ45t/vlpO+o3TTgHkL2cN8KE5tLGQHulWam5VVi63JDfRU/qjUtdFd0qUujvqa0Kew4bs7DT68HEpQ8aKH4UJOd7pJdIfsIzA2B6JoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026882; c=relaxed/simple;
	bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6n7vxJRmh4GWFEHRvW77aGASjK8mqp46EEAmzSYB72WHVuyD6Eaas/07joe7uQDDtioud7O5OKFvF5mPAaj71CNL6JMk5ZQVLSPKRE+c9dZwOLPLd+1ts6kyXh39vI4zeqo2E5/kFSd37eS/TOP1ksmjT5coV+5nXmOcU/D8hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GH3FI8eo; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH3FI8eo"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bda3b4318dso995226eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 03:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777026880; cv=none;
        d=google.com; s=arc-20240605;
        b=gQELAm/YVxy/hFbb9qeSjUY5LyrvXoQff79sKlk7b+nlFDMkjBqOscRLbjT0XApwl2
         DDwymvb6p5C92Tc8ANm+jE4ioZNG1FZHCRZaK4GAb7xFG88ciSYK6sCqjW/5xaxpqaOU
         vFv0u8yTL6QfAR58iHQN65wrIQbFCzKaOgdG3rGCFJ0Y5EvK5hPkAOMiKtB1g4y35Oe0
         Rn7Zm+GRLotqIquFCga0GoyWG64YVmOUNjWmbUCY6pZKgt1jxc2SRGgLKkqzEPQA4+z2
         qGP36aPoudfpMyufSsenS9t7CJMFgbn7dC6EZK2CY5OffdVYkHfXpOqrc78Syqord60A
         Mvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
        fh=rWw5U5yQ6hlWmsiVMX38/isWkjUn8mOFB0XCvdpuCbg=;
        b=l129JMIMXDa5gw5NLBeJowGLLa/bsNq5IgwiONarkTtrO4yGFnIoPa7fs82WlI6LvW
         qq/esUYea+Sd7e9fjtMa7483F5TZNYI453gLLznHhIJJ/Jrwna27yfjBXUw6xdZohsBD
         v09mQNE2MAyfufgvqTHJr8a37N1iyC2XMyCp006nrG/H0UfM/NrFBUw3AtT2L+SPHV2B
         t9ieTlFu4jzkoDZGM47UCYwA1z6R9Js1zKSEbpZXXPocJBsntLEbBLlKLpHmJYQCD3jS
         YgKdYMnHTJctTOkMtZgNWST5hn5XpGzPl5KfzZgFTr0seq447W0vnjscnzsVRCVyzEra
         d4rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777026880; x=1777631680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
        b=GH3FI8eoaeOISDjCG6bRh/anVmMs2qAF11E2gOV2wf/U9lrjah+oHi99lSujwadRbM
         X1NK/sKVRs5iL7VM96OJv2y/AVA6LFiYHmFW+jMFK6l7ic1uS/UEJ8Xozml+B5cXM7zF
         4dA8LT5EuwqbCdzX4uP2E+ZIlmb5Ihr16wzKydko2SpHeYL5gzxrDTAunJVNeOHNe3th
         ZfTAeNnNUSVz+UzcBmfXu3eZrrEGMjIJNoypRXCGb27uxEQXcF6GU56lmDomcACgKE0o
         59CsQhQH7oEbMTBNeflbLLkh3H5ijtdy+X3y/KHTahZjFidnQrRaxqCKyLU41ZxfGogj
         FxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026880; x=1777631680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yTJizOE+aTFx68oE3PlVDChTaWYKzRYowl6JulRmua4=;
        b=l5J6KEB/HNlwsoMWQj5JKxYIDFFsQKLdr0YBgb/dBWkbAc1Wq8FFVYSOU0+5GNnrx1
         c6CkJgraXd5qmdGakOYBquOfVvHL91UmnPDqKAShUv/+9g9Q9BkUhsZlfs5Scsv1nmG6
         v5D71fV8wFvqGnj8qCKaA5hxR+/Bb7+SPzm8A02z1zRxBDE1wuFoMCcblzdyLa711aWs
         sNau6+6MkhGeYOgpieWpCexq3Ak660F8Fel9RXaud1BNrqKvOBXEHajX+APpD0mr6ib4
         eqCGroEDE2QaBqwZ3ZKKy80ycS3uMNPmkhgit8bnoMgZzV9lwPA4Pt6qulgXqGoh1Ul5
         2aEA==
X-Forwarded-Encrypted: i=1; AFNElJ+FfKfGIvTuACYIwXjB7NE/B+9L6UO6ZlgJ1d8937cmvFvJZU47zoqYDrRZT4RODP78NzRy+GeEcN2AJQaHig==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ1zP9QazJmMZ2XWhAjrw3F62Fw7EKfIe+pSVZ5pG0dOcJdC8D
	IuHErvO9OvNhf3ahsb85RVQFrLgjwVQcetW3Fd994ZMmuXKEQT+TGTBEiCOfQzhiI5ebATp3T2v
	aAfbzTu0PUhHJFpNvRvnTVXgh3Ia4XFs=
X-Gm-Gg: AeBDieu7oo7VCLMovKq0/uDeb3aLDfNzFn0exD2cPFwT8Y9oU1y/ALIDhI2/dSccTUs
	hFo6ycnpVxO0vSRTZ90LiDk/Cu9djEu026nHTy/YcJBWI9sGanRpuNX9efg8tyEsPUJTESs3kyC
	Jgp/8E8OhHDSYGIoaQGzwQS868baI8/DYX013d5QXyz488g5PlW7Ud+evQp60Dm3aIOdWvghJ08
	0z0ZwPDzvMQEhFYJgO+bpQRdhKu215mExXQKEtrBklr3wHCcggn2T3pUc6d/wqgXhIw79Fuf7zT
	xHMQZ+iM8bxkeVDkLpLe53xbXxkIq3yO95E5wne4Sc81nOMvTYiB1OmdkBSZyXBJ+Ih7itCxwYR
	Jn1vcWJb9RxBZaUBU8mPjseeJvugy5OGcQg==
X-Received: by 2002:a05:7300:d50e:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2e478936a32mr6682650eec.3.1777026880251; Fri, 24 Apr 2026
 03:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424054742.45832-1-mkchauras@gmail.com> <20260424054742.45832-6-mkchauras@gmail.com>
 <20260424101425.6bde0e17@pumpkin> <aes7L3M1d_LvvGKa@luna> <0a81f510-7b49-4879-b0bb-3b24dbfc0788@app.fastmail.com>
In-Reply-To: <0a81f510-7b49-4879-b0bb-3b24dbfc0788@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Apr 2026 12:34:27 +0200
X-Gm-Features: AQROBzBsdDZLB2GUpMgvGgFgU1KPjXwk3TMpDFKjffQGyp1lulncbpRBZafhAFU
Message-ID: <CANiq72mZGb+mTwP-8pTLe81oM0QnK-WtQeVjKPiP5m8zK_tOnw@mail.gmail.com>
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
To: Arnd Bergmann <arnd@arndb.de>
Cc: Link Mauve <linkmauve@linkmauve.fr>, David Laight <david.laight.linux@gmail.com>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Miguel Ojeda <ojeda@kernel.org>, boqun@kernel.org, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, tamird@kernel.org, 
	Nicolas Schier <nsc@kernel.org>, simona.vetter@ffwll.ch, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 12:21=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> How hard would it be to have a private copy of the parts of the core
> crate that the kernel actually needs? Since Linux is neither quite
> hosted (using a full libc) nor entirely freestanding (still using
> some library interfaces), the C implementation on most architectures
> has a small subset of the libgcc that we ship with the kernel.
>
> I assume the core crate is larger than libgcc, but I don't know how
> much of it is actually needed here.

It is fairly tied to the compiler version, so it would be a
substantial effort to support across a bunch of versions. Instead of
that, initially we asked to have some `cfg`s (i.e. conditional
compilation) to customize it in the few places we need. We already
pass `--cfg no_fp_fmt_parse` for instance.

There were concerns about combinatorial explosion of `cfg`s, so we
suggested `cfg(linux_kernel)` or similar instead, though nothing
happened so far.

The other option is to at least lint against certain operations, but I
think it would be better to have a way to tell the compiler we really
don't want them generated to begin with.

Cheers,
Miguel

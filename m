Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620837;
	b=u0KLZyN7m/TxwNy+8NzTJqs4r0pDIWEC6sb/BBMqQ+gZkpR8prtBEkZqvgUwTKIIJTal
	 a6kmm6n1vhbXA0rZG1sjGpneEf1fEsI4gO4tpKfPyUmsAu28ltYTKEslspFzNPSUugOTG
	 dBkD8/JLaCiPqrpHDE2UJ0ZcsGDRTpfs7n+z8VlSRc23+hFg95/C0gsrv10oTHuOeNXxH
	 ygsMAMicTy+bVJCb5xseE6qRRI6/RutYgqA1VghCJLYl8N+CHlgmWXu2xAFxIrvnAL3sb
	 LTzOTINBEztMPedy2XENnGyNPmdyitNe94qMxtRHB8zB5eIG5aS/QMRGuLrv8wiOm3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
	b=DAbVss98Q1P2WL9IO36QWlBErPFNwmlHfKpqNLah4mlQHU5EvPJDVicdEH3HTx0eZa5i
	 EcZe1qpVAqDxPQoydNG6HOxM2JBfDktDYWW7x6e+JPaK7j7L176cXwB2EqUfMT2RHc6Tq
	 TQ450cpgpxTmX5p2ed7JRWz/v4CmiW8GJCqeemGXe7ulkdyFK4lLd14E6x0FAmeTHrwQ3
	 mEfnndX29yUm5QlZM1bU+saT+UveP17XtMRDkq5PCUeIyGsftncomZvTXxP8RPBe2qDpK
	 +2cS9kak+YuQuv+PwPe/0u3zOGrQzVOt+PPDjPKFa8yAFOc/lxctF925OSAJWYz1F2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=buKUYa8n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E3E606A31E
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 15:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=buKUYa8n
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14b6ac47eso742299e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 07:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620835; cv=none;
        d=google.com; s=arc-20260327;
        b=Qlpkw1ds2Dp3q0/BD1/4rDpFzx2bpXmImOVRv0m/sbhbsHLV0ApP0/86r0VRd5RRMM
         kP96H5aOQa9oDgbiLXsQyHH1g4cMLYVBMpUVlEClHADlkqYhym5Ixkk3UMrbjEAa1PD6
         6w13PxwDszGTtnwnIOTAfcrTVdIJKTg+K6PARWRlsGvc5ByNr0MS7/Sclm9sSe1MY5BN
         mMmVh2gnP2FIkUDFvpG1+Aej/KauEv1XSU9oMEohPgxAbV3TfRF7XYfTxXGJ+t/08RKC
         RvRdianVPFwjhKl9MMDnBJvVF1y8Co9HYILoQ7j7B9SLUK78X0/zKa1WpBwgBcwY89eu
         cvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        fh=CHIN1R+8yfol4+Wv337cXcg8gdVC7KGc0dyf0HzPSbo=;
        b=kaT0mI10d3dlfI6+uGRQrnIGRu6uC0QbpzneB72WsUTGenbdEfV7/4jP8c3GYjYJjF
         YlcaTScqQ5wYFO6pQDtWDlSly9DnG0nSwNYn6vMSMebpi4/jTTG87arGP+hmihEO8wOR
         3GpjeMnXX/iDKgi9tglIXffN0iiGeK8aHu0fFRkDRqj73fCZJt70tHn4jWvORuobDEa0
         PnNtCRXnFmHefzR9h8hfoTYuwepFrKvxL+sW3mpUkiSbfIu266rLgRn9DCAtAiTQqJpc
         /O6CoDNYiNM8EdoD1j/0RndZiDIsV+kjX0lNAdk56V8zr7HRUeXFnOxFlao1c7nES3Yn
         ecjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795620835; x=1796225635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        b=buKUYa8n/c+VXe6APnpgpXA6FOrq+FpjqfwIVQgo23FhWgtM2lNC3OswV9rT/1j1St
         s7iH62UZ9fSmbTJmNmOe1wusd6iKi7MKlpK7OQEZEeZVEAn1tcE9gW5483bhuLeVVlZX
         tGZhQYHe59rb/eOybw083v6sewKrRTARw8BaOX0EixFJjcVTURpw2ruRgQaNIr2d12TB
         1eAlRqX28isVPYAIbEdIx9S2DjhCtfSLFhVd4UQuba+fFbGKhnhcP1QT20dQyldgF5cO
         j9MrI9ffEitabU7NvGkF5I5XmQ7HGSV3Mvyua2JTeZmuW2ZM50kod9BFAcntFma3EQ+0
         sgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620835; x=1796225635;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKqdQvSAuRnmEmZrQT2+mDn5yykXvIjFQspA9QZyZuU=;
        b=l0yfKsWEzLb7Ur+Mt4Lzq0pz/b6gmHLwbve9drk2JhrS0c/s5INs5Aq1xIqLfQHbXn
         ZOR/nIm4oYHb+LcVI6I3myz1aXT8V/EZgiLGPioik53dyzBUhMA9SRbPg8A4BRdas2Z/
         kbVzR+BcM2opD+D7sCvhu7rVUNUbuj1jBKYpgF+m0DERKw+5mQ36YL/VH9g8CSKeDAkP
         Y6CXrIyOqrtbnpfR6zv7ISOeHYos9ryMruRJp4KVPzQaxp4PGTMGxsKqP3gUPgUdXrIE
         iDD9Tu//oR/sLekogiuTLBiFzlEazJD1a5AQ7ogJT72CCuhpTjkjz2yC/Urtu1DxIMIH
         rN6g==
X-Forwarded-Encrypted: i=1; AL+hErFyntg4CrDgmh/feic19RXEcbNL+tEv2meounvcW3rIBzHpEyXgiRuiQkfIMJaqn6t6JMgExgp63Ky6oCZIdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9A81wJRL7WZEjRE2TXMHzJQkLl/DNbCFx5jQUT50jKvLNM7buR
	S8lODK3/7/oZPCj5t7LSg0QZANA05dy1WxkrawrCHU5PzTi1TYNNvi4aDMibN4qvObi+Z61zeFP
	mTUq1MvxBN8RriMl9/1G1MDHqPwyky7A=
X-Gm-Gg: AZFdTZftmz52JgVDwpDD9F6xnXI0ibrl4LXznxNmMo2M2A4UbZmHDnAOLgifwwpPGtN
	cqXw+YTWSReyZl3TO1wFAWGvPBp9u4cDtnspVbGUxsHxwXqGFn+XKt841oAb3K8dpx4al2m+kae
	UB62hJ43j/KiBecdXgvFksEyev34flgEAZmCaABEfNZ94uKnOmQwbdQ+tgZXcgyfnyqnpo1BgAv
	NV7wGA5/E5oNyFEbPPiHQMsmYeba86sZTScU/Y6Z/iOgHrGH+4lQ47iuzkhr6A6X/nilTOYKCxS
	C5YrCOw8tmNE9LIJSEVpWeK30vR3sGVLwXB/c7FFgrpXnmbVetsrJd+Q+AQ1lHeXlq1mQj4cqv3
	nq2uI+jn8M0wjZfo22QK5fgQxgmpWqTqORj0PYqpmXl1UUMzkGf5sRQfUuy0GuoOwYa/eAaAGkj
	5t1ujwOYXuLCJzvYN56xGWSXRuVAnPmdoR/UTVPwoTLda8nmRGFHzStBFwW/U1YITYqyTIfrTFh
	KXPlyVRhEjb+SEolGjhfqXxxx/G4BYf89DCiQD0i7Gr0oNaEZK+pgupxFVKdCT96rXq2Fas
X-Received: by 2002:a05:6512:6c3:b0:5c1:4a47:b86b with SMTP id
 2adb3069b0e04-5c1bc785b7amr6221022e87.3.1795620835046; Wed, 25 Nov 2026
 07:33:55 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-build-speedup-v6-0-141a4f861c67@kernel.org> <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
In-Reply-To: <20261124-build-speedup-v6-2-141a4f861c67@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2026 16:33:42 +0100
X-Gm-Features: Aa3M54rAUhOIl7nJAGzRxUt_IUS4JYfamPQ_n0qFr3V4ZOsnZoEMWuF3JwFrbDg
Message-ID: <CANiq72kdpY_tr0Gg16b24J1J-Duj3YS4rJ0CgNYVWQqmQv=nxg@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] kbuild: implement and use depcheck to check
 dependency timestamps
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nicolas Schier <n.schier@fritz.com>, Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 1:20=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> A dependency that is also a target of the same directory (e.g. header
> generated by an if_changed rule) may get remade later in the same make ru=
n,
> so do not treat a target as fresh.

One more thing I noticed: a header generated with `filechk` does not
have a `.cmd` file, so it is not covered by this.

It matters for targets that reach such a header through their `.cmd`
file alone, e.g. single targets like `.s`. For instance, after
building `arch/x86/kvm/`:

    make arch/x86/kvm/vmx/vmenter.s
    # Change an offset in `kvm-asm-offsets.c`.
    make arch/x86/kvm/vmx/vmenter.s

In mainline, the second one regenerates `kvm-asm-offsets.h` and then
`vmenter.s`. With this patch, nothing is rebuilt.

Cheers,
Miguel

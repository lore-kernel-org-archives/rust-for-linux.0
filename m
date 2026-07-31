Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC2439183A
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497704; cv=pass; b=KJnFuQ1qFft4713zt9DLdSvwx7JNKab+waHzTKDxpy+jtOYE6pC2H3kY9h3iNwxtIKIkjgMOAsqtYe8jL8Djj3+nRigITwBGWIDasrqi2bGtVoch5fRbwuESZkDGWtYVOwY1sjx6/MydzQMAce84yTa8ZSvA068QC9sXMumbx5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497704; c=relaxed/simple;
	bh=6qITLO1DJJu2A0goaagn9MYpDZURjD0egTWCeUgW91M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qzKqNOjzOFS+u8Bbjg2KFhhOqYNBKw65QndjJYYmjGiBSk0779YduNEDAOBrSc7U1hwofvyBMeyVK2bqWUxH0oYqIIIXtsNAHA/4VBh0NFklKO0nusvs/joEa4hnXliZTPKuj6jJFYRrT9DX/jUHfR5VQ8w2d2K50LqZMggfQaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxcSaSVu; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxcSaSVu"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf420670bbso750785ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 04:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785497703; cv=none;
        d=google.com; s=arc-20260327;
        b=IDv6NZv/YJRTVg1GKdKVUB8n1JGcsbFIbbbcBObQaf2Ny6ed/EXo/XsmF2B8l5jmOh
         ZTtpaLQ98hxSRhA3YMnBgeWvR0+D6vXdIwcxNSmGojnQuBgGu1CpvRYmYv9cD0kig9vB
         lC5nrvUUUQ2y3V0vUzoMDI3MxWA2GTprSLf1/cn3utJOPGxCCSDqU7uSvuDvZT6y343F
         zWlVSWpbxFa5YskxquTFsnpw6BlAafydeOxXFWl6mYIW1VBER+babCasQnrq0Lq5fJ5g
         VGWIdPGUOdUA6XQKCXfNQMq6BqZqrpt3LD0dRXo81XoKRmZc78/yp6KdnqbwHkQz1Rkn
         l74Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6qITLO1DJJu2A0goaagn9MYpDZURjD0egTWCeUgW91M=;
        fh=HkzXnxEjPGZViwO0t/QH2By6L4/bYf2zdYJPQYIPnWQ=;
        b=DCntmsjFyKGSfsmsZDdcqxN5NWRCIxVnfK/jraamULaNTSzayUiFOEGWjIXigoPuTg
         3R+encwtH+2l+bCapSF/eY9pr+aPhVE/bz5j7XgXkOC6gw5O9pi3RrNhPh8rcluqven5
         2wWJE+HNWI/jGKpOdMiBuVSJ9zwVSEMzGHH00wjoE4oOjDifFRlk3Ybn0ddNm8J7uL3V
         Q+n9R5fff72aUL4KSRBM/SEEROrUO1V3JMeqAhjmTT5KdIR9yQHitAgFnLub1kthp8Hj
         XS0M7AoR6EEVsOMzrOXk345+K7BC9sWzRTZHUNir/tT3PSpchFzTvAThcEqaPFus+Wq7
         3O6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497703; x=1786102503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6qITLO1DJJu2A0goaagn9MYpDZURjD0egTWCeUgW91M=;
        b=lxcSaSVuHUVr6W/vI6fXqneEARHVvA1ubYxRXvpYL/z3fBZ79771jMVujhdAe1Dkz/
         qrDESKYdXVToT+nbrZ2diNGrCmgAd407oeAjrOE1Ndra08MNQ/zjmJyKB2soeTWUXIhh
         hX3BLGV4W81fpQfBtefPt7J/HEGSMOI9NeU4kXRSCcpI/EET+oV8rJRcZ+NanlAiK0yn
         yFPpAKYFT0fWsl/RGrEkH07iCjFIVumj3JfMAIoi2aUvn2Bu4zPwqsQpSAm/B30VkqVP
         EyB3W3vOgpyI7mSY+PcFFKQ8wKBmdQYY30Y2d/lrKHJLJh4uPSsV6pndthUYpyQH/DnH
         CVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497703; x=1786102503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qITLO1DJJu2A0goaagn9MYpDZURjD0egTWCeUgW91M=;
        b=myO5arRgSsrSP+zmeq+olvMYFiP9P69EnQnVEXyCXBqiy1RbAi3OdFYpwX3IpSFH4j
         YRouuwi2NhMCoTLOMBFoRUIq5GTj3TO5whJynckYzAh5r087MPgvZt9k32DrbUJKu9kk
         czr7Ctu9clAvrIYSzDhWs2OLitUfHJIpMpMDm007s2NZKbLDHhOJi+uq/OM77+J6jrfq
         3mWEf2OZdJYkc23ub15h/mJiQaneeje9ruza+9cP5SLMpI18p61uFHhKS0NlSUH7CT7f
         t9rFdyRpAeOj7OLmc8vIFXKIytNNNOxqncNN9KhdzfHJItqtURlIHgIhAes0I4TVrNOA
         b7/g==
X-Forwarded-Encrypted: i=1; AHgh+Rr628fDyFGD2FwT7CkiQEn6W1h502DDbPhdkzhu2q7WzmhIWTtLKRKGJYEHYL4n8Pe5Os3nHfpokAVLe1iwTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7CNSkZadNA6r1uGfZUu0mH7gxAs09kkiYOeedx+rDwyI//smu
	C/s3rZZ9RU/2RjYqrOHDo/jc2364YHyVw/TVGzdWTZWF/X+v5VrrvJB/dKZgRM9xIG9p8Xqk/ue
	qI7sZD0R9Zo5biEGOdNQWmTZv3A0ktD8=
X-Gm-Gg: AR+sD11AP2sRdVrfDMXGVN3iOLTAwqBLa5JnfBHLphOBzcFd8sTb8MihyvOEFiL6Wr7
	PDeMiRfVfCNdCsHiCK6LAR/PbyX8BMfM+zGRXmFBXq64HaTlNDgX5vmuU9dWYgDCw5cxIN6EFiX
	aNNHZKFMw6gO27dpf2rl4CaNHyCHhkFs1ffQetr0B7VpJsNTuT6/ruSRDfSCqGSxPMTf2OFcP6F
	AHUXLl163SuQyw99rfbAw2BhUodbhkbKRZRqiRrrLfRZSvD3Ox/r6X+XIYurfTdw2BSlxR1RT9K
	/FQC8qVuWTUDT0c0cbsdsvMqXR5DL9BfYp6GjqUNX1L7EMKnp1bqTuPKdgQ6jKCioBnWqGAajh/
	eNeNh+y8oyimXSa39QjbTfmcXnSys9k9oCSRRr4Vx4urAE4ssAyShhcWfXCir
X-Received: by 2002:a17:902:e847:b0:2ca:ecf6:9105 with SMTP id
 d9443c01a7336-2d046dfe858mr23892855ad.1.1785497702592; Fri, 31 Jul 2026
 04:35:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com> <2026073148-cushy-mocha-2ecf@gregkh>
In-Reply-To: <2026073148-cushy-mocha-2ecf@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Jul 2026 13:34:49 +0200
X-Gm-Features: AUfX_mzIB-MLseZFeU19i2MTRH_8O6c3_W2T5QnBVqbBEEGp9PKJBtiMcvaRtGk
Message-ID: <CANiq72ksdfw57QE1+FsMW3uE5p056tTn=xxK1m3fg-ABhHU8cQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Rate limited printing for Rust
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 11:06=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> Doesn't apply on my branch anymore, perhaps due to the other binder
> patches I just accepted?
>
> Ideally the rate-limit stuff could go through the rust tree, but that
> would delay this a release cycle, so I don't mind taking this through
> char-misc, if someone wants to rebase it yet-again :)

I asked Boqun about it yesterday -- I think he wanted to perhaps take
the first two patches.

But if we can take all, even better. I was going to pick the first
three at least this cycle, if no one else was picking anything... :)

Cheers,
Miguel

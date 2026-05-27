Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAD73E63AE
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876048; cv=none; b=oFNxRc+J4yestbrb/6uVuJ3+Xf8o92YmNj9e3Hw/E+scOwZ6jxhVOYWStCO2SbgPrfASGIDXj3uj8zp5a5yf1QvWyAE3dkLSFTD1kQSl1w6ObufMP7JAD+A3qL+i+i6emzcHfzs1KL5gKzaH3oTZexf1XRROhUWmOTCqcvt9j8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876048; c=relaxed/simple;
	bh=EALKIjV6741ShbozP3pzBJI6TCQdg6YABZXuAUMU20A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rzqNiiX0Jhlm8jFtcXNwwpXGKZou7V2sImasMSQmhhTTZuRwTeEh7IdV2FL9IepMEGZ4MUT5k4ifmoht+N0kvlfG6BhQPuFhOtmQSz/8oLnogBZqvWoIhgwmBPXrSuc0uVUd54SH54yk4KLo5ZcX3QFa8bdZLJ22fcWbUsgthSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=crkznwvu; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="crkznwvu"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-45ed830a0eeso1140325f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 03:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779876042; x=1780480842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HybpFb6d1l31Aoue0OxjoI6wFbeps3Bhk/YBv4itmA=;
        b=crkznwvuLRvdLfdj3ryaAn+fcfcYslz2uBgFQ2B4Ytv6lCenY45doaq5QzNEgSu1jr
         NzWHFGFu2GwaMniwr9Tud4AEDh53i3Tc4M0BcEHy32cibMYvQFRfGPBz9Ud23Wc8nwIJ
         qVkiLXL6XEmpBWHZqLk2md7x1iA+5/1BVb8ClCoIUggAc3ozNoxcw+gzUTYsqp/2XkIk
         RUDuPEBf/256K8GOThOBrwRVR8qMnv1DEjprv/R60Y9P0EXFjLUEMA0bb24vlJwjkKwn
         NmmWlFf5o/aYOZnK5ynWilQU+pWHE745M3Eszn7lSGzrphRQ5jCa6XZnBkejE5dN1Gxl
         gsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876042; x=1780480842;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/HybpFb6d1l31Aoue0OxjoI6wFbeps3Bhk/YBv4itmA=;
        b=sMYc0dHGGA6DFqXh24Y7ppxXDSu0FmjTJ6e/EcikJxS7zj2py1g26FNwtsbTzIEa9J
         cv4gV+grLKzaUzcYRJK46Sbcf+LeBCyCEM762PT4ZR/X4CAuOQg5RHlu8LsSGD8RKHDI
         KfNMraVIHV99zPgGi8y3h6EI7gEjGa8VuXCiTfQzBqlnQkRIq/pxGe0kVbHC6/OGDpL8
         GRqpDlGNRyu/roB8cUKXfsvcxkVGLp3rWD9Jv0+SgDfReo6JDa6icGZow1Fl7xXiiDAx
         YA7xUjSO7xL7OMeLvcBcU1qYuVChkE/9J7bpuzIXcgMKalHNVDNtHbXtJdQJ9ZKAgYYx
         +sUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+697WaEL1UuDNmec5ZfG7XpH9ieGxU+DMGJLgy3A97sB9d8W5st/jzIrEGwuSB/JW1IOzydI9eLSWGMwaPmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvZgJXIdtkx60yeM49wEk2laowzM0JMMe/usB0swLW/5olDm1+
	r1Xki37fkCCAHacs8juNMe5BNOjWi9kzt6WfqCqE0EMXbHzkqRptbsK24E0cka2HTQ4CUqWHRxj
	BjL5jxHh6oYJIjzzotg==
X-Received: from wmqh19.prod.google.com ([2002:a05:600c:3513:b0:485:3bc4:b1d6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a402:b0:48f:d1c0:721e with SMTP id 5b1f17b1804b1-490426b294amr256811665e9.12.1779876042131;
 Wed, 27 May 2026 03:00:42 -0700 (PDT)
Date: Wed, 27 May 2026 10:00:40 +0000
In-Reply-To: <CANiq72kRC_k1cnJLmG+AUSiUH6kDXVsox3nMJnV-c6HkNXOwBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260525-binder-netlink-v5-0-a90e2923ebeb@google.com>
 <20260525-binder-netlink-v5-1-a90e2923ebeb@google.com> <CANiq72kRC_k1cnJLmG+AUSiUH6kDXVsox3nMJnV-c6HkNXOwBA@mail.gmail.com>
Message-ID: <ahbAyBD584Hk9Mst@google.com>
Subject: Re: [PATCH v5 1/2] rust: netlink: add raw netlink abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>
Cc: Carlos Llamas <cmllamas@google.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 04:29:26PM +0200, Miguel Ojeda wrote:
> On Mon, May 25, 2026 at 3:17=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > This implements a safe and relatively simple API over the netlink API,
> > that allows you to add different attributes to a netlink message and
> > broadcast it. As the first user of this API only makes use of broadcast=
,
> > only broadcast messages are supported here.
>=20
> >  rust/kernel/netlink.rs          | 336 ++++++++++++++++++++++++++++++++=
++++++++
>=20
> This should be added to an existing or new `MAINTAINERS` entry, i.e.
> as usual, either inheriting it if the maintainers want, or delegating
> it to a sub- or co-maintainer, etc. depending on what people want.

Netdev maintainers, what do you prefer that I put for these files? I'm
of course happy to be on the hook for this code.

We can either add it under an existing entry, or we could add a new one
along these lines:

NETWORKING [RUST]
M:	Alice Ryhl <aliceryhl@google.com>
L:	netdev@vger.kernel.org
L:	rust-for-linux@vger.kernel.org
S:	Supported
F:	rust/helpers/genetlink.c
F:	rust/kernel/netlink.rs

Of course, it would be useful to have others listed here, as I'm sure I
will have questions about how networking works if there are patches in
this area. Or perhaps the netdev@ list itself is enough for that to
reach the right people?

With regards to actually merging code in this area, then I think for
this particular series it is simpler to let Greg take it through
char-misc with all the other Binder changes. But for any future changes
to netlink.rs, I think it makes sense for them to land through the
netdev tree.

Thoughts?

Alice

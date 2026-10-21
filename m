Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576006;
	b=kNaqTloeSBqF7EinxKotGtj5xSrkz4m0e2fYdw4nYWbd7ghKVDNdiy/OA8tC65scjgrZ
	 eXzQc3lbinkMSXmVWY76eoFF+E04jFXMcKnR9RcYi3YwgoufjgjU5GzzOarthkW0OM14j
	 GSlwjcleSGN1IcRDQbxmXdgKY6RoAZGfxG2kuNLOuKdygUumybwB7YNJaxApo6qOTwUmm
	 PJbBEkbKy5jV+HuJToFHS5+30feu+SgDUJ0DiAs5Kf8EW6q3TZLjYscMLC650InGdzwDt
	 CREPglOgSs7OYNPeqrPMow3okmdUJIgcPBoJ45T0j5TvacH6FaXLqYfh2nwZ19aBYIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=UZHr8KaXPzKePXeT1gi88PdV3hmG6tA9tT4jti5k8hg=;
	b=sGyyOY6g4Sv5lRDfHUN2mwJ2XZjgVTIdeOMUGFYXS+DAxjWqfFGFcKopgzcZG41jQFjS
	 WCbHo2KLY+Ed9NOZhHceBKnMBlJ1H93p4zjISHw2rnltJr933tR/z0xY5WpuvqJ5bUvuP
	 +xE7wLeUfpke2zU6fmsIMfdkg6ANotSI4d/pL0UyY2TOLlFVgS8016zXdFUc+XK7VdFad
	 Iyr0pgmNpj5J4bg6eAP51GSFpq/ARbAmr3S3zfWYVR5RsvA9h5nq/a4F2csx6B2x0KtpO
	 J1g2dnB6ckrqIcidzowqF126lkpdLtNSe/Bo0ZY9Akw5uF4CpIAtnLPP+9bpYipLARw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=d16DGRW6;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F6A606A31D
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 09:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F6A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=d16DGRW6
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so4990765e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 02:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792576004; x=1793180804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UZHr8KaXPzKePXeT1gi88PdV3hmG6tA9tT4jti5k8hg=;
        b=d16DGRW6ofJsB2xWwhvic/Qso6qUGR65IA/IDsPThfIfCF5cITHxyxge3y/nfQRkQp
         lpMwZJXWC4Cikck8FY8O07l8VhExksbpZW1R6OihHG9nl3YMAAz7S3XYgrITcqKoF/WG
         JEvrlofHxtO+vWfPWHnd6H3srHTWclVwKOdWRw2cVn3ZQpGp+xm5iseggMc0QNtwlWpY
         YmONLuj7aagKZCqLsiowTuzkO8kr9v5yqqsVc45ZgzYhqIIwyI+DKy+DmBPXVfu6NUDE
         XI0st7dYDC91ivBQbhs8nLe3B8eb7vmKLFSdJxLkImAf6k24jOPP7nSg/jPaTtZG3+ao
         64kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576004; x=1793180804;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZHr8KaXPzKePXeT1gi88PdV3hmG6tA9tT4jti5k8hg=;
        b=gOINoYcjDWFKxmsjO3mboWMQX6z56zcqxhhrPDEaH1379dCsDrOQB13tmVYjKJJr8D
         mfns754RSu86mvu7JQbuyLG2KeI7Tuajq9fORJfGt4hXBqGP0VAsV1o7AV2wlXiTpNSM
         6MCezjDaH0mKSAmEdZqr/aQqmd5ubjXl2HXOEmDIUHdcKDFfBfUkDlFFySKV+D3OKn41
         54+yQupgP8tUc6e98WIDyBkc3cRJs0VMN5Eym6XPjQkeVxB1vPj4TwwP9N9yE6FOus0h
         FP5ah6fLCTrp3YATWpPHNZsMdbjIChYqSrx+S7iGTm2gHevE4IuJZJWf0EugNapSawHf
         vvEA==
X-Forwarded-Encrypted: i=1; AKwUvBxydGAOVR++nFnaFYrRLppgIP5Jo5YWT+3eMxL7lQyNBWug24z+k9VfiJTJjK1g92XCQY6ZS65Vxm9xIpCz7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6Bv+QK/m3scDl6xYLjOqT83+iATPG0Aun+p3gqUJX2U2Ym4G7
	0DeWcdoLFkRSQTMl80pELPYopjGGuzYIUX6bciW2v3PiA6KQD3pD/mZxZgCJw6d6vDaE4fAUfhk
	iiB9+4avy/Xrzq8xsdw==
X-Received: from wmik21.prod.google.com ([2002:a7b:c415:0:b0:4a1:e474:4213])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:4:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a1fdd39eddmr23675595e9.32.1792576003837;
 Wed, 21 Oct 2026 02:46:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:46:42 +0000
In-Reply-To: <CANiq72nHP4qiHE1=y2nhF5en2r9XAR40AnTUNWMK3uPmGuENWw@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <2026101318-stingy-crescent-b47e@gregkh> <20261021033257.1359428-1-cmllamas@google.com>
 <CANiq72nHP4qiHE1=y2nhF5en2r9XAR40AnTUNWMK3uPmGuENWw@mail.gmail.com>
Message-ID: <atiKAh5e4BjYgHSu@google.com>
Subject: Re: [PATCH v2] rust_binder: add state_hashed and transactions_hashed files
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 11:37:26AM +0200, Miguel Ojeda wrote:
> On Wed, Oct 21, 2026 at 5:33=E2=80=AFAM Carlos Llamas <cmllamas@google.co=
m> wrote:
> >
> > v2: open-code the %p behavior in MaybeHashed: No "0x" prefix.
>=20
> Thanks! I think we may want to have an easier way to do this non-`0x`
> formatting later, centrally, even if not as the default (which I am
> ambivalent about -- I didn't hear more opinions on your other patch).

The version that open codes it is probably what we will cherry-pick to
Android's kernel branches for now, but we can definitely look into how
to best support non-0x prefixes in a better way.

Alice

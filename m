Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0912843E4AB
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031516; cv=pass; b=ATOqDoNG7vKBwWqc8q9OMU2C5Of9Q2Xd3Zj8/OG6uXiZf5/x8Q6W913iSggkXlc8fQzdA/TION+WsB06GfZ0C0CVBfhO7pjXzEVuAsZmuyCWizfkhWBLkqhpNp8G4Cq6tn8xOOlfEOWJu4auErESTxOjf0YJ2v7H1XWOBN3TDgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031516; c=relaxed/simple;
	bh=Phsev7En5/v5D2VkKuO7WGNHJncWPoz7xj8eT6fdFqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4JnwG7SLF6vafEUrNsoCMj/s+ZSojb6SpQ405JQiA3RqP1/fWrx+Rezhh80GRrvJSjoIseMSC9T3CkGbYdabv2URIxRXXwqh7La2xKDml9YKglW6af9MCdsiWQxogxHUHeYQpxppgNT4Bti8TtxCswkxAzLJ/jDcZE74fyfE8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKZmbycv; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKZmbycv"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38096590070so709370a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 05:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784031514; cv=none;
        d=google.com; s=arc-20260327;
        b=WqCnWnp4saK16Tr2TlWJvHLbPzRa6pXnstcR4wQvrWvwii2MeLVgKqT7oNcR5ivHPT
         /lGf3jMPOGwjtjLTDtYmzSig4m5GV6n8h6kvaxvpJUrZyAPhuPtJyDQTYH96M0SzJYRo
         z72wrJSPWFqWZkhfcQHSTmlM1Lb/zNQl2CM2FKbsdydDgoJrunqrxP861hIo6G/iqHNb
         OAurc4xHIzG4vjd+ThAHhCCeoK76kOAx44x7E6X4Zd2G8KO3cw2PYdBVudRV2lfxdwgl
         cHZI9k+by+uflos1xQEx2musL4ZE9lKIMNQYw6O1iFdjmMmRVg+cQ0P8t2SlpP3bNzCT
         4cFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oeaIxPPErRbFLFeyp7HcdPPuVXRJDKgFysfmVVvL208=;
        fh=ox5Pi6Fe5Uyw6s7MG/LICQLARcRxDiAbK8lFQgT83cc=;
        b=e9UPhz9Pu+Nqf15p7SOnGkrxG1RO3VahmwA2LCKsihM+SOvYlByY7ZALNI+V4j8sSp
         Sq8VK/iwOTxshWG+Xu3yji6t4mxXSF/cNpaqA6mtwM8ows3etgLrM5quugo83dpatz0Q
         yxsMQRo8sGJJL2uTygqxdvigGv972fJ1Y+s7qKDnEwHHgOk1o4bLwf7THaQPeG75UvC0
         unHu7gzNmfrOyo3CMjxY0ELesmW2f4NM1G8Gds7mihhbqT3vfNNz7Akxws3NO1PvL5vE
         3PkvqlyLlVCzOCrThKU2gnij8W8e9Mrct+SpWFiTIozmWEXLA2axz7GvLcm4wm+ZB72t
         dEHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784031514; x=1784636314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oeaIxPPErRbFLFeyp7HcdPPuVXRJDKgFysfmVVvL208=;
        b=mKZmbycv5Yd1ZMJu/5LG6/r6vwHkPLLkBEwWWOYWzVqQAgMKUWXODuthb7IKEWQd3m
         kGeWn173fYZOUrLbNHI/xpoC/+9C9tLVdIOyoSjbD2M5Co4fXiGUM+1mz5HxtGR5ZvH6
         xe2JPXTHUd3ooiM3gDmwj/6/oc//ULAocO1JmZx+djUKogbUVhMRboRn6aNUT3TCtxm3
         VaE/ZaCBcbRKw52F1fBpzvOtKWoKD1rAcwCSl43sqQ0//OfhitbWTBh2k4Fyr9TjZ5vM
         atNCgz5aB7zW6ubVct0uJzAx3pJdUt3iuJFmo/1cWhmtODwFQCIDOSNPqKfy8XZte/cV
         m6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031514; x=1784636314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oeaIxPPErRbFLFeyp7HcdPPuVXRJDKgFysfmVVvL208=;
        b=bKxov2aukSYqaiFPW7griOVUUSmiQ+VakByyAZRBOgpabbTyDEMVQ94DNRFCJ8LT5x
         w3OgMkcixdSOITWO/iPJJMed3EEHdKTdf6m3GryJLhQJ1pYbPRzSmJlcY0EFmACNdmli
         hFtzKJlbuBdk9wTUZxJrqEuLq7ozQH0VwSpsbIH6sW/yH4IfZatA2VTCpkaIjDdIVRLq
         sYraddDdteQBxJq8C5uWBJakoH0Rr4E9x1h/qZZrvk4pfGTX+H7x0Kih32Kt0gD7YwcJ
         tqXcWlQmaSDTZZpcEj1M3mPraDfjSU2Gvc0e7a+x2WPMWaBAufZ5tLkn5Q96+IXsV9dn
         p7Ww==
X-Forwarded-Encrypted: i=1; AHgh+RoUkz1nS5LcKmbXhYIWZgd7lGZm8ENM5zh7oVZnChBEmvwIXacNuvOlHPS8bJLY+oegbtMB3V3PMOO7YlCMLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6shyQ8r8i6x80mEIMDIiix39b2zrWm0pHhHh7SRSyRBEXIaGN
	rozqaMeym/kpcRt0jq5c6QX25Y6YxkzzDRXD7kjfwQlOehAA9yc3vdzdGNmXnE/5NmUgooWeaw4
	WwOrimBIprcwBfHzjRbKavUz9DZkmi8g=
X-Gm-Gg: AfdE7cmiLtbnoK7cjDUk3WlwyXW9du8VeGBf6D6bm2HHZh0g82NxAIszcBUJvvQyD2h
	oNyURYq1bvHtigrXBMGjKGfvXOyDKxmzv2kNsAwjR3DLTbQKBjkzGQML72nUJAuEahdDJ+9a/5k
	12TqBp0qmj4aB0nN2+I/p8opm+Jcwdt/eBH+mFtGNGWhWJQPIguVrgjRb1knyvzXtzxaqD85rxG
	zgHwI9wDz+OIpBRwaoeaAtVYC875S4Ge1d3PoCfBjuY0pDfjeWzUka/63LW+/juV0I4lDmo8OfO
	XqQpzuG+25+tjHjKhyQrIl9yc7FpfP9gRfrUAgXqUkNPThCtRk/VhUJKXe3hqU2XLMsyGCp26EP
	vsYVjJ+g9G9aQ
X-Received: by 2002:a17:90b:5870:b0:36d:de94:f31 with SMTP id
 98e67ed59e1d1-38dc7c44fd6mr9877894a91.7.1784031514278; Tue, 14 Jul 2026
 05:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72kMWjfk9u_HiYsGWYGnKaF-oOn2w-kH=ap0wO9QccZYEg@mail.gmail.com>
 <20260714.191642.1103024240790648142.tomo@flapping.org> <CANiq72m+mx-z6idfdTLh+mcW76nxRr_eA-a6vgjFY6a1GE_ygA@mail.gmail.com>
 <20260714.194916.571807180513332641.tomo@flapping.org>
In-Reply-To: <20260714.194916.571807180513332641.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 14:18:20 +0200
X-Gm-Features: AUfX_myCr_GHTYR9NxTPYnowrENs6xyjH36Emvm7Nh4MX0OoFK563e9fyL4fjdQ
Message-ID: <CANiq72=SzstOfEsvdyahUdzKTxVRbTeCdQosWnwseF0CwDBOJw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, lossin@kernel.org, 
	lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 12:49=E2=80=AFPM FUJITA Tomonori <tomo@flapping.org=
> wrote:
>
> As I recall, the last time I posted a patch to make them constants,
> Gary was opposed?
>
> https://lore.kernel.org/rust-for-linux/20260119233621.3465304-1-fujita.to=
monori@gmail.com/

What I meant is to have constants in the example itself rather than
the full number (e.g. if we have two long integer literals N and N +
1, then defining N rather than repeating a very long number), i.e. as
a general principle.

Having said that, if those constants are meant to be kept private,
i.e. if we don't want to expose exactly the edge, then we can just use
another example and/or move that particular edge case to a `#[test]`.

However, we do already expose those numbers in the docs. And so your
patch looks fine to me. Either that, or we drop them altogether from
the docs.

So there are two orthogonal things here:

  - Whether the long constants in `time.rs` in particular should be
private or not. That is up to the maintainers to decide whether they
want to expose that as a documented fact or not. If they should be
private, then we should change the dos and move those cases to
`#[test]`. If they are meant to be public, we should use your `pub
const` patch *and* use them in the added examples.

  - We should have examples and possibly `#[test]`s in these methods,
regardless of whether we make the `9_223_...` constants public or not.

Cheers,
Miguel

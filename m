Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC122C11D6
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296103; cv=pass; b=AubIIuyxUgx0guDTB2/YukcAWcCdTEb+GAWkGL7SRLcr/uEgIr+dKB1dej7KmW38BIpwpYD6ifFhUSoBUbdSiazpc+j6anrdoPjrq+OzfBgo91KEC9wN51qGMrO9pXVsv1QrxbHXyB8tZ4pfNaBQentbhGP9l9QvlmtH1ysTuYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296103; c=relaxed/simple;
	bh=xUJhbj3yyPAiqFDdLRL6Vu2BwchblYlCM5Tj4IDP928=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rx+z61NBzaRZ3iBTTwY5S/J8fvOxynWxMw2z6IXO6qbC/zqFZu8bIfqW/l+Z5NRGJJStfdIUsOL1nMs9bPJQbnn+S1WlHgi+nYUPPe5rPanxnbMcQbYxUJoGin4crnIEmcTw1uN2RoOvjFKpcjzXNuW3H8VLRdnK9Puvrex0iRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q48g3ktW; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q48g3ktW"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de0093c42so3656056f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 06:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784296100; cv=none;
        d=google.com; s=arc-20260327;
        b=ezcDElXQgv/oqizLcTl34VxlFbDVxBCyPdjqIE7Z9QqmdpLzRAZh//ZsUA8/2/elF5
         Pe7rS3cPBQgGG0cm6LckvBqYkLcaJL4OCHGrRGKEoa5hvaurekoVwxwHj82xDf+4EdSb
         VSSZ7h5kcwRj15A/I7H/ZGSPawn4NKaltXOWNrM9zPzX6/K2V5K0CVdS74ziEZPbjqfB
         WUfGdJ9p+q/HOWaeqxDOOppL7gUScNZjlyEhPpGjxdHfdjhiuECUhW8yrNt6p2QaIU4k
         6lYLeeG7hlhSqSFLDi/XC5Ordfc+6mR/wjo4jLgAM6qvtvLO5+CqjAccZZI4CkaOYzi4
         ImsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+k8IhwEuO4wsB0kPzrLtc1OfuFTTs1CCMQ4oQVoac2M=;
        fh=NRWcopylafQykhSkEDaXJfgcz3PQgvblurcoSCdvX9s=;
        b=grXqQ7isKIUen5uAlylN5nASFTXQbYFaXDkLh2nZNk3dY83AfjFe7t0AYHH9wdrzmB
         4/jnAY0eTHWzjN2G+n4wZBEavraVTzEkx9w9oXF30/MqMRL2851U3z8J3CE8VLRmSyTb
         XZIEbIh6xLlNl+YH75FnLdz/pK91vlWcl6cGK+wrEp5NIAk+NVJ6sgqTbWkU9TduMkof
         tp5j5dVoOqUyc9G/RR05JfYffb5J4PzE/lK1iCR7WudTWbCZLtQsN5Vwilpzi87rMuNV
         qJ7cvhjGek6IGJYM2ACr72DatETOz2XypP+72aTkmprzShAiBkzDQubcFw8VBSmNjgic
         m4tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784296100; x=1784900900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+k8IhwEuO4wsB0kPzrLtc1OfuFTTs1CCMQ4oQVoac2M=;
        b=Q48g3ktW55a2swGxdble1hSF3IKRv819Dn5QE6Y50tVs6aF6EDjnT+DKxBU9dt2ZDq
         ZYG9X4EL4kl0L7toCJ+25ELL9ZBP/ig6SPJiRl6aWlcYbXaCCUAjYwbIPxaXZfT0Tsf+
         SGnVrGN1o48OOMmbvKsSGz75SOxpczNjdk0vd5h/jMYKgPfERTfi+oiviURnyJCj+bC6
         0xgUTyF/fCzXS6/ItSI5/r5hPRJ0nTPb7+542bRrkhvaQMDp7o5t2TI4nYu5IiIRIQQ1
         Aoyapxr0BNSUdNZ5alCdNL47pQedSussNG0EVnHR4UHHHqQVn6oyc05FA3H6luMUbkeu
         17jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784296100; x=1784900900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+k8IhwEuO4wsB0kPzrLtc1OfuFTTs1CCMQ4oQVoac2M=;
        b=UB7iR3d539UvE6W2m100HRkAOjtjDAt5zIkp0stXiOEt8mcafnXk+eodE0aZolMgnA
         CVqo8xwEN5DCqHBpsqLJXJfTqlTE+NVOvTq3w2yi9/I7lyEMa6NzTCR9nYv8g7cBsgHX
         nGI/adVdZZRDFccd+j3Ks9WG1TnstrUuN8eoWeyEIMmMDBJVf3yUg0e/tN9BDokFslTZ
         2AOe4ZADry+ocVvqtGlCDIlc9GoSHiSZpr0J5IoLx6pFgXF1q/sqITgttzNhGOsVagGr
         Xxha/bCcwlVKu8iB+0xN72poKlxGbJ0HQ49uv3Xl/WWNahsfUb4nLzga7tcqdCs9Y87g
         sMeA==
X-Forwarded-Encrypted: i=1; AHgh+RrGwmzT2TPhSjirTMY3Xcga6tWy7PDKOcVcr5bh09kVPYOgh+vaW+WrDTVyfKqNspCsdWERDLxBzCtjnvt9QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLPIY2QTjr3cCUdD3O7yNq31nIK04sAUPOOcIkTL7kKL04HnV6
	PCrYqEf8JDqvoyNrT6eIFpUOKhEH7L0OeAorZQ0NeatupajbMEJ3HKN4N8TzuUZ0dk4eEdcs5Rn
	oYe6d5Jir1CqpV54M3WwUlpwQ6njPpRYOLWi8dZqz
X-Gm-Gg: AfdE7cm35GD5PYqTcLTq0jd00QaMC0JsCPDzGk/DBxIiw+2STa4oHIrJ5mSKcP1ddRh
	/tWdDGloTYt6zicbZUiRxOptLCetmyF6UAbhlRr7aAxTTtB9FtwPvsfxw2iU6jlqDzD24dMRgC8
	pT9zYWNBd0YqgPqQvQiVkoO+5ufpZBOj+2S6m9xF/miilL6WS/XzA0BG8JvhJDLs2VWsch5tqbF
	+zbafbjHa7mUfPmAAmdWcyhitfj4vgW5VuInTm5ojY/h0Tou5SQJxzjdyCj7uow7ExZwjCvnnSO
	Gl6cw6NjR16pgRMTHCzI+O1G4K8ppFenXt3+44XNsWf8IdDw
X-Received: by 2002:a05:6000:4305:b0:473:c18:f2cb with SMTP id
 ffacd0b85a97d-47f622f94c7mr3837445f8f.18.1784296099552; Fri, 17 Jul 2026
 06:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707-binder-noderefs-spin-v4-0-7c3c8bc16339@google.com>
 <20260707-binder-noderefs-spin-v4-1-7c3c8bc16339@google.com> <2026071755-covenant-shining-6910@gregkh>
In-Reply-To: <2026071755-covenant-shining-6910@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 17 Jul 2026 15:48:07 +0200
X-Gm-Features: AUfX_mzYRAD2zHwodrs55ChKTGt3WvYOr2EkVXlmM382Q173j8KxINpvh3q7dFg
Message-ID: <CAH5fLgjNm_aHLTE-XH=S+nukEW0o5MLe8Uih1nmn6io7e7fDZg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] rust_binder: avoid allocating under node_refs for
 freeze listeners
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 3:20=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 07, 2026 at 10:28:51AM +0000, Alice Ryhl wrote:
> > The node_refs mutex needs to be changed to a spinlock, so in preparatio=
n
> > for that, update freeze.rs to avoid allocating under the node_refs lock=
.
> > This is done by adding a retry loop so that if add_freeze_listener()
> > requires reallocating the KVVec<_> of freeze listeners, the caller will
> > allocate a larger vector and retry.
> >
> > Analogously, the remove_freeze_listener() function is updated to return
> > the empty KVVec<_> when it is no longer needed, to avoid calling
> > kvfree() under the node_refs lock.
> >
> > Reviewed-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  drivers/android/binder/freeze.rs | 65 +++++++++++++++++++++++++++-----=
--------
> >  drivers/android/binder/node.rs   | 41 +++++++++++++------------
> >  2 files changed, 64 insertions(+), 42 deletions(-)
> >
>
> This doesn't apply against my tree now, given all of the binder patches
> now added?  Can you rebase against char-misc-testing and resend?

I believe this is already in char-misc-next as commit b9d17aa74ddd
("rust_binder: avoid allocating under node_refs for freeze
listeners").

Alice

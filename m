Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24201CEAD6
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Nov 2024 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731681672; cv=none; b=FFJxF/3xnQsXxfhOPmQpPqOJtlU2FuAEQ/0Wwx5JsgMqTxVXYSMVGhUb4X+4qoyWnf+PGh5D+qr9azGp8OKqd6kH83TQwlE/CaGiEJ3q/bpBS1YljPJjaXGV45UO2u2LAzjgpfox2pAQ0pTMGwPL3LRkcMEmohNMAkPHmn07g4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731681672; c=relaxed/simple;
	bh=CRQn+tGQa6XbNRj3SOvuXE3AM/Uz3e4FZykxRrdWx1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGQvJpMKvgmCc3WOhSdmMzkexw+aRKTj2MgTH2rsv1PjX8SS1Al9Ghs0pKS/162J9+m7YLm9rgqoaRvgqxDa2vYTvIk4+JbPucWSflSCkfDYI00PIBSvOg8IMyy3kurQ8wnkHzh9l9EovGSaJqTv4IJzCM9vuOHK8XR06VE1ub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZclWJpIe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZclWJpIe"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-382171fe8b1so1195771f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Nov 2024 06:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731681669; x=1732286469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buXxOe83u3FgQFJ8o6x9jmB8gLX8VUgcHKKTNzyTu84=;
        b=ZclWJpIeqSMkeWiKhulBK+yeFG7YSobwnIBDlNNQ/3aoJqs6akNJcWCuvJiyHwcvXl
         85prXCFHC40tlT9oT2l3dQYuT/PW6BA5fNwPbu9Ij4PlVCF8ZUAJJJEZOvnf4TXDIZ+j
         ry3JRb8ShyQqVYfQVr78rA3ZqBkCAK+DqTaIfeJfuXWfEvviQ59Ra9fladQdoAjx7kJl
         z/1cYuPqFp/cnWSaEZ4xbkjm6fC5mEz/hw/hBW7Fn+kubDi72iDcCwTXMdURyzPq1tgo
         TlvdxPZx2qzQj7U/K9nIUVrmcDvOWlu0mlIhEQeM9ftoeLYxbtkaweYEry3z2foJ10uE
         rjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731681669; x=1732286469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buXxOe83u3FgQFJ8o6x9jmB8gLX8VUgcHKKTNzyTu84=;
        b=O/BEejDrhCivYhcTxXLTYXLxu8PiuRjabCpDXxTdbSYs5O5cyz5OMGeRe1fXcK/i2R
         1thid48VNrzweGw9/xqnWrnRlEERtPyfKoc7pubJ03Vf9WDxVoB4zpVX6uxc08Z6K7kS
         X1tbRwIIcQkjYtI02NS7ZCvx2CjJd2r8UKXbBqviCMDmkSzDKtp2Vq4CdUUfevA9R6Ww
         EpWy9XfjOY/hNxYTwVQSFZjYzoU3cL4ScU9YPxpgMXu+V6begsX+aedvjLkFlgIr9B/h
         8lu4Mi3F6K5fpAGoZhJ6AIuy+uIGQ+OtoBV9/c2ksFSh+No5Uo5QAoaK6QD5oRqycFlB
         3ZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe9KXpzwFBHp35AFgf9hGY53IjnAxjDeiR1vQD7onWZZJwdy5GUYNBF2YnrNO6dzkIekoCpqNtVyTY0+gOqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHgZ1gPJ6uIWtvR632KTx4DGGrGjR6h51DRHcDZn7hbebIBeHD
	G4+7DoEyISMOhJ03RE8y7o7xhwjiIH5MlMDY5mENPRkEc4W+wC1lCcYED2NSCAN07Hct6Lr8Cby
	hQ3+OFCxmcXVDZkvc3M/hSXPZOruWI4X4fhy+
X-Google-Smtp-Source: AGHT+IE/0bNrpbw7OSn/X/f0vVquy7N3e9FpffUmeO+beNbCkBmxfrwSIlCUfcKFprzsVggnB0+Ec6ks+E8W2GbiM6w=
X-Received: by 2002:a5d:6d09:0:b0:381:d133:d541 with SMTP id
 ffacd0b85a97d-38213fff9fcmr7260515f8f.11.1731681669357; Fri, 15 Nov 2024
 06:41:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113-topic-panthor-rs-platform_io_support-v2-1-0dea1edc3a49@collabora.com>
 <1C6A62A2-B723-4066-9466-C3F0F9FB4B3F@collabora.com>
In-Reply-To: <1C6A62A2-B723-4066-9466-C3F0F9FB4B3F@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 15 Nov 2024 15:40:56 +0100
Message-ID: <CAH5fLgiCgoUQLgZcd-w_PGjtFHYdFxsBFezoaFeyZXnBxY3O=A@mail.gmail.com>
Subject: Re: [PATCH v2] rust: platform: add Io support
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 8:43=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi all, hopefully I did not butcher anything using b4 this time.
>
> See one question from me below.
>
> > On 13 Nov 2024, at 16:30, Daniel Almeida <daniel.almeida@collabora.com>=
 wrote:
> > +    pub(crate) fn resource(&self, resource: u32) -> Result<*mut bindin=
gs::resource> {
> > +        // SAFETY: By the type invariants, we know that `self.ptr` is =
non-null and valid.
> > +        let resource =3D unsafe {
> > +            bindings::platform_get_resource(self.as_raw(), bindings::I=
ORESOURCE_MEM, resource)
> > +        };
> > +        if !resource.is_null() {
> > +            Ok(resource)
> > +        } else {
> > +            Err(EINVAL)
> > +        }
> > +    }
> > }
>
> Should this return an immutable reference instead of a pointer?
>
> Once the pointer is known not to be null, I think it should. So far, this
> is the only place in the kernel crate calling `platform_get_resource`, so
> there would be no risk of breaking the reference rules and it would make
> the API more ergonomic to use.

You should never create references to bare C structs. If you want a
reference, you'll need to create a wrapper Rust type that uses Opaque
so that Rust's assumptions about references are not applied to the C
struct.

Since you're just passing it on to a C api that expects a raw pointer,
I would say keep the raw pointer. I wouldn't go for the wrapper struct
unless you expect this to be part of the API used by drivers.

Alice

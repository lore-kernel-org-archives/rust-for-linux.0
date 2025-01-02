Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3999D1A8F71
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jan 2025 21:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735852398; cv=none; b=OjQg9xu6YEx148MXS/2at3wRZbFz1jO5VVrCwKa4NdKlX461KP8RMpUVox3CgoktUS2dhXxUP1V0+eS3PRoEfpotF7LN6N8pqVq7zfLYhF2qCmaq0Hi0pRRszMSYSdwLoNWhKXdzX/i5FGsok5PQ+BJ/p/g6k1xYeq62z65HCMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735852398; c=relaxed/simple;
	bh=ZCPjk1VSEOoj9qcGvr9INHgp3+iPxgC7iRxlFjdwm1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioT2AOzJVsLyYlGWzzYaAL3TOqdkqoGlVuj9/QotkHgn2FLhzrMlRXuyuMDU9swJKwC1r7Yrp9/QZcJ/Cl2B4lYxbdhVFitYTgXCEJFEPtJh4AwqzkNU6sfsQ4R5RYTjVPBZ/Shalw8FdkfOVzUg3yAE9bXYYKSr7WW6Bgj4JYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z8xzJtP/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z8xzJtP/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3cfdc7e4fso2244a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jan 2025 13:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735852395; x=1736457195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvUkrZDHA2r06RrENG6eOLFTdRhJU/aQsdXibpnme2U=;
        b=z8xzJtP/CSrxsPg8sKrDrNleaJZFUB6HwJ1tPniAn5Q+gvUQdRc1bzBrWLeCeKgPnO
         9R4Z+og7IAOWPHUBwv0PYWdAJvWIcXlXBna7Y+0GgBIhIkLJ1bQFVmT2U6BVRgL4EBUw
         i8Gb6OBhgeY9VXxo4NuhIdi+SXY/T1g7nH1RQo4jdUQTOBAzUHsywVM+EGho7fg8wuso
         JPe4mcDE9OK2oCqA59ndVX1F32+C4pOETi2jU8jkrvK5MrA4y69SEkNKEiLzmVaPGTe+
         9K181gOy6+e8LQkrTNQ4HvuIaK5s1MbYmm/zQIgPqHJjOmVh+k5bmlMK7Gcay4HzJWMl
         OMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735852395; x=1736457195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvUkrZDHA2r06RrENG6eOLFTdRhJU/aQsdXibpnme2U=;
        b=PwrNRZa6LuF1FlO2OeCdY835gh4PkoYexnYqYwpmy9kVjPz/nPIaT/EsRRuiYeAfFF
         qk/CxHThDjZmrMMt45Hy7ID4W5lek1n2NFKj2RPbjsK+1/sAC6ioLBsZvoRL/vvmO54d
         EJ/CN79QCyJALkUOl9KLfEBi0grEb7fgUBUXENoCwlVn4lyqY4Ze65DOHEYDqNQTNTRD
         Co2fLPQm087GSTPO5sI4xpQHC1qCSiRHMDk0DWynBcBOjfFNkencIRYPlVYf98GHgM68
         G3+e2Jk+XR6z8BE37Enng8ykZ0GMS4jv9TqRIa3j6IgvA4mFagxEcttwOMK+zOHqXo2U
         UkQg==
X-Forwarded-Encrypted: i=1; AJvYcCWlE2UtFaur0IiZatcfikvBJ2TC3JN0KGgZinV5FeWOqwUmQrCtEUugXBdQGw1F1R/aeTIIfnT/sS9YQRrH5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV0i2nLukbEHspJmDcvY20eU79i4V6iaQjb4hizb+sBC0fg/F4
	zAb8IPtroeI0lSuyY75xRf43inCaCkAoFhX+X7ITzcvqnJXpU0q1iMQIVMOQrvRx163W0kmUuPa
	Lke/r0O2wdUZAdohlnTwbFZHbl5/MBTAq/zJd
X-Gm-Gg: ASbGnctzvYb1i845rfU87Uao4sW9OKXYgU/j8mA1W0/mi0UeoHd+DorsKHAs25yF3QU
	3p9xF1bxQ9C1VjdiyFVQjIPF1SxIU0vW+coXOdsoaCAUiEI7OzFWYok5YKprZpAD7Ug==
X-Google-Smtp-Source: AGHT+IEtlAdtAQF0lMpNHSAEsc7gKMjqxf9IMXqHQKnDEMEIOF1Cil022qn1qEqxWg1zVwXIF3GwRL8uUgt3sTNN0l0=
X-Received: by 2002:a05:6402:538b:b0:5d0:d7ca:7bf4 with SMTP id
 4fb4d7f45d1cf-5d9156e2c80mr22824a12.0.1735852395426; Thu, 02 Jan 2025
 13:13:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
 <20241219210736.2990838-21-samitolvanen@google.com> <CAK7LNATRGzGjLLcv+aD3KdgkZXzwMsCSud116rzEThNXRQC0rw@mail.gmail.com>
In-Reply-To: <CAK7LNATRGzGjLLcv+aD3KdgkZXzwMsCSud116rzEThNXRQC0rw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 2 Jan 2025 21:12:38 +0000
X-Gm-Features: AbW1kva22k7lR6mC6lLzzh3eFbyjqTfNlFADg35Eb_8EP8gJ3kl6j3JlF1zhr0c
Message-ID: <CABCJKufXd+JZBm6WPZG8e+41DSTVC3-t33CbuOC-L4poTRQfpg@mail.gmail.com>
Subject: Re: [PATCH v7 01/18] tools: Add gendwarfksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, Dec 27, 2024 at 6:02=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Dec 20, 2024 at 6:07=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
>
> > +int main(int argc, char **argv)
> > +{
> > +       unsigned int n;
> > +       int opt;
> > +
> > +       struct option opts[] =3D { { "debug", 0, NULL, 'd' },
>
> You can add "static const" to opts[] here.
>
> I like the array initializer formatted like follows:
>
> static const struct option opts[] =3D {
>         { "debug", 0, NULL, 'd' },
>         { "dump-dies", 0, &dump_dies, 1 },
>         { "help", 0, NULL, 'h' },
>         { 0, 0, NULL, 0 }
> };

Sure, I'll change this.

Sami

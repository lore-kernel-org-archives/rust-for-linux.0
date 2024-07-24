Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE98F15E5BB
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jul 2024 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721840705; cv=none; b=O47+Fcv8CcO4wKAysLo95S1I0hxs7e476/yPWDHXiWLnUfWCGSDX0xqxlA7e22CP3agaSkgPA8V/IG18IwLOi0MYLBI6cOp5uu6i+zX9MSIZWgI8laZka+vdl4tknFnexf7zUzY9t7a+AmSFCvjNVlyh7Pcrf+5QD+FRzJj0D7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721840705; c=relaxed/simple;
	bh=2Bz9LEUG5IRIBnqaD+mw+y/DTHSwXPPuolZ57c8CUOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAclyO/uT9AmBFinVbKU6ykV6yeo2wUSp/Q79blMHA8YgePPyYkDxRunW5veNZ5Px/MnWJT2run4cZzuRHr4eeYplCk7gHzwDPWiEywt/icpm7JyT9C51sU763ZShmYU/Jhk5bec1K1nIVAWS5JM0TWosXi/nZIQalmucAnBhEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZTdDl021; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZTdDl021"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7037a208ff5so3987835a34.0
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jul 2024 10:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721840703; x=1722445503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Bz9LEUG5IRIBnqaD+mw+y/DTHSwXPPuolZ57c8CUOs=;
        b=ZTdDl0218icOzhXRxV8PNDcWewDcWDJg/7il0MJhV1wyoQFYzwubnpxXYSpPN7wLHK
         lGRJflvoiynVCfiEXmhbWj3UGmPXd4sKCjfSDUDvLoGklojFsfYWulGVqKbN2eoJ1XE5
         vrtayUVzRaAx199NcSPQJvC76x9UbDxEeyN5BvOpBx57vCCv0yBjUM3cyQlKDmMQ2UdX
         jhn78hxdiJHy6sY0iRFa9P3T2za4KzTm8/YWIt4i+1MIzX0bRIzVi/Vj5qbLVOppapDp
         uD1Pm49HmdFh2YfLkxnZwAgOgnSjEy3qaZEZK+N9aC3Kaaf35Yy50r/bpYZwfk4xKH0S
         A6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721840703; x=1722445503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Bz9LEUG5IRIBnqaD+mw+y/DTHSwXPPuolZ57c8CUOs=;
        b=p0/zXexQsNJUSFpdjraHMcAw9Q/zodQEPHRd+JNiawUBw1AOKM9E/mRNaRIJRAhkD5
         SCDLil6tWwPaR3VQZQO4PoeRsK2Zo54pC1m7x4AQ1QNBaJPdfWECqOtfFjD4gqaaswLc
         odRMu1NUBWz8GlxJEVFxlys23kCXPk2ZSUksDP5UvjvncN7/UZTHdNdLZm8uMrtw5VyK
         5isNAQhEyUSXwi47O8YAROPgsGNlyIcPoLKYBN8gpcQCRaAMmYcQqlxVl5ciGvR2OlPP
         vN9gb3Q4ErsCCej46yF6x56fnH0qOheBwZXAM4rxRII8T+TFsqUDWfSPtQ0H+aaCSH6Q
         G/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHTA1vn9Y1apsiZU0ihb3k1Ikqv2dC0fIL5GiYwfhB6YK7TcePb4dFekxmGHsK+sZ38hj6mZv9vUUaYzlIm/INDV08O2+tYNFQ88rx0KA=
X-Gm-Message-State: AOJu0Yy0CPV502heY5JAApCJgE9PS9zpEe//rwlaxWJszTy43hbeCl2N
	mB9XM6sBjoV6r1jachctzqsIHt1wAiqhd8kkJB5YOs2AXFenLgQly6yjGEVfu5W6frNMCpTtllo
	IN+URPk2Vke2lEivgs1cuS/sZf0DtKIxRrKe/Hs8zIelhyqbGwQ==
X-Google-Smtp-Source: AGHT+IH5qu5Pd8+Wc1JJyMKIDTSnImI5ORd+5pnxuYabMb0yDNFZtWUMGOB1Qib+k8k3GVaD7dTdh2/YBJzda258UN4=
X-Received: by 2002:a05:6830:6005:b0:703:67f8:9b3b with SMTP id
 46e09a7af769-7092e77b710mr418087a34.30.1721840702560; Wed, 24 Jul 2024
 10:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240705111455.142790-1-nmi@metaspace.dk> <ZoxdRjpy2hRndqmc@bombadil.infradead.org>
 <CANiq72=VU+PHfkiq8HokfeCEKvQoeBiUaB76XbW6s3f2zYmEtA@mail.gmail.com> <ZplNxxXS3RLULeI6@bombadil.infradead.org>
In-Reply-To: <ZplNxxXS3RLULeI6@bombadil.infradead.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 24 Jul 2024 17:04:25 +0000
Message-ID: <CABCJKud=dfBKaCSqW2NbDCiN=EX0hGxkZ7H+dCd5mK_9NbwBVw@mail.gmail.com>
Subject: Re: [PATCH] rust: add `module_params` macro
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Kris Van Hees <kris.van.hees@oracle.com>, Andreas Hindborg <nmi@metaspace.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@samsung.com>, Adam Bratschi-Kaye <ark.email@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luis,

On Thu, Jul 18, 2024 at 5:15=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Tue, Jul 09, 2024 at 12:08:16PM +0200, Miguel Ojeda wrote:
> > On Mon, Jul 8, 2024 at 11:42=E2=80=AFPM Luis Chamberlain <mcgrof@kernel=
.org> wrote:
> > >
> > > The rationale here is that a rust binding means commitment then also
> > > from fresh blood to help co-maintain review C / Rust for exising code
> > > when there is will / desire to collaborate from an existing C maintai=
ner.
> > >
> > > I realize this may be a lot to ask, but I think this is one of the
> > > responsible ways to ask to scale here.
> >
> > But, yes, I think Rust is a great opportunity to get new
> > co-maintainers, as well as getting new developers involved with kernel
> > maintenance in general, which could help with other issues too.
>
> Great well then my preference is to not have Rust bindings for modules
> unless the Rust community can commit to not only a co-maintianer for
> both C And Rust but also commit to not ditching the role; if a C/Rust
> co-maintainer gets hits by a bus the Rust community would strive to
> look for someone else to step in. This would proactively help with
> upstream responsibilities understood by companies who hire developers
> in this context. It is why I brought up Andreas's work, I already know
> he has a lot of work to do and responsibilities. If not Andreas, who else
> can step up to help with this, Sami?

I agree, having a co-maintainer from the Rust community sounds like a
good idea. It would be great if someone actually working on the
bindings could step up, but if there are no other volunteers, I can
certainly help with this.

Sami

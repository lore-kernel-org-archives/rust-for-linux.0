Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734FC1D278B
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805825; cv=none; b=jcFGrp0BolJTahrsL8GssODqxTehrJF5Ec4pgZY7Miho6geF6ww6uEHqystoxIFXbgRk6W69/GEs1qBclu4FbUlEYSjSD9Ng3PhyEuwk5rVvTdpHExbveqfvDf2FzbPtPApTnC6dCayYP5jsPcpZ2ZfoYpZ63s76qXXvTaWMtE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805825; c=relaxed/simple;
	bh=ypIHrGNLHK5uOyIsDrC7vwvTgh7KZ/FTPANjwfsZLYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UTwOoQihiWaTu6HD8IqiF4zFa0W0m3CEZKoDRNBgcSfsmUjvyevj/ZW4W7+0Mc2uEEVEHtRjRTcJ5DdSPYfO2VU3MOhiRGFMYfGai4MV2IROTjJ87FWXRg+NTmuz+IlHfdX0eMJlTY7F+Y/+DglWvljR8DNe4LCorYkLEoMrxUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeIo3/DX; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeIo3/DX"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e9f377a3c9so729550a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 03:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730805824; x=1731410624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3Zb9x+7vJiaq/rcvxeP7/xGY1k1MHjWK5mZunbxww4=;
        b=HeIo3/DXFfz01aYGOA9gGD/JrSFGSfro6CLNPXjj0d3eUZc+sjjXhDm3kKXX+wF+Nz
         3C31hGtorpfFahUBZOf8qpqNaMFo41y5DJS1IUZ6vm1Caw84K5c2ZUW7Uv6Cq9TUvDbx
         l9QDml0yO5YjT5s98P+HS6je/Q95ho+n3cjq4F2Jttg798ZsRfqtWRl40JiOI6bhwjQG
         Mdf4DTOMxuqiig5Hs7ifFpzELfy3QbSs/eEPzJ+wi+2JiT7z9WHU2L/JKVvJVtasn8jz
         QgG2eUvC/W5nW4RkxBIccwGM5ABmUTybiS+dGB65CR2FwXcmKJ1xx4CEzL9o0O17DRP4
         POgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805824; x=1731410624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3Zb9x+7vJiaq/rcvxeP7/xGY1k1MHjWK5mZunbxww4=;
        b=tpdWM9Vzyn4jDDVERYUohMC4MRe83zr8YXk/Q8+hbPummMXTIFwcONAoEbrMYkgA8X
         0CrBQNWQPCHM+DAdWjd5KOo85DzVXfWHFwZBuBJoCUeqIOpRMyp2icc9DW1FkS/8+M/5
         d5fu5YnQkMxl1m7ctS9zIcdEReWYPOUUASsyofytJu8gziU9+XpRDMz+r+Sr9xQQt4AD
         6iT0ilsH4iQfZFNDvXgiO7FLgJ4QWceXz6CCw8Z7iAGablagjf3o3WN3suvDBs7lXMsl
         xq23OvzWgUyt4v83xbPRBZyrdzKbIjEi8k3Q6Wf/M7enLsXQSObqn0KH4gAMkfTXixbF
         Blww==
X-Gm-Message-State: AOJu0Yyavo2n66bawQSzlp3/Vuy+Wqe3tXyCmZTo0PNta94hl2m/YGVv
	TeTxmzZyvokjtLLQFO57GNnqgx67qblyODyuEGHQUhE+TjQQk6AB9FM0maUq0eR9KJ6rhWh8tVQ
	yIvaPriZldxAm4udri8iHsTLExf4=
X-Google-Smtp-Source: AGHT+IGJs4suo6Hg7Kf+tQLwvTpNxJISJy542bG+PmOQMln1YsZzMkqPJSJ2iZfDEZ9VUblysekyksIIHeHkhOPkegI=
X-Received: by 2002:a17:902:e743:b0:20b:9b07:777a with SMTP id
 d9443c01a7336-210c6c31ad7mr211894165ad.10.1730805823587; Tue, 05 Nov 2024
 03:23:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com> <20241105104726.3111058-3-abdiel.janulgue@gmail.com>
In-Reply-To: <20241105104726.3111058-3-abdiel.janulgue@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 Nov 2024 12:23:31 +0100
Message-ID: <CANiq72nLNQD6f_Y2+jdcn3w_K0oXaEX-Y+mUE6Nco565m8Jzgw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] rust: add dma coherent allocator abstraction.
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, aliceryhl@google.com, 
	daniel.almeida@collabora.com, a.hindborg@kernel.org, dakr@redhat.com, 
	airlied@redhat.com, wedsonaf@gmail.com, a.hindborg@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Abdiel,

Some quick comments on the docs I noticed.

On Tue, Nov 5, 2024 at 11:47=E2=80=AFAM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> +/// Abstraction of dma_alloc_coherent
> +///
> +/// # Invariants
> +///
> +/// For the lifetime of an instance of CoherentAllocation, the cpu addre=
ss is a valid pointer
> +/// to an allocated region of consistent memory and we hold a reference =
to the device.

Please use Markdown formatting everywhere (including documentation
like here, as well as comments). For documentation, also please use
intra-doc links where applicable (i.e. the square brackets, e.g.
[`Foo`]).

Also, ideally, please define/explain the abstraction, rather than just
saying it is an abstraction of something else.

Finally, if you want to have a link to a C header to refer to it, you
can use a `srctree/...` link (please refer to others to see how it is
usually done).

> +    /// # fn dox(dev: &Device) -> Result<()> {

Can we avoid this, i.e. use the `# Ok::<(), ...>(())` approach instead?

I see we got another `dox()` function in `page.rs`, which I guess is
where you got it from, but I think those should be cleaned up too,
unless I am missing something.

> +    /// Returns the base address to the allocated region and the dma han=
dle.
> +    /// Caller takes ownership of returned resources.

Note that this will make it a single paragraph -- you may want to have
an empty line here.

Thanks!

Cheers,
Miguel

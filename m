Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C233FF1
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 00:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742085246; cv=none; b=EHAulEvIwKK8oimj/72hEPRlqGcOh3YLP5DfsRNJsXX/5u+dWCF498+TYj3z6AElm7brC4hPj+2rxc6qjP29RwVZ7xIQM4uyifd2g33fzOL3MQ5jFazCn9cGDwXMgUGOJ4oWwL3LXYIgilzYew2wF4NJ1TnSN80mpu75WJ2EdmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742085246; c=relaxed/simple;
	bh=HFv3f8gddpZ1c65xhjO14KDWFC83C0NJnzSwsrAaaKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lH3MsZ8e2mvnEzNr9XN8DqpnkE7NifQJpZP9vADfkDqnVuWUdWGDrWwBopvCkPNXl8rvvw1GTmAc1+Ox+fKT8xf4rGoTN12QX80P7euQganNd2IcMFhOGorOa+EA79/uJc/3tt4j81ZffhaE48hdUb8jOvqO0/pVKC8uSVqF1ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6XuviD+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6XuviD+"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso36334681fa.3
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 17:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742085242; x=1742690042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAz06rcJ7UjofKDHFyLX9/PsLZScpHwvRonD9ot87zI=;
        b=Z6XuviD+M+n5n9sT2VaiCzqi16P84eMBtR13vvHGjmf0YbnmBTt3d8KWiJopJKUFLo
         6egvCSMsB6qvs2/3kkj8IC/QY5tJHG1BTmPHRMKDQUiJ0WUDvwrwyqTZfPcz8VgReR+z
         Jb5WV9sjxm0lNjCAG9xKchqpuy9mjWc8g7DjNOsuybtAQp33/uGiXIkvL9Um4Qa3pgDK
         LrVNwVe5IZqih0J6z88xwCnN2S619DSNcMoRg/UGnJOjb62Hnqut7R81vx+BtoH44nP+
         U+uln9zvmMrRRJXzh7naMb2T4U5x7fSyyrwPT1EhbLkO/YWwerQQ3L1+fbEhrEufE7dT
         hiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742085242; x=1742690042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAz06rcJ7UjofKDHFyLX9/PsLZScpHwvRonD9ot87zI=;
        b=SyFq84W8en1dtN+AaFcFZ8uIvQX1YOIBJs3engPvuRnD6HLhK1vbRphJXfXE4hugnj
         DG0hx5CnOubrmRCSewSOpTH4YlOkZegA2AHsyMu2FT3EeD7T1sYJvSW/C1wlLggEYqt8
         D9S3fQ506b7s48toKbEixCAmq+tSkEkNkksu4/4rRqIlvS+dvslaiOCNuLilFDwOZqfc
         sHQqsZfoFuoAm4uZQQ2vwjQJzAunvc1ckFKEtfsxiqEXvFl6YJf7teM5QJKMnQuRHWNY
         wEv3hYYaa7eYpeUVxMMBYLkNCYsNywrncGay9Wf8h7TYNuf5ZCDg7Zyhi8Qo6SCUXJG1
         RPBg==
X-Forwarded-Encrypted: i=1; AJvYcCXyZmTIB8om9rIaIFFwmncV5TzgbeSZvzhI3/ZAngP+vwTSMcrfTy/j+LxP5kcpFrEhymmNaAnYgb38RDQ5Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHVAJAtmEahKLrqb+afGtDqgyCvAgqqwDQoHut0eTSZo+HUOdq
	0ReG6n8bXz2+2C7Evh3rt3Y5TTpis8mvQV1WEJ27Nj+zhevFObVUwF6OI0GBKsx0QUdFtw3dCml
	CU+msmlrOvHnUlTdhsLFsD2sbJF4=
X-Gm-Gg: ASbGncv3jBsx1NMZDCkxcJOgSlXSFhdjXlPN0cN/P65YxDsrCc8dJ9vWWov/cRkvG12
	eDwKBpIkDbGzZGlf2wVVkzYD68M0Ole13VJ84D0KLOIcRO0WhDWWVT+6V9sbwdNTnm2c3OUlsqQ
	UcCMYLLzFLM9BJATxRPKY96TBF84opuBm//fdN4ztSGITh2+Q34r/s4BcdwI+J
X-Google-Smtp-Source: AGHT+IGLKKC36Xk8lXgdjuZPAueZNif0wxevBu67NB+7G/k9hEXkNkSx/D88j9uSwd4A+U1H2fdTbb7SflYM9J5Xilo=
X-Received: by 2002:a05:651c:503:b0:309:bc3:3a71 with SMTP id
 38308e7fff4ca-30c4a8e503bmr21083891fa.31.1742085242024; Sat, 15 Mar 2025
 17:34:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315154436.65065-1-dakr@kernel.org> <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>
 <Z9XIk3WpzruUfh6O@pollux>
In-Reply-To: <Z9XIk3WpzruUfh6O@pollux>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 15 Mar 2025 20:33:26 -0400
X-Gm-Features: AQ5f1Jrkzl0FHhLAQbOrnLS1kOwTJMdMAEjEXqOCZ_5MrNu8C3K2u0-FBow6tBY
Message-ID: <CAJ-ks9=vvuXpdCnxPKzDEF_ibxBxzGXbSb7hVGi-vDgZcDQnxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 2:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sat, Mar 15, 2025 at 05:44:29PM +0000, Benno Lossin wrote:
> >
> > What is meant by "copied"? I agree with Tamir, this can probably just b=
e
> > "taken ownership of".
>
> If not dropped in place, the only way to take ownership of the object is =
to copy
> the corresponding memory, i.e. the caller can not take ownership of the o=
bject
> at its current memory location, since this memory is owned by the vector.

I think this is the point I was trying to make: the language semantics
are such that "taking ownership of" is equivalent to "become
responsible for the dropping of", so it doesn't make sense to write
that here, as though this requirement is specific to the semantics of
this function.

> AFAIU, when we speak of ownership, we mean ownership over a value or obje=
ct, but
> not ownership over the underlying memory.
>
> Hence, I think it's important to mention that it needs to be either dropp=
ed in
> place or copied in order to take ownership.
>
> Even if we agree that "drop in place" is considered as "take ownership", =
we need
> to differentiate between the special case of taking ownership where its d=
ropped
> in place and the requirement to copy the value and then take ownership.

Perhaps:

> The caller must ensure the destructors of [`new_len`, `self.len`) are run=
 exactly once.

On Sat, Mar 15, 2025 at 12:06=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> On Sat, Mar 15, 2025 at 11:45=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index ae9d072741ce..8540d9e2b717 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -189,7 +189,9 @@ pub fn len(&self) -> usize {
> >      ///
> >      /// - `new_len` must be less than or equal to [`Self::capacity`].
> >      /// - If `new_len` is greater than `self.len`, all elements within=
 the interval
> > -    ///   [`self.len`,`new_len`) must be initialized.
> > +    ///   [`self.len`,`new_len`) must be initialized,
>
> Why a comma here? There's a period on the previous list item, and a
> period seems more appropriate before the next item.

Did you see this one? Was it intentional?

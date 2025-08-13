Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047662690D9
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 08:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073468; cv=none; b=EP8qbfOCXiTiecxWI1baugY+v+okldjXhGF87qMr2FuGqsQu8BBw7jAOzy2zv2ppbHRPI/HQ1UP8NtweQ5o8zmpskUQuEBOYqvNg2cK4IVBzYadYvcOLLzr9JzDk4pIwfLmgR+7hiwbSVy6d/hxn1bLky9A+p6vB5PhsC2cP0fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073468; c=relaxed/simple;
	bh=i7q6cu4XOofJpPaygp+2HmHMBYvZuvOZRgvH9TX/sCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLh1co13DFBGftQ3Ar1T/84MJrWHLgNrMRGUsfhT3IoSFBwwQVqsbiQOdOm7I/SviJ16Vwi/An5cZwYh2FLROAHgP4PhXE2qJIgnQUep3BAoCQv8khHir1HhHvqymYvYTXhmlzWQ+683CK6U7Jq728iQ1ufDVf6EMS/6kG8Jw6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y+9B8ZRY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+9B8ZRY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b8db5e9b35so3800882f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755073465; x=1755678265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j36Wt2d1lcdfM4qMmSBsoKx8o0T/CsoyesZWxgamGL8=;
        b=Y+9B8ZRYLT/LKQm7fSfdHyyHSbWoIpIx4/0+X63tmrj0EwmgPjpeTaDixHbPtKSUbD
         GSgk+jJDpySj7jousX3IT7j9bMezBv9ubwAAz0ZQ7ZnJ9RUFLzDXdrhCsLPeaeZZ8j8A
         IWhlag8AUXpgR3sehbL+rzLpHHwIP2NGhQGSl5B1JqQzg/yFsv7OGoEFSsJY1yHG+YRO
         uSu6pAwAejbkUhUlHo2bTZx5YgwtacVUerSffuGpCQW14WXZBlb5h81u94mE7wkUmwvn
         /RrbnZztNMHAuEc66rCev58tRMFnnXzVGsWShBfCJnABwT7kqy8wxCRlpEDn2yeA6o/J
         xKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755073465; x=1755678265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j36Wt2d1lcdfM4qMmSBsoKx8o0T/CsoyesZWxgamGL8=;
        b=EDNH0haHoJOtGK5+zLl5/wc9FWnRfx5LJn/P1rwAw1y5+36QQAeceF4U5v7gxko0Ms
         xCYBuXspfCN0VOgnqxwDg3Qz5REMDgoaXGqbbbJQdxB7RjrDV4SBI74cOkaGKr0KFNiE
         TM/4q1B/AZvs2IabTZqEtfEHP66ww9Aq8iUe7jL9xZjtYMrKcenMRyPj56rb6qH00C+y
         kNEaWd5N7CDVQnXkC8tpztUtpR1eld18yM/ksAdNeEiMCoCulxlYDs5ENyPOZaUFvKfr
         FxQFniHOqiXSKvpveasrN/5nG/iJ7qc0z2K8nOEufO4ItXhWXt2gICba300aSucSlnpH
         mfnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWq7VRUbliOutjo9AUPDlQPnitzmP6/Jh63Xi62I8vIUe0j3RORi+Si9j5FzhLlQN9NkRLFm7p08jisYP8dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNOGENEGKam/hxkgJy30NsOCwEJap4bzeibrUo7gvV8vRfUfAF
	5xa5zZSOFCedrrIwOkA9+pRGLArQlsroRfp+urZq+fOu5/oeHdP5ka21RYN0/sTjawIC9EM60k4
	WyxBSh8G7zddGj0cHShZAC75Url5AskSxs2sj1vB7
X-Gm-Gg: ASbGncsBKfW4rQ28TCRE9KdxqCnBqWoNN2x/aUBTXYlCTWIcPSwHlzWNnEf1CuH6DaK
	6xLI6zd5SDc7l6/huXUiNGLNWehcOIM5cuTXMAIrx1Wig/7bHvxzZkAvvFWTJqr31Io6O0fJgwA
	+r3vWX6Wg/p8H5jtmvAIbWUxKqcb/Oc76tdQh+/7UPupz4XZrVq7Dtfpx67N/yJWIegTe0ZLE5Y
	isaIA7Atg9dL9XJ+BJxiaQT1mBG/HFBQxeO2Q==
X-Google-Smtp-Source: AGHT+IEQTBj4vbtzEEQ6lxltaO/FqbXF7A9ORef0fFY6z6R00Et5UkVsjPhHS6jo/ghAMR6v/ylRnCX7wGQtfB7kXBU=
X-Received: by 2002:a5d:5d10:0:b0:3b9:1457:df79 with SMTP id
 ffacd0b85a97d-3b917d1e6b2mr1381034f8f.5.1755073465088; Wed, 13 Aug 2025
 01:24:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-iov-iter-v3-0-3efc9c2c2893@google.com>
 <IMil7T48wWl_KirFiwKV5bNm7TuVsFNPEX3_6CJWEzwQ6n4jaVn943ujBotHAettCFL5Slnb0v_3Cz50enMdqw==@protonmail.internalid>
 <20250722-iov-iter-v3-1-3efc9c2c2893@google.com> <871ppq9fve.fsf@kernel.org>
In-Reply-To: <871ppq9fve.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 13 Aug 2025 10:24:13 +0200
X-Gm-Features: Ac12FXyZHCu-I22etoYCjoFadSFqXkK4cOQ639JdLkpUnt1K4hiGXS3NmFf7rkc
Message-ID: <CAH5fLghb_YoZgNGGJOa1aLA3bM=tyZKziDwyUqnVPHMg8NW4CQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: iov: add iov_iter abstractions for ITER_SOURCE
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 1:18=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
> > +
> > +    /// Advance this IO vector backwards by `bytes` bytes.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The IO vector must not be reverted to before its beginning.
> > +    #[inline]
> > +    pub unsafe fn revert(&mut self, bytes: usize) {
> > +        // SAFETY: By the struct invariants, `self.iov` is a valid IO =
vector, and `bytes` is in
> > +        // bounds.
>
> "... and by method safety requirements `bytes` is in bounds", right?

Will reword.

> > +        unsafe { bindings::iov_iter_revert(self.as_raw(), bytes) };
> > +    }
> > +
> > +    /// Read data from this IO vector.
> > +    ///
> > +    /// Returns the number of bytes that have been copied.
> > +    #[inline]
> > +    pub fn copy_from_iter(&mut self, out: &mut [u8]) -> usize {
> > +        // SAFETY: `Self::copy_from_iter_raw` guarantees that it will =
not deinitialize any bytes in
> > +        // the provided buffer, so `out` is still a valid `u8` slice a=
fter this call.
>
> I am curious if there is a particular reason you chose "deinitialize"
> over "write uninitialized" for the wording throughout this patch? It's
> an unfamiliar phrasing to me.

I've seen it a fair number of times, but I'll change it to less niche wordi=
ng.

Alice

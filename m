Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B268C170A26
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Jun 2025 23:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749942724; cv=none; b=HMjE2mhOKf5YFqEjkZEVtQZUJgumFeuEgnglJ4vepHe3kJtuKnHdb03v0CaqpJSfCVZUhPAGkZ+6W+Ws1Isf005m+JbiORkf4lGMfkXnHX3KRH69iLPXet4D+1Gady/Ihf143GUCu/nenpZ5IWrctdu9BTnu4VYIWsENWJ1hzVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749942724; c=relaxed/simple;
	bh=7aQKox15HFRiAgr/Nbk+lF+bGCecZEiP3hzutFWQDhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BN6uR8l/yYcu6zDOm6W9GMBzTBlA0thHa6S6SMkEZOee9YnIzW45r3gKGRrK5GQdbFVTBzwtD74QMSpQInRIUIKS12wdw2qXu1/EyBd82c6lUy9aSfAqDN8GPk6vD02Xi0OtOsUO0roGYN11kXGg2WcB8ZDVsO3uHj7NU/Xfp6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExfODAZE; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExfODAZE"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7311a8bb581so3084790a34.0
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Jun 2025 16:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749942721; x=1750547521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8juW6MvzoL4CHD74I1P5RmelwPS5i/WPTaj9xDofQnY=;
        b=ExfODAZESBlbSS1EbRCIJs05gM9gtOm+noYAsJfqCOcny2tYhory6wDZ94rMquYWK5
         jGNUNzLWi5+P3N1aQiqqpfQ+Acw3EuZuqVkAxHwgr1bogteKG3p1cGhmf3woAfDMfbGa
         VukVeDhGecsxLcVuv2jE1dvBCdBOhtZ/Ccl6sh3mZcObCn+6r+DJLLC2uxjRftJnku5v
         8gOIALe6lj+gPnswi1ERfZR64eOcU1o+IlyRhybzsvf2OrKqr1sSnWIZnxIt55P7DTUQ
         +vZy26cqfscKXJ5EYv3VkYuIKq3y2avSfc+j+gNac/BEG4kcH94Qnoiqhg18QgeMAp8K
         /o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749942721; x=1750547521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8juW6MvzoL4CHD74I1P5RmelwPS5i/WPTaj9xDofQnY=;
        b=AiC9KRKzsDEW1kYWRPD0GbL4vIEfFMpP0OO100/njfoZBxRnzN53JfdUNAV+aGMzGK
         isnP8kTe8RBUTUxKGCMY/kD6yECknCW7pQHCCf8n0spiiPlJ7aEJf+ltW4ckVxVgPuQG
         91HVFl9T2tXnhvMDXzRXi4saFxeJAujB7vzQTIla87QSalqlBU81zXS91NvwcA0ELvXt
         pi0xffZw6kCKu5HZ76EMZz7LOPmW0XRFdVEZFxM9+96hm/W5vxYRugHGvwMRX7u4kayg
         ZiG5+ei7jz449H6C6hy1AzHDoJG6Nk0DGimbzG28ljRKr61ADLhBxB08EQmcMMKkZWgc
         0b1w==
X-Forwarded-Encrypted: i=1; AJvYcCXbvj2XCDVjD2HFChozdGoJcxKM45Oe5S6fqIVUrVYnuMy8MJfijBwO5+YDgpqVw7b23S+jOEpbLPLmOpTS9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS7nQ+eSfJ7OzBa7wzGxJ/QYVoGjApBfYCGQTVpDu6CdVXfW8E
	Rc3+yEOgkRN1ZH9z9VrQGSvxrOVYIbrE0CDV8j6cQ/LMV9ZIXeZDZNPNZua3+D7LjNgTIA2wYkB
	OImVx7tRloWU8lQp6Htu8fYQuFuZw8PtNc194dEs=
X-Gm-Gg: ASbGncuDiDB7C+pnCC82dEg6gJkqbq6MZpYJtrhD7LEtc9RMHg8vv4xq0nQREyFIevq
	kuwCh9di81guM2irSSbqWBnoiIYKBvYcuBlhMbI8fE5sT+VtgtSMqmpuShS5ySOoVs7jDZDFVjh
	lH79rhgoTNlJdNFdfoLvdEUsjmwPqgPznccDKldGRSL3Bkli048s4QYL0=
X-Google-Smtp-Source: AGHT+IEd5xY4c2prQ9C4gYVGOVpAHJ53a+IaKWmwvPYKKLqQ1iX1xB899yr6bzGK54Sf3LESREd/ByttQmLlJxMKoZY=
X-Received: by 2002:a05:6808:1a03:b0:3f7:d16c:e283 with SMTP id
 5614622812f47-40a7c131ce4mr3047730b6e.11.1749942721648; Sat, 14 Jun 2025
 16:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com> <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com> <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org>
In-Reply-To: <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sat, 14 Jun 2025 20:11:50 -0300
X-Gm-Features: AX0GCFvSfb5qmS4mdJFH70NZ_cFHGfdoEtoaG87ivfr7m2yN7xVweMNueL4RXKU
Message-ID: <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Benno Lossin <lossin@kernel.org>
Cc: dakr@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 14 de jun. de 2025 =C3=A0s 15:05, Benno Lossin <lossin@kernel=
.org> escreveu:
>
> On Thu Jun 12, 2025 at 9:22 PM CEST, Marcelo Moreira wrote:
> > Em qui., 12 de jun. de 2025 =C3=A0s 06:02, Benno Lossin <lossin@kernel.=
org> escreveu:
> >> On Tue Jun 3, 2025 at 1:26 AM CEST, Marcelo Moreira wrote:
> >> > +            // and because this `PinnedDrop` context (having `&mut =
Self`) guarantees exclusive access,
> >> > +            // ensuring no other thread can concurrently access or =
revoke `data`.
> >> > +            // This ensures `data` is valid for `drop_in_place`.
> >>
> >> This last sentence is not needed. Instead, we should mention that sinc=
e
> >> this is a `drop` function, we're only called once, so it's fine to cal=
l
> >> drop (since that also is only allowed to be called once).
> >>
> >
> > ok, I thought of something like:
> >
> > // SAFETY: `self.data` is valid for writes because of `Self`'s type inv=
ariants.
> > // The `&mut Self` context guarantees exclusive access and a single
> > call to `drop`,
>
> Let's mention that no thread can access `data` *because* of the
> exclusive reference.
>
> > // making `self.data` valid for `drop_in_place`.
>
> The part about drop should be separate. We usually use bullet points for
> that.
>

Hmm, ok.
I think I understand now.

what about:

// SAFETY: `self.data` is valid for writes because of `Self`'s type invaria=
nts.
// The `&mut Self` context guarantees exclusive access, meaning no other
// thread can concurrently access `data`.
//
// - `drop_in_place` is valid to call because `drop` is only called once.
unsafe { drop_in_place(p.data.get()) };

I'm not sure if the line break in the comment is okay...

Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FC614A8E
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750034224; cv=none; b=OFcvWxK2x0QovAOMn9DWSyZ1S7YFWShgai8+gHgoWLVldcnWh7VhTxe9v1R+Ob1amy56N8+vj5r4MRK/AxTuT7zJjIW8TG6qyyegtkE1Lr1tIf60gKlDuzOAqUKCU2WGMktwzeFQ3zLIemGmaLJKIxbtKVQ+I5DTssc4XFOIuMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750034224; c=relaxed/simple;
	bh=joLQgy7THiby9YEil2XE+UIzDZdO5ZO1IDZZdJ4KNFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pirX8PtuJ+q6rNcZaDG3RKCqe8rCsyFJKkbm1106Ayif3EgI/5VopKWF/XZO/h3RK/8OHeNOAIMELs6SFpKHGUe+gu9emCuPF9xqxbcrb665CekgvD7gSJKMCZpEz9xHiiaygC/mnsoBE8RocZO0mfoNdemzGzt/0e17duOpDoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoX7QeQF; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoX7QeQF"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2d0920ce388so1636056fac.0
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Jun 2025 17:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750034222; x=1750639022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mVUACo6+9Gx4ugBjFoGWxOae7iusvYWHl18i97oElg=;
        b=KoX7QeQFB2ihNuiJzbJg8otHB3wKWQbkSKn22iJ/3ulUSvhe8EWamp6Nw/fE4AfUNk
         rUINKekrVSDptau4WyZRy7jiJS+XwTCImWB4fOhGHoIGKjTJa945Ln5nKkffpM2zlPD/
         1tJVzL/tsOcOUO+psp7qYIqByr3Zhi2ZgKbZZ0vY/F1EgEO6Dj2fVPmYXa4FMaUq6tAl
         1qnHgrT4E5lJtj6XTnz6v23oat684afuMNikCu39lVKvAsB+40MwxNlpbyXCTWYW/oIE
         +5euh8OTC4Tyx0guHQNryj3gkYW8Jw0v3YgFuwZG4oUh0FuOqV3xT1jf4+k+Tz/mtnZw
         p1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750034222; x=1750639022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mVUACo6+9Gx4ugBjFoGWxOae7iusvYWHl18i97oElg=;
        b=kLMq1s1v/j9C9jogj8PlHHcMS+c0xeusqCDZq2VWWSRGmiKqt1ozhXZ3oaTe/uh90e
         KJuxwSNmieZLv8MrHqFwQvb2OPMxeYezHwd06n8cZ+cOC+2QO2MmkPR4gf215T/Nd64U
         ACsLa91Wk7UoYsj4HxaZnrJAxFL99Sim1OcNk5rEpvniA/HZHtwy7vOCIUN6BPHHFmJU
         X0rDkLdXgIM9a1jJRTMXggAltPqTidZ2Kf97LJb7a/tHq+ghW7YX4b00rS0fMp5W3PtD
         cCnGZA0EiMaIBqT4F0UfWglA1RUnHp7rouyv6Y3EP4HleHNTIegFSzEzkdM+JE2kIyCl
         EsDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI9uQlELL07MVP0a1NOsh59U2JJmN4+er2QVywetls77ItM7ET4wuZu1Pwp/edmzarHu43fOeFDYqXCRdWRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtN70GPxGtymfEtR0KE7p4cxx6dGR8MmEiZAsI0WWyBk9dvKpa
	5/am2i2+AazOOkFrTMQMVvRJjb208jRfJqBzfqF0ggd/0VND3taCaVmc43UWE8FadErb7vkDtjd
	2mQ1Ad6iGm/hIkmISGw4qZQzeNcc4wvQ=
X-Gm-Gg: ASbGnctlbQUFHWJG0IVuKt/Oz8H1vyf7HgRuRfw1gDF48tqBCr4Wq/iWZfhGVf0MgRD
	DYfcBlDCuO8RFalyfpp0n2a46pjJvXgOdkoC1cNkhBBXZLkvAM/20BuQ7ksfEqRzhWq1r8SymKC
	sRnVsCO0gHzwnqwrE41mowyH+bSTnNFz4r83L76or+YwG7MYsfst/rd8Y=
X-Google-Smtp-Source: AGHT+IGOCMr7c17nTnYwUqCUXcZIVYQ0teU95JAAq8GgJ/n6VY0v3t/yjPcSZ74yez7WQNGIcGpkX2yVzpHSb2jQPiM=
X-Received: by 2002:a05:6870:788f:b0:2c1:62e9:584b with SMTP id
 586e51a60fabf-2eaf0c3601emr4231533fac.39.1750034221910; Sun, 15 Jun 2025
 17:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com> <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
 <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org> <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
 <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
In-Reply-To: <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sun, 15 Jun 2025 21:36:50 -0300
X-Gm-Features: AX0GCFsVQqQkD7Evd8g0Xb8nPlD8DXHyXbZOmujybNwPgKWP9L9F2HDN-WGqnzg
Message-ID: <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 15 de jun. de 2025 =C3=A0s 05:38, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> escreveu:
>
> On Sun, Jun 15, 2025 at 1:12=E2=80=AFAM Marcelo Moreira
> <marcelomoreira1905@gmail.com> wrote:
> >
> > what about:
> >
> > // SAFETY: `self.data` is valid for writes because of `Self`'s type inv=
ariants.
> > // The `&mut Self` context guarantees exclusive access, meaning no othe=
r
> > // thread can concurrently access `data`.
> > //
> > // - `drop_in_place` is valid to call because `drop` is only called onc=
e.
> > unsafe { drop_in_place(p.data.get()) };
> >
> > I'm not sure if the line break in the comment is okay...
>
> Benno likely meant to use bullet points for each one, rather than a
> bullet point after a paragraph.
>
> If you do e.g.
>
>     git grep -A5 '// SAFETY:$' -- rust/kernel
>
> you will find examples of that.

Cool! Thanks for the command Miguel =3DD it helped a lot.

I'm ready to send like this:

// SAFETY:
// - `self.data` is valid for writes because of `Self`'s type invariants.
// - The `&mut Self` context guarantees exclusive access, meaning no other
//    thread can concurrently access `data`.
// - `drop_in_place` is valid to call because `drop` is only called once.
unsafe { drop_in_place(p.data.get()) };

--=20
Cheers,
Marcelo Moreira

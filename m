Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CA7208984
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733914683; cv=none; b=CulPODesfSvGLktxjAk9KoQvujs5YhdRzWxlzlUzTxjXY4YCWKJpEhpXnlxKJaWdyPII9wJyfgbJPy7Jj+Ml97hdr0w1892QysfWZJs6R+nmVqmqTehC5Q+S5Uekoz4nNnXsWF8LaHhFaIPVqh40xmnChGa21gZIBoVobOOmQzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733914683; c=relaxed/simple;
	bh=avf3tUXOuYRSKETT3gs06EPn1ESwA+EPARe+dlRGr1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCMCkqih1W/Ya7Eif+3xuhpdKfYsFRBoG5BHRKYtEiOewJOuJ4qLSgfHzuH6mD0SdY/edf0k7XrlUCV+tDbWjsaCnjfe7rbjPL8hxvDwzuKwmdVKzTGlMaQNlFN2qNZ1bKw4QiK4xotvtvR9sjNZI+zU1i9bVgAYPY/Nh1Al43s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEI+Eomk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEI+Eomk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so3560449f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 02:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733914679; x=1734519479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9PtumkMFYAOvEEd8+H2rccuyHQFzgSMwrAW2ht91xU=;
        b=tEI+Eomk3yZRfly493gKnYlsts4AE/ZSDEjokgV8AkdytdkGeUAD5RVDmGuU9gvnZJ
         EX6XtkiPq6uE7KN6nAhPlNcFsOiRmuDfYxyGuLFI/iC5VdumP/J2sZo1FZUVywE4BINk
         JFrZHwXpaRYgsEcfAqXtL64CB9ESIUHis0qPsmQ8jGXK0lwoG9xOWTW7WgEr+1WTALte
         oNNVYTu44UTo8J0BgqYcJwwlI8VXaK2mXCD3EZTjtNfy/j28TPMqvUjlOyv1mpUJxGFv
         k9U9/VBvFdrZG7EAhZo0cmTk6VTYA3C5IJSiYaXdD89LGvv18wbk4cSUjLRPVDxmJv1c
         lhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733914679; x=1734519479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9PtumkMFYAOvEEd8+H2rccuyHQFzgSMwrAW2ht91xU=;
        b=JAE5Jic7fgUr5jxHHecmdm9Pd1FV+IVy/WYKf6K80hrD/naYmMinxpR30a8JoT15CR
         RXBTXL8Ct+I5m4dx6+k/n3dZP8Pq3WwRXbnuntH7lYLAxUbrItuFiYltZrOzgE3J5hRp
         Q7m1x+ppsWfFHrIhXuS5t1fhJTU0XcNHCSZy+oURSWdckzDrbrV/6Btry+/r4hvs7mnu
         TU6BkqDt2D7zMaJ0ZGZ/9mAZvuU8IrouVyxWjyhUagBUfox/UYNimvkItzNPRL+MgiMk
         beHsTlJOB5nInK4J1mqeVtdZPgH7RM/3AtTXUFA6n1rP6Jw7sMCfrJBoW0LMHMq5Rs+q
         FcFg==
X-Forwarded-Encrypted: i=1; AJvYcCWHIh9zQZT4QxNEeDkLeyZLtkswI8pZ/Rxk85b6X04bhjXz+q00bqP4c0TXE/WGtajasnVScWhQ17biEo/urg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgjiez6DEE6MkNPFWUggx9/Bsxt9W044ikY9hNZrdnLgLsXC0+
	IuTiUYOY75c2/Fa40aFngvB+QwejUaTg1T/D93Fsb2+ZuR2yY6d9U6jqbhrtY7adXDRNfFMwreL
	LxY8vUPNysEH63KdSrzurgMZ5yPLUkTb3gH49
X-Gm-Gg: ASbGncuehkX3KupODDrN2VrXLiddCMfBGSVhlq4DX9IKpbMF8DAXfWvsA6pHYPYP3rI
	ifXpRWlcigF8S/mtS2rFlzUBJVPAdBmlZjBSzBP71RhbN1zot5w2SG2Bt+WmWo7Mxow==
X-Google-Smtp-Source: AGHT+IEo1dBS36E4Exb3soYdCQkI9XhgNGcMH5O/gbeJ4gRSazPIpyMzj5iXmoR3+umlkKVaSTzxPHrFrJGOjnVnbqw=
X-Received: by 2002:a05:6000:1f81:b0:385:e3b8:f331 with SMTP id
 ffacd0b85a97d-3864ce97173mr1517915f8f.14.1733914679348; Wed, 11 Dec 2024
 02:57:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210224947.23804-7-dakr@kernel.org> <20241211104742.533392-1-benoit@dugarreau.fr>
In-Reply-To: <20241211104742.533392-1-benoit@dugarreau.fr>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Dec 2024 11:57:47 +0100
Message-ID: <CAH5fLgg3QXiJFvfEE63kcxQ6=ZRE38CViZ0E6=Xec6a1+njbWw@mail.gmail.com>
Subject: Re: [PATCH v5 06/16] rust: add `Revocable` type
To: =?UTF-8?Q?Beno=C3=AEt_du_Garreau?= <benoit@dugarreau.fr>
Cc: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	bhelgaas@google.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, tmgross@umich.edu, a.hindborg@samsung.com, 
	airlied@gmail.com, fujita.tomonori@gmail.com, lina@asahilina.net, 
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, dirk.behme@de.bosch.com, 
	j@jannau.net, fabien.parent@linaro.org, chrisi.schrefl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:48=E2=80=AFAM Beno=C3=AEt du Garreau <benoit@dug=
arreau.fr> wrote:
>
> On Tue, 10 Dec 2024 23:46:33 +0100 Danilo Krummrich <dakr@kernel.org> wro=
te:
> > +/// A guard that allows access to a revocable object and keeps it aliv=
e.
> > +///
> > +/// CPUs may not sleep while holding on to [`RevocableGuard`] because =
it's in atomic context
> > +/// holding the RCU read-side lock.
> > +///
> > +/// # Invariants
> > +///
> > +/// The RCU read-side lock is held while the guard is alive.
> > +pub struct RevocableGuard<'a, T> {
> > +    data_ref: *const T,
> > +    _rcu_guard: rcu::Guard,
> > +    _p: PhantomData<&'a ()>,
> > +}
>
> Shouldn't this type hold a `&'a T` directly instead of a raw pointer ?

No, because the value might get destroyed before the end of the
lifetime 'a. It's not legal to use references for containers that
might free or otherwise invalidate the referent in their destructor.

That said, the PhantomData field should probably be `&'a T`. It
doesn't actually change anything, but it carries the right intent.

Alice

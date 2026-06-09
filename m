Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2064192EB
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012582; cv=pass; b=p7mKW4Y4p8H7m7xjYvZWR92NZIeDlGfwrL3loPOGPEtYB8tEcU23Rcf+Ouj8Knujx8hHr8QqKiSh/tBQikyF12lED8lT4+XSPTQXoLuHxhtVikEIQQg93/9xoD+F+w5YZyF/p+2dBIivJMOl0XsgKwudiJMIJ3CzsAKG7bC9yS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012582; c=relaxed/simple;
	bh=il96Vdi4Eeogfn34vuw3kP9ywrKOL275SKxMEIOyGko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9mSihgQV3wnrfxa5HHA/LxbypAC/3kfLCtRpyhTEkkFT8qBfCn7rKBWY/vWW/pTqhrrZhc7/4tCIuhUJLmfitgnxWzrxeDtIDKh82IMgeCrSCeDm47O74kBoiy8ozwaqGVDqXLE/L0q8NdL79g9yWseykKtf7MWvAfE8TTQktU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knyt4x3j; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knyt4x3j"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137c0db2638so455011c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 06:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781012581; cv=none;
        d=google.com; s=arc-20240605;
        b=aqm8cL2B1R+9tguVoRAPf4vOil/OF3/Rj/d7I/8OrocUrr1gDsm5UWUYWcYfFolQHS
         YrTp1eoHx4tcYkUkyCp4DwvmA+OliN7VsVSwEHW8kS6dZpo+fcEHp963BmZLbAd56X4Q
         futkHAuX42KlVRyWLkIqOPKjQzh4h/+0JSmtzgajH0ovyGsmt6CLmb4SvzS2nHKYBWpY
         yMZC4jRoapEdSe7Xj0mTEM0IAyDNBel3RPcGgk7xDz5fmYeCFtjo+IlTgbSVWRGcyOa8
         FuVNthE2zIKoCOcceRYfeXmSgiNtYHYorHIHcqovapqOmMMb94NYDfew5TwuCti7OA8N
         mL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DpcQI1wwukUFL/YY5yUBboZfSVsn0TKLbwHmxRz2KMo=;
        fh=J6lagsDJBShebudaO3adQ1gL9PcgwnCXhXT9xEPeMYQ=;
        b=IpaO9nXwToNeU+Lomuee6F0Q2ghPVSqfqSFoD4JY+UZhpMF2RJUc1KTq8V0c1bKSl2
         yuaiF2apHxI1vELI5kc40OEKaoAatHZpYAgjvSi3IDsLGHycyGpbYzihqZmK9HUJWJpc
         8G4Xf6zURABlU3xUIaxJUbzkhKBMGst1OaeYI7LZVHVLSR7xIUWVWnRlDhvfG+esEf+L
         TnRwpmKO6KmVQQjGIPVZrOfAHsyDTnsVolWC7tw3Xj2AER1tzmopKtOhRlHl1hhONL/N
         JYUZlEkdDTAv82ulYZVOoMEs83SmLB0O3iqItynuroELPsMu9u/41KuMdvRV/U/xRzV6
         3zoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781012581; x=1781617381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpcQI1wwukUFL/YY5yUBboZfSVsn0TKLbwHmxRz2KMo=;
        b=knyt4x3jZ22x8WPUpHi+bu/OE2EtwOWwjQsvicr9zlB3+FWpKQIqrdgudMeXxP1fOK
         +YnM+bi+Abv1jr3LhJnnJNos24oThNebH8W3ZI4Zeg+VR+sVg/I3nPmfEzEGJbpB86sN
         8ATZIqAp6X7sWGYbZ7oYHm+44SeLEJrSJYyJZgsnvbO7ChHHcg6ztGaDUZ4soROMLP+g
         1zhKWdgtwMhOvRxuJP6xeJOJZV9ZxPRTc5PkuzVloOQ9u5ykxa4IK2XPGXXQffbaDYCR
         LPw3Twa/GDROOmnp+fM8NQ4kqtwLqpxTbHUcVQ6aPSZwg660IA8R6BIO6SadCd3DWgln
         tmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012581; x=1781617381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DpcQI1wwukUFL/YY5yUBboZfSVsn0TKLbwHmxRz2KMo=;
        b=ib3NWqzTgcLJrs6kXWpMQlErO1CM6RRSwpHatrJ7C7hWOdNQ/Du190QbgZ1i+DymwH
         FSYoSZw6aDflPmLN+xp0TFYZNzs2+QL38tB77ST61/YU9Jy6HnU+O5KRkHdazcCNCq2M
         A8cIPLmHuWUjwTF9wqh5ry/W5tN0n4YXrogSmVrOrk6X7umR4K6+fpHzCpePh0eypBc7
         MeJDQcl+NX0zhIZxFTwyZmwhTc9ZJejakZjOxOTQd1V+YJ7TRA6x0FgMsZu+4pAeF2RT
         WAgQMUgTaZEetvAYyRp1ygzGfR/msgD1M6TgBii8etUz5/zWeYrxvF/3ybSL1QWj+Za0
         LWxg==
X-Forwarded-Encrypted: i=1; AFNElJ/HG2tohFDD3k8auyJerxBQbN3eVBlVPkWuzJHsy6YWdsrWUmXwmuYExqAT5NOkhCyxqNPw48i9Q/rQqsIcug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9lBZZtQqYaiP3grgoQvKHAPAu9abOUa9hoGotxuU2DiwLz57e
	NK+icUQ9I0kLnA10PBVXEJUQS71jh5wGhdN9qhStdhF0twaaTsUiNrRj87LEbUeD/TBLXEHVY1p
	HHxfXhYZGqMnZ3VEg/cLfmFRfiaWWmbs=
X-Gm-Gg: Acq92OHUkDYZsYB3bH1dXGNbiOB2qFneWKi+AA5lcMRkX0WKOv1QuVtfn02HjpQxuF+
	eWw6U9blv/ooTmefTYAXJl7nO8x2UBcPj4he+3uYnXc5MidiA80Pf1X99dIWgHgAm4YJNYlOF3J
	hVaodag9yHAdAZj5KHSx8UDWDhmpKybi1p8io4XEF4MinVAHcjrqDU9kQ4Gx9pC0SUr0EBch2yy
	oP0NYUrRYUqZ+/HGooW2qVIH7+Yd5Yhp6lWllw1U/QjxhNX4oCEt5/7CGObCAQFkvDTdFbYd0NL
	OL0SowGWOAO/X8gWlxGUfMBvKP3BeqTVewO/TI+ljbz9M26z49jCvwFEUQ1x3riAzqgWj24fsVy
	rWrqFvTTi7mIdtBk+W8a4zj+l4mVC+NDzlQ==
X-Received: by 2002:a05:7300:cc0c:b0:304:5074:83b1 with SMTP id
 5a478bee46e88-3077b77c96emr5815587eec.6.1781012580802; Tue, 09 Jun 2026
 06:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609120325.233721-1-gary@kernel.org> <20260609121103.385001F00898@smtp.kernel.org>
 <CANiq72kAvoGgG2jG+bHs56z0C=Gk6UUHKQTcuTAK4+WqnVePzg@mail.gmail.com>
In-Reply-To: <CANiq72kAvoGgG2jG+bHs56z0C=Gk6UUHKQTcuTAK4+WqnVePzg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 15:42:48 +0200
X-Gm-Features: AVVi8CfvPzZW2hkFYp1AH2CNOs2Fqw5fK2JVut1TtN-0H3ulEKA_NS49W8oh_oI
Message-ID: <CANiq72kH9dBAbXZ7=cpNVS7bPj7LeGkkv0ca7uTzkut2k0P8zg@mail.gmail.com>
Subject: Re: [PATCH] rust: mem: add `Align` type
To: sashiko-reviews@lists.linux.dev
Cc: Gary Guo <gary@kernel.org>, ojeda@kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 3:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jun 9, 2026 at 2:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > > +/// # Examples
> > > +///
> > > +/// ```
> > > +/// # use kernel::mem::Align;
> > > +/// const ALIGN: usize =3D 128;
> > > +/// struct MyStruct {
> > > +///     align: Align<ALIGN>,
> > > +/// }
> > > +/// assert_eq!(align_of::<MyStruct>(), ALIGN);
> >
> > [Severity: Low]
> > Does this doctest fail to compile during documentation testing?
> >
> > Because align_of is a function from core::mem and is not in the standar=
d
> > Rust prelude, it looks like it needs an explicit import, such as
> > # use core::mem::align_of; to avoid a build failure.
>
> Ok, I added a section about the prelude for Sashiko:
>
>   https://github.com/masoncl/review-prompts/pull/75
>
> I also noticed we can clean up the prelude nowadays, i.e. essentially
> undo commit 72b04a8af7fb ("rust: prelude: re-export
> `core::mem::{align,size}_of{,_val}`") and clean a few other cases. I
> will send a quick patch.

Cc'ing the list too.

Cheers,
Miguel

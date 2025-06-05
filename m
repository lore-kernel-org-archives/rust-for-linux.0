Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB1B18C06
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Jun 2025 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145192; cv=none; b=tNRgOc0WmzEjvZA1qV4iJ6AMzHDPVZQorD6YvE+XGn/He4Iajj6h40UhTbLrAPdAMcUZ/KBOHY+VpVeMM1CrwKKsYxlI8ECC5f4MbxP+OczPCp1PRZP9SgVy8JYovy4E6Go7+l0yIthCfRfhg2yLCl+bHCzEg67S7c7VDJKR10U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145192; c=relaxed/simple;
	bh=Pdgb08ny/SLt/yMKXyMyhsUJOflgLMR1JSP5P2PkELY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ViU3PXKUASyQNM0dBw+WY7sQRfcSngtDPOZ84jbVmcejZDH5jXcigezpOOfpFrwJyY6Bc2iOSKAeIewcvtgTU8jfpxnOxkGjhR+XMJsJNIG+AuR8L/OG5+mY6ddJn7sKC3ykfwYX8Yl2gFkpxt8xWLwicoNdo43GZekrVoLLEfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERE7fPe1; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERE7fPe1"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b26ed911f4cso170234a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Jun 2025 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749145190; x=1749749990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnHaT3YtqEqEkb1SccLcszSPhIlgELG7NwRN+u4Cffk=;
        b=ERE7fPe1k4WjwKUTNQ0NcMHEuKTzBD14eOSer0F+x6XE4KwixCyr/T59x/PpHMfvJE
         uALSzsrLelXgUQEAaDQPRDs/gva2tfUPDbT/tuYAuc9NaaIGutlpwSc5IIgZVRmxpNT4
         WU2EASdxcy7vj/JfxNzhC+8ZsjYNE3y3KMu1rPxOVI4BH1zkjAIgAqtLoLRQj65/x7v7
         yn3yDSuL2fh9Uf7qb7R6iFvkL2lL7yI1lOeHmntYPS3vS5P2Ha2BQAFkEgARgNJm1LvT
         UMozihTMHGGXDP6fS+lCBIl0NnuNzpe9sHhQ/oBP/0fk55uomuUCdxmRLL0p30N6cW20
         emgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145190; x=1749749990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnHaT3YtqEqEkb1SccLcszSPhIlgELG7NwRN+u4Cffk=;
        b=D3I228cYq4Z+oeMDbz7sgcPN6GKYFxA7XAf4gpebU6jy8DcxUhvjKzksGRCsO8EyYK
         nmVG4jjdE+utOVjxxK0GofS9RF1wy2ZqtwPQ8PgbUgg/QOdvARjtZG+/FXCwhsBk5axU
         wuauOBOrcwhVSkyAcDPOW7i422s7iym7uh06XPRfLZpRhGASjDLjdkcwuHHNDG4asUJC
         ZJHfWgzBDbF7jrGIDlQCsUsyioLnc9dgzv9VJZA4UnT0WrYiXmPjFRLXn86bbVySHqPU
         2WejuywcrEgW+XOe2vSdsbkrjsgT/c7ubR3BfgX+AM2GW6/7Lm61Xu93My7vEnivnTeT
         0KPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTG322r+ro+mKe4NVJZEPnDj9arovQ0g14BipTpBEf+Y1gbOMJ9oJkTE14EbGgNG+f0QL75f17HkybvmaTGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlU1Fz9U13ThsOlysSWZ8JCf8m7OO3x6MAppOJ7NYHPJfveGZa
	KbqGgjoVeyRVarIzblke/uJsSImwbMEWqAeZHmtN2TGGsF/IzpECV/ZYQirMe485e7yI6UXfbIh
	Ar0bW6izn58LZlNszVZ3SbOtDcQXh/lw=
X-Gm-Gg: ASbGncudpPYu8E1k2KJgRUZhT8WvCMlHZs3Dkxun/X0CFKF5ObemtVTX8zcHuvK8WhO
	FQD7f4YxgEBRjhXEnpXzFlMN3+uTWfqVXU9y/RQeDOQn2iXsN7I4aWyE36J++cgwBKztjb6tsAQ
	8Fq+ixAbHSDVX0mF+4tAVkdfsYF9cQFq5UGSOpwxlE3P8=
X-Google-Smtp-Source: AGHT+IEpLfjAQ/qYmiJjTHGLJgUwAKlQOPxsxdep4svglH9LffH70bI25+SpF+JSGjdroXLTd4RGhCC2Quan4ekGs14=
X-Received: by 2002:a17:90b:1e01:b0:311:c1da:3858 with SMTP id
 98e67ed59e1d1-313472d24damr240457a91.0.1749145189800; Thu, 05 Jun 2025
 10:39:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
 <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
 <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
 <874ffd400b0632cff99b618661adffe472abbf8d.camel@nvidia.com>
 <2025060508-spool-twistable-66af@gregkh> <7faac30f75f2ba651995d9667c463706b61ffca5.camel@nvidia.com>
 <2025060511-surcharge-overfill-a721@gregkh> <CANiq72khbkdS625Bcb1iX1EbUwo1iQOLVoke698SUm9BA3PgYw@mail.gmail.com>
 <2025060531-backless-venus-68f3@gregkh>
In-Reply-To: <2025060531-backless-venus-68f3@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 19:39:37 +0200
X-Gm-Features: AX0GCFubbeUF_5cm45swWZTn9wggjKmvsJeXffC8nywvywoiFdoXucmsqmTl5DE
Message-ID: <CANiq72=CBdbVutqY2-tA21mUf-W+TPHZwMvhDHA68zUQK+xMzg@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: Timur Tabi <ttabi@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 6:42=E2=80=AFPM gregkh@linuxfoundation.org
<gregkh@linuxfoundation.org> wrote:
>
> Ah, I didn't realize this, so thanks.  The dbg!() implementation in the
> kernel tree matches the userspace stuff, so the documentation refers to
> "release builds" and the like.  It would be good if we could say
> something like "Use ONLY for local debugging code, NEVER submit a patch
> with this used in it."

You're welcome!

So we added this at the bottom of those docs:

    Note that the macro is intended as a temporary debugging tool to
be used during development. Therefore, avoid committing `dbg!` macro
invocations into the kernel tree.

But, you are right, we may want to remove the sentence above that one
about "release builds" (or, rather, replace it with some of what I
wrote in the previous reply).

> Or we can add it to checkpatch to catch when people inevitably do submit
> patches with it?  :)

We (are supposed to) have something better -- we disallow the macro in
Clippy, i.e. one should get a warning about it:

    disallowed-macros =3D [
        # The `clippy::dbg_macro` lint only works with `std::dbg!`,
thus we simulate
        # it here, see: https://github.com/rust-lang/rust-clippy/issues/113=
03.
        { path =3D "kernel::dbg", reason =3D "the `dbg!` macro is intended
as a debugging tool", allow-invalid =3D true },
    ]

Sadly, I reported false negatives with it a while ago:

    https://github.com/rust-lang/rust-clippy/issues/11431

And it appears that Clippy is not recognizing `kernel::dbg` at the
moment -- commit c016722fd575 ("rust: clean Rust 1.88.0's warning
about `clippy::disallowed_macros` configuration") has some more
details.

But eventually it should work. Worst case, indeed, we can move it to
`checkpatch.pl`.

Cheers,
Miguel

Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AC61E5728
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 21:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731967130; cv=none; b=tLKrXubHHTOeLlGAxn0/PSbVuooPjuNhuPSXd65iSk3Cg7uTYNnYkYfwLiSLQBB/bk4KbkedzyalRuT47Ya7IW5k25Ep7UQrm2kVjoF/YJ/kPlupYyziXx4MA/kxfUGH8sg1P5LNwXxuHtWFGFjCKCLf4Byh3KPs1z9UlxWoDKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731967130; c=relaxed/simple;
	bh=hQkH15gr6Qgm2KoVe/ThQVUD4flOHdtYi2Q7pTwd0MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOztBeL3dk/f7irexRzVJkh6UrqNDOJwjMqkhNmLXq5L0v5ZD33v79SOWOSpQAT4NUBcOOo5dducLwZMXTwPyUz7vYh2qAqxNM9+LRFrGe63gzzHfnPkP41aoDFQg5Zgai3cfJ+qt3uCPC0/5Yg10XDhXcaIlVOhXn4Hn75zQ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YCwFGM4m; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCwFGM4m"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cf6f5d4939so791a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 13:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731967127; x=1732571927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQ3Et6WIBdQ7sud4i/NonpGyXfau4X1TNW+PUgugafE=;
        b=YCwFGM4m7dm3zFbfStEWvyaCFaFZgAlEnsbWu0wmvgKiX3fe9zlLm1kZwFEwV+Y7q/
         crJtP3SJxgkueA8WSOKJrQIztfNl6bxSkwKeJvsVh0iA61LK0rsBcohX1jJhvdneuxvN
         /JFSN23ZmIszzCTZL+nvL4lxcm/2fAI+LK17pHRid03SQFt3q63VmmkkbI+0rejeoaW8
         uXawDrsKcpcfBip21IbCPgpMygCAEMCqEMCfPoxlmnLiUQGU6suyP8I71Zgo8TKnWikf
         6Uais1OpfOsGBQQQfOpbIOIx+/02IIGLk70py3jHHlQAJ+Hpt3Bm5bakqdoZ96pTz05s
         d63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731967127; x=1732571927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQ3Et6WIBdQ7sud4i/NonpGyXfau4X1TNW+PUgugafE=;
        b=jC4Zvu+LBMRvLrjdOOmuUuyF8Xy7xTLboM5nKL1TRejms2P8D40xVrdS9oibGb8WeK
         XmLkW/c9wNKp7H7lUWn0bubBfHA80sxM3qqo44Ss3sOngoDvjKaokoBNtkObSaEYc9P6
         nHhqI91D6DVsEBBpOl22FHIDP1rhoWp5ul5pVXLshxJmB9Eb1F1SMbjGPAAXWvAoAQXG
         JscDWF23ifXUI60uDgxh93V+TL10TWEEQIKC7Lbfwue+4uDTpbaeURs6HveZ5MvBbTGN
         heSdFsvdt9s3dRAjAWVMkSjUO9iq+5sDxYLj881E+fcpgAnSjQULhUolnyWheBgwEvwx
         hDQA==
X-Forwarded-Encrypted: i=1; AJvYcCUXUcS2YuJ6Ir0dC4qtSq3u33z0ChlhCxhD7rDCtgYk8YC50ooSA4+l0fuu3P5UN/ANX9uFyZkLym709aCgSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOdInGBg0abP9OsemL0NjKJf6JqVxg9lc6PQvdxOK99fpfEjo2
	BV7EJdBWgpheenH7IwLfS1IgkINBNf9+wRDxIiH25wzUL4wRm4vT1Rlb3bZwKMVmSiUfE3URE/l
	I6zYPbQvrmp3Xc6cQ64cg9sDH75lC2swq3EAR
X-Gm-Gg: ASbGnctPxexW6gaImqVxtQmL7ttKmc69TLGYHryTKmrekU+ce2aAsiL/JcSTE6zFpKj
	F2sWuz7w4KeJCKonTyxMPOcb73gun41PBQUpMMKjaAyIIh52TtDeoLfH7sxA=
X-Google-Smtp-Source: AGHT+IED/n5r3VjG+Ri+3OnSZ0XSX0QLyw7ggJKkFG+u6FSu0srLpXwOc/cszXrN20qB0TpblSw7+zX2Fd7l9uwnoW4=
X-Received: by 2002:a05:6402:50c6:b0:5cf:deaf:ac2 with SMTP id
 4fb4d7f45d1cf-5cfdec1bb2cmr23256a12.2.1731967126565; Mon, 18 Nov 2024
 13:58:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
 <CABCJKueVjP8V-=3Ehi4QvQzg1FZh2unyVMDzSJ_vJ_E5EE+gLg@mail.gmail.com> <CAK7LNARVK1ZpGXZVTAynuo7CDjgB4uT5bQzcGiWseZfaEu7Tvw@mail.gmail.com>
In-Reply-To: <CAK7LNARVK1ZpGXZVTAynuo7CDjgB4uT5bQzcGiWseZfaEu7Tvw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 18 Nov 2024 21:58:09 +0000
Message-ID: <CABCJKufVpx4dsr7A44qA0ydwTEx+3Qy_OMx9Ch6OKa4nzvRj2g@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
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

Hi,

On Sat, Nov 16, 2024 at 9:09=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Nov 14, 2024 at 2:54=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > Hi,
> >
> > On Mon, Nov 11, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@g=
oogle.com> wrote:
> > > >
> > > > To avoid duplication between host programs, move the crc32 code to =
a
> > > > shared header file.
> > >
> > >
> > > Only the motivation to use this long table is to keep compatibility
> > > between genksyms and gendwarfksyms.
> > > I do not think this should be exposed to other programs.
> > >
> > >
> > > If you avoid the code duplication, you can do
> > >
> > > // scripts/gendwarfksyms/crc.c
> > > #include "../genksyms/crc.c"
> >
> > Sure, that sounds reasonable. I'll change this in the next version.
>
>
> BTW, is it necessary to share the same crc function
> between genksyms and gendwarfksyms?
>
> If CONFIG_GENKSYMS and CONFIG_GENDWARFKSYMS
> were able to produce the same CRC, it would be a good motivation
> to share the same function.
> However, as far as I tested, gendwarfksyms generates different CRC values=
.
>
> When a distro migrates to CONFIG_GENDWARFKSYMS,
> the new kernel cannot load old modules built with CONFIG_GENKSYMS.

No, it's not necessary to use the exact same function, this was just
to avoid adding more external dependencies.

> So, there is no need to share the old code.
> Another solution might be to use crc32() provided by zlib, for example.
> It requires another external library, but this already depends on
> libdw and libelf.

Makes sense. I'll switch to the zlib implementation in v6.

> > > > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > Acked-by: Neal Gompa <neal@gompa.dev>
> > >
> > > Does this Ack add any value?
> > >
> > > Acked-by is meaningful only when it is given by someone who
> > > maintains the relevant area or has established a reputation.
> > >
> > > $ git grep "Neal Gompa"
> > > $ git shortlog -n -s | grep "Neal Gompa"
> > >      2 Neal Gompa
> > >
> > > His Ack feels more like "I like it" rather than a qualified endorseme=
nt.
> >
> > Like Neal explained, an Ack from a potential user of this feature
> > seemed relevant, but if you don't think it's meaningful, I can
> > certainly drop it.
>
> Tested-by is more suitable if he wants to leave something.

Ack. Neal, I'll drop the acks from v6, but if you end up testing that
series, please feel free to add your Tested-by.

Sami

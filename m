Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C475E1A0AF2
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 17:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725556974; cv=none; b=Ohrx6dJwOUaE3j9v3vcUUJNJbELO8qYRew49Wv2D93uWpjBUJhYXgMSzLDBTuouJM+L6W8ZsRfAyk33FAX6X2pk89ESQQsQS0Yx1cGx1r5DMMoNvnmUZzE7sxDk/dPZufD6Ec6VqPwJOJLOI3cZTl4kz+VdHlPk6O22WcKaflNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725556974; c=relaxed/simple;
	bh=YFFKBprzYe9Tjgx2xzIwNzSdZsPmSgV07WRj1qDXFxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/ifaxMl96cag+w4qb0Ir23aCtd+8gCHDz+sQoMz4Anz6/r9if9xfTLYXoTCk0/HsqUEVsN5RPPTVg5n1iQYwRB+/mUDS7N2BE5ArpMXHnMOsFqCnevqs9DH9wxrsKCoNiYfysl1pPsoS7JyA9uKWZ00ydh3jRG81nWiI4Do8Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RBY30qTw; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RBY30qTw"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-457c6389a3aso13401cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 10:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725556971; x=1726161771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mvs7XZfIpE1KW27Mt7NAHyVzsNIaPWNnyyca8sCjzlY=;
        b=RBY30qTwPitK5RhRYhOmrFrMNOh0bvy8MUUjCqXkdJuDtApdLEs6dM6/2JGWREdVUD
         BzETBfblOOq1xtixYxxA3bpPrIFtIWmQ0EOTh3h+bUgD5cHKG+t9V7UHTwG8w8d6pZ2e
         Tji1FS5ZEaQQ286jEUuheA3EuvE6BJtOT7k/ZLr+OEHSehaFMTlYDh+E1uD0IqTQ90kp
         EQDjnyfqWMMP7+0sTwo7tmoHLHzFyxeqOg3Es8obwIwoO4DJIp/5hVLnwBwLg0c2CFc4
         Dzr3rJZ21J/fKRbw9RR590Lxkp5nAbi7rB6wxRPvEOCYNg66yOOmiRfWCnLGY6FDwkHA
         1Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725556971; x=1726161771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mvs7XZfIpE1KW27Mt7NAHyVzsNIaPWNnyyca8sCjzlY=;
        b=iIhD9r8aHl3ROKwGAhhQBIo3JqB6XI8WaM8hEs92TeDIY26Sn/gy5554yRfyn3JYQw
         VXm4q6giB7EqKTrtN24PjsS8vc9UyDQ+I99aAbNDhFatD/sQFfHM+RxXWqhyXNmPWAjX
         ln0ojmTV1PF8Jgrp8V2B1X/HQsvvhDmggUcIFpICf64aeY5UD25S2PVEdxBr1NQ0mNCc
         /sHrbFdeS+/fJewtz2zN6i9ieuYot+02po4GEZN/UZQygNxAp+N+LnXsnjJ/c9cTT4eN
         Uehx/fTdkUnBfFVlVAf2aGYY2xfCh1OuSZN9pHvzNO0QUenfuIreWjeBml59lMtLyi7W
         BWWg==
X-Forwarded-Encrypted: i=1; AJvYcCXzltlyi0EQulgr36tJ+PqxBEiCESfsWcG6QfwQxqQWDpS0u7MyV5+Ot2vEVJpYCrCq3EqpGfgytdvyPRrViw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw91pR3sPrzG6ASr7/cHHpgRcKdfzGDdrAb1Mz+76wWyYzqCNY
	cV+eO6WDBYZWGMbOwqq3Yf5Wn7KzTZE+nN5rTGboOTRyIVWoee8wSnzXE9X9A0tlGO/RO+glVis
	FwglaoPIeNERaIIlqzGKwx+XsSbiQ4BaxWs0Q
X-Google-Smtp-Source: AGHT+IF4rwXFs+UGCrz3ubl9L36dS9jXzoOD9ZgQ9qmLanwyxQeo4NKEDHOV384nsw66SxugWS/hRi2Iyt4M39fljdA=
X-Received: by 2002:a05:622a:5786:b0:456:796b:2fe5 with SMTP id
 d75a77b69052e-458033f9c3amr3636611cf.9.1725556971239; Thu, 05 Sep 2024
 10:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-29-samitolvanen@google.com> <9978884e-87c8-4c20-b9ff-b4571bce01ce@suse.com>
In-Reply-To: <9978884e-87c8-4c20-b9ff-b4571bce01ce@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 Sep 2024 10:22:14 -0700
Message-ID: <CABCJKucn8KFw3+oj0qanYm-CbCpMhrJFKZqFmgQ0p5-zqfCc8w@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] gendwarfksyms: Expand subroutine_type
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 8:11=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> >
> > +static int __process_subroutine_type(struct state *state, struct die *=
cache,
> > +                                  Dwarf_Die *die, const char *type)
> > +{
> > +     check(process(state, cache, type));
> > +     check(process(state, cache, "("));
> > +     check(process_linebreak(cache, 1));
> > +     /* Parameters */
> > +     check(process_die_container(state, cache, die, process_type,
> > +                                 match_formal_parameter_type));
> > +     check(process_linebreak(cache, -1));
> > +     check(process(state, cache, ")"));
> > +     process_linebreak(cache, 0);
> > +     /* Return type */
> > +     check(process(state, cache, "-> "));
> > +     return check(process_type_attr(state, cache, die));
> > +}
>
> If I understand correctly, this formatting logic also affects the
> symtypes output. Looking at its format, I would like to propose a few
> minor changes.

Correct, it's passed directly to the symtypes output.

> Example of the current symtypes output:
> kprobe_event_cmd_init subprogram( formal_parameter pointer_type <unnamed>=
 { s#dynevent_cmd } byte_size(8), formal_parameter pointer_type <unnamed> {=
 base_type char byte_size(1) encoding(8) } byte_size(8), formal_parameter b=
ase_type int byte_size(4) encoding(5),  ) -> base_type void
>
> Proposed changes:
> kprobe_event_cmd_init subprogram ( formal_parameter pointer_type <unnamed=
> { s#dynevent_cmd } byte_size(8) , formal_parameter pointer_type <unnamed>=
 { base_type char byte_size(1) encoding(8) } byte_size(8) , formal_paramete=
r base_type int byte_size(4) encoding(5) ) -> base_type void
>                                 ^- (1)                                   =
                                 ^- (2)                                    =
                                                                           =
                                        ^- (3)
>
> (1) "subprogram(" is split to "subprogram (".
> (2) A space is added prior to ",".
> (3) String ", " is removed after the last parameter.
>
> Separating each token with a whitespace matches the current genksyms
> format, makes the data trivially parsable and easy to pretty-print by
> additional tools. If some tokens are merged, as in "subprogram(", then
> such a tool needs to have extra logic to parse each word and split it
> into tokens.

Sure, that makes sense. I'll clean this up.

Sami

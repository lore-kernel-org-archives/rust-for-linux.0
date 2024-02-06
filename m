Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669573194
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 03:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707189072; cv=none; b=HKGwqGT8guDcURADgqfktC9l4rkmgxUleYOzkz8ghsiHkpaAnYd2YvR8FCclpGmU3PDfXq5NESrs6fJezIjZEE+4m+Ls7spWn/fzSzfV9wKSHXhzcYWJBOofm2cxW2e+/frK50rUCeS02zoVdvQc+dpJxYq+YHZVNpgde7Ye0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707189072; c=relaxed/simple;
	bh=/2HOim3XXLLsomqM1aw1kF2MzqXOL9omA1bwQbUeXYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoOv9r3VddgmsVcY1femPZW0Np4kOHq1tvHwWpytI+GVTyxMXugZNoTAwJbhrLDm6Gr0GSInE7UFUIvHCWJ+TuD+wBBritJznlMmUfrSBTYbAnIGvIEzJf9D+1mZxWLgLEoxq7mSsevzerON6f2yGTA1PgtSamq6u4sf1XXxEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=fFfgKlRH; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="fFfgKlRH"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6047e7d38easo511947b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 19:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707189069; x=1707793869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrz9nuXoYjayEsWApiRQvKEZwq9CLqcTwHNXHxuNb/A=;
        b=fFfgKlRHIwMeA9LL+C+4/uSoJ8CshrihWD2Z8HJFyR42EgkFF7naDTAmhM1BGiptE8
         AlZcTv/P0YnJ+6S1HnnNxprPgocTkzW/1LT8abRKrUD1sxpd3gNidRCmzRcvtUy+SLzx
         DL8a1xX3wf92ODg/nEjakxlqRRm2jMhVnxxLIYfTlD9xZsdi5IQAFlZbJNTeybTqdPt1
         ADoD7ezEDaf+CZTXEcdbQ4aO74NGTR/IEqOxUTjHh6IwKnBsyNLa4XDF13tf8RCoHiNT
         idQvFQwErv4fpeAfYjRSraPSj7Q2LmHEBUf4VG+JDzUDpLsCNnHU+AVRjxnydGsjJOV7
         vl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707189069; x=1707793869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrz9nuXoYjayEsWApiRQvKEZwq9CLqcTwHNXHxuNb/A=;
        b=W4/76yvAUhawYC4fZQ7wIwTs37wFD4TwUcTWn6PtjGYfS4jc/BFbcKktTNwytmKxI9
         8OfmCpEBqyxYXpCFxy+MVGJtIospOGK/w28i/H1bnKEl4R3F4isdEQfKOEaizQA/QwEg
         LUGj0RQcckXK/TH5sr8aOo4NSbH01mr0zWQtxkw9RjXZivI4WUjToH9byAMPc29ltsQp
         zDWtcvMoQVi0+dqPj0tSKa3gp2kRQkoNWrq7osuIZXlRh166Ft7gVFWd2QWlprbM9YEr
         BbKj5AMFG9XyrrCLyl0/VaRdEzuUI3UjBnHgnMpNxo0vMWbUkuPnnAUJfyhNgs7f5e5T
         ak0Q==
X-Gm-Message-State: AOJu0Yza8zVFsQP5m2HpbA3sPPCq7CwASO/i0k7bTgYS1quSxLhEIuAS
	fEqMn2Blfow3tu8nk0S6R13SLcIuHhMQtE1QpZ7/BCGNZD99xfttz9alBsOjZS1+UUy79qYGmf8
	QyOniz2Bd1mVkDOuKC6lgRA6C3BW17sMMYMXO5w==
X-Google-Smtp-Source: AGHT+IHNNmQdoMC0f3UErPIYpjIY/PD5gWHUrjkAww1BaoeT7CgElbdbgZnWCGF1MDVSyI8IUAPNxuOtQj+0Hd568VQ=
X-Received: by 2002:a81:9a88:0:b0:602:b343:60c9 with SMTP id
 r130-20020a819a88000000b00602b34360c9mr426602ywg.26.1707189068927; Mon, 05
 Feb 2024 19:11:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <c5a8d670-2574-4d64-8928-d606968f360e@gmail.com> <20240206021342.GD296718@fedora-laptop>
In-Reply-To: <20240206021342.GD296718@fedora-laptop>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 5 Feb 2024 22:10:57 -0500
Message-ID: <CALNs47uWE+DLGdG_8CPQUWEccbJeX+68x6piSa0sf3i5RYcO-Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in .init.text
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: Martin Rodriguez Reboredo <yakoyoku@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 9:13=E2=80=AFPM Thomas Bertschinger
<tahbertschinger@gmail.com> wrote:
>
> On Mon, Feb 05, 2024 at 10:39:40PM -0300, Martin Rodriguez Reboredo wrote=
:
> > On 2/5/24 22:25, Thomas Bertschinger wrote:
> > > [...]
> > >               // Loadable modules need to export the `{{init,cleanup}=
}_module` identifiers.
> > > +            /// # Safety
> > > +            /// This function must only be called once, during modul=
e initialization, because it
> > > +            /// may be freed after it returns.
> >
> > The thing with this doc comment is that it's going to be hidden because
> > of the `#[doc(hidden)]` attribute. I think that it should either be a
> > common comment, placed elsewhere or removed.
>
> I went back and forth on the best way to comment this (or not). I am
> fine with any of the proposals, with perhaps a slight preference for
> removing it so as to not clutter the already somewhat busy macro. If it
> is important to keep, then I think a common comment in this location
> makes more sense than moving it elsewhere. Anyone else have an opinion?
>
> - Thomas Bertschinger
>

My 2cents says to keep it as-is - it's useful, doc comment form makes
it clear what it is in reference to, and I think even hidden items
show up if rustdoc is run with --document-private-items.

- Trevor

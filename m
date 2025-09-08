Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9983081A1
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 16:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349144; cv=none; b=fplMH/Eku/hWsbqs92scrtviHrWZi7pNXvekmTUuH8Dtc413B9OYRskjEZX7ziFSqeAc74wS6YEjDBAb+iyiHehBtP8SelcgeWuBsMdKlortPAwdsJGfr/HTHsGg43yL3nlhI53lFDdUM3G9gokPXjjghyrF26ZDD/+dIR6dhjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349144; c=relaxed/simple;
	bh=UoSxqZLwvjJ+W5ldROygOM7fdzpSBHyK27BKs+KwPLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dIZhYMLlZizkwWv0IcDBwLz0k1Hob/+hhi+cwV/pqvkFL/6IFQYQsUyyyDUiwK5H/vWtrz7TWNqQxEEP2m0QkJwD42zltLfCCNEpgAfnT6W8Q9bsz/8ZSpmeWPtTIdQhaHpjW/j0mdww7tsL0mlZZx9B+cM1ed1OuUs66plHj5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIyg6F2w; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIyg6F2w"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24498e93b8fso9152225ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 09:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757349143; x=1757953943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOHckARAzjSnD5XqHvXfv11mR6xBcj5eLuDkGHpT+0o=;
        b=PIyg6F2wieUaNMvT5l5aGvC//qEas+8IR4huDPzZBOovt3UyXxtl97MmYI+7e7K63K
         b5RNOgSxGxYw8A+oMpsJ4sqQo00tF3OVH2LZ18GN+Gjp4g/dowCjSvgAUZgTVbqBP5AB
         8tXnRrn88fEXNfNvJJvrLrlxTeUsmz9Q653WT5RE436fiqjmJeikndad+tPQUR37b1CQ
         dKgaw+B31Z9xk3romoGBpY3mzQUx7W6t3oVYoMhvzm9eb5MiAcY4U6O4FsMRi4FkEkEk
         VaW70pmTiwz5V8qg1HJt+zxPvhuxdEGcI30JrgVZpCyy2SlBGWZy3UxwUzWlMCiR/pDX
         qV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757349143; x=1757953943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOHckARAzjSnD5XqHvXfv11mR6xBcj5eLuDkGHpT+0o=;
        b=j5svM8kempH/E9YRvwt2BROQ3lkLuL9j2Kqekyt95IBWzbTj3XgneDFugd5hbbt0Dh
         ZCoONiCnXgS3+f1aiYMIi8A2AYHjQ/aOryRViTRhK9KrROdZ31ZKeJci6sTcnPhzKUWm
         uVmHFzhNLPsh6WBoH38R77cpz7GBHa+ZqmS+4gngoPcEoCfEAv+ynAALADjg7LtjwEAT
         4c5a3BSO4dBerQMGI9615b+wIDboebltYo4RcZQV4O+MVtebCESDcst0ats72nG684n4
         Ffjz3M50njpnrsxo7itW/rpvVu78I8IM4p+SQtJdoB7o6EproRfFA8KHr3cYaFERfMuJ
         xs2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoJBAocUO9GAtNmHk6vmZANVs+BRiywxBmlkNbHLvlY8KWFXd/PqdcAusxTR7RU9xexlby9VhjoQO15lqhUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXiRD+UxVAj7JOkKKOy1kGuyxFdwORThWm9lL7pGSPZ6zB9TWx
	d76gumdg6glW0SNgIE2oS0pkQT2tsR4ES4e71N2/h2jBMXG5dFADt+7Z4Tg52OnRetkrxQAnAUd
	EHYMY9QUXd6A4QKJlTjfNTinoLQyZaBk=
X-Gm-Gg: ASbGnct3D8and5MSM7gS2svi9w9UYslknI6uzhI7CwDnXOWWtvT3lpnMFe9yA3Pxv7z
	BhCoiMqDUkSA4gRvuFjYMM3y/lOSg9k0vi0O6j03zCkQWJYxdjN9NHZNU8ZqZ5Kww5/VZJe1k9B
	aHo77WuTLBlCQzTVQweKyst1BV22Iz8lwY0fOMMR5ei7j0QEvPj2ZlxrHaxoqZWJFqWY9nyRP7y
	s5QYz+N5bx7qwnNnTzv0e27GaP15YXtdNkW/jRniwd6oAayspOvO15qGBqlePaPBDHny18Kwsjx
	gTILwDn3/GrarjXMbcWM8Wj1VXP5eR51+iQDZpIKnaxui4M=
X-Google-Smtp-Source: AGHT+IGBMEcsEfLwrnaPqrIwoCQoztMNrnQ+yijjrZW50dqiJSfSpzIPRSqaYzKuBgNmINNfO5ktIrZ02yLJPHrHHx4=
X-Received: by 2002:a17:902:c203:b0:24c:b1f4:88cc with SMTP id
 d9443c01a7336-251757bab71mr46772935ad.9.1757349142637; Mon, 08 Sep 2025
 09:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908160224.376634-1-marco.crivellari@suse.com>
In-Reply-To: <20250908160224.376634-1-marco.crivellari@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 18:32:09 +0200
X-Gm-Features: AS18NWDjPw_A7bqwfFLpIv9dVxi8NUPCfc_-v0uamw69CRZEIxhIEXxGDVH5PyI
Message-ID: <CANiq72kJxwEncXVVrZoMyjXrtsJUGf+kamz0G+d2we7Fk1Vp6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rust: replace use of system_unbound_wq and system_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 6:02=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Below is a summary of a discussion about the Workqueue API and cpu isolat=
ion
> considerations. Details and more information are available here:

If I understand correctly, these two patches are "just" following the
C side, right?

i.e. the summary below comes from that original patch series, but this
one is just adding the `system_{dfl,percpu}_wq`s that were added on
the C side.

In other words, I would have just said that, plus a link to the patch
series or commit that actually added the new wqs.

I would do so similarly in the commit messages.

> =3D=3D=3D Introduced Changes by this series =3D=3D=3D
>
> 1) [P 1-2] Replace use of system_wq and system_unbound_wq
>
>         system_wq is a per-CPU workqueue, but his name is not clear.
>         system_unbound_wq is to be used when locality is not required.
>
>         Because of that, system_wq has been renamed in system_percpu_wq, =
and
>         system_unbound_wq has been renamed in system_dfl_wq.

This is not what the patches are doing? There is no replacement nor rename.

> =3D=3D=3D For Maintainers =3D=3D=3D
>
> There are prerequisites for this series, already merged in the master bra=
nch.
> The commits are:
>
> 128ea9f6ccfb6960293ae4212f4f97165e42222d ("workqueue: Add system_percpu_w=
q and
> system_dfl_wq")
>
> 930c2ea566aff59e962c50b2421d5fcc3b98b8be ("workqueue: Add new WQ_PERCPU f=
lag")

Why are these prerequisites if they are already merged?

Thanks!

Cheers,
Miguel

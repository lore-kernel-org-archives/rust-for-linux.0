Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D82513CC5C
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711557050; cv=none; b=iRHnXy2JNqkX/BuQE9cv+PngZMeakG7tcsq8KZvZt+AGtPPBZtfS/kXkUHIFnR7hPovVIL8hiB1U94kbjYJytB9XUBKqinfHBjSTyKnnYWZ+aZl2ISR9ZxuIXWppC9db3xgK3SVOAIN2G7zg4ZECle02lxNEF05T6Iw4uGPlDgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711557050; c=relaxed/simple;
	bh=B+y3KfTmF29v6VYHD7tORMKanRDvDZ0THIjtmMQtUck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFMRp/jhqLxIP73ZEUOicAVv0HrXqOJGK8EhTUsSwDmY20inZRTGghrB1vwqR0cOZiO9bW7srvHs9TB7Q+SqAHFmnRwBSyI6z2aORLm9RtiPY6F6syxmNwIy39girItN3d0bCuBqgs5pLngXefHy0mUD29wF2UwrHfA1w4yMdF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jz2lljQt; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jz2lljQt"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d3907ff128so5217591a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711557047; x=1712161847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgZvJNSc77OLkxWq3dlzWEXQulVrBf5A1FquBlsE+hM=;
        b=Jz2lljQtz6oCebhrrG5S1dd3119+VVynz7eEvEhW1rdZsHrKTeSdZBuExooccXlnCe
         vdBt5XcSQdTcRTHrtVBKU1wxVIuv0PRBqnzlWppKex1NeasUgElg/N4KgoevUileov30
         jZoNfkPO1uEISZiNVJ2wupQm93nNZitp5pusp9orVU9xs/00x9ur0plal8XgKPjRmCnC
         F9zuKk9fTaBbVFI/mN7T88f2RWIa93l2++zq/Mz/oSLq1XPJVifnguhtL/P/GUWcE/Es
         4iTLGzsDJ/hTtL/maczn7lCQO2wQK8OhlBUyDOC12sxuPNb4Wc8znAG6qKtqVtzlcnHa
         QXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711557047; x=1712161847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgZvJNSc77OLkxWq3dlzWEXQulVrBf5A1FquBlsE+hM=;
        b=NRqGzAG6cR8LkXdBzq0vmTPFrjsgvrdfrrJUdxhtAaQYYzb8yycuR+s+s+w7im94li
         MDw5l5ZB3cppJxcjmG82wuOKYlHuOYJkUA+cTPmIdFIzGc4KwhPOz4sUkxqvLOUBdkog
         xYtbSlEQ/wLYunx6mHrXvm6RyY3AI/JyKstz+uZNm9Bw2onb8aMnePugrUMC97PfLuda
         glzGnmnsDI0tw0EAshNvrZLjHmqMQsjRS65Ls9mFhGw1ihsE3eq2EwiGVMLtlaSIVCxv
         Q8d3Z5+TemcoqC8qEDrFBJ7f/Nk/uwCRC+ceOV7jts2fNhQFTF6Pmzrac0CHNPBH8aJT
         48zw==
X-Forwarded-Encrypted: i=1; AJvYcCWxOTTsHFLjliB1KI9sJf8dQQrIGyg8QjkcvDs6ZQLryTGH7rQweCOmTlAtt0bmW5R2HQPc9S9niFRzRTDvF76PFTsrxWUZSTAorFpDYdc=
X-Gm-Message-State: AOJu0YxlBmQhS+yX2KU0AMrqsQd1I1sfg+0Vh+9BAUBgBurbPQ63vaFh
	aTJqpJfFlarHDqCyaq+rnDfX/ASyoeZFTmryMa34JtGqRjVlk1c08ry5wZACWBmanSCQKdXCQrZ
	F7JBE9FSb+kPNzWDGi4qs+2HsRP8=
X-Google-Smtp-Source: AGHT+IGxYd85hhUY5l0m/3Xx4Z/Vi3X5oh99rrWRqYJ4YKmvckiJ7mYxYAnHa2nDXkIYJMNrvFp65DYqG2lCayJ4aOs=
X-Received: by 2002:a17:90a:ca90:b0:2a0:1167:bfea with SMTP id
 y16-20020a17090aca9000b002a01167bfeamr180397pjt.5.1711557047276; Wed, 27 Mar
 2024 09:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174743.95542-1-dakr@redhat.com> <CANeycqq=qETyG5ZwmKo0-iLehWeGVf_WqLf=OK3D1LN2yzYbCg@mail.gmail.com>
 <ZgQCF3jp73n4BTs4@pollux> <CANiq72=s576RhVFCK0+BHSY7Z7gsef9ddh586zrEDhQSoXAXwA@mail.gmail.com>
 <ZgQx_rjWrelMGm04@pollux>
In-Reply-To: <ZgQx_rjWrelMGm04@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 Mar 2024 17:30:19 +0100
Message-ID: <CANiq72kXDAiYdCARMbK5Z3QWQNm=MQa4Va7PTc5zJm=9+cH_5Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] [RFC] Rust device / driver abstractions
To: Danilo Krummrich <dakr@redhat.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com, 
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 3:49=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> Sorry, I wasn't aware that you prefer to have some extra process / stage =
of
> revisiting / reviewing of existing patches / code that is picked up from
> R4L/rust.

No worries. It is up to the submitters in the end (i.e. you in this
case) -- we just try to help by suggesting what we think may have the
best chances of succeeding.

In other words, it is not that we want to have "extra process". In
fact, we are not the ones that should/will decide when to merge code
in many/most cases (it is the relevant subsystems where applicable).
But we are trying to help you get there.

In particular, the old `rust` branch contained a lot of work from
different people, in different stages. Some was mainlined. Some was
marked as unfinished. Some is now old enough that requires adjustments
to new stuff like pinned-init, or maybe the C side has changed since
then, etc. even if it was upstreamable. Some was definitely not
intended/ready for upstreaming.

> Maybe it would have been good to give me this pointer when I asked: "how =
(and
> where) to get specific code discussed." [1]

I think we talked about the usual process we have been
following/suggesting in our virtual call. I don't discount having been
unclear or not mentioning everything to you, but it was a fairly long
call (~3 hours I think! :)

We also have some of our recommendations at
https://rust-for-linux.com/contributing#submitting-new-abstractions-and-mod=
ules

i.e. the main point for work like this is to get people involved.
Sending the patches like you did is one way of doing it, but sometimes
it is best to approach it a bit differently, and thus our suggestions.

> Maybe I'm also misunderstanding what you mean by "revisiting".
>
> Anyway, how can we proceed? Can we just continue with this series and imp=
rove
> things by further review? Do you prefer to approach it differently?

Up to you, but I would suggest taking a look at what Greg & Wedson
have mentioned so far (last time this was submitted and now), fixing
whatever is needed there (like the pinned-init stuff) and improving
the documentation (API documentation, code comments, even `Doc/` if
needed) as much as possible where needed (so that maintainers can very
clearly see what you are doing, and it will also help other people
later on too), perhaps replying to all the previous feedback in a
summary in the cover letter...

Then I would double-check afterwards with Wedson and others if it
looks better, and then resubmitting to the list.

Or maybe Wedson wants to revisit and submit these himself -- I would
check with him, perhaps you can save yourself some work :)

> I think that's actually explained in [2], which I referenced in the cover
> letter. If you think there should be additional information, please let m=
e know,
> I'm happy to add it.

I did read your Nova message before my other reply, and I pointed it
out because it is not (even assuming your readers do read that other
message).

That message just says "something" was taking from "somewhere",
essentially. You want to be way more concrete. For instance:

  - From where/when it was taken: i.e. it could have been the `rust`
branch, or another tree from one of the main users, or a personal tree
(e.g. Wedson's in this case), or even a random one somewhere else (and
somebody there could have had the code modified without telling
anybody anything nor adding a SoB etc.).

    It could also have been not the latest version from one of those
trees, either.

    You could provide the URL/hash if you think it is useful.

  - Why it was taken: i.e. what will require this code? Yes, "Nova",
but ideally you want to be more concrete. You can even get to the
point where, if you are e.g. adding a function, and you already have
the code somewhere that calls the function, then if you can include a
link (or even an example of the caller inline if that makes sense,
assuming there is not an example in the API documentation itself), it
will help a lot readers.

    After all, the main blocker for some of these things is the
"chicken-and-egg" issue, thus clarifying helps.

    For instance, take a look at e.g. commit e7b9b1ff1d49 ("rust:
sync: add `CondVar::wait_timeout`"), where Alice most recently wrote:

        This is used by Rust Binder for process freezing. There, we want to
        sleep until the freeze operation completes, but we want to be able =
to
        abort the process freezing if it doesn't complete within some timeo=
ut.

And this typically you should do per series at least, or in some cases
per patch may be best.

> Noted. But just to clarify (and I'm clearly not saying you implied someth=
ing
> else), not doing so is not meant to be understood as doing it without pro=
per
> deference. I was very careful in setting up proper authorship and co-auth=
orship
> (e.g. for fixes that I squashed into some commits).

Yeah, the authorship looks fine -- I meant to be clear when you didn't
hear from the authors.

i.e. I would recommend pinging, waiting a fair amount of time, and if
you don't hear from them, saying so in the cover letter (so that
everybody understands that they may not have realized this was sent,
or they may not have had the chance to comment, or they may not be
ready to reply in the mailing list, etc.).

I hope that helps, and thanks for working on this!

Cheers,
Miguel

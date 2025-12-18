Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DB73FFD
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766056601; cv=none; b=oU1U/Tv8vpAASIsHz8YKa7BWz975AaSmEQLhvf7RvECRyxFKDftTIOIdCpX12va6EYT02GMqIEu7QbbzCEUyUtvtPZdIxHupjaIlWsu1ycsuMJ3Y27KwZbi4IrXy8JZUSG0tvFpLDneJuoowML0PbVChlWbi79ehlud8foNsb+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766056601; c=relaxed/simple;
	bh=KztlaeGaKnd/OAfSmunex5j7GqNA94eUF0mYNucDr+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/KGM7UwMgZjF7wZofJI63P9rTJ+Ty+KqOyNDcz7B9l08lYOigQJ+l5NJkIhX652nqcObpXGcsuAlKozBJZfBXKnLKx9CeiSAbuSfzP+fsCfwph3piHi/8aSKuSm0X+xO/DVPGHPNuuYq6hxG2Jsk/JQ23QegsSadUhmaE1WrG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oFVOvXAM; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oFVOvXAM"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2e77f519so316919f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 03:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766056598; x=1766661398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOXkpA8lYBVLvZTCg8IrEbi29SdqOpQhJylQGG6roho=;
        b=oFVOvXAMF8hxSEcwv80N6KIQ+TW8wwmGs9xaVH9RcJ/ELWfgZy+gAWG3fa06EK7lEQ
         nm7yLHc6479YjcNE4xWojXpkf9lJ498DQBQ3ZC3/m6Nrx+YnR/lcPAjIE1+y/x0/H8tg
         kOtbmHGuDbP2j5X1pvj2/p4o3cj885fLSKgsUYF64M/v64u6AcNJZZStSGrqLvOvk8w3
         C9ftA2fhzLrOv/9I1gJjkh+i6MRwo+GNvETtafOLNLC4HRwDLvjpAhD6UypdV8Ek3L52
         b/62YbTufkYUYHVByHMdrNZR0LSPqN+SkE7oIjpzFHLgF0UU5+ZzIg9dg+9S6ysPtR62
         HaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766056598; x=1766661398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uOXkpA8lYBVLvZTCg8IrEbi29SdqOpQhJylQGG6roho=;
        b=s8wMYzhabmAK5MSm52vOz1pDB+XozhS5vY5KdAcqeo5Hr6NUNvDWcSSpfopgptND2+
         kLdvPnBWAIDS9Mn8GKmScm3hx9kg3GmWsgLuVP07EDmThISed5lyUDGbPmeak/ftWPz3
         S85X3zavZQQKbri5/o8MZm8+qP79Q/QuZsFGe6kqkPzDe4XKBTTLeQMyS9+4SdtN3ww0
         MakqmgLNMOibusGbh+mbgMKZ9l55LHQS85+rVZT3JtJXMUDpevL849c8qOvyr+1Pi6Ye
         vbcXqTZ962AHKOPNarpvvjeud32Jy0Sc8S7edPQmzyeFJWluPU8XpkgZ4aHKoj5vMRqz
         lt7A==
X-Forwarded-Encrypted: i=1; AJvYcCWtBY6+Rr8XRdV3dX0iDK+l6zTzDzB711PF1uVCOUa1pSopP7AJdku4ireabRYtsteCCyGujfFhZfNtb95O+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd/XqzAFbJb4sZOy/CrNH2DWj3qrMPRAcZYam161llXtYlq4oy
	NLfOTgr5vdnG2xYEQ4D6M/q0flZvO3wIQxtOsVOD/Gk51+aDJ2Igyxf6XsHnymD4T6fvQHKXD+k
	E+frOgxwaIsbNdpPG39MfRgOcc6oICD3tml0GDakN
X-Gm-Gg: AY/fxX6xgV9sObg4Bkqvs2f0su92B9l56pGdY+A8Gd0ouNPLl20yyy+EzrMejPLN/ys
	ieEWgaDxSl9PgCHr3WZTxdA5bf9Dn559d3mryZP1z6M6rWxdlLsMj1iyakzguFlo3AwZPG7D4vw
	5OanEAU7vyuo+BsrwsLlwkuyADoDZ+PRnjQFFReB54UQ4iiMpqJ8lq8hhf0rh/oFM44zdDG31Dp
	8k09utZEB4EaF1df4aGc0VupFlg4WxrHPFOid9pmvKGV1pso4xCtM5ZlnEFobakUJ/fhVFFD7lH
	mvSY26AJf6WOSk4PeYu8/P5XJA==
X-Google-Smtp-Source: AGHT+IFrXoEzEmVRVSzOzT1YZ+gWxS6eF1Sdu95x/QMJlgrz+t1Ee2yozvEWMo/cVsiyiwqvxXVU3aGVoS8tAA05mWI=
X-Received: by 2002:a05:6000:d82:b0:42f:b9c6:c89b with SMTP id
 ffacd0b85a97d-42fb9c6caccmr19207847f8f.50.1766056597425; Thu, 18 Dec 2025
 03:16:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218-task-group-leader-v1-1-4fb7ecd4c830@google.com> <aUPYIm6jhceRC4J7@redhat.com>
In-Reply-To: <aUPYIm6jhceRC4J7@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Dec 2025 12:16:24 +0100
X-Gm-Features: AQt7F2rMx8pc5mdf6C10I1W6Z_S5-bI58P6NNbu4f_kBP2JBUttYy3TkZlHcKzA
Message-ID: <CAH5fLgjhBZRn_gPcFK41RTRgQzqOscD+tKms0QrXdYrSZ-g+Vw@mail.gmail.com>
Subject: Re: [PATCH] rust: task: restrict Task::group_leader() to current
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 11:32=E2=80=AFAM Oleg Nesterov <oleg@redhat.com> wr=
ote:
>
> On 12/18, Alice Ryhl wrote:
> >
> > The Task::group_leader() method currently allows you to access the
> > group_leader() of any task, for example one you hold a refcount to. But
> > this is not safe in general since the group leader could change when a
> > task exits. See for example commit a15f37a40145c ("kernel/sys.c: fix th=
e
> > racy usage of task_lock(tsk->group_leader) in sys_prlimit64() paths").
> >
> > All existing users of Task::group_leader() call this method on current,
> > which is guaranteed running, so there's not an actual issue in Rust cod=
e
> > today. But to prevent code in the future from making this mistake,
> > restrict Task::group_leader() so that it can only be called on current.
> >
> > There are some other cases where accessing task->group_leader is okay.
> > For example it can be safe if you hold tasklist_lock or rcu_read_lock()=
.
> > However, only supporting current->group_leader is sufficient for all
> > in-tree Rust users of group_leader right now. Safe Rust functionality
> > for accessing it under rcu or while holding tasklist_lock may be added
> > in the future if required by any future Rust module.
>
> I obviously can't ACK this patch ;) but just in case, it looks good to me=
.
>
> Although I am not sure this is a stable material... Exactly because,
> as you mentioned, all existing users call this method on current.

Well, I suppose you are right that it isn't. I would like it to land
on Android's fork of 6.18 somehow so that nobody makes this mistake in
future Android drivers using 6.18, but I can always do that separately
of upstream Linux.

> > I don't think there's a clear owner for this file, so to break ambiguit=
y
> > I'm doing to declare that this patch is intended for Andrew Morton's
> > tree. Please let me know if you think a different tree is appropriate.
>
> If Andrew agrees and nobody objects this would be nice. I am going to
> send some tree-wide changes related to task_struct.group_leader usage,
> it would be simpler to route them all via -mm tree.
>
> So far I sent the trivial preparations
>
>         [PATCH 0/7] don't abuse task_struct.group_leader
>         https://lore.kernel.org/all/aTV1pbftBkH8n4kh@redhat.com/
>
> and I am still waiting for more reviews. Alice, perhaps you can review
> the (hopefully trivial) 1-2 which touch android/binder?

Done.

Alice

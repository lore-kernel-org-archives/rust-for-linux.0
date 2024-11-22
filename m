Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B929A5
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 18:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732301485; cv=none; b=KLeAUp00m50ihbxfnYL1d0smW4Zh+l/F6jyLuJSycuUcfY9b1LQ6JUaY5fWYh4iwWzCUAvaBEBHH+xWie6hBvEjTHAd7QPw5c83QynlVMQ4a+j8ayQR2zOZxLgyYXPaSw7Mq8XjCwF/dQliyNQmStiiYuhLxMk1UX7ZsYGciCKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732301485; c=relaxed/simple;
	bh=EDdjp3Lg+51DL8S+jI088MEBG3Mx8anTybv8AsR/tQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxGx6lIcmZyLTGjP21wwMyezZVlPhsacXjCcX+V/+oSmXf1iMpi6HZYWZHXDN2fqZ55MgHEzMztT1HN0/x14e0w9yR9NqjWmrtIz7qv8wP//Rhxs8XYt7Ln+JeXpD9q1Rs3lP7BrpMu7xTh6Ll+MCVK3WSzpZ6yP1N70u15NHwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0UFb3Q3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0UFb3Q3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431695fa98bso19984155e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732301482; x=1732906282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpPPN3R1McXWozDvHX/daHUfjmdWOz+ThDGU7hiahks=;
        b=H0UFb3Q3t2LHnSdHH8OUHPEsb3O3cmnA9PehJ/eDmVBOLEWyaJHFff4nrJQuWjnEeX
         pl1YKwmfEdKtkRdnBqctjYwSFVBCnesTL42eWyQnxHdOJ2daaH4troRrOlwXU9q7AbRD
         yzE7VSl2QT8FMClrxYIaZ+kZgW4mHsTn3efA2QEso8JnPlzr4EYmXodY6at8IeJb4jd9
         XYuS0htA4wqvW5eX1fz9lqRQB0x/10nUybx5PjaIpQNNrJwL8LZf/TvVIDIJywCaKqfO
         jnxTkxKHsX20KxW43DwxyUaPRRH5nlBIM96Gn5ouDHMCEvzOXoEVdD389FFxxJmWIXqE
         89ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732301482; x=1732906282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpPPN3R1McXWozDvHX/daHUfjmdWOz+ThDGU7hiahks=;
        b=Ye8QvwguYWilOFnt0V7PINeLOb6T5ku1sOvoMyh0R1xjCq9sSLTcEofOVOEehsoQVZ
         vyRetMTKi6dHLixlbY0hj4nCgusTyxx/41RF8pKuc2CZIcAh6kWp2C0IsljqLKHUTZ8b
         2Ta1TJ6A/lyjBD06kxxBRww1nIAt8JMM0aQOMAf5RP0h2hecY/zI1/QIH5g8ubU80vnX
         lxxgZp8KXwNy3ZSGuyXWcp29WRDfNv7uoQLn+S6QHOvEAPNBxrbRUUJWmuhTQzNL8uHW
         FyKaurl4R1FvvSg46pI4l+Diip39ivLJIZDPbYZi3Kc6GcgyACoLFK4oqgs9LFk+UgJK
         4iOg==
X-Forwarded-Encrypted: i=1; AJvYcCXkNc40HA/R8EjSlZmBbT3ONuZ2eI0yng653JbHAxH59AbwV8Evs8DulZtWTcPSPTvrsR0wtcAwMYDnUnLgXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgGy1gzIlj179bcQgo17xqPPw8sgNQcdL7fCc6JmrAwJr9waPb
	yDYdvG+mJOR+PzxKkn4Bb+2qwqu92bzkbyM2eO+pVeYhq7jWXueWkaLHgzHEghfS2qxSB1KsWVi
	gszGfyi2DYCWpkjEXvhyWHhXv/ajjKWuYRVIj
X-Gm-Gg: ASbGncvurutdMcDRVr58fUbRy351iL0hK2656+iahOSJ/01j+STckl8l3bWPzytfNwE
	+GJuK2E6EON0+9+jMGIsvikKug88sbsgS
X-Google-Smtp-Source: AGHT+IG60MHKWjpS7HL7BdSocFUswkPE6VjI5QZYufrqTtnaXwwR0eY35AZS63m+jOBxtRcZRh13iR5ORrpJEqRMoRU=
X-Received: by 2002:a05:600c:1f88:b0:431:60d0:9088 with SMTP id
 5b1f17b1804b1-433ce426feamr37670195e9.13.1732301482043; Fri, 22 Nov 2024
 10:51:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-8-7127bfcdd54e@google.com>
 <44ef7154-0f38-46c0-b87d-e598b146f4a4@lucifer.local>
In-Reply-To: <44ef7154-0f38-46c0-b87d-e598b146f4a4@lucifer.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Nov 2024 19:51:10 +0100
Message-ID: <CAH5fLgifW+x6d8S42Gz5p0jEXVC7MGKQAygUXL5VWzgrxP2Uxg@mail.gmail.com>
Subject: Re: [PATCH v9 8/8] task: rust: rework how current is accessed
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 6:55=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Nov 22, 2024 at 03:40:33PM +0000, Alice Ryhl wrote:
> > Introduce a new type called `CurrentTask` that lets you perform various
> > operations that are only safe on the `current` task. Use the new type t=
o
> > provide a way to access the current mm without incrementing its
> > refcount.
>
> Nice!
>
> >
> > With this change, you can write stuff such as
> >
> >       let vma =3D current!().mm().lock_vma_under_rcu(addr);
> >
> > without incrementing any refcounts.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> On assumption that the problem you reference with the rust imports is
> corrected in v10, and that what you are doing with current_raw() is
> sensible, then:
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Thanks!
>
> > ---
> > Reviewers: Does accessing task->mm on a non-current task require rcu
> > protection?
>
> Hm I am not actually sure, but it seems like you probably do, and I would=
 say
> you need the task lock right?
>
> Looking at find_lock_task_mm() as used by the oomk for instance suggests =
as much.

Okay, sounds complicated. I'm not going to bother with that right now.

> >  /// The type of process identifiers (PIDs).
> >  type Pid =3D bindings::pid_t;
> >
> > @@ -121,27 +141,25 @@ pub fn current_raw() -> *mut bindings::task_struc=
t {
> >      /// # Safety
> >      ///
> >      /// Callers must ensure that the returned object doesn't outlive t=
he current task/thread.
> > -    pub unsafe fn current() -> impl Deref<Target =3D Task> {
> > -        struct TaskRef<'a> {
> > -            task: &'a Task,
> > -            _not_send: NotThreadSafe,
> > +    pub unsafe fn current() -> impl Deref<Target =3D CurrentTask> {
> > +        struct TaskRef {
> > +            task: *const CurrentTask,
> >          }
>
> Why do we drop the NotThreadSafe bit here? And it seems like the 'a lifet=
ime
> stuff has gone too?
>
> I'm guessing the lifetime stuff is because of the SAFETY comment below ab=
out
> assumptions about lifetime?

I dropped the lifetime because it's not doing anything. As for NotThreadSaf=
e:

1. See thread with Boqun.
2. Raw pointers are already considered not thread safe by default, so
the *const CurrentTask field has the same effect.

Alice

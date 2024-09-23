Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B051946A2
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 09:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082635; cv=none; b=CuH+IlTTmcxKJzt2Hws+wGg820RTJutSwL/RYgxD66iwy6TSq7EcZnoQYoUIdVwgRdHoyAjD9nORJNv+Yks1f4YodimpfwPuWifTKJkHTAdpn/cGOZ+3A30hj+WHS25zBn4lu9DuAOTp68XSUs01yjhx/ktUl0jie2GtXYxOWKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082635; c=relaxed/simple;
	bh=uPgZlCyKgHfBNlGgGtBBy44h+xASjg0WLpo+j35SnPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUNvMUc5qycRYoOHQYHutsYwfEqBKNQ2jWtwM0pjv6Tu27xekE/rPwFd5Cp3HDZAIyLweGiRM5cq4irARp+4BvVgN3KTZHk/1oLXAQIVjQPbqL6mCj8gYTjMJjENsfYPYhZvSMCvLwzp8EzC0APnkDjKELrgDVNG3BkUnp8F9fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UHm69EB+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UHm69EB+"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f7528f4658so34795021fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727082632; x=1727687432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTh3TINkxBJWpdvT07eZ7FGsjAZzFnLti1KSAZnm+A0=;
        b=UHm69EB+GGCnZOwV3aue1IKtlkedL+Vqb5Ikziy+O3XhoYtWpzl42F/OQCziYnhXG+
         3//7FNsK8Pr6R6qxIn6ofwBa2U9zUjxFI1QLPNnkGn3dm+Mz8Rk/8DDdraw3YuOC0eQE
         PUQPvO5OVJIPBKgQj0VWVAdnToUZ3DluQvQGAKjdpm/OzkhTStxsbAfKFZ5a9blfxowT
         amAv7qhFZ+K5B8QPCrB58tXOqTnzN+ClMAnpiBUocl2QWzlZGb8NrjpimW9lcYofpSyp
         Uwom+R/gHgbVWzKSAnoHB2c7eZJRV20IpGkfFMPkd1gZtoOq4hxpV1dXz72BAgWrzYPb
         ybrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082632; x=1727687432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTh3TINkxBJWpdvT07eZ7FGsjAZzFnLti1KSAZnm+A0=;
        b=nMruzCBPRm2wZfb6Lsj5yCO8gYBeeqXZPbM0+AN+OOQIZT1tOPI9a+XawYq3Gas06z
         BuIfs3jlqhCGhMqftJHiBLQXHnDnNhSUc7eKTMx82vNhvgdrhgoWuZ2YFWAHxf0h2HuD
         RbWwRFtUzBJPfCCzfcux1ber94wTZronsgFqqAAHGf2xJ+1/FPdW1vKA+wr4eszGokHR
         qW1JAFWIbLp1SIs5oSc4nEKq6TXiRZiCO5//1zXRRkvFGoNYzuFRnJ104tziBsfEivqp
         PtrJDfE7u1r3SVHi/FyA4dTs1OgMPAAzbo5SuubP9IAorqEEY3QRYoSWZ8Zz5rPBgK6H
         /mAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv6VRFESK0eBdkDWHcb9EmrwPkS3z5hfn2QauUZ3eKT2Mue2XjDflQB63p/8Z4hho3SuTnGBfwLqhWNGKPHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxohVP7U8U3R5OH+yVi9fprXzg9x4JAuXHIBnUyIRNrTDXO30nA
	rnlRro2sn0yRJxMmnyf+gg1SDYNkPzZ6jg/bO7m7TAfhjZLTmABOiDB6ha1DIu1EIYQ6AOiTBSt
	70R07W8R7B+xk443AUyWdm7z2aU84POGyTADC
X-Google-Smtp-Source: AGHT+IFkDo4/xXo1toU5UNTrEq3g4zN2D09rl3Vkx1QeLDwzQPemWQJHswibNjBrREPKHVC790lBmLUeOANVqIdHn3Y=
X-Received: by 2002:a2e:3302:0:b0:2f7:611c:a643 with SMTP id
 38308e7fff4ca-2f7cb342ec0mr44724231fa.33.1727082631501; Mon, 23 Sep 2024
 02:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240915-alice-file-v10-0-88484f7a3dcf@google.com>
 <20240915-alice-file-v10-8-88484f7a3dcf@google.com> <20240915232403.58466ba7.gary@garyguo.net>
In-Reply-To: <20240915232403.58466ba7.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 11:10:19 +0200
Message-ID: <CAH5fLghE1RTGgnY=y=T0k62XfW6oqE-mQLSJEEc15YyZwdYU6Q@mail.gmail.com>
Subject: Re: [PATCH v10 8/8] rust: file: add abstraction for `poll_table`
To: Gary Guo <gary@garyguo.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 12:24=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Sun, 15 Sep 2024 14:31:34 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> > +    /// Register this [`PollTable`] with the provided [`PollCondVar`],=
 so that it can be notified
> > +    /// using the condition variable.
> > +    pub fn register_wait(&mut self, file: &File, cv: &PollCondVar) {
> > +        if let Some(qproc) =3D self.get_qproc() {
> > +            // SAFETY: The pointers to `file` and `self` need to be va=
lid for the duration of this
> > +            // call to `qproc`, which they are because they are refere=
nces.
> > +            //
> > +            // The `cv.wait_queue_head` pointer must be valid until an=
 rcu grace period after the
> > +            // waiter is removed. The `PollCondVar` is pinned, so befo=
re `cv.wait_queue_head` can
> > +            // be destroyed, the destructor must run. That destructor =
first removes all waiters,
> > +            // and then waits for an rcu grace period. Therefore, `cv.=
wait_queue_head` is valid for
> > +            // long enough.
> > +            unsafe { qproc(file.as_ptr() as _, cv.wait_queue_head.get(=
), self.0.get()) };
> > +        }
>
> Should this be calling `poll_wait` instead?
>
> > +#[pinned_drop]
> > +impl PinnedDrop for PollCondVar {
> > +    fn drop(self: Pin<&mut Self>) {
> > +        // Clear anything registered using `register_wait`.
> > +        //
> > +        // SAFETY: The pointer points at a valid `wait_queue_head`.
> > +        unsafe { bindings::__wake_up_pollfree(self.inner.wait_queue_he=
ad.get()) };
>
> Should this use `wake_up_pollfree` (without the leading __)?

For both cases, that would require a Rust helper. But I suppose we could do=
 it.

Alice

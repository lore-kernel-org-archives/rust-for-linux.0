Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEFC1946B1
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727082853; cv=none; b=PQsKQaV+Xqlj71enkObwu0Z3nnQzYw/fPDEmXSRbmUmjWtBaC2VXV7WfmJPlmoHa9OXk/Q+qzRJvaQtIxucquk7y0l+B5+IfTUTl1cs9096rCTz0iCfQoXtEMbK4emG8B8P2kcyOZ3WS+//UgFMYPVT4vZLXXUIniLwRsmtFSRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727082853; c=relaxed/simple;
	bh=u1Yt+XcZ79WUB7fnlp22OxIAKnCGDFrUq84/EzsKNbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCihmP1cv4U85dIaHQ/SyyvUXa0t9w1T/bQAOL/7a47AuGQIaJEAcqwzRulYtFihJb/hT19yupxDs9I75OrnUexIUOlumwCAqfeRS4oS9FAw+tpYMTflE1KsrEuH4ljVUKmAg+w9DHLtxvbyTD3OKgdR8EkOrNgcW9yoAfpbHYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l1UX417v; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l1UX417v"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374ca65cafdso2185014f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Sep 2024 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727082850; x=1727687650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoO4Ly2WYXegBLZyNy+1d+6/sF8Jo34Fx4K3h2NWcB0=;
        b=l1UX417v+M2k1oMAOlTbUw39xhCvyuYIRoLmhEROcKB0KbV6vo46WJ13+tJ9md0AQg
         JjLMU3Am2DYTbl2lJvwLHoGaAvvdzHv9qRPMev9LFyhAj+qndEKFl4eLjC9m+IxOffQp
         h5U9szBvAZ43XSpafYL00RcecZO1zRiGde9C9dVy/8Rpy9nzGkD1hBX3kVTPCySZKiq2
         GaHRaCZsu1inwzHXR86OAy0xhc8aCIIrhPfKbQ0BXGeb670L2P9JsjblEZcAvGPOZmk4
         EZmG7d7b8ChxNpNRXq7sYX3LGPY3v0CnbsOzZYWi5q8o6DBKPZ8Xw9sIo2OJPlIvvcQf
         4G/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082850; x=1727687650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoO4Ly2WYXegBLZyNy+1d+6/sF8Jo34Fx4K3h2NWcB0=;
        b=Ez6iglMezOcD3H6S1hgsLVF2EnORmT7HtYasFQN77/UjjhO4k1D2m0FUubIC/gH6uw
         72cIdoR7O0mVkGkikoYWNzz1PBMk9nO6iWHzdUpmkQDUErKI2oHcDpfUFIqNu0vr6UZl
         d6K0NqTk3uT+E86qst9Pb8KHpmy5mLNo80Ryfyz2/e/FG3AfHwfMHjpil2dgRyzazd9X
         Xf1kRTVotCkTJBqZXleSQVC9hLj+3bYimy9Hx3Q9LZgTsbH6DoheYwSMxyGPCf7j5pb8
         ropDS1NwdqMyyCZHBo7Iqd1vG7yYGdHlQsn0KNXPxHzFedAn63Bex9DQitmBpz8OWsO0
         jpiA==
X-Forwarded-Encrypted: i=1; AJvYcCWy/1HZYAv6ut2pOVZExrZsFfV1YCoZnEwFYnmzkC5myPWcvhov9bI/OYXAhoiVFdv7WBM24aE99LKUPG/b5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSIUB6PShpSrPFZtWXogK+jnIhqMayZzBJFH44AnlhRUBQtm/v
	4+krg+pBNRhtzbwqPffj7b4Sw0ek2qaOFV0NsFeZSoFWyl4nV8iJAL2pxlEBeaWC5UB9YrvuhP0
	xLuEgc1vZAR1czgyNqRotlfk9r2t1CJOLRLgm
X-Google-Smtp-Source: AGHT+IHdzVX9t2EMP2lKRd5S39F9WNXWngwiqDwQMOqOZbFRiUDhguhcAAX9KRImsjgcAu5QvwoMSQv8k0tvmZqPDgs=
X-Received: by 2002:a5d:6b42:0:b0:378:e8b4:1900 with SMTP id
 ffacd0b85a97d-37a4234d20amr5876417f8f.41.1727082849686; Mon, 23 Sep 2024
 02:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240915-alice-file-v10-0-88484f7a3dcf@google.com>
 <20240915-alice-file-v10-7-88484f7a3dcf@google.com> <20240915230211.420f48a9.gary@garyguo.net>
In-Reply-To: <20240915230211.420f48a9.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 11:13:56 +0200
Message-ID: <CAH5fLgixve=E5=ghc3maXVC+JdqkrPSDqKgJiYEJ9j_MD4GAzg@mail.gmail.com>
Subject: Re: [PATCH v10 7/8] rust: file: add `Kuid` wrapper
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

On Mon, Sep 16, 2024 at 12:02=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Sun, 15 Sep 2024 14:31:33 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> > +    /// Returns the given task's pid in the current pid namespace.
> > +    pub fn pid_in_current_ns(&self) -> Pid {
> > +        // SAFETY: We know that `self.0.get()` is valid by the type in=
variant, and passing a null
> > +        // pointer as the namespace is correct for using the current n=
amespace.
> > +        unsafe { bindings::task_tgid_nr_ns(self.0.get(), ptr::null_mut=
()) }
>
> Do we want to rely on the behaviour of `task_tgid_nr_ns` with null
> pointer as namespace, or use `task_tgid_vnr`?

Hmm. Looks like C Binder actually does:
trd->sender_pid =3D task_tgid_nr_ns(sender, task_active_pid_ns(current));

Not sure why I'm using a null pointer here.

Alice

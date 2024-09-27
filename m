Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B014717ADF0
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438669; cv=none; b=aNw9BArebPWp0M95Q8PxKJWoaUKnEUX01Z0q1hTviMnLuwvrg/SwcXn0/OSaK/GwHE+K5dExAZBuYA+XMnpu78m9Jj/1hfA0hAM/qjDwK47hbzH/ymdRNLM85VykrtrmKG4A2Py+WOuPpj8T9txRbuklOtWL9p9Ch6BmBWH9ZFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438669; c=relaxed/simple;
	bh=A52lZ6eit/IH20xPJbZ0ifh6fyqIylwhlAVPULjwrM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QP1N0VVr37+cxzJTwR9ZxWvm3ZqCwwdAPLQycPn7Xjzoixdk7y+jIt1JwVXzwCJesvIXRf2Yiz248WrHF+M8Fl1LD+FmAGxyjv4BPV8XGdiiBRiltA5EeGeD1ZQ+Q0EfyFR/knQszQA0IqPX5JRdHInfyp2MZY7qINiSZHYZvnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=097hUeN6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="097hUeN6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37ccf0c0376so1161303f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727438666; x=1728043466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A52lZ6eit/IH20xPJbZ0ifh6fyqIylwhlAVPULjwrM8=;
        b=097hUeN6Fwz5/BL43oDYO8p/1fifXuzVn7Mso1pxqMg/WbzJaigjzvHc90Tf0v1XRc
         aOmdmBLaqJBV9u9K7cuC1AvCSOqZNP9Fr6vIBxF/Ubf5XCNqrHQH77mwanWhOj8HpMzO
         a/POu5LZcImYnMDDwXgUUi7j9BGYcaNfKSLfodZiHNfDt/i3ofPOxhcBKvkJNHHUwha/
         QNmPnUkazkbZCNO1OuIe1RvnVLS4+b8IK4BrDvCMv5xFOscPh7/GYkAONiddW1696Iww
         jpne4UrtHqdi7TISYT6v/2a8qnyNDxYSCxjUB89HoYBbsy+4YBzwH6hB04VMJe6okZ5f
         DzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727438666; x=1728043466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A52lZ6eit/IH20xPJbZ0ifh6fyqIylwhlAVPULjwrM8=;
        b=j+n3edJfmuPQio1eXJCIWEJFba6itI6ggPGUxBEFkCTRtH3g0PBLvwHBLPYmAVU0Dq
         NZU+qeJVfodGU4dzqjhoupMZBVdQPm7rpJdVG45JxCGu+O4DCiT8gihrMfQ/SxXDwheb
         N8U6NtkZnh2goRJx0LaozCf1GAyY0y6mY1rIn9jP8bQ17TU4MGXkhyjQBP8VlNGIqoTj
         hAlreQHc6qu4F1T+S9fL7BTrLJB59vHYQMEzllXJtoZvpA5nlJgLljyMffDvsrmfzu0c
         XXYZnpBIr+9/Otw7BI/DFyA8l56H778qrGRp9/qgmo9M5cylPAupuiW4LjI1qHrkLb79
         /plA==
X-Forwarded-Encrypted: i=1; AJvYcCV8AFAtkmODSoPv/PVntpLk/DcxWUhFtodHshULHr1QO1zvUCqo5/lS70MHjq2Lr3O4743i1GqAv15H4e6bIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPuGrJtA38/NR+7ZlAbHnXuilPMRShON+GX4lZxXpazjYRokIj
	9VLb5mO+ofiNqsXy+Gv7qw0vyS7oSaF0aC5+dL0tCilSebaQ31KM9Jes+/vJgTs4UWGZN7nvwnv
	qQQe+QVAm1BEF3tx33e9A7HiZtrgjGlCWx+vG
X-Google-Smtp-Source: AGHT+IEy3dP7p1C2eMoRV16OpmNG4PB6S4oIj5yrTQFRdGKMIDUcgcOI2efalw5tNFlnpHn1BB6580PiK2e8zpr1Klo=
X-Received: by 2002:a5d:4808:0:b0:37c:d55a:38a5 with SMTP id
 ffacd0b85a97d-37cd5a69225mr1687246f8f.11.1727438665878; Fri, 27 Sep 2024
 05:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgixve=E5=ghc3maXVC+JdqkrPSDqKgJiYEJ9j_MD4GAzg@mail.gmail.com>
 <20240926-bewundere-beseitigen-59808f199f82@brauner> <20240926-pocht-sittlich-87108178c093@brauner>
In-Reply-To: <20240926-pocht-sittlich-87108178c093@brauner>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Sep 2024 14:04:13 +0200
Message-ID: <CAH5fLghUj3-8eZMOVhhk0c9x29B7uMj=9dHWsRJYC1ghxqUdxg@mail.gmail.com>
Subject: Re: [PATCH] [RFC] rust: add PidNamespace wrapper
To: Christian Brauner <brauner@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Bjoern Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arve Hjonnevag <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 6:36=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Ok, so here's my feeble attempt at getting something going for wrapping
> struct pid_namespace as struct pid_namespace indirectly came up in the
> file abstraction thread.

This looks great!

> The lifetime of a pid namespace is intimately tied to the lifetime of
> task. The pid namespace of a task doesn't ever change. A
> unshare(CLONE_NEWPID) or setns(fd_pidns/pidfd, CLONE_NEWPID) will not
> change the task's pid namespace only the pid namespace of children
> spawned by the task. This invariant is important to keep in mind.
>
> After a task is reaped it will be detached from its associated struct
> pids via __unhash_process(). This will also set task->thread_pid to
> NULL.
>
> In order to retrieve the pid namespace of a task task_active_pid_ns()
> can be used. The helper works on both current and non-current taks but
> the requirements are slightly different in both cases and it depends on
> where the helper is called.
>
> The rules for this are simple but difficult for me to translate into
> Rust. If task_active_pid_ns() is called on current then no RCU locking
> is needed as current is obviously alive. On the other hand calling
> task_active_pid_ns() after release_task() would work but it would mean
> task_active_pid_ns() will return NULL.
>
> Calling task_active_pid_ns() on a non-current task, while valid, must be
> under RCU or other protection mechanism as the task might be
> release_task() and thus in __unhash_process().

Just to confirm, calling task_active_pid_ns() on a non-current task
requires the rcu lock even if you own a refcont on the task?

Alice

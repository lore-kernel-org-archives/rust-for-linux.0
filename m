Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AAF17837F
	for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716928160; cv=none; b=ahxmyEeAuAF8mycnRHKAXh6WX6FXgy+BDeK8jLHfipoFsZ2nrUbxwpSKfUVfBXXAVGSQ0bHf2HSfYiiERF/lJqs1/5dsmXgX8PuxTOJvo5s9q7kyepEaQqNQY4ydYkk0BXKhZBt+ZdDUBm0JYySRk1SSCdv43J7WUkFoPtwAuR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716928160; c=relaxed/simple;
	bh=6mb+AyKCcY2yNuBAEwVmrS9m/hjPvJbxv0Y2vkU0eXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGSoG69d6f0vu69524sWjNWEH3jlIODUtB3gk+ScsiycRfJBD+Iqc6RawnzZ7pPW6WMJJDkO41WMk0w/Cd7idXNhgNsPVzlgufDFR4Kt3ONut9XUfF/MPeViOl4kte7fMFPGQfOv7iI2R7cSECfg5BHsT+vRO+jsI3Jg0NBRoCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vQEgrJ5o; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vQEgrJ5o"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35507e3a5deso116057f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 13:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716928157; x=1717532957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWLV/WrhUMfC/WxnYGeBUOyuFt9nvr3SPEDSWekunHA=;
        b=vQEgrJ5oro4nmI9+hjVPG2UIZHvHzAEHnkjdRD7NxzL05rtGwVliFSIlHdykElMQ61
         iEh+Wchf4k3cKU+3JQiirH8AJW8dBSUwtYahL2hgM0xqLu30U1lxlPzwAXJJrM+6xl4K
         uUmqmFRUvRfcnQko/6VH1hg9VbZBei1P5MCit0FExIWnXz1a00RWEzRsmPqDudDNcRYD
         yuBdPLyRf0I7XnvW90Ov+kOYefP+LgHEhPh6Y8IQezaZhjnRLy0bZ+paaulByUYH8CrU
         1eMNwW4y0FhPieEAFi+SmYsNZVhWO8+AFLCoPJCeWe7l98wL32jd5tnklvw3Y9Zo1fGg
         wsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716928157; x=1717532957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWLV/WrhUMfC/WxnYGeBUOyuFt9nvr3SPEDSWekunHA=;
        b=CHRcpkhm9lJxBjUbPraIFkYSKgIg1ILuJNzNBteCuhGiJWo0s9pB30/hbm32oNCnVN
         lBfqgp3UjXRHG1mSAqgIgdfw80VwBkKwScTg/Y+lNk3OeV9VIij1U/LZ7KGHVZLmYFPU
         PZQC17RB7qoTmdiDO/gnk+6zMvWECSHVDk/239xBvbOm8TiRpxlbC8/JVsQxlrx8SAPF
         gDnX5LvuanKMnI44TaCuIY9mCQzkEDfLXWYzWTdpgerdalDynAsNuo7klNhfWGZ1umFq
         LieU393gtyDF8toj8TJUQENQlVb62L7f5etSMZCICl0GLpBysRF41nseY1BBtPkJPRCg
         I7+A==
X-Forwarded-Encrypted: i=1; AJvYcCXKlNrDYHAiOEyDXPwBTQe8zISeQ6KXOLSp6dcBWvF8rDAbQPAnPJjmdL00QwTfAH7B2cWwuXaYQkiNvaWOBN10KfK4zH4tq1uOkvkLriU=
X-Gm-Message-State: AOJu0YxDa7X4piafoE6LaPHWrVbC+v/vYGk+ilMPABlYj7fuO70eC33z
	BmW/uKEI3RU/Bt/FPFe7YQGK3waudB8Qm7fjwlps9d8JQit2moxSMip4r5at3q43g64NtsmNOVP
	uGc9Q9j1tkYPLX9cFCI5mBOiSqk8/JzNFQj44
X-Google-Smtp-Source: AGHT+IEGxKcuSL6tu+YpaC13+aXQYCbazR2E3yf3HXMyqQoskNTQuhpwbnAmxzVmJsQhaAH7f1bayXZQoH5qexT1beA=
X-Received: by 2002:a5d:68d0:0:b0:34d:b0bf:f1b5 with SMTP id
 ffacd0b85a97d-35c7c6988c7mr88083f8f.35.1716928156588; Tue, 28 May 2024
 13:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524213245.GT2118490@ZenIV> <20240527160356.3909000-1-aliceryhl@google.com>
 <20240528193624.GH2118490@ZenIV>
In-Reply-To: <20240528193624.GH2118490@ZenIV>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 28 May 2024 22:29:03 +0200
Message-ID: <CAH5fLgiD_x3OVSc_JVK43BoNY4SeFt01siT32w2gQy_Ae_awrA@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] rust: file: add Rust abstraction for `struct file`
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, arve@android.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	brauner@kernel.org, cmllamas@google.com, dan.j.williams@intel.com, 
	dxu@dxuuu.xyz, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, tmgross@umich.edu, wedsonaf@gmail.com, 
	willy@infradead.org, yakoyoku@gmail.com, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 9:36=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Mon, May 27, 2024 at 04:03:56PM +0000, Alice Ryhl wrote:
>
> > > In other words, if current->files->count is equal to 1 at fdget() tim=
e
> > > we can skip incrementing refcount.  Matching fdput() would need to
> > > skip decrement, of course.  Note that we must record that (borrowed
> > > vs. cloned) in struct fd - the condition cannot be rechecked at fdput=
()
> > > time, since the table that had been shared at fdget() time might no l=
onger
> > > be shared by the time of fdput().
> >
> > This is great! It matches my understanding. I didn't know the details
> > about current->files and task->files.
> >
> > You should copy this to the kernel documentation somewhere. :)
>
> Probably, after it's turned into something more coherent - and after
> the description of struct fd scope rules is corrected ;-/
>
> Correction in question: you _are_ allowed to move reference from
> descriptor table while in scope of struct fd; what you are not allowed
> is dropping that reference until the end of scope.

The patch you are commenting on contains a change to fs/file.c with
exactly that correction. I'm not sure if you noticed it - I should
probably have put it in its own commit to make it more obvious.

> That's what binder_do_fd_close() is about - binder_deferred_fd_close()
> is called in a struct fd scope (anything called from ->unlocked_ioctl()
> instances is).  It *does* remove a struct file reference from
> descriptor table:
>         twcb->file =3D file_close_fd(fd);
> moves that reference to twcb->file, and subsequent
>                 get_file(twcb->file);
>                 filp_close(twcb->file, current->files);
> completes detaching it from the table[*] and the reference itself
> is dropped via task_work, which is going to be executed on the
> way out to userland, definitely after we leave the scope of
> struct fd.

Yeah. If you look at previous versions of this patchset, it contains
Rust code for performing exactly that dance. I was asked to drop it
from the patch series, though.

> Incidentally, I'm very tempted to unexport close_fd(); in addition to
> being a source of bugs when called from ioctl on user-supplied descriptor
> it encourages racy crap - just look at e.g. 1819200166ce
> "drm/amdkfd: Export DMABufs from KFD using GEM handles", where we
> call drm_gem_prime_handle_to_fd(), immediately followed by
>                 dmabuf =3D dma_buf_get(fd);
>                 close_fd(fd);
> dup2() from another thread with guessed descriptor number as target and
> you've got a problem...  It's not a violation of fdget() use rules
> (it is called from ioctl, but descriptor is guaranteed to be different
> from the one passed to ioctl(2)), but it's still wrong.  Would take
> some work, though...

Wait, what's going on there? It adds the fd and then immediately
removes it again, or?

> "Detaching from the table" bit also needs documenting, BTW.  If you look
> at that thing, you'll see that current->files is converted to fl_owner_t,
> which is an opaque pointer.  What happens is that dnotify and POSIX lock
> use current->files as opaque tags (->dn_owner and ->flc_owner resp.) and
> filp_close() (well, filp_flush() these days) needs to be called to
> purge all of those associated with given struct file and given tag value.

Ah, yes, fl_owner_t being a void pointer rather than having a proper
type caused a bug in an early version of Rust Binder ...

Alice

> That needs to be done between removal of file reference from table and
> destruction of the table itself and it guarantees that those opaque refer=
ences
> won't outlive the table (more importantly, don't survive until a differen=
t
> files_struct instance is allocated at the same address).
>
> [*] NB: might make sense to export filp_flush(), since that's what this
> sequence boils down to.  We really need a better identifier, though -
> "filp" part is a leftover from OSDI, AFAICT; that's a hungarism for
> "file pointer" and it makes no sense.  file_flush() would be better,
> IMO - or flush_file(), for that matter.

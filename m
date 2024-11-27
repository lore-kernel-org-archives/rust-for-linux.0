Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439601FC7D9
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710964; cv=none; b=Siec6AXqAVdsE3lGSzJaRFcOfjykTIPdS70r4zj52aG9NxuWuLcxgLbOqf2nJsvKdEIqQcjyUbelFjSFSOYwarGLyQmLfSpAzwCcbCx/UYm17tl6xGsy4uk1vaWejqrO/hV8/Z5S81cKBbi1guwneuO55q43KnlzR3W7IyzOT/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710964; c=relaxed/simple;
	bh=JYbL2g8guAT8sd0URsVEdQ/eCdsK61c3+OjoQGgYXoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgxHabp67uzr1benhPCxpDmnKizgcq68pazyS2a8IWzU3uewr1sRYl1FHdJOw+fVdrddVup+6qh578CflIPERSqXZlNqM8MRcOfXahIEVxMfokdHaDn5h1EO9unHhMwJMdIBZIVRqjsj0zQNIRIOpdaYexEl3oXkMAKChgaySPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mSAcu2K8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mSAcu2K8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-382325b0508so4259129f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 04:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732710961; x=1733315761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrzbbClRBZ1yOTU2YN04HTV4UJx3/zhI0vBTZVhTMAw=;
        b=mSAcu2K8eGTPWbuxojPWEIMfF2fVTTbYbafdmXnyK6N854nyXqj3Fr2oBZ1ds13VNf
         rTVaEdM+7FuzNim5Gwg6cy4JVOKbBJuEpUlbwV62pqUy49IR6+Qk6bWc9MdtCRpSYWER
         UAthYoP8/X78wgobZy/+rj20BXee1zr+loKM/D/QYNrvdyni7GXcuYrlr10taJcgMSS6
         AzwC4QkWE2oRS/c3m36eLFMyj7xG3ZSOND6JsEAogIRDBCDToeCOlpHMSWuxM0g8QI8T
         AaJQVXIPxACTP/NuxJVF5OIUEZozNAnJ5JWaAbDCHY8DxfYUZG9Cj/9nvvQYyHHSuJmD
         Ux/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710961; x=1733315761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrzbbClRBZ1yOTU2YN04HTV4UJx3/zhI0vBTZVhTMAw=;
        b=NRSXK52Kh+7Bs5B/6Y0PcUcfi8yg5vYr5OIBBP64OJhJryVmrUOlI9rCZfusMPEiwk
         D+c4jqnaKYKjHvNOdsB8KBwtVZSx4p8oT7LCwPR/QZkk10AygxtxD/l/pjyPW1T5VStE
         ig7RwFcixjP1G85KauHmdXwiUFoNo9VcPgKpS1XpKeZYceIRabkW9A8f2oCqmfnaaVAx
         ZgVQtr0u2XEkkGXwu6idyVnIbIoZFSGS8TOLP4eCqaZnrqEsMedVE8s0uP7Bt2y+9x9S
         5Lm/Kn9di+EnXYznaIOP87MNHTXVVybhSLwIwKmU0z71+XUiM+vdHdh6nij5u/nzXvXa
         MUqw==
X-Forwarded-Encrypted: i=1; AJvYcCWDk59hbkRhqZzWtjoVoA5Ao5552WQIn26PNDFNrwqJHxn/Mx/onswQOx73YwuiEU6W94E26On07lk3ybYn+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOect6Bxdi27+PGMBc5mOUtJJoJ8RQb5xTcx/r1+b8bbGOenLo
	ztHHs5uON2pLfEYy2vA1041tXV+zVh9E7yYLNAUxMr1+oD5Fz3L/mAMyfoRmrincEZoRWhA5uIf
	6zTyQMBENJZTX0Bs3bdqotoD5QiDna4AU+3wg
X-Gm-Gg: ASbGncsNJj9nrVI8Zuco0IBt6enaub3Zrj3YAQwcQs8ZOEtw9gVqKInCCK1hFh1e1fy
	19ZG3PfomM6985dgL+1x1BZEqKXYiUP0weAgVkL9+mgtIKtFUZD/8WRUi4cuVrQ==
X-Google-Smtp-Source: AGHT+IEbpjzkgc8IM7OndZI804Me6rzyM6Kjc3mTYT80bhflefRpDQA7MbvAM40NWVN+XmE+Ao7DgeTZqeqNuKDfQlI=
X-Received: by 2002:a5d:59a6:0:b0:382:31a1:8dc3 with SMTP id
 ffacd0b85a97d-385c6ec0ce0mr2408873f8f.35.1732710961482; Wed, 27 Nov 2024
 04:36:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-8-7127bfcdd54e@google.com>
 <CAG48ez09fS1v2gWbOFx+uQd7Lj+z2x3LhL3hfpQzpVHdNJ5UJg@mail.gmail.com>
In-Reply-To: <CAG48ez09fS1v2gWbOFx+uQd7Lj+z2x3LhL3hfpQzpVHdNJ5UJg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 27 Nov 2024 13:35:49 +0100
Message-ID: <CAH5fLgiJLP_w9vpuQFszkrUW3V3DyJVGHLv7Q43-Rx9-WSXzyw@mail.gmail.com>
Subject: Re: [PATCH v9 8/8] task: rust: rework how current is accessed
To: Jann Horn <jannh@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 6:15=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Fri, Nov 22, 2024 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > +impl CurrentTask {
> > +    /// Access the address space of this task.
> > +    ///
> > +    /// To increment the refcount of the referenced `mm`, you can use =
`ARef::from`.
> > +    #[inline]
> > +    pub fn mm(&self) -> Option<&MmWithUser> {
> > +        let mm =3D unsafe { (*self.as_ptr()).mm };
> > +
> > +        if mm.is_null() {
> > +            None
> > +        } else {
> > +            // SAFETY: If `current->mm` is non-null, then it reference=
s a valid mm with a non-zero
> > +            // value of `mm_users`. The returned `&MmWithUser` borrows=
 from `CurrentTask`, so the
> > +            // `&MmWithUser` cannot escape the current task, meaning `=
mm_users` can't reach zero
> > +            // while the reference is still live.
> > +            Some(unsafe { MmWithUser::from_raw(mm) })
>
> Maybe also add safety comments for these nitpicky details:
>
> kthreads can use kthread_use_mm()/kthread_unuse_mm() to change
> current->mm (which allows kthreads to access arbitrary userspace
> address spaces with copy_from_user/copy_to_user), but as long as you
> can't call into kthread_use_mm()/kthread_unuse_mm() from Rust code,
> this should be correct. If you do want to allow calls into
> kthread_use_mm()/kthread_unuse_mm() later on, you might have to gate
> this on a check for PF_KTHREAD, or something like that.

Huh ... is it possible to use kthread_use_mm() to create a situation
where current->mm has mm_users equal to zero? If not, then I don't
think it's a problem.

> Binary formats' .load_binary implementations can change current->mm by
> calling begin_new_exec(), but that's not an issue as long as no binary
> format loaders are implemented in Rust.

I think we can allow such loaders by having them involve an unsafe
operation asserting that you're not holding any references into
current when you start the new process.

Alice

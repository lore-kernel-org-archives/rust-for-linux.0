Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4936A1FCF77
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732724340; cv=none; b=N3IdyZ5/D8Krw5x/B9KzRCyl3r7vMb+Ap3N49yv+eKzwZNLDMrQvEBTyOswyNDit1U1amW74zKc8JAIaEp0vpfQTC3h06hSNx69xoyAi987at1J0H4vjZl36/QFAlht7WhmJnmGgw5w88hzXnrm/9pfVynAQqqlNpkFnot4SHdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732724340; c=relaxed/simple;
	bh=/1gwrOIavLfrPieDrLJ9EuYDBuWukPgu7Q7CFtpdA0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjXfupW6D63O3Iz2Nx4KdUw2zkNoU2UE8+OvWTeyZDSfw3Ozk3G3sn+u6oWbAYX3nIUGNPgD6Ra5IITG0awtqEQzR9QaqBUDgIyn0U84NOZt8XEVwBo4mJ3IZA2SLcf3E8HQ2FqQfP6+a+Rdp//DRbGbE6ZXwDLiZBevryKaqws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y/fIIBId; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y/fIIBId"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d027dc53ccso10352a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 08:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732724338; x=1733329138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtL6wKjrUKaD9G1UUVsHA8qoTJvLASSvZXVOzErx25M=;
        b=y/fIIBId2NQ5XU6sXdlfY9a0XKbSUm8xm6e1ynLiVXHN+PeEjMqnjj/DQtANOnI53w
         l7yUHA080Aqjv5AS4pkas8Drpg+eLL6KPa7lhosd8CzfZa+u5ueSDk1XHfnm7MuWj9fb
         5F3AwoF7PGWu0OH4MJ7xVfgh6mC4SZtMVPPDXy7f9+h+vnRq6Pk5KQmi7Eq/PmKAA/0i
         ZuGmrNm8iZpq1+OtmgLVe2/dFb7h4+sY+jUTqZyP+84FCkKheZvN0IpYj5YF6hyRAZ2a
         m/huU0PI4VW7868FSqWSfrJfrjSdJG47TyiGMdr9sW0hxv3X/TtvFqSyN7OjrJq3QKqJ
         WOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732724338; x=1733329138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtL6wKjrUKaD9G1UUVsHA8qoTJvLASSvZXVOzErx25M=;
        b=qiy4BZBWs1LWIiNBc9ZMWUvNIGXqwReru7qPI4T5c45BbAdBxi8SMVtwAIA3xDAHp/
         MYFSpIElNJi3cx0ovCSmARp+JPltb7bem27CwjPvAm8MmKxh+lIugNWZ9gsKg80/mJ9t
         2Dlcg/xz1OpeMA4ZqSZ7H2gY8ndhwX6izkUdBuCu3DAmE0K6VYVAkuqQwf98zrdu8ZlH
         7eVqHWvRNdbX9P8XBH/U7f3q91b7po2JGBN8kBZAckNJMcEgkHeSsmdHal3RNGUn8qFr
         Zqq6NMTXVDOkhj7+/Tr28n2wIGnf8TWJsD2KnDSZWto0Lah0r5UscghsCzqUsduOwCXt
         lrOg==
X-Forwarded-Encrypted: i=1; AJvYcCWYpNJE3e0woHoZ3Il5vPy+H9B+mkV5YtcojHCNOYY0AYAelDIZp1jAZ6mW7I7V33mSyNe2vzxDwapVeOxUNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQv1kxZUheLcHRw5aMzhyFoJzOehHzrJf/7zOp8FsLG0Iejhsc
	DKuMJcsZqzVcU3qMebpdsUJqhOCW09AP3PN3Yjbym4npRceKfFYPVB1SMApksHhCUhA02zGy45z
	0yB5sODp7kLnHKsYz7iwJw4QAGNv5cvoX5XCU
X-Gm-Gg: ASbGncv6Kw7Nl9iZ5jagzxkDg7QYOTEJ7HX/Eaf3sEgkIEqHrYJXEU7P2+sM568YAZW
	VR12DTNnKpLRHFMY4wY69pgnGjZiPFzpuPAXc9qQyyZt08VHbmzJDe7Pec1k=
X-Google-Smtp-Source: AGHT+IGyvRZff5SP+V5FIb2c2WgZxCW2RkMkXyailqNw0SxFY/h2Ezn7rEf+kB6G9/hMA8LcUFv43P+VanzsdKuSEZc=
X-Received: by 2002:aa7:cacf:0:b0:5cf:c93f:36f3 with SMTP id
 4fb4d7f45d1cf-5d08356e19bmr84258a12.7.1732724337334; Wed, 27 Nov 2024
 08:18:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-8-7127bfcdd54e@google.com>
 <CAG48ez09fS1v2gWbOFx+uQd7Lj+z2x3LhL3hfpQzpVHdNJ5UJg@mail.gmail.com>
 <CAH5fLgiJLP_w9vpuQFszkrUW3V3DyJVGHLv7Q43-Rx9-WSXzyw@mail.gmail.com>
 <CAG48ez3a0vs=LHzkbpOKW753m6_LOtoYyWtjhfYvB48TKsCekQ@mail.gmail.com> <CAH5fLgjuKEU8noU5XN_FWEy4wAzJu0aeaURzNsCQrt59a_0gJA@mail.gmail.com>
In-Reply-To: <CAH5fLgjuKEU8noU5XN_FWEy4wAzJu0aeaURzNsCQrt59a_0gJA@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 27 Nov 2024 17:18:21 +0100
Message-ID: <CAG48ez1an_cbUinfCvukQe=X-veygFLe-twQq5zMKTVcMpPv7g@mail.gmail.com>
Subject: Re: [PATCH v9 8/8] task: rust: rework how current is accessed
To: Alice Ryhl <aliceryhl@google.com>
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

On Wed, Nov 27, 2024 at 4:57=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Wed, Nov 27, 2024 at 4:52=E2=80=AFPM Jann Horn <jannh@google.com> wrot=
e:
> > On Wed, Nov 27, 2024 at 1:36=E2=80=AFPM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > > On Tue, Nov 26, 2024 at 6:15=E2=80=AFPM Jann Horn <jannh@google.com> =
wrote:
> > > >
> > > > On Fri, Nov 22, 2024 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> > > > > +impl CurrentTask {
> > > > > +    /// Access the address space of this task.
> > > > > +    ///
> > > > > +    /// To increment the refcount of the referenced `mm`, you ca=
n use `ARef::from`.
> > > > > +    #[inline]
> > > > > +    pub fn mm(&self) -> Option<&MmWithUser> {
> > > > > +        let mm =3D unsafe { (*self.as_ptr()).mm };
> > > > > +
> > > > > +        if mm.is_null() {
> > > > > +            None
> > > > > +        } else {
> > > > > +            // SAFETY: If `current->mm` is non-null, then it ref=
erences a valid mm with a non-zero
> > > > > +            // value of `mm_users`. The returned `&MmWithUser` b=
orrows from `CurrentTask`, so the
> > > > > +            // `&MmWithUser` cannot escape the current task, mea=
ning `mm_users` can't reach zero
> > > > > +            // while the reference is still live.
> > > > > +            Some(unsafe { MmWithUser::from_raw(mm) })
> > > >
> > > > Maybe also add safety comments for these nitpicky details:
> > > >
> > > > kthreads can use kthread_use_mm()/kthread_unuse_mm() to change
> > > > current->mm (which allows kthreads to access arbitrary userspace
> > > > address spaces with copy_from_user/copy_to_user), but as long as yo=
u
> > > > can't call into kthread_use_mm()/kthread_unuse_mm() from Rust code,
> > > > this should be correct. If you do want to allow calls into
> > > > kthread_use_mm()/kthread_unuse_mm() later on, you might have to gat=
e
> > > > this on a check for PF_KTHREAD, or something like that.
> > >
> > > Huh ... is it possible to use kthread_use_mm() to create a situation
> > > where current->mm has mm_users equal to zero? If not, then I don't
> > > think it's a problem.
> >
> > Ah, no, I don't think so. I think the only problematic scenario would
> > be if rust code created a borrow of current->mm, then called
> > kthread_unuse_mm() and dropped the reference that was held on the MM,
> > and then accessed the borrowed old mm_struct. Which isn't possible
> > unless a Rust binding is created for
> > kthread_use_mm()/kthread_unuse_mm().
>
> Ah, ok.
>
> The way that the current abstraction works is that it enforces that
> the current pointer cannot escape the scope you were in when you
> obtained it. If we enforce that kthread_use_mm() and
> kthread_unuse_mm() involve a scope, then that should solve that.

Oooh, that's neat, thanks for the explanation.

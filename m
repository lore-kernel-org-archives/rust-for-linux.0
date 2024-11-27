Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A857518FDD0
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732722770; cv=none; b=RPtKik4FpLfjuipk3hKn1DsxusZBDUX6qmbveQkXrfulDHtItqHubn7507T0tHKZoWWwn4C3Ourc7mCPbmnE1+7uy66peG0quZvNp3v28N7rZk99clhqkRnaSJjGq39Nb2JqbfmefsN5MQaTpv/KcFOsDNksVxIQhKfhSwtvat0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732722770; c=relaxed/simple;
	bh=DPf9CZDUw1xuPmrJRDmJhbs8f7HyL5z27zV/xGxBV0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGpyDOGPqUil3UlRkfAccHoBtTDds1/wWsnObFPClJEqCGUDSw5mJliejNt6jpyqAxyk/R+VY9H/yEw/9VqIDWwxZKN8nfXEQz7+dqeoPt9gmjDWtwvWTlXNkvtvongMPUV2jA83ZKVS7GjKjIghDrFSk6g+Fk1HRVodNjVuzSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1MlEv9kV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1MlEv9kV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d027dc53ccso9792a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 07:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732722767; x=1733327567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/NtU0l0FRQQbt2Knk7s8zJ9lWXoHwoocpt9wyTKe8c=;
        b=1MlEv9kVM7mXnifk/452y2zRUtyIaXPvjeRRJd1a0Lz5yS950cP8vMTP/owGiuGeqk
         1GzGhETWUUVBtCkHz9gC0KFPlKB7DGJ5YC2Fc61I9hEe1++p4570ge8XoGfRGcm/TQBJ
         p6lPpcnfXjWzjRn8qgQocdC2ivur+yHrCRG4Mr64fTxuRBz72XnMaOQTdhnZOK7VUx7w
         rvXo72mmoR0lVQs0+L3o3g5HMlsx8ls9r2yi4iDBUwD6OyFjM1oIUHet4B6znDTFvwwG
         NsMTebuMQatAHktsNuc3ycl/28B/MnFsMIrD3zQpGqAgAtLF2sa8j/z/1tvPzSZmt161
         Jo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732722767; x=1733327567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/NtU0l0FRQQbt2Knk7s8zJ9lWXoHwoocpt9wyTKe8c=;
        b=FZCjOLGsSJ3bQS88iJVWP2/x5BSRT9pGMHPF+3Ucg1fBM0nmSgI20CA+PtwLB5P0zF
         jFDNVZZb29RvJi61vqyhY5FAIRGj3Hx5aMC9qsYt3H+Nwo+DDD5hPsMls6i0fMgYyIy+
         H2aRNC0aiw985Iky+MphSWQ22bTRuI/IdLdEADaN49l/Tf560u33OYi2Gtkh3TZWSmE1
         eksvBNVG9+bbwkKi6xEWHodVm1SqXf5Xtqifz6JakxoZ0/qK9wwNy/f7w1xz1RK3QjTR
         5NIf1bufwz/pPo9VH9prG1FcCeij6F13z7Oi4wfOTyLvk0TPLRK+Ma7GGQ31Gm6sHsAt
         Y2RA==
X-Forwarded-Encrypted: i=1; AJvYcCWB06UlNuldBi8hIkXUoJ46Hcj1vBunGNZY2Dc5QD9q37GYbCmSPA0L+rLPhq4KVHcQ+SiyxSokJnbSyhg0pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTolrg04sXptfmrVwhkhqR0gZfA5CcUsoh/Xm8DMuW+2N3FxaU
	Wdm6tfbMCOyB6u1wCaHYW6FXmDIBS+v4Si5oVJLrjuLbOAD0Pv1yAOR3g8Peb78GmhMShibxq/4
	cETNCRsuEGkgAU2wc/If6ylEc7w8UIzFNX53b
X-Gm-Gg: ASbGncuDkkG9xt7fJSqQ1qVxDi60xDaSpRMr7O0KvYS+EJM0+rmZxXLbhWMfLKyRx9O
	HnPBbPS/DBJRVGcx9VX8RrUJ87RBX7/var/irNEn4bNBaSUUwi79LXGU6tz8=
X-Google-Smtp-Source: AGHT+IGTPN4/S8TASU18K7Bf2qjUWSo8zdU4Y5Icg5MBDnyn6tZHZNZ7ool61CiwqTxfrkdgE/GvaQL4yeeJvOCrMtI=
X-Received: by 2002:aa7:c74d:0:b0:5d0:3dcc:16bb with SMTP id
 4fb4d7f45d1cf-5d0819a44fcmr82630a12.4.1732722766657; Wed, 27 Nov 2024
 07:52:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-8-7127bfcdd54e@google.com>
 <CAG48ez09fS1v2gWbOFx+uQd7Lj+z2x3LhL3hfpQzpVHdNJ5UJg@mail.gmail.com> <CAH5fLgiJLP_w9vpuQFszkrUW3V3DyJVGHLv7Q43-Rx9-WSXzyw@mail.gmail.com>
In-Reply-To: <CAH5fLgiJLP_w9vpuQFszkrUW3V3DyJVGHLv7Q43-Rx9-WSXzyw@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 27 Nov 2024 16:52:10 +0100
Message-ID: <CAG48ez3a0vs=LHzkbpOKW753m6_LOtoYyWtjhfYvB48TKsCekQ@mail.gmail.com>
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

On Wed, Nov 27, 2024 at 1:36=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> On Tue, Nov 26, 2024 at 6:15=E2=80=AFPM Jann Horn <jannh@google.com> wrot=
e:
> >
> > On Fri, Nov 22, 2024 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > > +impl CurrentTask {
> > > +    /// Access the address space of this task.
> > > +    ///
> > > +    /// To increment the refcount of the referenced `mm`, you can us=
e `ARef::from`.
> > > +    #[inline]
> > > +    pub fn mm(&self) -> Option<&MmWithUser> {
> > > +        let mm =3D unsafe { (*self.as_ptr()).mm };
> > > +
> > > +        if mm.is_null() {
> > > +            None
> > > +        } else {
> > > +            // SAFETY: If `current->mm` is non-null, then it referen=
ces a valid mm with a non-zero
> > > +            // value of `mm_users`. The returned `&MmWithUser` borro=
ws from `CurrentTask`, so the
> > > +            // `&MmWithUser` cannot escape the current task, meaning=
 `mm_users` can't reach zero
> > > +            // while the reference is still live.
> > > +            Some(unsafe { MmWithUser::from_raw(mm) })
> >
> > Maybe also add safety comments for these nitpicky details:
> >
> > kthreads can use kthread_use_mm()/kthread_unuse_mm() to change
> > current->mm (which allows kthreads to access arbitrary userspace
> > address spaces with copy_from_user/copy_to_user), but as long as you
> > can't call into kthread_use_mm()/kthread_unuse_mm() from Rust code,
> > this should be correct. If you do want to allow calls into
> > kthread_use_mm()/kthread_unuse_mm() later on, you might have to gate
> > this on a check for PF_KTHREAD, or something like that.
>
> Huh ... is it possible to use kthread_use_mm() to create a situation
> where current->mm has mm_users equal to zero? If not, then I don't
> think it's a problem.

Ah, no, I don't think so. I think the only problematic scenario would
be if rust code created a borrow of current->mm, then called
kthread_unuse_mm() and dropped the reference that was held on the MM,
and then accessed the borrowed old mm_struct. Which isn't possible
unless a Rust binding is created for
kthread_use_mm()/kthread_unuse_mm().

> > Binary formats' .load_binary implementations can change current->mm by
> > calling begin_new_exec(), but that's not an issue as long as no binary
> > format loaders are implemented in Rust.
>
> I think we can allow such loaders by having them involve an unsafe
> operation asserting that you're not holding any references into
> current when you start the new process.

Sounds reasonable.

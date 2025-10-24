Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D807C28314A
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761302219; cv=none; b=cxgv28g6gIXB/be8CsIzFArFpPIc6803wZqAkPT44CMpbHOdq2qtGHsJRplV+ow+i144y8fiVRcn4StCelclLGpNsa24/PcwzS5+GaXNAxSwxny98s/24sggq69TgKVYgFiuZ+rlhoEeezP+j31aLVbZsIKzhaV9qkEMt2I6SG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761302219; c=relaxed/simple;
	bh=s2FO8pnEV/7szb+dOJiq08LSuK/rb7I+nZ2d4KW8ctI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hLsfpzx3yIHaD7egOlA9FurBK7+oGAEnxGGeRv+bb+m0tENasmIubHNRet0HBFqi7wh/RovIJrYAITSPfpjrUTdSt+105pNvxDyilmrUzcHOG79FJsKT/wmqcJC062eR2yl8loNfTdH5/yRNHNmeU+6FQijoMImynu1mgbfPQX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSz7tjwg; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSz7tjwg"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46fa88b5760so6496495e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761302216; x=1761907016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5WckZjr4qpmTV+gX2VgoGwpr/mWfENYA9Da0Yb01PI=;
        b=MSz7tjwgyvFZkXvDVUUXgaxwns48UJXrL6dnuTQzZ43x3DlchEM61p71kMIuz64ph9
         suiSlWxDC2AcqvZESe7730GIUlX1KntWwl+gUZ+7e4CY+rcdMDN2iDQQ5yNUngCDTQjf
         FhlGmFNnfYQke2YQC/LcnvN9KAXP03bV7aiWOxaiLeVuTSYWvza+5Ec2Of1RFoJAYNWf
         cvZbUaszI4w394upLVxOhNSATrn9+PqqGfEIaPcg1f4CLxX+tRaUiFCLVSXHAw8qpGkm
         Nmg/DjVkc0N+3j9E17j1Z5bCoviefd4Cd/uNGcQWB61yVFMHTrrN7tNy1lHwaQPE5ppL
         A6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761302216; x=1761907016;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c5WckZjr4qpmTV+gX2VgoGwpr/mWfENYA9Da0Yb01PI=;
        b=UC6KeeH+ECCE1FsU15V89q2tgbkHRij+8G7b4/HSsoYLspgVzJpTuTNwR1DkcENMCB
         XPX0oKbukvJxhVtWzHYAeoMpjTvk3653KmJ+icIPIX0ALb5VxBJbLGasXWZKaf9ompqw
         8P3a8sJ8giSfzo7LtvwssIUgVvLD56QikvPnEljZ92RugCqbhzGCnDapQRHVTjW8b4nN
         1by2EQ0wSSSJY65y7BPsCUdM6tlApwbjdwU92jUQOm9dDJtNzRWBoVFwprjEaf8DJ6sO
         oCBTc5+iw0Yw5HeLD9ZDswmMLz43BX0QRMqYX5/AKPjDGGgfZZKRLylOg4lU37GLQiE5
         fgZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmbJ6/QDpgB00w5YfmfXyR5BbcK3IFKZm76LES69AY937cK6YGSTU1s+t8ehqpEb0VxwJQ7G/hXb2Lfwk7/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz45GDE0P07FpENptQ/dkzwvcwt0x+yHpsPnA6zLmCtQrXGJPu+
	Pdp9k8nJ/fy24r9KNRNmQV3OZi2OqZadCP2U8oDnO3+KHtu4kU/BBPmSgNOvA98tRbZTOwmjYAW
	tTCcYagBt/Hvn0sLT4Q==
X-Google-Smtp-Source: AGHT+IF6Mgy1YsJz+7QCsPHpP9ik7YMhi0K8WjvdltQv05VpchJvsZPKXTgJ4bEGg+tkcUMZROs5PhBuuxH4BSw=
X-Received: from wmsm9.prod.google.com ([2002:a05:600c:3b09:b0:46e:684e:1977])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524f:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-471178a6e99mr195067895e9.17.1761302216346;
 Fri, 24 Oct 2025 03:36:56 -0700 (PDT)
Date: Fri, 24 Oct 2025 10:36:55 +0000
In-Reply-To: <CAH5fLghiEqqccH-0S9-GD7pJaNuVpuo_NecMMmGVF+zR7Xs_dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-7-dakr@kernel.org>
 <aPnmriUUdbsQAu3e@google.com> <DDPMBR9EUYJ6.23AYG1B27BUEN@kernel.org> <CAH5fLghiEqqccH-0S9-GD7pJaNuVpuo_NecMMmGVF+zR7Xs_dA@mail.gmail.com>
Message-ID: <aPtWx4i3WuIlcWEM@google.com>
Subject: Re: [PATCH v3 06/10] rust: debugfs: support for binary large objects
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 12:21:24PM +0200, Alice Ryhl wrote:
> On Thu, Oct 23, 2025 at 12:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >
> > On Thu Oct 23, 2025 at 10:26 AM CEST, Alice Ryhl wrote:
> > > On Wed, Oct 22, 2025 at 04:30:40PM +0200, Danilo Krummrich wrote:
> > >> Introduce support for read-only, write-only, and read-write binary f=
iles
> > >> in Rust debugfs. This adds:
> > >>
> > >> - BinaryWriter and BinaryReader traits for writing to and reading fr=
om
> > >>   user slices in binary form.
> > >> - New Dir methods: read_binary_file(), write_binary_file(),
> > >>   `read_write_binary_file`.
> > >> - Corresponding FileOps implementations: BinaryReadFile,
> > >>   BinaryWriteFile, BinaryReadWriteFile.
> > >>
> > >> This allows kernel modules to expose arbitrary binary data through
> > >> debugfs, with proper support for offsets and partial reads/writes.
> > >>
> > >> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> Reviewed-by: Matthew Maurer <mmaurer@google.com>
> > >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > >
> > >> +extern "C" fn blob_read<T: BinaryWriter>(
> > >> +    file: *mut bindings::file,
> > >> +    buf: *mut c_char,
> > >> +    count: usize,
> > >> +    ppos: *mut bindings::loff_t,
> > >> +) -> isize {
> > >> +    // SAFETY:
> > >> +    // - `file` is a valid pointer to a `struct file`.
> > >> +    // - The type invariant of `FileOps` guarantees that `private_d=
ata` points to a valid `T`.
> > >> +    let this =3D unsafe { &*((*file).private_data.cast::<T>()) };
> > >> +
> > >> +    // SAFETY:
> > >> +    // `ppos` is a valid `file::Offset` pointer.
> > >> +    // We have exclusive access to `ppos`.
> > >> +    let pos =3D unsafe { file::Offset::from_raw(ppos) };
> > >> +
> > >> +    let mut writer =3D UserSlice::new(UserPtr::from_ptr(buf.cast())=
, count).writer();
> > >> +
> > >> +    let ret =3D || -> Result<isize> {
> > >> +        let written =3D this.write_to_slice(&mut writer, pos)?;
> > >> +
> > >> +        Ok(written.try_into()?)
> > >
> > > Hmm ... a conversion? Sounds like write_to_slice() has the wrong retu=
rn
> > > type.
> >
> > write_to_slice() returns the number of bytes written as usize, which se=
ems
> > correct, no?
>=20
> Yes, you're right, I think usize is the right value. The cast is
> unfortunate, but it can't really be avoided. In practice it should
> never fail because slice lengths always fit in an isize, but isize
> isn't the right type.
>=20
> Alice

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

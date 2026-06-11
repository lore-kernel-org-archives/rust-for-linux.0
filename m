Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BC735DA76
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 22:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781216489; cv=pass; b=cxYo84J99/tduEcEc1Xd69BdOtDOtlIkhHZlfcOetvwgjCc/KJfYRGiT1Us23+CQ5ZxTy8y2gxudgInX61zUVu/u38hAfxxcbCbvBaSOT9M9I187ZsAhNupARUoFOfS6HwfGmK0gp183OcLnWJkjLwiJDE95GpbBo0I9n4Vk7xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781216489; c=relaxed/simple;
	bh=7kQaz+hKeqDHKzE6nu5C3dvX93K3QD9eUVVH/NfdzLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eh+joG//oZPg8aFogOr46AYCGhFA0Phbefw4oiBfnOiG3ozXc5KCvmhtesfFCI5Dzr6dRwgWk7pf8tx8VtF5sEkJyfwWHIYKoqa0obAf35kugSKUXJbtwx9JNNchWfNNo/8nAP+3Nz10lNGngPaU7jtV4aXEJ6gELkmV7Mcoxq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HQvaNOW4; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HQvaNOW4"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68ced08613aso4538a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 15:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781216487; cv=none;
        d=google.com; s=arc-20240605;
        b=LZYWr79qYhEcF6FPCUtiNh+wTpi+wm9bATIiwaNUZfzL0xlPEibmCQowqOAU/QSzN3
         gWgCn7QpPnGKScdup/jDo572k3+hihtAOd/63cip/Das4IRigzzkdv1CEhNtwwKrgUZ5
         icvLDIvpfElCuyyZdEbmZey7wFYzv8gJhIQDc+ESx01bPtbpN+z9hQzj6Iq+342xI4xA
         ryvAvPK5U4PT5sxSSK5xaJwV7Yps8uFTfvAOgN4sDsqzV07MiLPUFnE1db5+FXYxjuyH
         JNz68OibCTkTU4YSP96iypiCbSaG7nJA+/6irVC1Kyps188P5c/BLThDUJB01KsU1QzU
         gc5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o6mGOyOYPbhpER7czQON2yXscvwLfU7tShQLOptb3mA=;
        fh=d6rt+O25PduJzTFDcaWsDgpWkTo57aSWPAJSUrY0M9g=;
        b=OEuwR3yGGVjSPtuCkOv451B1+IuxOdO7h5pt16dBo/qPd2tldrvpq7jb89B9LUUuJY
         b4C3GkaU2BxHz0zcf91xn1E+E2RbxZp+N5yxOESRrMHlQDKl3SUskOgRZFmy6BipouMw
         fj4iZF2KzmJlfR8L41IlZvSUv1JkiRUWmoL7r4ZLRzuBUA9F2/fS2VHb0ut55wag2lEC
         /Kq7favpsEy8QFSq2gMPaNMzZANVwhY5/fO6wrVp77i2jr9cmrFpsysScaF8BgeUD8rf
         s4r0DOigUwd/vSchMSkDyfcqq63Ttxlm+Xr6EB/tslTBdhzMTCV9cK2OUGMp7wRdYdM4
         n0mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781216487; x=1781821287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6mGOyOYPbhpER7czQON2yXscvwLfU7tShQLOptb3mA=;
        b=HQvaNOW4FmvRC9ZS8UW7rnvV+XQW8hozshjI7auz7Ubd/cXzW6IlTiGzJUX1BamYkb
         N90EgyKEYauo4y21/ukJsJ6AM6fe3fEiklGhALi05wVw5ycw/vkoIxp3/lONjqKe8bjh
         WM7jtSFPjuA0ZuvGv7CO+Y1DLhe+TeUc+UvzqH+muWtwzIOvbfk1G1BgN9ErHzvCA5Hi
         2AtITafjSTQb6elDkaF+lRqtoKGzztbqPFatPN+H0DRNXJyvK4NpXzDm7yj3bGrXNwby
         PurADn+CbscYAT0p5WcphHpxrFPuOIuiEmMJCCbUrCs2rwDIZ1HY4fIK/wACymgKVEAL
         E2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216487; x=1781821287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6mGOyOYPbhpER7czQON2yXscvwLfU7tShQLOptb3mA=;
        b=BY74H4Av0b+wLWdMosyC9Bx64KnAyWN0aHQtZeVuTSENvxii4JLf4Yl3yavOUmQAzG
         NLkADfEbqBNBONeDPX3L+WiSuqIL+NqsDNseNNLt6qctRE1t1Ng5mOC02bMHPXJMpAxY
         mLTVgys/jXGgRXUprSeohZ5SNuF+FIHA+uSrlbt6icBiwIAtHLWaYS+w+6JsYif3at04
         fbSCu3OKz4S0swK4vG1CHEx0Xqce7+YIWG6bgT+Nv/Vv+XHZ2Q49cZ/ovZ1bUPby6xgZ
         WBJqtqkvyBk+aFVqNSAXcAEsZBfw8jYZFb50wyrUlJAnL34lpHnX4zhdAZ6wZlQCj32Y
         Sckg==
X-Forwarded-Encrypted: i=1; AFNElJ/Q5rXvEPGCmaurUjaDFfRG1ZFw7PZ5YekzoueyTPYdm4d9cLycWLAgsxyH4hZ9M1OHTEm54iqSg8ANJ8Z4Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0b2+7iwFsRUGRI9OEkeMky/+0iBW9bxhbjbvfLzMetrsuycgg
	DpPL++5lHpK2tpk0BCfgurNtLtjvtcHnURFcEr3W7WEItweQrABJEvjimBfADW4j46+f/r1Xubw
	GEQVTq4waOKcZWAJWWgT+vhGxjiuIoA473MrO0UPS
X-Gm-Gg: Acq92OHTJChOlpq4aXz33f41LzfCIGdC+FjhMrJZTzyOPCB5xqm8ngUUD1GwLF+QkVw
	z9EFb5ws5cfduJWgM5SGBrCHNuuPrgCmqe/KW6GSFxykK0l8iiQqGyL3ti5j4X+bPWWGEUPRlHV
	JNoNbldO6hGsUxmd/1n8/RgVNu82Nvg6jortaJDZiHn46YciL4AuIjT0LgyVLoMdNkLGg705nlr
	xAjHtNnLKnJQVTUyBOnGaLtZWHhlGj7F3UzZpNohXLvHOgzrhyYzZVJDnl9jo74x8F/K+nELy8/
	a7dTFqQulwgLiG6L4u1Rwa718jLW7Mx5cBLdPzFDUkR7BIw=
X-Received: by 2002:a05:6402:a550:20b0:68f:d45f:e496 with SMTP id
 4fb4d7f45d1cf-6936eae2f41mr5750a12.13.1781216486379; Thu, 11 Jun 2026
 15:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com> <20260609-binder-noderefs-spin-v2-2-eafde2ff376c@google.com>
In-Reply-To: <20260609-binder-noderefs-spin-v2-2-eafde2ff376c@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 11 Jun 2026 15:21:14 -0700
X-Gm-Features: AVVi8CeBCY1rD252cLIJOIDI2jFoyICNjeemTUA_6ZidvbfXUMjnjKLycR3-3Jc
Message-ID: <CAGSQo03n0Ld8Qre1PEB+WFX=LL3a-aH6Z4SS=-smtu1eewjc5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] rust_binder: avoid dropping NodeRef in
 update_ref() under lock
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:44=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> In preparation for changing the node_refs lock to a spinlock, move the
> cleanup of NodeRefInfo in update_ref() so that it occurs without the
> node_refs lock held. This avoids dropping an Arc<Node> with the lock
> held. Furthermore, the NodeDeath field is kept in the NodeRefInfo to be
> dropped outside the lock as well.
>
> The removal from the rbtree is updated to use remove_node(), which keeps
> the rbtree node allocation until after node_refs is unlocked as well.
> This is not strictly necessary as it just moves a kfree() outside the
> lock, but there's no reason to invoke the kfree() under the lock if we
> can easily avoid it, so avoid it.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/process.rs | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs
> index 96b8440ceac6..f4f4d45e1ab7 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -942,13 +942,17 @@ pub(crate) fn update_ref(
>
>          // To preserve original binder behaviour, we only fail requests =
where the manager tries to
>          // increment references on itself.
> +        let _to_free_by_handle;
> +        let _to_free_by_node;
>          let mut refs =3D self.node_refs.lock();
>          if let Some(info) =3D refs.by_handle.get_mut(&handle) {
>              if info.node_ref().update(inc, strong) {
>                  // Clean up death if there is one attached to this node =
reference.
> -                if let Some(death) =3D info.death().take() {
> +                //
> +                // We remove the entire `info` below, so no need to remo=
ve `death` from `info`.
> +                if let Some(death) =3D info.death().as_ref() {
>                      death.set_cleared(true);
> -                    self.remove_from_delivered_deaths(&death);
> +                    self.remove_from_delivered_deaths(death);
>                  }
>
>                  // Remove reference from process tables, and from the no=
de's `refs` list.
> @@ -957,8 +961,8 @@ pub(crate) fn update_ref(
>                  unsafe { info.node_ref2().node.remove_node_info(info) };
>
>                  let id =3D info.node_ref().node.global_id();
> -                refs.by_handle.remove(&handle);
> -                refs.by_node.remove(&id);
> +                _to_free_by_handle =3D refs.by_handle.remove_node(&handl=
e);
> +                _to_free_by_node =3D refs.by_node.remove_node(&id);
>                  refs.handle_is_present.release_id(handle as usize);
>
>                  if let Some(shrink) =3D refs.handle_is_present.shrink_re=
quest() {
>
> --
> 2.54.0.1064.gd145956f57-goog
>
>

Reviewed-by: Matthew Maurer <mmaurer@google.com>

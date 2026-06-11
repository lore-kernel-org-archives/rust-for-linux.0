Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE16A32938D
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 23:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781220979; cv=pass; b=r1KDIDYOtsddKrmfp7nPfSD/RU/IJLOih6tCW7LmM6aRjUFo0Y4DlKDxf89bB75ZvEDTOP2XrVa2m2SVb3ufGWNwn6K/dQj78MKJoMDybyO5q7+VYjL2kbpDBG8S1ORepG8Bb7ARmNzP31p5Hov+EBpQch+5828ff7PsBwMGWto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781220979; c=relaxed/simple;
	bh=l3HgKI7Njn/7vohHiaPnF4aEH4dXQ/1/JOJsDg+6+9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmGnw5PettNlk3iP6ydKUAOx6lS8tJmJk/UDWQrYB8cX9dY75/8ZLXj5BcnX6h5mJwnBAydBCyn3Dq4n5bdU/SoEnxv/PzZJiELfvUq83XLMkPxHHTouWYR0qO0NqukHNnnZ5EyxfTdlnu/KWxHou+ekZ+mzc6p0qNJ0pLHZMd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lwOVUWHF; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lwOVUWHF"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68ced08613aso5044a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 16:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781220976; cv=none;
        d=google.com; s=arc-20240605;
        b=URis7Ug1CXq1dcSXHnOoVtUTAkiPEJxZRQuAT+5MJKDQkL6td4Zf12pgMOyXG1Xr8y
         hvAJO97AwTj7KH3SfOewTqVb4CsObeLXTnxVCZ4vI3lgzEuhxTHDRMsOpTtI90luXq2u
         ns5WLUgBce535u8PsHXIFPEOGHn27ym7X5BnLOgFDgxXGn6JM9jF9wUa8TT7eD3a77W9
         2FGQRlYbet1rH/lF576K1f5iInBltWE+euP88rFM+H90PvHPUGdbJQHb2XasPfIQIe+o
         BACaVqMtoeWpGy/16FMYpT9tLeKHFsFpT0df2kRgVW7lzK0fmTn9KWwkIS2zFFK0P4G3
         L7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/4zW8C18fMzcnCs6y1cXAB5w7Ou4SG5/rh1yzLAD75w=;
        fh=TAkTmytAok+gUGXXQoZ8qpTU7obe5D4BKAHxQmaISig=;
        b=kkvLCLqfDkxj1rR1O04hsE5B51aSDyrxpBiKVctcrLklDF5fXlO6wYPrHTZFnOpAuF
         Ub/kQ9rNZjJFhZgUndkWeviprrAlRfpmBVmwc7c+WauxYdAHo5rFF27t/MQMQi9zPTHw
         uMaedP2dqCBYRYZgW63a9lKSwVfC8Ky0D5MSCHa+773imYU1BeDpZwDOLmGiKKODA4i7
         OYBvwQc3MI2OOaW8WB31JsAnbnrfU+J0jrF/CoKDIu34kfLQrCTzjCDVIKPy9FhDxJrf
         9mFjfzbYNnddGLmkTpmckRv0VrWoIghrIepYpQMXSBE7/MC/dWhd+LaWwKj08Pf6HzK5
         k45Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781220976; x=1781825776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4zW8C18fMzcnCs6y1cXAB5w7Ou4SG5/rh1yzLAD75w=;
        b=lwOVUWHFZjg8P4f9WL1cgwf5PoDJv8d725by2D/fIylHJMTTxZ67Uk6gJZ9uL6QUo/
         p54wJEAvI+Nc07BSgGJfkbaBRDdnFaBFEySalvfQqgpOqcVR+x+PH3LFp49rrN9CDQAm
         onz9hW/A+7hgpmCJ/L4f2ozk2rbOu2Kp/+bd0ShliIx1CsXJ01px6/OvMokenozCAklQ
         WOvihbNtmqZmtAM9iwUl4RZ4y44dPKLvAoiknAkrNYiNLAWYXKKrKQpsdgERhvSU5PWx
         eJJMeieeWXJCIBsWbrLwqSzdgwp29Y3JXLaQfPKqyrVvZhgdP0XSRcTsMAOm3hWmrJmg
         F26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781220976; x=1781825776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4zW8C18fMzcnCs6y1cXAB5w7Ou4SG5/rh1yzLAD75w=;
        b=AQoKg246LxH9Zr4hHxy0iZ8rXEWmWfNrhJ8dF82t+XlunJ8j0FO+j6CXfeQT994na5
         SS5AabvFR9pFP2FTtjzCLFoQtrAZBHaxpwbqYeggOoGbyiN5FcPVY6q7Yhs0u4HCPu2h
         BCX37rXWT0zvm4OcM5Jvp4y0gb0QJgiRNaIL57fOyMnSUDy5c0iWW+Pw4WjZpC4BsE7A
         STYL0Lhgw0XFotQsEW/vUubCFrC6MeuoezFmOZ1nE1WLbJx7heFaqV+PJZdMDZZZLe+3
         GSiYHghMpZNVpZv6rkGIpiTTLAY0iIGon1aD3unYa6wO6HT2X7sGHLTSnJ0ce+xXXUo8
         g8hg==
X-Forwarded-Encrypted: i=1; AFNElJ8cNYDJT8vnTZaD6Pf28500LViYMoMjGtHd7Tgl8snmbzdcLTdu2caggbz3/NqyB1cE0NcVwQXYNHqSbgeizg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0p/+qSAWWtMsYfsiiA/e3YkQdM6uYkqRLvgkx0H3AWfBMcvIF
	klBHI3vd16pFUc6cr1etNpc6FHLl2bYQGJ+zuNoNdD/VxrCgY7vafBPM33I2pxXFl9gnowOj53A
	HnfTfQLHiT8t+3RweZs6/HuwhjZRqbmi6YeBdV4MN
X-Gm-Gg: Acq92OFEs8KYsoIh4FPklKsyJ19vJamOuBHqzMbK2XHYbC6F7sl91nT8X1Trs8BYp8F
	ZBK5EV7VTndqEN8BS/ArnoYhE6a3vn5KnQzBZSazt1fLoVTJrbMyfamkTDm3uTqLbfn0OsWlF5/
	/cio5rLBetWaP44H6KpZ52jlFWFviTj8aFR8LNVuIupWvRDMLsP/z/3du9wAQiDgjeYGmUwVzpl
	2jX1tu6H9W5OVrROb/rW7TJE+V+gro0bvPrFDBh+1O4ozrwY3VozuPpNSUjiKMnnCaDsDMDf5Uq
	VvfpKFs1Gvblz+Zf72jMwhNo/45imz/TYq68
X-Received: by 2002:a05:6402:8c9:b0:68f:d45f:e497 with SMTP id
 4fb4d7f45d1cf-6935ebe0aecmr19389a12.14.1781220975678; Thu, 11 Jun 2026
 16:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com> <20260609-binder-noderefs-spin-v2-5-eafde2ff376c@google.com>
In-Reply-To: <20260609-binder-noderefs-spin-v2-5-eafde2ff376c@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 11 Jun 2026 16:36:04 -0700
X-Gm-Features: AVVi8CclJL0Nh007sn4RRNFlcWdipiVcgV1hyAUtjRFY6dLt-txOw1cX8_WsKuw
Message-ID: <CAGSQo01S1k4wRQKQFNBn0E-bfWL67XPAg75zBb1C9N2pXF=YAw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] rust_binder: avoid destructors in insert_or_update_handle()
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 2:34=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> The insert_or_update_handle() function currently has two places where it
> drops objects under the node_refs lock. In preparation for changing
> node_refs into a spinlock, update the code to either entirely remove the
> codepath or drop the node_refs lock first before running the destructor.
>
> This also has the side-benefit that we avoid traversing the by_node
> rbtree twice. Currently it's first traversed to see if the new node is
> present, and then traversed again to insert it. By saving the
> VacantEntry from the first lookup, we can perform the insertion without
> traversing the tree again.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/process.rs | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/p=
rocess.rs
> index c8e9fd0d0472..268d78f8cfb3 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -861,14 +861,17 @@ pub(crate) fn insert_or_update_handle(
>          let handle =3D unused_id.as_u32();
>
>          // Do a lookup again as node may have been inserted before the l=
ock was reacquired.
> -        if let Some(handle_ref) =3D refs.by_node.get(&node_ref.node.glob=
al_id()) {
> -            let handle =3D *handle_ref;
> -            let info =3D refs.by_handle.get_mut(&handle).unwrap();
> -            info.node_ref().absorb(node_ref);
> -            return Ok(handle);
> -        }
> +        let by_node_slot =3D match refs.by_node.entry(node_ref.node.glob=
al_id()) {
> +            rbtree::Entry::Vacant(by_node_slot) =3D> by_node_slot,
> +            rbtree::Entry::Occupied(handle_ref) =3D> {
> +                // The node was inserted by another thread while we didn=
't hold the lock.
> +                let handle =3D handle_ref.get();
> +                let info =3D refs.by_handle.get_mut(handle).unwrap();
> +                info.node_ref().absorb(node_ref);
> +                return Ok(*handle);
> +            }
> +        };
>
> -        let gid =3D node_ref.node.global_id();
>          let (info_proc, info_node) =3D {
>              let info_init =3D NodeRefInfo::new(node_ref, handle, self.in=
to());
>              match info.pin_init_with(info_init) {
> @@ -884,6 +887,9 @@ pub(crate) fn insert_or_update_handle(
>          // first thing in `deferred_release`, process cleanup will not m=
iss the items inserted into
>          // `refs` below.
>          if self.inner.lock().is_dead {
> +            // Explicitly drop the lock so that `info_proc` and `info_no=
de` are dropped outside of
> +            // the lock.
> +            drop(refs_lock);
>              return Err(ESRCH);
>          }
>
> @@ -891,7 +897,7 @@ pub(crate) fn insert_or_update_handle(
>          // `info_node` into the right node's `refs` list.
>          unsafe { info_proc.node_ref2().node.insert_node_info(info_node) =
};
>
> -        refs.by_node.insert(reserve1.into_node(gid, handle));
> +        by_node_slot.insert(handle, reserve1);
>          by_handle_slot.insert(info_proc, reserve2);
>          unused_id.acquire();
>          Ok(handle)
>
> --
> 2.54.0.1064.gd145956f57-goog
>
>

Reviewed-by: Matthew Maurer <mmaurer@google.com>

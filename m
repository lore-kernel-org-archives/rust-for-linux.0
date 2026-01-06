Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD98D1FECCD
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767691705; cv=none; b=RNA9B9eDb4I6sF3Sk9CvF0R16zv5l2datTLwvfI3PpJ0EVE6q/lDB5S+iWc3evIo0mQq1DSIu5Y0DgA62WnM8eZjM/DdqgjnN7SzXI1SWAl4gk3UjogxVkoFbMCLN0iiHFS4DGqobS78hW1zFReIGH2hN2PA6Wwg+gaHLdBV1nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767691705; c=relaxed/simple;
	bh=B5QgLzXytJTBwF4m/Wq4TMPG+2aauBnYhfvjMCFyPBU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lveI5KVAEBGhmDJRnFq9VCsWul9qo0aYsoLID9H3LTOPdKWn5qKnS49HD5JSvQ+nBf+BbDoCtpAUZCExhRivhhdVi/Hrlpor+JNkUWdbn3PugTOaKNa0/rKIH3y037PabqFnfBnyNjW71HArw7aWJ76SBrqh3zD1DYIx7ZRE9nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dyNQPAq4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dyNQPAq4"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d3c4468d8so4116935e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jan 2026 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767691702; x=1768296502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RjpJ0KDmu6ECR8rL0wc7ojCWim0me85ZoK7bVZx8Nw=;
        b=dyNQPAq4y2bsCLwmjHpfyqWS/ZNraJSkw0J4uk7pS6fq3v+6XqETRKgtapPzSyRuYA
         tMrLVRt5UnM9/G49mdq/w/abJAge2OgDbtddsydV2ho0Wm+bAQ2cemtI8uA0TZJiH89d
         +YwCM+lYsAxZmaxJMCIOY4PJO3UNlX6+GPFAyXHNpKi2cwxJGQtu6Lasbw/x70CU7SrW
         Sgc9/y9E/OhzDFKVfLzvH02lavINECBWLBsYifhgKhwbb/y6hw7q4h6tgCNCUiYQrh8a
         3JAicGo7QmJYCe/KOWt7aFP0E71cKXZwuQFHl92JRHBhO6u3aQFkXM2ChBNR+0yQQazg
         Ebeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691702; x=1768296502;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6RjpJ0KDmu6ECR8rL0wc7ojCWim0me85ZoK7bVZx8Nw=;
        b=vzvcjNDEdTy6tpHh7wWe7iOJF0XBkReqWLL1tXCOYfcqEcbVrYoB+uqs8DMQlUL6Va
         DxW1ADwjGTyuYmsO7Q1BR0Hl8t9DnJe/SeCaFtJLM2dfqiHHE5CUFZ0YtfSQqbThfdf5
         zA8md8xTTFhfZNwgaDjPffxivNAYpyL7RO1ApSuCz8x4a+RFJemYwSFsNJQEebuNwU7V
         tSsHBIZRl8+UTOdiyDgw3LXOMSJUg3y0S5a6zG+uyTOFEcnX6scuh2F1lpTXkCRwxZ3F
         T1cZvWf/oO73ecUialXWEdbthCXiAkS96W6KYjtv7sNvphTXL62/65s0XW6tPyNH6A5h
         5o+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWw5PT95CKR5LwiJcfLF/AjVhF77E5ugwixTh6kbNVIYS411HcU50K89yt8VN/wZJN46xoZf7hsRZsIM+208Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBu0YlZ2gGtyM0szwV1yzt80VPBOiY1kz4iNP6JEF7oKpvSa6Y
	Giwm4Ax7znH6t3SMF51Zf+wrY678VeTakfferIpXdHOGH/En3RiWRN+UoG+RWUCH5Qcknf2/wiW
	fcDfmcMltIyHrMTVbxw==
X-Google-Smtp-Source: AGHT+IHNW8cnVGr4FrI4JSUTQ4MhjlhNsVpoauV6Ax0QEt6OpkLERWQ91EuorShFPTBR+aL8Z2pePHC4+iiUcQY=
X-Received: from wmoo8-n2.prod.google.com ([2002:a05:600d:108:20b0:47b:daaa:51cf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b43:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47d7f09b89emr24896975e9.21.1767691702185;
 Tue, 06 Jan 2026 01:28:22 -0800 (PST)
Date: Tue, 6 Jan 2026 09:28:21 +0000
In-Reply-To: <CAGSQo00Vz54=3tgw8z3DtEqtXZGbk3SbJoautuD2pCgw4aswLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-cfi-lru-status-v1-1-0b2401f7c5b2@google.com> <CAGSQo00Vz54=3tgw8z3DtEqtXZGbk3SbJoautuD2pCgw4aswLA@mail.gmail.com>
Message-ID: <aVzVtS8c4MMEdcZe@google.com>
Subject: Re: [PATCH] rust: declare cfi_encoding for lru_status
From: Alice Ryhl <aliceryhl@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Ramon de C Valle <rcvalle@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2026 at 09:19:53AM -0800, Matthew Maurer wrote:
> On Mon, Jan 5, 2026 at 8:12=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > By default bindgen will convert 'enum lru_status' into a typedef for an
> > integer, but this leads to the wrong cfi type. It's supposed to be a
> > type called "lru_status" rather than the underlying native integer type=
.
> >
> > To fix this, tell bindgen to generate a newtype and set the CFI type
> > explicitly. Note that we need to set the CFI attribute explicitly as
> > bindgen is using repr(transparent), which is otherwise identical to the
> > inner type for ABI purposes.
> >
> > This allows us to remove the page range helper C function in Binder
> > without risking a CFI failure when list_lru_walk calls the provided
> > function pointer.
> >
> > This requires bindgen v0.71 or greater.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  drivers/android/binder/Makefile            |  3 +--
> >  drivers/android/binder/page_range.rs       |  6 +++---
> >  drivers/android/binder/page_range_helper.c | 24 ----------------------=
--
> >  drivers/android/binder/page_range_helper.h | 15 ---------------
> >  rust/bindgen_parameters                    |  4 ++++
> >  rust/bindings/bindings_helper.h            |  1 -
> >  rust/bindings/lib.rs                       |  1 +
> >  rust/uapi/lib.rs                           |  1 +
> >  8 files changed, 10 insertions(+), 45 deletions(-)
> >
> > diff --git a/drivers/android/binder/Makefile b/drivers/android/binder/M=
akefile
> > index 09eabb527fa092b659559367705fd3667db6cb2c..7e0cd9782a8b24db598034e=
15e5a36eca91b3fa9 100644
> > --- a/drivers/android/binder/Makefile
> > +++ b/drivers/android/binder/Makefile
> > @@ -5,5 +5,4 @@ obj-$(CONFIG_ANDROID_BINDER_IPC_RUST) +=3D rust_binder.=
o
> >  rust_binder-y :=3D \
> >         rust_binder_main.o      \
> >         rust_binderfs.o         \
> > -       rust_binder_events.o    \
> > -       page_range_helper.o
> > +       rust_binder_events.o
> > diff --git a/drivers/android/binder/page_range.rs b/drivers/android/bin=
der/page_range.rs
> > index 9379038f61f513c51ebed6c7e7b6fde32e5b8d06..eb738e169525839a199132d=
d71e69e0b9cc69053 100644
> > --- a/drivers/android/binder/page_range.rs
> > +++ b/drivers/android/binder/page_range.rs
> > @@ -642,15 +642,15 @@ fn drop(self: Pin<&mut Self>) {
> >      unsafe {
> >          bindings::list_lru_walk(
> >              list_lru,
> > -            Some(bindings::rust_shrink_free_page_wrap),
> > +            Some(rust_shrink_free_page),
> >              ptr::null_mut(),
> >              nr_to_scan,
> >          )
> >      }
> >  }
> >
> > -const LRU_SKIP: bindings::lru_status =3D bindings::lru_status_LRU_SKIP=
;
> > -const LRU_REMOVED_ENTRY: bindings::lru_status =3D bindings::lru_status=
_LRU_REMOVED_RETRY;
> > +const LRU_SKIP: bindings::lru_status =3D bindings::lru_status::LRU_SKI=
P;
> > +const LRU_REMOVED_ENTRY: bindings::lru_status =3D bindings::lru_status=
::LRU_REMOVED_RETRY;
> >
> >  /// # Safety
> >  /// Called by the shrinker.
> > diff --git a/drivers/android/binder/page_range_helper.c b/drivers/andro=
id/binder/page_range_helper.c
> > deleted file mode 100644
> > index 496887723ee003e910d6ce67dbadd8c5286e39d1..00000000000000000000000=
00000000000000000
> > --- a/drivers/android/binder/page_range_helper.c
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0
> > -
> > -/* C helper for page_range.rs to work around a CFI violation.
> > - *
> > - * Bindgen currently pretends that `enum lru_status` is the same as an=
 integer.
> > - * This assumption is fine ABI-wise, but once you add CFI to the mix, =
it
> > - * triggers a CFI violation because `enum lru_status` gets a different=
 CFI tag.
> > - *
> > - * This file contains a workaround until bindgen can be fixed.
> > - *
> > - * Copyright (C) 2025 Google LLC.
> > - */
> > -#include "page_range_helper.h"
> > -
> > -unsigned int rust_shrink_free_page(struct list_head *item,
> > -                                  struct list_lru_one *list,
> > -                                  void *cb_arg);
> > -
> > -enum lru_status
> > -rust_shrink_free_page_wrap(struct list_head *item, struct list_lru_one=
 *list,
> > -                          void *cb_arg)
> > -{
> > -       return rust_shrink_free_page(item, list, cb_arg);
> > -}
> > diff --git a/drivers/android/binder/page_range_helper.h b/drivers/andro=
id/binder/page_range_helper.h
> > deleted file mode 100644
> > index 18dd2dd117b253fcbac735b48032b8f2d53d11fe..00000000000000000000000=
00000000000000000
> > --- a/drivers/android/binder/page_range_helper.h
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -/*
> > - * Copyright (C) 2025 Google, Inc.
> > - */
> > -
> > -#ifndef _LINUX_PAGE_RANGE_HELPER_H
> > -#define _LINUX_PAGE_RANGE_HELPER_H
> > -
> > -#include <linux/list_lru.h>
> > -
> > -enum lru_status
> > -rust_shrink_free_page_wrap(struct list_head *item, struct list_lru_one=
 *list,
> > -                          void *cb_arg);
> > -
> > -#endif /* _LINUX_PAGE_RANGE_HELPER_H */
> > diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
> > index fd2fd1c3cb9a51ea46fcd721907783b457aa1378..1358f3348ffdd31f9bef6c0=
4ee9577d0f6a0c5a6 100644
> > --- a/rust/bindgen_parameters
> > +++ b/rust/bindgen_parameters
> > @@ -23,6 +23,10 @@
> >  # warning. We don't need to peek into it anyway.
> >  --opaque-type spinlock
> >
> > +# enums that appear in indirect function calls should specify a cfi ty=
pe
> > +--newtype-enum lru_status
> > +--with-attribute-custom-enum=3Dlru_status=3D'#[cfi_encoding=3D"lru_sta=
tus"]'
>=20
> I think this may need to be `#[cfi_encoding=3D"10lru_status"]`

Ah, I did have some trouble testing this.

Is there an easy way to test that I got the cfi enconding right? I guess
I can always add a kunit test that makes a dynamic function call...

Alice

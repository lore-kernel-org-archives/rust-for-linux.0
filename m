Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C31A3029
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 01:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767231821; cv=none; b=nfjOaOXeencilARAXrSKS+VDxZm6qsutIF0a96Bt5syeDAStsvR+5us1YqjroEVvZsfbth0tPRxXHi0xBitkLfjeRZ1uj+S5VCED4hXSngh6KFnR5n6ecEW+vNRptq/AKEWtmXu0FqKj0ifl1gFZruz6MjF823rvH4KH9LbjKLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767231821; c=relaxed/simple;
	bh=RMCYmC1Oubx8T9OX4HGP+LuRcopbaCrIKk16O1wTI6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdvP+SlhABV/QF3usKzD+SRzHwzk8S1k+5rS9QWLDuIAJtAMofYTLuFagEybyp5wULcr/l1tv2vhH42KkfGsJUHm9nXUakxf5V3Bq2jeaMocOHIjBRfUPmwdRnKQTyajiJsDd7vjUgO4UwVoWF66xK97GwZNXDUZ9Krv5xDWvAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALPJOAIs; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALPJOAIs"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37a3340391cso89582561fa.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 17:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767231818; x=1767836618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCE7uUSE9sjZ0PtrMGueCDZmvLDiSF0FwCCrGBTq3pU=;
        b=ALPJOAIs4gHwA0ffxn2Lshc6wcn0mehlrNDpUlf9Aw0R1OwObctqGygkXy3Sy0cIcH
         2nlbffH3OCdCRa2l6dWV9ydYkXu+vjig4UBqkFbuv+8Q/KH9mfoqItZsVTLebwOxR+rK
         8J2FfVJxHfekVpG4XB99m4xB3YZ3xh3udla7s6q0mp1+ck5U26+DaNTJVnfcFIh1EOOp
         h7+EJmxYlJr5R5MyuFVuRFQecO6+AomCd+C6vm5e8ypUJ7jMHKhQZpUuXaiNQBQ6lP6D
         h4hLgi13JuhLTGcRxxna9vECe15Rf3SdxAqyUoC3lGED5p7ILNb670MLrQxYjMl7LBRy
         +TCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767231818; x=1767836618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gCE7uUSE9sjZ0PtrMGueCDZmvLDiSF0FwCCrGBTq3pU=;
        b=vuV9qMMcu3wrU5sys6R3/UapL+tkdIGGg0Anl5bWs6Yk+tmuybi2vKmwDe3gbLOoOe
         D+ZkKGSxT6/le0un6z072QdrF317aqnHnuXZjWz1MGQyBkh6mKFKR6DlvZ3p5bu3PNvB
         YOrpMxTG0Rexzhitc1O0EVoauNw+IbWDOf/M8fZcj9iJCPRR0IOV7hjsFkDiIoSDoyBe
         0jGy6Mwkqqpu/kxL8SPoXI0yubXZueygYGMAtpEk5rzg6U2jIEdPgClAnJbJp8nIp8Rr
         IsEVTgo8tYqn1Ri55pAWCcJoyYKQFl0CRI/FV4xfb8Z0XKFmUi3giRL3jU5yH59DAhjK
         37bw==
X-Forwarded-Encrypted: i=1; AJvYcCXXYO1QcvWOuNZPtmhVVaV+JDagNNDHmT2vCeevXcrJAEYuOT6PkvjTRtEOKhjPMfn4EiqHD69yeYvwx9cC3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwttrF/tQZ185/BRfmGLuNXmYQwxL7cHMp4hFHdIX8lgUycJYqN
	mlIuImOLsZ6x7I1mH6EYRlRXFhhQgUtpxHG9OrI3gviVMJL3Mj6vTB2rz/KR4QdnXpN7Z45kNxT
	aGCN7lbpZ7hnHvY5oQ+Z8BCBM6Bninfwcdd0n70yW4RuHbVg=
X-Gm-Gg: AY/fxX4c5sYuHG6CczfGsEXf/EqnIWGG3tmumYj9S6yTiY9JKfR5ZxRtRNSDpwSk09k
	K8gEwm1Vsf7zt5QFclRfkhcoOtlu82GtwaE2qqOQ4//Rmll38Txt/+BJEMQXvFy290PO3U52H+H
	rEG/RRu8ED8FLy12mbWBaINbFTPT2SX1zbVgyJ9vYiLz/MDD72GpSRIBK/bWlc22DN7X+Vtg00F
	6CwdS1es5URJMUhEb/GrjjHv1WURXwZIIa6bcdWnPI8Xd5qWcsXk43U+icW3aeDXvkixiof
X-Google-Smtp-Source: AGHT+IEZ3xskbnTcFFXLfNw1WfFC+mUgQkFCAg3Zmqyh/u2exvaTg6y8Rz1515yNWFUPOwaCQ2x7J+8eVnVoEyXmvWs=
X-Received: by 2002:a2e:ab1b:0:b0:37b:9b28:4282 with SMTP id
 38308e7fff4ca-38121561689mr113011721fa.11.1767231817298; Wed, 31 Dec 2025
 17:43:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229072157.3857053-1-sunke@kylinos.cn> <20251229072157.3857053-2-sunke@kylinos.cn>
 <aVKN0Q-6bsHGq_Gy@smile.fi.intel.com> <aVT1N1NHQDCe2Dn8@google.com>
In-Reply-To: <aVT1N1NHQDCe2Dn8@google.com>
From: =?UTF-8?B?5a2Z56eR?= <sk.alvin.x@gmail.com>
Date: Thu, 1 Jan 2026 09:43:25 +0800
X-Gm-Features: AQt7F2pS0TqvVAQdanc3Bo3EMWR6iCq_CzwU-ee236FPcjRgH_zlGQ05ThiHK84
Message-ID: <CALpAb9O0cvg+bPy5tD_BbE9kwHyTy99jvgp=xuwNqefTRWFiVg@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] lib/vsprintf: Export functions for Rust pointer
 formatting support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dirk Behme <dirk.behme@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 6:04=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Mon, Dec 29, 2025 at 04:18:57PM +0200, Andy Shevchenko wrote:
> > On Mon, Dec 29, 2025 at 03:21:19PM +0800, Ke Sun wrote:
> > > Export ptr_to_hashval() and extract kptr_restrict_value() to enable
> > > Rust code to use kernel pointer formatting functionality.
> > >
> > > - Export ptr_to_hashval() with EXPORT_SYMBOL_GPL for pointer hashing.
> > >   This function is used to hash kernel pointers before printing them,
> > >   preventing information leaks about kernel memory layout.
> > >
> > > - Extract kptr_restrict handling logic from restricted_pointer() into
> > >   a separate exported function kptr_restrict_value() that can be
> > >   reused by both restricted_pointer() (for %pK format specifier) and
> > >   Rust code.
> > >
> > > The kptr_restrict_value() function:
> > > - Returns 0, 1, or 2 to indicate the kptr_restrict sysctl value
> > > - Returns -1 for error case (IRQ context with kptr_restrict=3D=3D1)
> > > - Modifies the pointer value through @pptr parameter when needed
> > >   (sets to NULL when access should be restricted)
> > >
> > > These functions are needed for the HashedPtr and RestrictedPtr wrappe=
r
> > > types in rust/kernel/ptr.rs to provide safe pointer formatting that
> > > matches C kernel patterns.
> > >
> > > This refactoring:
> > > - Allows restricted_pointer() to reuse the common logic while
> > >   maintaining the same behavior
> > > - Enables Rust code to use the same kptr_restrict handling logic
> > > - Reduces code duplication
> >
> > ...
> >
> > > +EXPORT_SYMBOL_GPL(ptr_to_hashval);
> >
> > I do not like this. At bare minimum we should make sure it's namespaced=
, so the
> > author of the code deliberately needs to import it (I'm talking about C=
 side).
> >
> > Ideally we should have something which is Rust specific, like
> >
> > EXPORT_SYMBOL_FOR_RUST_ONLY(foo);
> >
> > Can we do that first?
>
> We don't have an EXPORT_SYMBOL_FOR_RUST_ONLY(). The closest there is
> would be to place it in rust/helpers/, since such symbols won't be
> available to C modules once we land this:
>
> https://lore.kernel.org/all/20251202-inline-helpers-v1-0-879dae33a66a@goo=
gle.com/

Does the inline helpers feature also support GCC builds, or is it
limited to Clang only?

>
> But since the current file also needs to access this, I don't think it
> will fly.
>
> Alice

Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84925393C
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 16:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758214517; cv=none; b=iHBLVvq6EhgrTk2mvNV+CboXIFPIw9vK1pdJUS9938utUax1WbsKY4/eWynzAQ/DLaSX4d8jdJzm8VaKLjtdg4WC5x39GM45ezMpuozHpyc8W/IyEFFeLrFSXN75ssWlhGFGE0ws629N4f+rInf/E3X27gmTgN+1LYDC88AHejY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758214517; c=relaxed/simple;
	bh=7yj+8e2r8iHEk5ANg8qImbXoBk4yFye88GKD4KMyPR8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d+u0417eNobZw7PWms4CQ4+Y3AHuTx3YNdzrYYCntpzz6y59T7+2iu/FKxVFdC48mOiEspQ2h6V15zDKl5OXepB8E+cySHFuW+2/EhslMaFsLxIDfyzY3ysFfN33GSApK1PCcWccrZPMd8vR9W86J/D5SINw20nIcEvlkHWvzP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G3LZ8I88; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G3LZ8I88"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b111d2951b9so118360766b.3
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Sep 2025 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758214514; x=1758819314; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=34EDgIXBDluEGauPQSlOKGzRZygW8gJTTorkuPVWZA8=;
        b=G3LZ8I88J4I+WvF1pGcBog60wKOHO7rAuAl5p7ORRHLmBdHXuGI8/cin95YFQxUoyW
         Y2HTwUOYMKJBnFvcWHS5y30hwE/55SV/oOzCYDh7XU4qAoGvBN6AMXTzcEeD1rzpocEK
         RGTg7fZjQvbZjp1EbtuUXV9KoMZoHYYFog29jT1bv3bP6AQ9oeIpab4PwMuJzkiwBAiz
         2GSei4cxX0tcVgkwCKF10wHb4jM9mxNLIyyv2MBk2AHKEACOAFtTG9XVr5N2m7T/i8T6
         3+Nbmz/r2bW0+jtlirJultbAocKTX8vO+09wLRMaFRQQJKkt2nKHag9iK0ezojgLkLvY
         1mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758214514; x=1758819314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34EDgIXBDluEGauPQSlOKGzRZygW8gJTTorkuPVWZA8=;
        b=odX0z4wiJjkubuXh46gAbrPNzNAKn5/HqK6J4ycc56WF+ktnrxAhnR7lVGvdcYaLAn
         E8LUwYRwP12YVHh6vzT11ULsfVQAjbyg+AH9MOZbtMa3J5TwDdQuV4LST7sphOazwuMC
         Thq1ttPRfW0Lv2n98lowDhtXbra/jx53WOigptJpOt+G0rz8QpYmf/No2Q5Wre1su2uW
         6VfnM2QKY90Fp4qXwm1l51vFlN8SnJTQX9NtzTKi5e85klwdBxaMmkmVCznFDm3bWlsQ
         +z7LyH18HoG54KU7+L8iU+6rGyUOq7QNt+dVa2ProzSPBzptKqBK2d3gVKGQsivDjKmG
         Cj3g==
X-Forwarded-Encrypted: i=1; AJvYcCUNX/KZ9TU2wKyjaN4PmLzZl/5zzxKH1S5EbJYACdoe4ifQSCP5ETgPiDOMCUJrI4InpwxF9YmN89Ou1qLrrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRz1McWiyOkC4tY96NEqiBBfxD6gJaAXRMYhy4WigVr4q5dAgI
	xsLNyORyrb7AQKVkOxhi2MWCouP3/Ud4Gft4StRZ3m3zBy0a2Sr0kNEIdYrwkMpw3YV2fUptkNd
	6a1bNzMOXN9TSrEOI3A==
X-Google-Smtp-Source: AGHT+IF4z5YMCca6wpSe2aYc/hXa4PxHhJwZJSFFGiM7lb0rzYJ7L07Kt4y+RBjUICVPayoJYG2995O0zayX9oE=
X-Received: from ejcli23.prod.google.com ([2002:a17:907:1997:b0:afc:aa75:6cae])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:94c3:b0:b07:b50d:df66 with SMTP id a640c23a62f3a-b1bb9d0f22fmr674804866b.19.1758214512173;
 Thu, 18 Sep 2025 09:55:12 -0700 (PDT)
Date: Thu, 18 Sep 2025 16:55:11 +0000
In-Reply-To: <aMwxLQubVOuGZGLf@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250918-rust-binder-v1-1-7a5559e8c6bb@google.com> <aMwxLQubVOuGZGLf@google.com>
Message-ID: <aMw5b7aNxoULilmg@google.com>
Subject: Re: [PATCH] rust_binder: add Rust Binder driver
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Sep 18, 2025 at 04:19:57PM +0000, Carlos Llamas wrote:
> On Thu, Sep 18, 2025 at 10:19:38AM +0000, Alice Ryhl wrote:
> > Please see the attached link to the original RFC for motivation.
> > 
> > I did not include all of the tracepoints as I felt that the mechansim
> > for making C access fields of Rust structs should be discussed on list
> > separately. I also did not include the support for building Rust Binder
> > as a module since that requires exporting a bunch of additional symbols
> > on the C side.
> > 
> > Link: https://lore.kernel.org/r/20231101-rust-binder-v1-0-08ba9197f637@google.com
> > Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Co-developed-by: Matt Gilbride <mattgilbride@google.com>
> > Signed-off-by: Matt Gilbride <mattgilbride@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > --- /dev/null
> > +++ b/drivers/android/binder/Makefile
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +ccflags-y += -I$(src)	# needed for trace events
> > +
> > +obj-$(CONFIG_ANDROID_BINDER_IPC_RUST) += rust_binder.o
> > +rust_binder-$(CONFIG_ANDROID_BINDER_IPC_RUST) := \
> 
> Since there is only one option for rust_binder.o, the target here should
> probably be just 'rust_binder-y := ...'.

Ok. I don't mind.

> > diff --git a/drivers/android/binder/dummy.c b/drivers/android/binder/dummy.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..7e9f6ea3a474b59f11e723a709c0c21e8b8beae0
> > --- /dev/null
> > +++ b/drivers/android/binder/dummy.c
> 
> This dummy should be removed, we aren't going to need it here right?

Ah yeah, thanks. This file can be deleted.

> > +// SPDX-License-Identifier: GPL-2.0
> 
> I'm not sure if all these need to be "GPL-2.0-only" explicitly?

It should be the same.

> > +int init_rust_binderfs(void)
> > +{
> > +	int ret;
> > +	const char *name;
> > +	size_t len;
> > +
> > +	/* Verify that the default binderfs device names are valid. */
> > +	name = rust_binder_devices_param;
> > +	for (len = strcspn(name, ","); len > 0; len = strcspn(name, ",")) {
> > +		if (len > BINDERFS_MAX_NAME)
> > +			return -E2BIG;
> > +		name += len;
> > +		if (*name == ',')
> > +			name++;
> > +	}
> > +
> > +	/* Allocate new major number for binderfs. */
> > +	ret = alloc_chrdev_region(&binderfs_dev, 0, BINDERFS_MAX_MINOR,
> > +				  "rust_binder");
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = register_filesystem(&binder_fs_type);
> > +	if (ret) {
> > +		unregister_chrdev_region(binderfs_dev, BINDERFS_MAX_MINOR);
> > +		return ret;
> > +	}
> > +
> > +	return ret;
> > +}
> 
> Hmm, is there anyway to keep a single binderfs.c implementation? In this
> case we now have separate CONFIGs we could use for the file creation
> callback? It would be nice to keep a single binderfs source file.

It could be nice, but it's pretty non-trivial to unify them. If we do
that, it will have to be a follow-up, and the follow-up will modify C
Binder too.

Alice

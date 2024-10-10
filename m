Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB381C3F3D
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568907; cv=none; b=EQNWhEiFR1QTAH05KuKz/SmH+roFOwBfrHQVDNJ1Gm6jJI06hzKv1D26hZpiTvAeU5tjB1b5CXviJJxO4jCIx7EZB3ed5PN2TltxUoIInTE2EfZGLTEWWhGZZDc4bIa6yt3eZ2q8aXjP/M424VOSoRXcW0TSfLoRGZ2VJA74TIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568907; c=relaxed/simple;
	bh=kALkcQRrhntN1yB20faxRzZG0b1HvvZgGUychwJTUIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kNuim1Ffj3rKBXse+v2LQ10CO3+MNTVSLqPDiUhqf5sfKiBzLNmhpdb0VJrlSNJICvK3OshH6vfNFBRLpCIlzy3Yzi8rxYcke7pQogjvU5luUnVpFXM7mibWNJOSdAaU7mbXdMuJHgBwcT91WS949oNKi1VgLdEfkC/5MuLf9CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qd3BtDhu; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qd3BtDhu"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37cea34cb57so591580f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Oct 2024 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728568904; x=1729173704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3CizW4u3+UrLWSR0ffHUPIJ13PdM9vRjZPunNir5Hg=;
        b=qd3BtDhuhekoxfW5j979y9b73Q2YXdYrtICznhDXDyGu6kGBiDp/lMKBjRkOCXFihI
         DLmT1vWo8ya+6qGSxeZKQo20Ju0Vv7hDNjW87xJMCR33PydrWe+fTPSLqv34UerLEDzv
         6XYNJcc7fyT5J5QxhhuBjkgYyqRb6jHhcsUCG6TkzBqeZ9lRJOxz8FgPnZJE+U2HJq1v
         zbdrqPA9cLGDJfHjyzPN6jujQV/prwuq2NxoJbyp4D6dMJNO5GmtG2+h6OSwUXoDGTK6
         CaDEUoXLPnS6FU1VaautmTkDwQWQX1tldjmSJwKJn+Mymgc2j+PdbyBHkzgBM9sIX0Y5
         ZRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568904; x=1729173704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3CizW4u3+UrLWSR0ffHUPIJ13PdM9vRjZPunNir5Hg=;
        b=OqQvTjP8sKnXpDh6X257/yTNC58/0iWk8w0cUyC7ZzBZm3aAzaCy50hQT1Gc6mRLVD
         Mt0XHP9tZwkqLyfSemeycdq/4fykE6AfpZrgEJmhPeR1e2r8O7dlhvqBkIFtE97K5Hyo
         gi0141U1aKZaiYN8MVd5VKXTN3c4ku5M0ktscHasHVJlQBkl+G1itE8Dwt9VTyw25+Sq
         o7a+WzTkgWHyRIqL9OLGr7UNME/PyACFhe9piBSc8vxvO/D/LwreO+eNKI2NzGkkULSD
         0xHYD4YvuskeCyhoz+BQGYDavwzMZVa9oxPfKrJJXTF4vITDJlqfWwrUJd1AinA5dRKD
         jvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO7qMNd/NW1ly7y/dVdGOmOOiOggqXi3F2HK8lGDab9vURzqDoRS/wQtY4d9fej7OvGS3gukuYCfr51aezoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcPjyIJsA5T+8r0gLy8pFZby/cXYObBC85fnj0I2yeL9RoHgMn
	YO3MJZPvHF4z2jboxjq8GYN3rzj0579EY0ml5EcdachZ4zOhs2gnrLIf2auX+/EZL7+WkQ9krH/
	fnxyBHr0pkyIsi9ERoKTWoSHOyXmx9e+8H567
X-Google-Smtp-Source: AGHT+IGbl/myGulPH7utUVANwqGBZ1G1wJDyWXE9tQCoFt9Nv3IiGyF+ktDEcfU32Dohut4keUWPmBaXOt/2BJpg4ck=
X-Received: by 2002:adf:e592:0:b0:37d:4956:b0b4 with SMTP id
 ffacd0b85a97d-37d4956b4a4mr1614858f8f.59.1728568903205; Thu, 10 Oct 2024
 07:01:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930-static-mutex-v4-1-c59555413127@google.com> <87r08okqlp.fsf@kernel.org>
In-Reply-To: <87r08okqlp.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Oct 2024 16:01:29 +0200
Message-ID: <CAH5fLghvZsU-rF+6hkOoiAOWhpiLJV1WJNPYCRWTq7cEW8UM1w@mail.gmail.com>
Subject: Re: [PATCH v4] rust: add global lock support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 3:57=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Hi Alice,
>
> Alice Ryhl <aliceryhl@google.com> writes:
>
> > Add support for creating global variables that are wrapped in a mutex o=
r
> > spinlock. Optionally, the macro can generate a special LockedBy type
> > that does not require a runtime check.
> >
> > The implementation here is intended to replace the global mutex
> > workaround found in the Rust Binder RFC [1]. In both cases, the global
> > lock must be initialized before first use. The macro is unsafe to use
> > for the same reason.
> >
> > The separate initialization step is required because it is tricky to
> > access the value of __ARCH_SPIN_LOCK_UNLOCKED from Rust. Doing so will
> > require changes to the C side. That change will happen as a follow-up t=
o
> > this patch.
>
> Why is this a challenge? It seems to work with locks that are not
> global.

Because normal locks are not initialized in a const expression.

> > diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/gl=
obal.rs
> > new file mode 100644
> > index 000000000000..fc02fac864f6
> > --- /dev/null
> > +++ b/rust/kernel/sync/lock/global.rs
> > @@ -0,0 +1,260 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Google LLC.
> > +
> > +//! Support for defining statics containing locks.
> > +
> > +/// Defines a global lock.
> > +///
> > +/// Supports the following options:
> > +///
> > +/// * `value` specifies the initial value in the global lock.
> > +/// * `wrapper` specifies the name of the wrapper struct.
>
> Could you add an example to demonstrate when using `wrapper` option
> would be useful?

Probably only guard and locked_by are useful, but I think you need to
give the wrapper a name to reasonably use guard/locked_by.

> > +                    /// Lock this global lock.
>
> "Try to lock..." ?

Thanks. Good point.

Alice

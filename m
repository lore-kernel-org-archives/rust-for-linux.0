Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D4926F463
	for <rust-for-linux@vger.kernel.org>; Thu,  1 May 2025 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746083866; cv=none; b=R8Ot04B0rI3NPqk6yuTTBRYMbVxRAyJ93luMVGYGaOReyn9BCWydZ8XtAS6fwM9dCnFIoT5MZDpJu6vuBvodETqVU3wEGl4OXsvuL3h8vC69K/x6bcGuHdJMycph3is9GuLvTGSacNeV36T0MccpdzPWE/aQrHEyW1W3drBdlZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746083866; c=relaxed/simple;
	bh=IsEFuKr8MdJiyQYBneHaUVR7yEJMImUpl5m96czfCBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZYBtLApdC1S7y+/t6YqtaHOAyg483L1rQq+SpxeDXz672ld9XwC5ZmazCpePRJEfoEVaefn8dG2+bu9gw661sjTTWqKAisDrgrl4y6kwnCsC0aLZLyrNTCRQ6QHjTgTNHPWD8Lw9Wp7vfx9uV6UBYy09VeU8z8jRnkz+ofawqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Asn/uqIU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Asn/uqIU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso4371645e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 May 2025 00:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746083860; x=1746688660; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfbpd6S+j/Op6XJKqOKEnKbRjtTW+fQ4p2/1pzW9EyY=;
        b=Asn/uqIUxT7H2kQ/yyk5Cmwqr/XYQ1vR7NRDs85+JIjC94pJ0WiCH210kr6HMWehA+
         RK+fWpOPh35jxVn0qsFnktC/b7eEX7oAr7fcRTLOYd0E5pH4zZU2s0EhMHmwTPPb+rzU
         5tCUaHA2opkTFrNVx74YQ89+GjMVYSh5ggqiUsu1Nw95vCJBAAGEqtmPqZVJRt/pR0Rs
         twAABu4IMFnunx4ZTEhbzPphrA+D+QV4SjplxxRIcApSLfZGhS7sgB2SnY1yaIdiEa/u
         NfnY4EIli1TzDxuu+NTsEXp5fP89QxJe/y2YUapKrWwwvnroZrIE6mVm2WlrQeFe3XvN
         vr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746083860; x=1746688660;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfbpd6S+j/Op6XJKqOKEnKbRjtTW+fQ4p2/1pzW9EyY=;
        b=if5GYln/2nCO+wLVAF0hTE7dWF3w5KBqV7+befM/UOTkc5qaNwXKWMukgINOg22BWf
         IskQhmULB5qqXPWKxAkqXCzj68fPA4glhWCAQxubqIZTuTUm1OsdUp90IDS5UNfKX2Vb
         49Bwvgy05FPbgUQTH+n3OSBWqaaR+C27OW2MCHuM02zHeQQ1ZBSv+SsD/WmaX5MxKjZB
         7bAywdrOxxDjB4CNhq1wLO+qIKDB92nnfyKWYZUEHV1AifzJyBazeG8o69F4N0oWq9Bz
         9uKj2WBpAVthLQL59XKHYp5cL/ySxqEbqizJZAoPjCt5oAdw5qpq+TRhibSKHltiIs5p
         fSFw==
X-Forwarded-Encrypted: i=1; AJvYcCU6NVkotVaJUngomNdKC/iQV6ugx3O9Sn4/h6Mvy4QUX4GFSUaR1/+6O2cTsxyKr9F6kXBk/lP1fjL34PTsPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBMntcp7eSXs9odL4eWPPTNmmz3z7100lT+44a5MP7in+8FONp
	Ir2dz1RZ5LEEnqNteJv4dtyz2V6rcdFLOCZ6SQGvf/zaNm7t3aI/HveLaTIQ3yjoTAuBVu2K0T5
	fRN+TNmfjReDePZyxeCR7kwIKmtvYz1bbYQFe
X-Gm-Gg: ASbGncuXx/w6ShFGR5UfCG7bQ4SNUk0NQjo4ohkpQZvCvbF2YJH+ZA+jIgN50Ys9c4c
	x67/i9V86J9LGuvHGp1+uthpW7y9Em+Vbt/ks+2yPey6IgK6DsTpN8KGLySWSZKdNa1kS80no8n
	0T+HYhMEdk5ax7vc5i/PH2ChI=
X-Google-Smtp-Source: AGHT+IFduWCt9dAJ2C1o84Xte2BlzpK0E9RUVCMttsag2Euox2KT9XXx00vsgL2LSClUGCr9nJXH2sWB2Mwl9YOh+0s=
X-Received: by 2002:a05:600c:3493:b0:43d:fa5d:9314 with SMTP id
 5b1f17b1804b1-441b653c894mr11786975e9.32.1746083860001; Thu, 01 May 2025
 00:17:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-rust-xarray-bindings-v19-0-83cdcf11c114@gmail.com>
 <20250423-rust-xarray-bindings-v19-1-83cdcf11c114@gmail.com>
 <20250430193112.4faaff3d.gary@garyguo.net> <CAJ-ks9nrrKvbfjt-6RPk0G-qENukWDvw=6ePPxyBS-me-joTcw@mail.gmail.com>
In-Reply-To: <CAJ-ks9nrrKvbfjt-6RPk0G-qENukWDvw=6ePPxyBS-me-joTcw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 May 2025 09:17:27 +0200
X-Gm-Features: ATxdqUFyUNh-QBM8NkJE1Rola7V4MLYJmp0oVbJRr7K1gApSfORdSuG0qeRLbzM
Message-ID: <CAH5fLghKLZR7i6YQk8cQrvfOr11xEKia5LHtj1fn8dD3Stv0dQ@mail.gmail.com>
Subject: Re: [PATCH v19 1/3] rust: types: add `ForeignOwnable::PointedTo`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Matthew Wilcox <willy@infradead.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 8:57=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Wed, Apr 30, 2025 at 11:31=E2=80=AFAM Gary Guo <gary@garyguo.net> wrot=
e:
> >
> > On Wed, 23 Apr 2025 09:54:37 -0400
> > Tamir Duberstein <tamird@gmail.com> wrote:
> > > -impl<T: 'static, A> ForeignOwnable for Box<T, A>
> > > +// SAFETY: The `into_foreign` function returns a pointer that is wel=
l-aligned.
> > > +unsafe impl<T: 'static, A> ForeignOwnable for Box<T, A>
> > >  where
> > >      A: Allocator,
> > >  {
> > > +    type PointedTo =3D T;
> >
> > I don't think this is the correct solution for this. The returned
> > pointer is supposed to opaque, and exposing this type may encourage
> > this is to be wrongly used.
>
> Can you give an example?

This came up when we discussed this patch in the meeting yesterday:
https://lore.kernel.org/all/20250227-configfs-v5-1-c40e8dc3b9cd@kernel.org/

This is incorrect use of the trait. The pointer is supposed to be
opaque, and you can't dereference it. See my reply to that patch as
well:
https://lore.kernel.org/all/CAH5fLggDwPBzMO2Z48oMjDm4qgoNM0NQs_63TxmVEGy+gt=
MpOA@mail.gmail.com/

Alice

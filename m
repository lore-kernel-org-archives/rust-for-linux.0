Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC758493
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724393501; cv=none; b=Nuqr4PzGnz1aU5pVeatX2+oAexUmsUgpyUW5NqKS6bIQ1usZjZQTleyF+4kpeesGKPb4GtehGcZQaFQm+Xh51Z45eo1U084PifT+c09XQpsGSsaazRUxVbFGTG3Xfd7L3dromnUWgJfoVDe+3Xpq7zrfibjE1fkypD4ztqstW7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724393501; c=relaxed/simple;
	bh=Kpg8ORXiY2iAJz97bh1ur+X6t9tWug5BhtEbImrkKA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ven593rVyXJGTym8O9yZpOVCtvDjXM2ZLf9X1vVIGbBPNj/tNkJrNKhfNhWQY64mbByJb+qxrWxV/v0NMdXoEvzub+i2eoKGEqf0gCllBfHdO+Z7Yh6DIjQ3iDbYnKztWaXsNi4ZkcUPclEO3Feo/Gl5blcgwfZVNFJmMWr52Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDNXv1ya; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDNXv1ya"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d3ba4e6ad9so277327a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 23:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724393500; x=1724998300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kpg8ORXiY2iAJz97bh1ur+X6t9tWug5BhtEbImrkKA8=;
        b=MDNXv1yatG8J91fOqwvjcwMKSpVdnScYZN5z1Izi5Rceegbrj4oQdALXwEMyjEVXEc
         URVTmP/UWSs7R7wqT8v5igq80rTLXT4zSGO+ZQDpzFdDRyFm/EJsAVICusq5391gUJfw
         e7/G1uS41wZK6S1EpLS9nfX4U0kN+IRCQ8txEz1bAE96kKTiRXmwqEDrTJDZminnalH4
         jMaidl0853DQm5dVteLHnJAONQvf5mG9XoW/50+EasJ8hlTsZHsomdDnwzYapLr0KGUb
         wOf8SbSa7IpKqEkomgSvOEYougGcpVX6cQZDTSsG3/iju1YERqE4KBQk59eDOcwXXE33
         g5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724393500; x=1724998300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kpg8ORXiY2iAJz97bh1ur+X6t9tWug5BhtEbImrkKA8=;
        b=qFLKIWFReCm+P85SoXifAEhnXuWcd6Eq+MBAtxVmNRFVm1DU5CN1k2WHYoh/BTUwP4
         LssPexappnlzD/odOyf8vEi0AZaNSTiqFKBwwduKsuYZfWHybIwqi+BZBo8RoXfbbMTe
         2lqMYKTupdR8UZajzYBXDZYNu+Ki1rahklzBruYg1KkvrMNsBmwl6R7X9j5Z7Q5lH+Yd
         nx9fQk/QjjBOZK3zl6qnZ8+NEEQEpPDlIMGGLl8zeGxm7QQ56YkvWfvKFDihTUrAuEQ6
         yUaj2FqSfmpAxpQKcV4Ubj9VCz3jRKqILcPEcvunkQvefu5xbM8+En/t5XtuIoSq40w6
         q4DA==
X-Forwarded-Encrypted: i=1; AJvYcCW75phD8X+D2dZKAHbXaXRNYVGP/EaAZJtJ0pj/3RhEv50xgdT1VKMZlHvkOGdzpaWhX+ubOcAsVZyGBXmBnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybdDvRL/rDRfyzY4ehUwvJgc4OJKA1WWP21kVU40nRbDgq72dM
	jbXHUpPzrJYDrjnP/dkHK/PmxSgz4lPXW0Ph1Ei9wDA6OfYTDoYBVj0PsaCTQa/+f904CzYeQRy
	gZZt6SDTcKUJC8gquFMkUhgQnLKc=
X-Google-Smtp-Source: AGHT+IHp0DWFrmAAJtQc2lKpuW/kRxHYcGDJvchuImPzBQOCuZ9S1UjSKbyQxyaG8wUPER486RO2xecILcYIyMZ72vc=
X-Received: by 2002:a17:90b:108c:b0:2d3:d6fd:7218 with SMTP id
 98e67ed59e1d1-2d646bc8757mr669172a91.2.1724393499603; Thu, 22 Aug 2024
 23:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823050359.1737893-1-workingjubilee@gmail.com> <CALNs47tTwECK_pX=RbC3Rj3AVovO_a3_ap3ctCQj724FJVQ3Wg@mail.gmail.com>
In-Reply-To: <CALNs47tTwECK_pX=RbC3Rj3AVovO_a3_ap3ctCQj724FJVQ3Wg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Aug 2024 08:11:26 +0200
Message-ID: <CANiq72=jR0d0jC6Pzz8CS0gmgfcKp-=nBebGWtbAO_rYvWegUg@mail.gmail.com>
Subject: Re: [PATCH] rust: Eschew `Box<MaybeUninit<T>>::write`
To: Trevor Gross <tmgross@umich.edu>
Cc: Jubilee Young <workingjubilee@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 7:44=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> Additional context of the CI job is at [1]. It's probably worthwhile
> to add a mechanism for patching the kernel in the rust-lang RFL CI
> job, so we can do things like this without needing to pick between
> blocking rustc and disabling the CI job. (I thought this may have
> existed already but I am not seeing it).

What we discussed was to simply give them a different hash/tag/branch
when this would happen.

I don't think a patching system is needed on their side, since they
don't have a requirement to keep the source fixed.

So I will just give them a new target which can be put in the PR to
re-try. There should be no need to disable the CI nor block rustc for
simple cases like this.

Thanks for reacting quickly in the PR, Trevor!

Cheers,
Miguel

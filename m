Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECD31F76BB
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729012761; cv=none; b=shLeJYKaO05xdZwmlLOAMLGL8VUZtKLuSx63ZV/ravzhOUXjQXMt1LADTJz+3dr/l2CTgkihjchajcXA0tLwEakGHjTD3aXjjb/RujIrF4ZTdefRzN0Uvfb+ePgb/HKzJ+s4uLbZ6CgmhTbBm4wf+78oKM1HmeHMdXMczAUZuOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729012761; c=relaxed/simple;
	bh=O4uKXUDjN+z2W9PEujWbY8qqByQDFOkH3r++MBAHigU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0EmpW+Ht+fpR3tLYKXz9URnQTrwwzr/QaIKFUvC70mJC4nOKeBw9juL5C2UBbNr7jrucfq51Ij2iJhcU3qZ/btMZRfJDsL4R36bAweZliovQuB4UAXiFfuSzPmkWLWpEvFiJXCeKEx52ukAT9X7NWFgXbKvThD+chGVAGZpNL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PMMrAVjV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PMMrAVjV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d3ecad390so34906f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729012758; x=1729617558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4uKXUDjN+z2W9PEujWbY8qqByQDFOkH3r++MBAHigU=;
        b=PMMrAVjV6oImg9Crry3IvEOJ7Xb0UjV9aDnqUrm21qzz7qvYGKsuAk+F/lAH5urEG9
         /3+zl4QbUh5pQjKS/pecJrkqQyeVi9ecrR9NTK8H/hiAFmOIwZQ65ZhfI+r20KqsG9di
         iUvYnULkjRKvnNo77MdyQsM8OOerpaD8ACJDi6Gov7FOF417gtShJvUwt1HNc8OjJ9Hz
         NoKCiVKhsuE61k7RzPNVQXzeOmVROdxdNs7wEHXoR8r/4jiLZvUrbrrxOBZYqnurTiXe
         ej2tBtqy9lP6K6ku2RS1sLGensS5jeGIt55P9UJEo/ivHpxXa6dK3JiHbyYYbpJ1KCtU
         zkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729012758; x=1729617558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4uKXUDjN+z2W9PEujWbY8qqByQDFOkH3r++MBAHigU=;
        b=GlcxhAVB5QZnwRiNpmJBxMRdgPkFYG+Yt8sMX9vhzzJN+sTCVackX4lkZYPof4RdHX
         eMmiKJiFpQNRHcH/PBurN7pT45cvb48tbdcegwhPSj5fKfC6Vge3lO+T5DdcqYXlOWCQ
         YI7tSMtuJsLat3PtSEUJzqpMtr1bgy78OJ+jEMKj7R3L8kaKSJgG2P5vVLZ0KTb6OJEn
         awsYmXAR0prLLrm7SoGc+9nXHNMkOMJkJaHxYOMEuheH4OtAQS6EQOHb8FaWcb59TeKN
         +iekMGYF332WPtmXUtFckHCvGmg9JgKVdIrkL+zw8o6eUvANtkStkNsE9o7CZoz6P/Lo
         GFpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFvEPRDAVHeX9EJ6yhx2K44BaRL7jpDVSB+4E/tcv3uiJxNQNtLw+OEswkowB85Gv32XDQtLr+9FKuNYYhWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Hn10O692MGjg0BBSrm7tVK69Hi/+qCtfomQcBtYYPaE7jU0N
	Lj83vfvBTUZKeZLn3ctpI3cniwkqoiPJtMJUw+okOUn2V09ioaiW5qojHTKM008L2/0+96rTshR
	5dieRvxV/GvJ+fJuwV0N4Q3hb6dmVkgNe5JVq
X-Google-Smtp-Source: AGHT+IFig9d4dT3memJwkNn7Iymd1aBOpKbqdU4BcA844xOhFXKOWBjaSdlMzFLKjew30l0syH1KLFiJSVMcwKEiyDc=
X-Received: by 2002:a05:6000:12c5:b0:37d:4706:f721 with SMTP id
 ffacd0b85a97d-37d552d2c64mr15099258f8f.27.1729012758376; Tue, 15 Oct 2024
 10:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-task-safety-cmnts-v1-1-46ee92c82768@google.com> <20241015-ohnehin-lorbeerblatt-f6629b558f4f@brauner>
In-Reply-To: <20241015-ohnehin-lorbeerblatt-f6629b558f4f@brauner>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Oct 2024 19:19:06 +0200
Message-ID: <CAH5fLgiwNR4tmzMMX9-+EYqDBUZQVLPEGhEjiEL5Db=mm51LGA@mail.gmail.com>
Subject: Re: [PATCH] rust: task: adjust safety comments in Task methods
To: Christian Brauner <brauner@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-fsdevel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 4:06=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Tue, Oct 15, 2024 at 02:02:12PM +0000, Alice Ryhl wrote:
> > The `Task` struct has several safety comments that aren't so great. For
> > example, the reason that it's okay to read the `pid` is that the field
> > is immutable, so there is no data race, which is not what the safety
> > comment says.
> >
> > Thus, improve the safety comments. Also add an `as_ptr` helper. This
> > makes it easier to read the various accessors on Task, as `self.0` may
> > be confusing syntax for new Rust users.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > This is based on top of vfs.rust.file as the file series adds some new
> > task methods. Christian, can you take this through that tree?
>
> Absolutely.

Thanks!

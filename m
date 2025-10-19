Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF192219A81
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 21:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909237; cv=none; b=rmARX1u5eHV9tnx7DZiKi6COAYzHQnhPp6LVe1x23p5yZGt3K7lkohm47Dj7jq+pysK22BrZDPLXhFS6Bb1iyZzG0M0wDeluzTAXg4l96d+yy2fCKxdlZKPsG8cY3KJ5iJvCt4oT+mcYB1VvOK0Jx/amN5FqBVTcOF/ZI6akR8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909237; c=relaxed/simple;
	bh=7QXi4ECa31zhkm3BeJtv7O0uJSmHaXRwVyarc11pYYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9BL08mVr/q8l2xx9QGt4Xd+fCpf9i/cAkISyuE0b6Ly1CjonHa/vGWrEqa1coL40mGvPXgDzpQBvfZX41XiCq96UGoMw1Swl10/SpD/3dhpTfW48xk6S5B9rMcV0dP2QhNqd4T2iWs4kWQgJE2BgU/VYWpWBgzwLJRRTrrHMQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MakeTJ5q; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MakeTJ5q"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-339a0b9ed6cso816856a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909235; x=1761514035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QXi4ECa31zhkm3BeJtv7O0uJSmHaXRwVyarc11pYYg=;
        b=MakeTJ5qrrPKcgCYb4kljtxVYayNEHC9ohDVC6sRKzIR590wtT8j27F7wvBDpr0uGe
         +7kGYnIhUlLJH85sA8MFDbuywJMLHbMW4I6Jhbhr9s0OlhdAGfXc2o/f2+8tIpBot8GY
         LUrGhSgXfy+IWTsnfDSspFp6MtIDfmcJjRXu/AcSriGxl22rDXBOaJv8q2WpjRYSky1j
         /umsUztBvYfqts7hgDh3OgnDmGbFZDz4kSbGHAplpXU5tMPfeDtkHF4dgQwdsuCfTzd7
         WxblaTLzUPszcWkiWdzu4D6+Nr42lUAsdAqGbiZ9iiwsScElTqLc0J1fMJqXsgucOAeg
         iqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909235; x=1761514035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QXi4ECa31zhkm3BeJtv7O0uJSmHaXRwVyarc11pYYg=;
        b=S+myuHYthhKqZhh2fk0EwOgLgk6C4m0VBXAGu/3l1CL8YHYO24IqrzhTGyEmYDI5NJ
         F6BdneFjBRVH9S/VqdGsnz8Y7L6axisqkxY3vNniezsrLj1MHfsM8E2tu0dWnL19P31W
         Q9JQ+o+BpurOUpI/1jkIqrGM2Kj5i4AFZKORfo3QKRoFMxtl7KDlQlCl+5hT2lyNdHlg
         jCDeOuwvBhT062nVCAbZeDtSJINLvJCXtGuTWFrj3CIia7dFfDjPp1b4smfWebxCQDGZ
         dOHwKVseNrFhvG4Vxf+OZrVVRvqFZySys2ECZpQ0Yd+qqk/Ibr0ypJciVPKopCw/rYMG
         IA2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMFAwcJBl/G5rluIkQsDnw4P8nQOGMPS/g1eg+09a8wZOby0xFZhoaoL+t+l7N8jQds+VDbrzuRw0XyVcsaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYl9Xe9TLuFgJ4fpyi5bKQsRugYgkk/DiAFXK9IqVT8sHUUCF5
	Brw/34Q0Dp6I0PMOhaXXustyF7GJFa+UjSknaz+i/7E6RqLy2/x8jhCQk7LKu1lFYrj9vyupkMs
	lMBfuUuaGp0U95tRolNj7IIO+blG0o2Y=
X-Gm-Gg: ASbGncvhtdPzVYFe+Dtt4XFYGcEKaN8XchepH5ifJQvAtzNYb128Tr+SVtsBPxmp9rr
	ZXnQwJvnUboUwVT7GhV0vX1bGlEW6Qc8HqKna7H7qx1Y17vJp3aVRw9Zd73q2hVT7j9cAC9ULT3
	PbZpl3EwlRF0XWwwjFLgjfgPLuyuIwMOs/TMkUuvhqhg3xMeL60179m4dalDhVoBRPsfyqyBwI4
	PApAuAzcZsi+1gsUN79U0QfMgNl2W7JAzPWnyDFiu7dU9U2y5azn6sDmnHbU7l5Dxqr4OxPxkaF
	zXOOGFi7Dy7zvA8O6vJptRofzqEc2xQ93PHzh8Uq57SpEc4EMx7bqL2Ezb418AA1aEAL+EoBBIZ
	WksApoVCLu25A/Q==
X-Google-Smtp-Source: AGHT+IF1VFFJwy8ygSX6eoBXAmkQpi5ZSm3xG9mAwnAEV9eBFnYF+NCv7z0G4tbtRrIxdCU8CTeu9qRXC9i913/SiXw=
X-Received: by 2002:a17:903:2f87:b0:290:af0d:9381 with SMTP id
 d9443c01a7336-290cba4effcmr71823605ad.7.1760909234948; Sun, 19 Oct 2025
 14:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-10-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-10-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:27:02 +0200
X-Gm-Features: AS18NWD3K-E_pn_Z0H-XvvQwoMFJQoy6QnxlKg55_WYP1vw1bB7QYmn04Fruiws
Message-ID: <CANiq72nTRAW17RRKHjdfmy-HQk+31vEHyksOs8XGZZKBY=54EQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 10/16] rust: opp: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 9:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=3D&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=3D&[u8]>`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Viresh, Nishanth, Stephen: I will apply this since it would be nice to
try to get the flag day patch in this series finally done -- please
shout if you have a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel

Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7811465B4
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 18:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762281350; cv=none; b=lBlm12uDAAfzMgkUm8QAr752keBbrg4GCqV7jniYMNAhivuwqREsapAyyZI/kEmbtYtNmf6vTVMCIk7c5YIbzdhk3nMkKbJWmPxm7NTcnGJeibn+1lZETUzBh6/By8EPrODM7b2wpGuDnLaj4Gkkt2F4vWfGbzTkgAckqBtn528=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762281350; c=relaxed/simple;
	bh=pDB/Q9lx5j80vNN8jyV2lRu5iagSZIvfFZ7cYndtLs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6k8chJ8b0S0ubn4oWNgV6L8HgmrWRJX3Q4A4uYtAMqeIMb5ATMcWducuIXiHFo1tua6gK9SZo8etX+phFTwWXO/U3NtifNWJZNXvkPurUI7LkyLGZgmvKP2TH9DlDWzhilgNvt4rhoj+/BzSs1SCjedPkU5dKqs3e5xvrbUc8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9gR/pui; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9gR/pui"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b6a42754723so433469a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762281348; x=1762886148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDB/Q9lx5j80vNN8jyV2lRu5iagSZIvfFZ7cYndtLs4=;
        b=K9gR/pui9JmK5ZhIOvbsddgLPEXFpDeaTu2Dw2DdiRKcFJYMOHjGd5+kcMnO+NnQJh
         0VXDKeyDxNfVN2gAv+kyPZKe43zAWn5i54xeK1Hv7FhYDuydAc/m0/aFz059VoeJ67Ss
         GwIy7lgnmT/da01W7F/V9KS0pq6ATslD3+W/PTbgsv2ih+h2/W1iqU2y56rNGjQCbqzZ
         /DnZbjP7m8l83NpmpkyGcDES595N68EYQcIT0C7C2uJZOdqc/ASn/C2TvoECqmAZEGSD
         rwZiI0X1oBA9ECXthzj63v3MtbU2J4WyqoGIhe5/4PWkX84oT/g5it0SAuPE3UJntzH/
         RFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762281348; x=1762886148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDB/Q9lx5j80vNN8jyV2lRu5iagSZIvfFZ7cYndtLs4=;
        b=g1I5KnpH4wSs+KnWoqn5qH5uLfsd2K4APZt6pViQ6y+bavdunQs9uTi7AVSqHuNPWy
         b1dUiuOa38VIULPmQrd+LPJsIZU7RsYbCymSZQcIesvWU2sznh3lX0Ln8O+ZOMODvqcT
         e+JH3Ue5WZMdsxOdOz6P5K3+yk9duflgotFj1jmk7zrDqjeu+8/VRRoxxKGiJng8895w
         KzZUgwTWqxEXJ+GS3bf2xMAcfp/QkRrRr+CIv2HqO0yY9nus732OCG9F8DJeF+Q7JAAK
         LxqVUyVsObA3V97kiyFBQNRKqes7E9wqJFEglLWjJ5pUWOFM0zIfJnZbd6lDdFNK/dSi
         WMyg==
X-Forwarded-Encrypted: i=1; AJvYcCWrLHVCjN4+IZRvNkji6sC5akcHHz/BKjmz11GC/9yrqXe00ux445h5aRjVnA9V5oSSTMCVIEDRhaUoInZgOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvc4elNoEYAP63sZdCou8oWXIUEVz+EcGCON6PrlsExwf6pfrK
	nDveQfUrT84xnluf5ejjIW+Yj+Y7uszpmeanPJME5nzQiU5jJ109KU+ygdXmMkmSWMSE3ZGu8lk
	00j0Xu3TZo/bDTMX6oWnT92Uc9yCS0ltUQTyX
X-Gm-Gg: ASbGncsL7qzHWaZGisU4fZAdJS94xcsc3QkbYTmsiQ+uzeciJrJlaye1seIVpubi2G6
	V0rLtKY5Nc9vXCJoyDaoXgrhcefbdO7GWhG3GMY9oYZkt/yQqUuvoxDCefMETu/0N6in+xjK6xq
	wuhUyjlFZSzieTHDmH98GbAnJDE8UT8Xbeb76uAWmILJ1X0Kz3p+2nD6NJO3ob3U8qLLH473xhn
	76iC0VFMnIslimRb76F/94Jd9VFWigZtg9yUUCKhiwn0sRamPQKl97l9z8ncRqw4yb4J6q/FoZA
	z0YZv9z3r3XHYicGhP8mo9u8GMUgRnQhpUi+e2GdLbr2NXoVpYJSEUW/mC5UlP7fHv1oPt/8mgX
	RJzY=
X-Google-Smtp-Source: AGHT+IGILpSUE4gVnXtKxcfD5gs3NAicKe3yGxxboyBy/726/XJYsRyq6U0De47lxh6jH86MUyGGWjvhPdulmM5+3So=
X-Received: by 2002:a05:6a20:6a0d:b0:244:aefe:71ef with SMTP id
 adf61e73a8af0-34f8620acbbmr152946637.6.1762281348226; Tue, 04 Nov 2025
 10:35:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com> <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
 <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com> <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
In-Reply-To: <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 19:35:35 +0100
X-Gm-Features: AWmQ_bn9ka2mYlunhef8Qs1JQYv0mviCoj_SNM7trLL_sBiialuKhkFBTWi90tg
Message-ID: <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Guillaume Gomez <guillaume1.gomez@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>, nouveau@lists.freedesktop.org, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 3:35=E2=80=AFPM Guillaume Gomez
<guillaume1.gomez@gmail.com> wrote:
>
> You can use `cfg(doc)` and `cfg(doctest)` to only include parts of the
> docs when running doctests (if that's what this is about).

Thanks for the quick reply!

I think this is more about having some code essentially "prefixed" to
certain doctests without having to repeat it in every one. Or, more
generally, to provide custom "environments" for certain doctests,
including perhaps a custom prelude and things like that.

So one way would be writing a `mod` (perhaps with a `path` attribute)
or an `include` to manually do that. Or perhaps having an auxiliary
crate or similar that contains those mods/files (that probably only
gets built when the KUnit doctests are enabled).

Orthogonally, the script that generates the doctests could perhaps
help to automate some of that. For instance, we could have a way to
specify an "environment" for a given Rust file or Rust `mod` or
similar, and then every doctests would have the code prefixed to them.
But I prefer to wait until we have real users of this and the new JSON
generation.

Using `cfg(doctest)` in some code in the `kernel` crate wouldn't work,
unless I am missing something, because we wouldn't want to have a
"parallel `kernel` crate" in the same build that only the doctests
would use.

Cheers,
Miguel

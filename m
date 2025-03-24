Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF83219F42D
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742843185; cv=none; b=H4Qs7dcN8W7vLJTtOejnfWzBhWuQK8c751UWTW7r4bAif4Zg1RROJiYwmP/fhagWBAf8op5wkM46zJ/hs6lnoMXvMupc4BgDFb3TZ25hte7x2FxnM+3v87amIdG6yXDiOFr0NCfR52rvccRFN2ENCbqW1JK26TH9o2STg1Zjhc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742843185; c=relaxed/simple;
	bh=IHq0oJ/Oam9E8nQLl3AZ13DzYe+o/7BpLpycRFCBrks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcfwNbfu44SnDPYDdKGxWPgzCRQE9p0qnuMPqAmYahOFG+b+RTSffcgDw9Or163aXvSTePbdT0PpBB2b2GYT/ANg8T+j7usq9xKWp6ymeaHouxlueaOlYujeFVIw52gPnut6u3ps7+2LRbwyxLC9dLq4/grQDo7hlXilsHcw/Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPCxhdZ+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPCxhdZ+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227c7e4d5feso3417405ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 12:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742843183; x=1743447983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHq0oJ/Oam9E8nQLl3AZ13DzYe+o/7BpLpycRFCBrks=;
        b=VPCxhdZ+CX16/HudIEAMZw9OEu19wAH798a0kus3YPtnr4H2rGp6bmRKMCFIsPHNa2
         N+5jXo+s0kSLG/a8ETdsA4qBzpys3w4+AAs8HPbK6HYE7yKWFdYPOGuaXlbeH+LNkMab
         lkNaAy2YVycBOnDseTsWkfb3QYUbFpd3Ub+Xwl7cd8r+5rlZzusK3cZUS6VrrDIzS68w
         pW18HXKHqvQEHS1FNv0y86oWD+BUS7RsnV+0kuMPIRCLUDvxwl9q2kmg5zT6J8/p4Rxc
         qdPUGH+yA+Be26cX7Jhja42ZleB8xtbQEB3PFc0Omc93COj+5txlkq4XI/loSC7lOxNs
         P5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742843183; x=1743447983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHq0oJ/Oam9E8nQLl3AZ13DzYe+o/7BpLpycRFCBrks=;
        b=rjuMeL2IwC5kEi3TyfoebLZn2Uw/8YzF1AyPLW7nqwXi47DkY29OhjroZAUYTeNsPd
         Pa1iM9vktZBHbicWHO8UrdZOpd/gTvRcBL+sYK9psQmtaQHhvTk1I9PLspWUx3qfKoN7
         k0Sv+sVP0EtSy9iUIIq/B3Tat3IY6y4Q5i9RtmftMpebRCejAf/4eG6uU5GCTFYtMp3k
         lrOE3oCfOjC7JgiwTNP/lhW+Q7n9xjK/KD16NVkVygtMGsauU+Y49zSTN4UfrKh9DO6X
         pEdIvf7rklnrKZdx8+zlh00HgfKfu2U6efVx2hvsvNvQj8e6IhJ3CKQBAlr/kMFfdZD+
         EZHA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0UPkDHbfsdznGFhZB6+8YPJNg/Sl4M2nlSpKnxMM93r36jDiBuiEX8Sugy6VlPf9Z2FW3ZBLPIl0Qf/WUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7m002mbJmgvOASQEHbk9wd/albetEMopq2GMXHjz9Cb/0emJg
	5FdvHNqAoJniVy60aBnjelLErIyXc7LyiS0LOYDkpb/OkNdqkW49y/nvD/ZMsDMG2DZ3ZqCE5si
	0W5/1TeiSwAbsmHRuN8sjnCknqWY=
X-Gm-Gg: ASbGncvi6wWl55cLGvWHQ4+GwZKYyzjX0gJ2pgZlXMa5FGCYvSOAMdkTG755pSaMCVk
	IG/mfVsziG6cG+ciTXEFZOWINhZgqz6uYDzGrlz/xXkrvWkOEd6x3f1nMPLNT6GbE/fDppi4aYN
	4G9+KbjkW7AAfGbqNTX0qLn0glQQ==
X-Google-Smtp-Source: AGHT+IHb6AjHWI0yDAzrbq66A2hV0xgBjw17y0lcrEL8xh69/hTajpRXaXieYBJKjD3mpZzLFLIfbR0mPyj2tHmezT8=
X-Received: by 2002:a17:902:ef0b:b0:220:cddb:5918 with SMTP id
 d9443c01a7336-227e28a83c0mr957455ad.9.1742843182573; Mon, 24 Mar 2025
 12:06:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324184403.868691-2-altan@ozlu.eu>
In-Reply-To: <20250324184403.868691-2-altan@ozlu.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 20:06:09 +0100
X-Gm-Features: AQ5f1JpjjD4J3bC3nzfeW3KZp9Mm6FhpVwmbLWpFe_XYwYle76Cx5h-rJ147fQw
Message-ID: <CANiq72mTL=vStohG+H2Xzu5i6O=XVjj7k1tKi7wWf09PCShe0Q@mail.gmail.com>
Subject: Re: [PATCH] rust: static_assert: add optional message
To: Altan Ozlu <altan@ozlu.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 7:45=E2=80=AFPM Altan Ozlu <altan@ozlu.eu> wrote:
>
> Add optional panic message for `static_assert!` macro.
>
> It doesn't support argument formatting, due to `const_format_args`
> being experimental. It will fail to compile if a message with argument
> is given.

I wondered if we should use `*` instead of `+` nevertheless, so that
it eventually "automatically works", but I guess the advantages of
using `+` are that we will not forget to update the docs eventually
(since the restriction is mentioned), and also using `+` means people
do not mistakenly use it in beta/nightly (since it seems it does not
require to enable the feature explicitly, from a quick test in
Compiler Explorer).

> +/// It has optional argument for custom panic messages.

"It supports an optional..."

> +/// Panic message doesn't support formatting.

"The panic..."

> -/// static_assert!(f(40) =3D=3D 42);
> +/// static_assert!(f(40) =3D=3D 42, "f(x) must add 2 to the given input.=
");

It could be nice to showcase both the case with and without the message.

Anyway, the patch looks fine :) No need to send another version for
those nits -- let's see what others think first.

Thanks!

Cheers,
Miguel

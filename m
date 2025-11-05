Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DCD3148C9
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 13:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762350043; cv=none; b=geQ//kl+rySew3zTtZgzgFftB/xipUWXbp9FhgIqQfzNlCWahTo8AV3oc2rUh+WJXTX9PcwDFOprYG1GCzaaGHhkIRcXDJuTm7Usv50jqjicv44LCFZhAT7lOBtMXhY205oW9nJeKqWCi3jN9PNEPGrIhwYrKZhkuPnvEcdOTUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762350043; c=relaxed/simple;
	bh=IfJpl7p8Eyo9EYu7HKE2ENdcDGvvdi1k9xcJF8YzUwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXrvM2F+/04OT3KOA8R/aaFPm2zDno+Obt91ONfLk18UjmX8RnE+65OOiIlrtkVPxJXz3k/gaA83SJXKeLuytKguL6cQBeICvbKLfVH2BXW0ccITm/hyiuhjEdNwYR+mg0eC4N5NOm2USwQ3hxtEEegZi8+vlCUB5N5K9cU/y0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xr1AKjrA; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xr1AKjrA"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7adc44440c6so142039b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 05:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762350042; x=1762954842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfJpl7p8Eyo9EYu7HKE2ENdcDGvvdi1k9xcJF8YzUwc=;
        b=Xr1AKjrAqoxget3o0WmPm8cxbimj1o1cPv3a4Lh614G6EsiYu+xhyLQxLZoWSjvY/6
         lqXTtwdTAkx1/lomv+JJlDt8F92EpqQ3BrOgghvdf9010CqhfsMlsIPUP0Ihvh6umMR5
         XGI3JGXOK8gaiM10Tjzzxs3E97Q2FvCc+WectkYIiBApb9ncgm7OUO24RFHhKLttcU5/
         TH/Noc1c7TMb1SVDtlVMNjuqkGINyuythgXoR+lDu2uDx4s7NJM/c29GFy8MFBiqxVEM
         SKF5d+9+V9I7fj1KThbo4oghFfnfc6H6ZmKslTRVesevfQErfYZ37jHgrTdAc4+P1MhP
         R1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762350042; x=1762954842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfJpl7p8Eyo9EYu7HKE2ENdcDGvvdi1k9xcJF8YzUwc=;
        b=guRJcBZ+xz7t3+fCZM0EFPAlramrp5bgr4vIrbqxKTqh9eaMRAd2gM/weuc+oG0plO
         4zNQiIeBp3ieYh5CE42YYlUaJrDhtyDmAtghCq2XVr96/FdNB5tP4rjfkWZvepVykVLo
         wGZVeJbKHlMMBNxDGewbPLo2ygKeX2zZykhE5JTMpalfUelDYd260L1H1TCNxEoVFAdF
         vH10OGvUEaZb0gPdHteLRtwiU6MctNNfO2jZswjYqUT1luNsCc3QE77LgDvaIHHpi8R0
         +RBphMorOEFgPakuoZTX9+FQeISYU6M7zR0JZ0Q50nw5pv+SzOrmFSMz89ltsixLSpwX
         jQig==
X-Forwarded-Encrypted: i=1; AJvYcCUnvhiUIf9hBNOy1akLsb0b/dCQnX4IDSLDuukVuQfXKxnynLpY9MEVFO3NKMllPC8s9kBZ9DMCcz16kkN15A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSVz1W6A0cmVsrvzgpe6RyZrQtmAIjgHmnUNvoy1hqXnkTkpuw
	B7w/TUpU2/iDSCnx7ntnweQXAJ+7IDbge6Q2nY0Qtm6xHr8w+lgpDJR6rODE8p66XMb/5VsRbSR
	iBxM29UEOkQkjWxamO25cMCpXSqE9GFf82i1U
X-Gm-Gg: ASbGncsS9sCjNVuxg/KqEjHxg+UNdx/Z2Gfu+l+K3txziLkd4tukp02sxoZef5Tdx0e
	AqXmsk+q3xUWPcgO+gtBH8aWvU3ZvN0tn2Nbbde156gEFuHIe2tPpd5qFKAj4pLK/zxNayzS7q6
	ZN80I/xBgOCoeEFGyGDES0icSc9LcxmB/dcmoV8OUn8wblqSJ3vhWqt2D2wkNuzp8pFsUpDaMYd
	WrfnHSeNiTggOGDtLBNXA7eKkA2P4K/hw/Jd5WS7pgqNjO3EUiIpF+x3cK4q5LUiYZooRP9CU9w
	9+bLidEs69txeKEi0LMH8o98a1torqOHmp4WTavsNus9NYVlGss+tMTVzrD7l/cO4b6RbSUKXIM
	KDzQ=
X-Google-Smtp-Source: AGHT+IF6J5XKQIh5lvr1phXMqKtXh65G/ocWfAYSngWfTSEeBXF/cRzivlt4tvYKH1TgBVYnuLE+h/PQqLxNVfW0pnk=
X-Received: by 2002:a05:6a20:7484:b0:34f:5e79:d1af with SMTP id
 adf61e73a8af0-34f86af92ebmr2206267637.5.1762350041793; Wed, 05 Nov 2025
 05:40:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <df3a68334760b2b254219a69426982bf858dee39.1762221537.git.chenmiao@openatom.club>
 <CANiq72=WZJ5=UACpFLWCVJ7mcXbc93X9MyYAZP8-0F==2b0adw@mail.gmail.com> <8d865a46-82c8-428d-a371-407889eefb62@openatom.club>
In-Reply-To: <8d865a46-82c8-428d-a371-407889eefb62@openatom.club>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Nov 2025 14:40:26 +0100
X-Gm-Features: AWmQ_bkkdd1TITNlXEXZk4E4kPCOhviuiBsqHVQwAGIH7Lk_3rk5UsX4g08ILZ4
Message-ID: <CANiq72=OE3JNpemanR-r1efbgKqQrZCiQ7hY2-=_bvxLyJZ-HQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: Support more jump_label api
To: Chen Miao <chenmiao@openatom.club>
Cc: ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"open list:RUST" <rust-for-linux@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 2:35=E2=80=AFPM Chen Miao <chenmiao@openatom.club> w=
rote:
>
> I can understand, but I'd like to make a brief explanation here. "Chen Mi=
ao"
> is my name, so the prefix of all my email addresses is "chenmiao." Theref=
ore,
> "Chen Miao" and "chenmiao" are equivalent.

That is fine, but what I was trying to say is that, in that case the
Signed-off-by should be "Chen Miao".

Please see https://docs.kernel.org/process/submitting-patches.html#sign-you=
r-work-the-developer-s-certificate-of-origin
-- thanks!

Cheers,
Miguel

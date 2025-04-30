Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5A51ADC98
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026826; cv=none; b=W8tJVzbQ8Thl571Rc/e0THBvFPSbUGqiTob1MQz3lAWIeacCMzXY0/fipYv1WS6Gn9cqqv5Fju7quzMJzCevTwsZd3ksJ/Rmn+BxARViRdo87HSQ/VQYSbnSOMXi/Kbt8slzUcjb/QCtlCE3lT7fV65fKu85EIM3ACK9Qq7AJFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026826; c=relaxed/simple;
	bh=8OoHx2rVJ81A7H8FIoNr//pSSmbFFvxpqUfLt3fQt6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8vBqVVKETCqy+XWtZI3/4NXd17kCFYEtiXDKIDAguNiqG/bJIqOiytRjDJ5Zw3e8gI5DwVWNN4gw87W286HqCiA7S/iMouOZt9v7bw5Ua9+mPABDYwPPoMlSazPnns/3Mgj3GWd+QpDB34JOgdE5NRUPV9vR9yFk88IAYjxN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bkNuh4Yg; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bkNuh4Yg"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f632bada3bso16081a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746026823; x=1746631623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee+IIuLitQ42YCFf3ekA1a9+Sa+jp2dWXVk3zuZ1xAY=;
        b=bkNuh4YgFYe9MaaxylFGl1cNNcNhVq2jbTxMjzAHL9SuxXy7/doM5htDPx17b8aH6O
         LQxako3mv6+Dh7xAZKOYbuW12p+zDT0UACl7uZfrJP9fNH4VhoWYwYT5uxuaR6rcOCcC
         r6bYNfL08dmZAc7R2mTMN90xol7u2S2MybRTEUX8Etb7NMyuS26IOmc5rRQQdx2zQGPu
         blP0yFkDRO+BMkVo29lp0/3ocHrYIRZCLm5EvBqaUIUUwQZ6Ku6U4NvSPqit12zjF9MR
         +EPUnFChe/1LwO5qz32D0EJWe7R8WlfvddTKaaX5TkbEzwPGTmY8Kvc6tznBxXzu2Q70
         dgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026823; x=1746631623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ee+IIuLitQ42YCFf3ekA1a9+Sa+jp2dWXVk3zuZ1xAY=;
        b=tjGkX1zWOtneYYb6BD5ufbWeonObZw04IGDUANJsFtOmAXSGeSnmSWqOEH1tcmfCp+
         l1sn3rKXu+QEMhga4mHi+d6eRYKNaTSqN5gW1yLZZW5YfRqs8vCruGqKZFxzh/znRuCu
         DZmaHIgaT2FnmTlFIBuaITFgXjFHFBmeuZtCQUB8ZXXXG7BLYwbolW3xQQa2Ih3VRZpd
         gX/CZkCNveAOzPHRMwTv7V4WOMSKqDEPcR2w6J5m2ZdbBqmVJYNVZoVn2Wwmfg6idcd0
         gtIZ/GyBlrj7am/RfJUAy8AXiZ1xNaebQKFet8dFpF5ZoOLMCx1ezpa2YHw/WJYlZ/qk
         srag==
X-Forwarded-Encrypted: i=1; AJvYcCU7QYz1bvs9E4cmlHDfTjDTJ2PEGS+EWjF6ZQ6NPoW93+JXhJZ//Cu1FLCn4Lbp56sq4CQQ6GJ1bHpmiDUloA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxGW0sExa9TX2cjTlt9wjhPlNXfuUc3u5ErgI93CQqojzbiULw
	lB1pWNaGD7kC7ElKHcjbpUgUhT8Ax0Qt1lhWQppnalikniGwwyXgxNtG2/db4Pp9XEaTjJoCAP5
	RG7f2owIbxXFUxpiKQ4b1E2IPumn/gc/01LZh
X-Gm-Gg: ASbGnctaNkaXfebD+o5fl2DoSbSwkHcI84xGmejVN5IMjVNHu2LyHPjcEjQeKJXTIkO
	vkYcG71Kq4j1W2cx8pzCxKBYM2HDZkTmE7dn1TDOupwqxEqERjFbnYvnpK6HPNhnFUS+qnAmGei
	URffjl6X3UCrmjSx4RwIZouVyA2+1xxxc9gZsPzXwPjuk6jHexjKg=
X-Google-Smtp-Source: AGHT+IF+YcYmBiDHEPgjd93TCGtkgaXSp9BJkhLjrIvFXdlM6R/end2BmwQo6oGMZ69RCy2AtqX6Q6qNSpPnbNB8gAE=
X-Received: by 2002:a05:6402:10c9:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5f8aac01ed0mr103284a12.7.1746026823207; Wed, 30 Apr 2025
 08:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com> <CANiq72kbHnPR8_y_Q3a8b7H=4wDorbBS5VxWD1NfD3yarEW-Vg@mail.gmail.com>
In-Reply-To: <CANiq72kbHnPR8_y_Q3a8b7H=4wDorbBS5VxWD1NfD3yarEW-Vg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:26:50 -0700
X-Gm-Features: ATxdqUFx0Z5V99iwF8PaTkZeIQ1qc6UvxlBQ5N_gbSRpqe65ZhLa74YGf52KIC0
Message-ID: <CAGSQo03FN-8qaLdfTNcQT_xO7MXz8+wDVxCSoF5VP53pn81J+Q@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: debugfs: Bind file creation for long-lived Display
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:27=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Matthew,
>
> Since I was playing around with this series, I noticed Clippy
> complained about a few things (please see `make ..... CLIPPY=3D1`):
>
> On Wed, Apr 30, 2025 at 1:16=E2=80=AFAM Matthew Maurer <mmaurer@google.co=
m> wrote:
> >
> > +                0444,
>
> This is decimal rather than octal.

Oops, will-fix.

>
> > +// # Safety
> > +// * seq must point to a live seq_file whose private data is a live po=
inter to a T which is not
> > +//   being mutated.
>
> This should be `///` (also, since I am here, please use Markdown etc.).

I thought I used markdown everywhere, I'll do an extra pass before I
upload the next version.

>
> There are a couple other classes of lints that Clippy mentions that
> should be cleaned up or allowed elsewhere.

It looks like when I transitioned over from running on a physical
board to running on an emulator I typo'd my clippy-check script, sorry
about that. I've got the errors confirmed coming out now, so I'll be
clean there next time.

>
> Thanks!
>
> Cheers,
> Miguel

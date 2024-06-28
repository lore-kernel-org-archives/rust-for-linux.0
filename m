Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3F51C689B
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Jun 2024 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586859; cv=none; b=Yewn4wjAw+yB7C4r8GafpRGV5HWrr6WOIWqmi5PWtceZ17gpp8uLFZouz6YbF0M1w72XJC4sHG/+LMjcCPt/7PirRlg6OEI1hgOS1chyD5LVpQceEk6U8CsD7fK4bnMtlgmedXSC842ndlSFroIm4vLJNUGaJBQDTZ4ZgqNlWqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586859; c=relaxed/simple;
	bh=NYBuvrFJB0rpq/965KIJmsqoQ1vlti70KKWXCJ9Q9eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9JyMSXvmCfUL7PYxFMem5Utcm8k8muEYpFnlMMPd8peD+Oou/l6+cSR9AL/jqBYN7wCcYUEV5oFpq2e4G+ga392mS1PFfsI0FL8DLQ5KJPLCGrg64zH3+uLR4jQM5cz+saxvCMdIMhMIqX+3L/FjVmREyXmP9qcGsBwkbNUqOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4i82SHr9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4i82SHr9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42566fb8302so5495105e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Jun 2024 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719586856; x=1720191656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaXk99eR0EYPN3u/ul7DqSTUXvM4e2LJKqc1JYNQsfM=;
        b=4i82SHr9q/nsbMhh47kcQixLwTX1k1/KIpVmu1tOtZk24Wb5P8KAFHS0LbAfNq8k8R
         9u2lsP1pdt4lXS2tUshngyhvjDzXbS1FCxkmxPFiO+01Etw1n++8hoepXd+0wdmvEbaX
         mF30eP4Jqw8Pa+MDsYZoAO6Rf1fa3DdWmJdyzLc8FF/bpxjIR7P0l3lFo8L/JAoYpAS9
         45eYLzZ8JWJSU64oLg8hAoHdrcHHcCLNyux+48271sxAIzrb8IE+7ZDSsRkPmkQ21Rd1
         Qe9qint7C9MpVdRUZmQeb3d92AWL1JpuwpSu3J4W7+CfYN3LSaobuYcrpwLDEZjJf/IO
         XYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586856; x=1720191656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaXk99eR0EYPN3u/ul7DqSTUXvM4e2LJKqc1JYNQsfM=;
        b=t3laGC9EnObmsd4vKDe7ZHzoULuwFy+js4xa9FrS4AOre6QBPo81y1nbtabQ0Ecwtg
         s6g8W0BTrLKJL8PgOvBqI22svIQ4yjvqStZcdkjAeMtjQCHtHacFB82P8yfj9xfpiaNM
         olttinRbq8J1EddHE9tlQqnijITG8FrSRTlCINdA81/FHpgmh/7LUwqLsOxeOdjkn2nH
         XyfYVdPq231CbRri5Zlgpz0MZtZe68F4VgdkKSMQvj5npQBZJSd9AT9GbZJrIHwQxyFt
         6FeDr1CksDe9iPD0/5YmqB3AL8Iakn7+jVY1XR5cdR6H5PHysCBfRC8Jfq4zf4VcLuWZ
         N9WA==
X-Forwarded-Encrypted: i=1; AJvYcCUaw7VvSxEd/rjo2p747OuRAltqJSrPnX96d7LICwnK4IqzEeP+FxPrvEcDoNaSAecPeU0z5Z2aHbws7Opb4gt3GoyZavG7qBKwdpWf6RI=
X-Gm-Message-State: AOJu0YyS2oDanf0Z/B3CpiXzUH22HLxCmK/4hsD8STlabg3sYd+WGZDq
	jb4S+GAflIKIX2mXk1mzVvsR+ziG+C1YtG3V58G+R7T0fTsc8Br3sIWu9ZC/bdgVoqWKlitt435
	T8OqHsFJL/XNNnG9tL+IXjZOiQJCtFK1ke59J
X-Google-Smtp-Source: AGHT+IESdcI6LaDytmK9AInHOqYMv9VljHnolsBwI5gOZUcR1j68rKkzN962JA8SfBozypmh2BajVH84GzpD2gHipck=
X-Received: by 2002:adf:a31e:0:b0:364:a088:6525 with SMTP id
 ffacd0b85a97d-366e79fea95mr9796415f8f.22.1719586856100; Fri, 28 Jun 2024
 08:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-tracepoint-v3-0-9e44eeea2b85@google.com>
 <20240621-tracepoint-v3-2-9e44eeea2b85@google.com> <CAH5fLghb6oVkgy3ckf=dUk9S4VdCeWin+yDBW1ffBoxu=HqBKw@mail.gmail.com>
 <ZnsIJ6ejNX_dAc8f@boqun-archlinux> <CAH5fLgiG5hdh1JJgjH94E=ZwJo6ERkuZUFDpkrrJ6ErQhTvCrg@mail.gmail.com>
 <20240626144313.3f1e8277@rorschach.local.home>
In-Reply-To: <20240626144313.3f1e8277@rorschach.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Jun 2024 17:00:43 +0200
Message-ID: <CAH5fLgiCT37jiow3NRqupY_a=-V+40QRoGpR8aiu-PmuwbgE9w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add tracepoint support
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 8:43=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Wed, 26 Jun 2024 10:48:23 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > >
> > > Because your hooks/rust_binder.h and events/rust_binder.h use the sam=
e
> > > TRACE_SYSTEM name? Could you try something like:
> > >
> > >         #define TRACE_SYSTEM rust_binder_hook
> > >
> > > in your hooks/rust_binder.h?
> >
> > I was able to get it to work by moving the includes into two different
> > .c files. I don't think changing TRACE_SYSTEM works because it must
> > match the filename.
>
> Try to use:
>
>  #define TRACE_SYSTEM_VAR rust_binder_hook_other_name
>
> in one. Then that is used as the variable for that file.

Thanks. I also made a change to restore the value of
DEFINE_RUST_DO_TRACE after define_trace.h

Alice

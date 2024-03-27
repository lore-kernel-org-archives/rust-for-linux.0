Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98B615382E
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 22:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711580253; cv=none; b=TuyD9Kq1cZtzobx8kGPb3J3TJJAqcBUs5JTiq3LHQ5QUwBkF7F4BAjiX9jIb2Kpyw2JT+uyFtZ53kqwxHvOn6HVXIRR+96bJ0QjaiQoBnsKubTNdC8uoOElHihK647yh3/ztN9OMuNSbvlOVjXswqdJg13ayWXC5nF1RixzAtFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711580253; c=relaxed/simple;
	bh=VO6BQZp9XbSQ+WsnBdem/mcXj4kD5L/TqZKDrqpZiSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZN6BDf7Qxu+Tqty99wTpKFs0k+qALXrAPYWRvYDVFev384zCmJjcn4jZwQ+7ULZniG4El2EXm42uO4waPbWulkIJuFOA8qvSv7vKp3lqtmQ9K9lTWji0wzolmQDRQY9GIdf2UzGKW4sDORPt5uCQCLqRXPeXxSt/KbHAqtw0EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dx4WhPaq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dx4WhPaq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33e285a33bdso189736f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 15:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711580250; x=1712185050; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ME3b1Rt51xAoj3MwQWhqtTxBw4ApU7TZHqRjbw2b7co=;
        b=dx4WhPaq/8KHox5vx6vtgraL0uFTOcJGXHVFY4mbdUjrnlw9wWqllPKi+Re7uMRutI
         86wGDNcd8PI+bMVRRJIFzTGtKHxzKzi4YpsFEtqHBwKAZXQ2+lNdTzxK6svMqd5s/QjE
         1+Yr1pQ3Ban4xJENJj1OgwBxjgGPizPSfSR3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711580250; x=1712185050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ME3b1Rt51xAoj3MwQWhqtTxBw4ApU7TZHqRjbw2b7co=;
        b=FzL8vlkNhp1KJd4XxFS5My2hog69t6rIdiUIdlBsF5TXX+R89VOKK4siazAl7Dd8Ja
         Vqh63F7xowEr6nmbS0xy5bnweejmAUcGbTnea6+hKui4Yk3OYLcz1BopXH9UrLWBnpzj
         AB+0HjcRrC2bPffnVoNbKnOUcjYzGrElJJ10ZjlrJh6doTODPCLAdSKiqGkOaUAOjgPj
         q9XtaitBprOiz7O0iSYI4DzxhzshpRkULvjDKgIPqidmLTljFTYlJJJHZZVYCys9l4ZI
         qBRq4y+9rkyXMmAyjQXgONiubwFVaGPLLvH6Sdyg6g9DIc67Fd+v93ZE4apRiUMWkOdo
         j6sg==
X-Forwarded-Encrypted: i=1; AJvYcCX5gBHXuyil5SY3CY56zIEW0OWcc+ja+PEGRqojpQ7pbGkuN2Bs7BBB+CvcypBZ2VxE0oFpV85Ok0JpNWS6lKOLuTcdEocyRRZKQ4YAikM=
X-Gm-Message-State: AOJu0Yw++GsQNNM9jax0Iii1QMcU3GjGqytZ0Kwm8KmWo16vq+AQdN78
	UZtHHyrcb9wAoDGIDN3moQweDYLaxWpRyXUUCaYSWIedGvHZPFyEvCEUDLyiJ4UgGaT7PmyhCf5
	xkwhMMQ==
X-Google-Smtp-Source: AGHT+IEcl2buNJZNf3XpiIiedDbtE7Kdo0aXOQlm3JHtua0t0NnZQYNZj36qCJmaDtDxi823TkuFKw==
X-Received: by 2002:adf:cc03:0:b0:33e:9451:c299 with SMTP id x3-20020adfcc03000000b0033e9451c299mr449316wrh.26.1711580249966;
        Wed, 27 Mar 2024 15:57:29 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id l13-20020a056402028d00b0056bfa6ad5eesm105376edv.91.2024.03.27.15.57.29
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 15:57:29 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5684db9147dso343323a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 15:57:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnfN/GY+a8Hmkuqx5GVvAKaHLgMUwJsejmnxChQCbRfEuL8zyBqb4fkHs6UJfQJk6BQWl+pjD+QNTMGUQIwAph7Y5iBR+QV86ryGlyWew=
X-Received: by 2002:a17:906:1352:b0:a47:3887:db68 with SMTP id
 x18-20020a170906135200b00a473887db68mr468280ejb.38.1711580249028; Wed, 27 Mar
 2024 15:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
 <bu3seu56hfozsvgpdqjarbdkqo3lsjfc4lhluk5oj456xmrjc7@lfbbjxuf4rpv>
 <CAHk-=wgLGWBXvNODAkzkVHEj7zrrnTq_hzMft62nKNkaL89ZGQ@mail.gmail.com>
 <ZgIRXL5YM2AwBD0Y@gallifrey> <CAHk-=wjwxKD9CxYsf5x+K5fJbJa_JYZh1eKB4PT5cZJq1+foGw@mail.gmail.com>
 <160DB953-1588-418E-A490-381009CD8DE0@gmail.com> <qyjrex54hbhvhw4gmn7b6l2hr45o56bwt6fazfalykwcp5zzkx@vwt7k3d6kdwt>
 <CAHk-=wgQy+FRKjO_BvZgZN56w6-+jDO8p-Mt=X=zM70CG=CVBQ@mail.gmail.com>
 <bjorlxatlpzjlh6dfulham3u4mqsfqt7ir5wtayacaoefr2r7x@lmfcqzcobl3f>
 <CAHk-=wiSiNtf4Z=Bvfs=sGJn6SYCZ=F7hvWwsQiOX4=V0Bgp_Q@mail.gmail.com> <psy7q3fbnjeyk7fu6wyfecpvgsaxel5vcc6cudftxgyvj4zuhf@3xhjikjjy5pn>
In-Reply-To: <psy7q3fbnjeyk7fu6wyfecpvgsaxel5vcc6cudftxgyvj4zuhf@3xhjikjjy5pn>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Mar 2024 15:57:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgjpos9wLwxgoUwp10C70DuOSGbC3uZiPp8ufEvM-bNtQ@mail.gmail.com>
Message-ID: <CAHk-=wgjpos9wLwxgoUwp10C70DuOSGbC3uZiPp8ufEvM-bNtQ@mail.gmail.com>
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: comex <comexk@gmail.com>, "Dr. David Alan Gilbert" <dave@treblig.org>, 
	Philipp Stanner <pstanner@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marco Elver <elver@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Mar 2024 at 14:41, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
>
> On the hardware end, the Mill guys were pointing out years ago that
> register renaming is a big power bottleneck in modern processors;

LOL.

The Mill guys took the arguments from the Itanium people, and turned
the crazy up to 11, with "the belt" and seemingly trying to do a
dataflow machine but not worrying over-much about memory accesses etc.

The whole "we'll deal with it in the compiler" is crazy talk.

In other words, I'll believe it when I see it. And I doubt we'll ever see it.

               Linus

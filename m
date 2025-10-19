Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602EF21C9E5
	for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909170; cv=none; b=KFQTYnuMLwhopacdcnJpbQa89mVFrHi7l0pa74rHFMYWmBlPegXHDdqt14lW05uf9ZFnoo3MwlEiRWSfGfRXRSPmjsq8RL+UB81BiV8jyOeFYn3RmJtBK7WrgQFMQVhsHXIF1JxNg+fjkBzwrUXJpO6l5mVREuVqGxqUaVFLs0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909170; c=relaxed/simple;
	bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8a/2Gq/KTf+2fo87Sk2nh34W/wSTGEZYXFNjkeg6Y28JaFwo+Nmo1rPA4sJZIRPtPcvHsuWe7cMZuvTTjfRFO2hJ8j+U/8h+F9WG0EryHUEgMGDd+ipDkOAWYviuWKp3xCTV+sqQ2DK52gC17Acqx5Xupd1NiVq3jz32ii4mM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDq7Fqvo; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDq7Fqvo"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33badfbd87aso899982a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 19 Oct 2025 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760909168; x=1761513968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
        b=PDq7Fqvoti6jPtW18JV8zNYCD4MF+/+5YXqFhSF40rJQ2ZFet8SRtKsBsR97WCothn
         qASGpWu/s+Pi6zMEJX0BTA4qKHPIeIb9rrBMjXogOlE6D6FwEub6lA33lq6V50E40sS+
         sC+6jjHrEVnxy2466yLZHos/VGNYN4QtGHXPPJvUjY93p5TydGBDeDzWMG+Xrsj2F1u+
         Nf7+jAOmXHe5o8D70M9FfWLfPQXkD6KmyR59HiYceSduOwnxZ3KKCwkfRgDsU+DQT6wo
         HC/pKRdC0Paci7gbI9oIUOxQPXfKmxajfD65UJyql4eobfugI+a+6j/sSpxPVJxrK4xO
         f4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760909168; x=1761513968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+LGfQKWIvVBT05pMeCKog85n15IAvxhMtSIzthF5hw=;
        b=ApKhwcfsjj82VO9vKj/GHLf4TNjpUcDibUeqkUz89YxlMVwnzgHqVS7X/fOIqzv71G
         OodfmfY/S/6TKTQp3se9Gu7TOjqlaXeHIpPzg55RZbJi/XLNhyLqeIorsjiQqbRWB3qt
         +GOLlyY1rQb//bCAWVf3a3ukQIztbOXpipC2DjlKlzW7kyUY1Ws9m/0e+YkpJugIP05g
         aFxdtpRKAtotw3fGcqyQ62wk9VBa6KIpjfhjbGc1eY91P9kRJeoMfb3AT7XfPXnczFj0
         as6kccHrxQCFt/X9m9/bhpc0suh8hHR1Pe8ppVYjq6vT4OCKwdDhYohWwZUbdLAiH1KS
         59ng==
X-Forwarded-Encrypted: i=1; AJvYcCXdBtYEVP9ngKmXIEWZB4OGIsGjlvmYiE0JOFhCe8KqHs3jODMwFBxRR86gW+vASMacHN1ifYCFWLm3adX4Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXoNrSFO07bghh1/PfYPQJaadq9Zkvx7JOe5pOjQQ3/KJ5iPKm
	2gQuV+dZaGGXQZQMpdMQxrJNyLZF/OQa4hG/i3YgJRDRplMEkyeJAkzVrJ5WByySCC8zQRJZLzq
	D4Vgn/yLXpVL3wCaby/EKMoXFK9DsN90=
X-Gm-Gg: ASbGncsbc982o/X6bNkJUo7wubA7/5a8/i1tsx7Qfr0Xxg+ZZ9kBYlizGiMBsIQ+61V
	YW0oV6dS9yTSR/enktgNBuJFfTWD7DToGKjXKRZrzjAseFctIHvZWoAMvS964Irqh4CxQy5ktX6
	nejVEBGnIInjyJrKIFPtE8rUIIbzC/qspysyvXtbMsbjefWBxax3JL4/JrBgTsLWv0i6TJhXWgd
	1HWkxzxgRXaJlNqY8BjaryT9vEwgDO6E2x62R2zlnUwhq7EiATIrcu4a/CaAqc2ZGTdT4a2EIXI
	J9hPdc7gNW+2Km21aiPptfW05ESWrmBOX9Mc8MjQBVueGgK5VD4xIEUbdPH7/tDfrUNMRUQQS1U
	xGiI=
X-Google-Smtp-Source: AGHT+IEwx4nwwBhH/hNxoUVwvTs3X2bARut2TDi7HRPmGCV4tokc0LBHgVVevC+PQZA8tTr6XyTnNa7XyeNocxVrSx4=
X-Received: by 2002:a17:903:b8b:b0:290:c5c5:57eb with SMTP id
 d9443c01a7336-290c9d2dd08mr73269955ad.3.1760909167598; Sun, 19 Oct 2025
 14:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com> <20251018-cstr-core-v18-11-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-11-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:55 +0200
X-Gm-Features: AS18NWDjBjMG5pR4bntjwqt3T7EHDFAllndAmj435I7b4c65f3XvqG9PcKa-Qb8
Message-ID: <CANiq72==SKsYkogrQhKTzCXwxeYfbL3V5jOiQKiunwzLta5=Pw@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 11/16] rust: opp: fix broken rustdoc link
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
> Correct the spelling of "CString" to make the link work.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

It is private, but it is good to have this done so that eventually we
can potentially enable a runtime toggle for private docs.

However, this is independent of the series, so I would suggest that
Viresh et al. apply it independently.

Fixes: ce32e2d47ce6 ("rust: opp: Add abstractions for the
configuration options")

Cheers,
Miguel

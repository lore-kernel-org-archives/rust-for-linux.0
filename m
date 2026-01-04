Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FBC28541A
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767527932; cv=none; b=GBlSbBeTbtl5QiXCiCP2JLcy0XU+xQ7XmwLdNsCIlpMEwANbN6foh/vP3anGKqbiYHAdhKWkdx7XA6sdv8M+a1zA7H5MJ8dVF1mgUM8MvcssjpkJuxV5sEa3YluhERQ3hc2E2qqSqh/VPE0JhWtBy1U2upOuLQ+ZYgYbcUPgvRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767527932; c=relaxed/simple;
	bh=qRNykfVLlKsMYF26I9Mk1nEAdlIgGVXyPPJUtI+YWHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OKmi4eY/BQk10wwL3EMl4KO2Fbbj10WXJ8BCx1DnDuY91PUBVglFalh7RBPGDmUrv4uJav/IZnJIs1dOpPG3zjUY701WWf+1UXuH3p+oeF+qmOX7Td9tATZEihsLLfBr92D4VyaKA1deP3yywAFfsuFNZovUBNTZN/6cXyfMo7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efSD5sZr; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efSD5sZr"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34ab4879aa5so1283020a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 03:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767527930; x=1768132730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRNykfVLlKsMYF26I9Mk1nEAdlIgGVXyPPJUtI+YWHY=;
        b=efSD5sZrUPJEK7Uo+52MeECrKJNb0SX3CWc1sGkgcS+WvNaRw95cEGt+wx2wuwqSyE
         sv93LxfWcc8K17GHvH0ox47mTnPzDaZ7o5cU/HNMN+bnCG0nMLl/1YvCem+EyV1HYh4w
         xio2Ylvq1VJ9h98jOoKygUW+xvdtupIXbT8q+DdhktrXh7fiofjn2/P1BzyM7FFn5OKA
         YFx/GsPN7Sgf6MnSykyn6hY0uZKlzm/3oyJ0lQGeih/ghcdgwalI9MqUNEXtvLFR3qJ9
         9cCMqpwaCcbyupgoI44rRkzv9mqCT2g3KcD7m7CDQXWExTUuFNt1mJgwRrR56p+5Sr6/
         sXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767527930; x=1768132730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRNykfVLlKsMYF26I9Mk1nEAdlIgGVXyPPJUtI+YWHY=;
        b=SXVQjkAznK5Gu3HP+lmD0VZjEraJYWAHKaexa5LclMy+9z7TyD724H4P3q42SZue8T
         LKrPCxOkImgVtTi21BgZFoA6vAvyHejAKqH6awozath/oXCouaQdXwxdqUrQ+sU3vMJ+
         Mj6jfC8QAxOCvV+AH5KTLEQEM4Ds7mB7+FgqTbH9j/CSdG28KK1TVsT7/twkmP0sJsnO
         B2153gAtLHjAo1LNSwFlJCuI8WQQjjmzZ4dOFHBgyDxV/x2qTHKLejdOJZPwFQePj3j3
         1jPXXzbUZu9SoO3Ry17Ze3pxnEnte/qUxcfjQ4VZPO7+mtvnFFUUTj6MArO9XML9yNq6
         zIqg==
X-Forwarded-Encrypted: i=1; AJvYcCUlXxjTcaOKzQhYgs1Gq/I3q2hfspRlWEq4J9RiLdPzg8uDsFQUhI2LqhgYZfHZBKp7Rchi211VOMynoMD0FA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK8cm3aERuU8ovSUkWwKagotGQV/p4cFDg6zXz9OqXaXByu9NP
	izVf3os87XgS835R1QMBdEyXhGLWhJKanJyPz8+I1gJEaodSrIBWsWeTj/SI5nCJ73cxmyZL0+X
	aHYVA2GZrxdDDxSoz8a636fQ90+9A308=
X-Gm-Gg: AY/fxX5szEx3g/P6ddEfga8epOU9rkkdrdu22qeNg7ZeoBzUT9puYAJV+PJ2kMTdmXj
	n8StVYQnFcLfeQPeJWnMYYjB94YtqDTOJAjAEUq4uoopeq1oO5tAY+8tBDJbtuVhWZRe8Enymha
	hbeiXqJJfKp7KbVayst8stkg5riuLvLRPWoJQ/Xb2XhHgQWPyBYhTU4IvQOgYr2u1My64ENkG2D
	GrgDdxH0q5OUKwFWs70Cvsjk4f3Qj6QrVnG+5uPlyx8RitV9oOdfnfCpdSmXJ0KhnceHK5/OZux
	od1CO9sNwaqo0LZqAtLX3SWMy2rC3sToHEvFrV6mbZf/GczoLfBbZ47aFuJxiuI4SDcSysnmqrG
	CPOTNQ6ZGYHz+
X-Google-Smtp-Source: AGHT+IHoSyXWaB+IZtLF7gvVAkKod9NVKsAnAMAwQKO/E7n2dzdTWagN4w07nM9wdAbIgbYmJEkc3dp689h+QnKsENs=
X-Received: by 2002:a05:7300:478d:b0:2ae:5e96:9d1b with SMTP id
 5a478bee46e88-2b05ec30b31mr23245876eec.5.1767527930478; Sun, 04 Jan 2026
 03:58:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260102202714.184223-1-shankari.ak0208@gmail.com>
 <20260102202714.184223-3-shankari.ak0208@gmail.com> <c7be9f2b-003b-4dca-8296-5cb7a06ded8c@gmail.com>
 <DFF8D5VJ7RMG.VRLZJ24NT2T3@kernel.org> <41d26500-d425-4359-91b4-b738725c0b8b@gmail.com>
In-Reply-To: <41d26500-d425-4359-91b4-b738725c0b8b@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 12:58:38 +0100
X-Gm-Features: AQt7F2pNIHRroxBTgEO8aLWyJP8g5R9iCgb4ayDLXi933TImSqHrHBW57LS8bjI
Message-ID: <CANiq72=YKO3fvX=CP1VeXoKfROtdJWF3rysNdz+k_nOWw1jv2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: i2c: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, wsa+renesas@sang-engineering.com, 
	Shankari Anand <shankari.ak0208@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 12:31=E2=80=AFAM Igor Korotin
<igor.korotin.linux@gmail.com> wrote:
>
> I see this change more as a Rust infrastructure change rather than
> something I2C-specific.
>
> If it is not a burden for you, I would appreciate it if you could take
> it through your tree.

This could even go through the Rust tree since it is a general
cleanup, but I imagine Danilo wanted to see what Wolfram thinks first,
since it is the "parent" subsystem.

I.e. in general, even for cleanup patches like this the subsystems
decide (e.g. others in this series went through their subsystems) and
generally pick the patches unless there is a practical reason not to.

Cheers,
Miguel

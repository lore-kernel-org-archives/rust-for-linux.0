Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D8735EDDF
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 12:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827217; cv=pass; b=iNUYO+I6XFqTVr/ejF2lBwf5So8U5rd8ETeHAwJYNwGUht8/nYx7RriuuonU4fY/n/FjUPFwZIYaHj8orbiZ0im6Vz4hiuBpcBg7Lo5JmvsHJ3qnXuKnHTCJi5IMyZwzDzRmVlqXcPQZz8fNP7nTHP6G9BaVU0/fzRT2/ff67KQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827217; c=relaxed/simple;
	bh=YZwcfNScRsx1/EsPon5hCX7NfuMYhsvwgxsgFvy0h1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfHTbAaRLsEE5amA7ZBMIw5BrMlOVji2EO6PjG10CGUa7gGF5MVb4jdUzovWBS1brYuKPj18J22p96rlOCKGmNGBxlcxUU5WEQTUu3dhbRultFAD0XcvnImPyCE5FkS7vUP3M2rC4zhtNMJovhp9Tu0fnZylr5UeVgnOq/ydOZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqPi62ZK; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqPi62ZK"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b6f04cae6so4408249e87.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 04:53:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768827214; cv=none;
        d=google.com; s=arc-20240605;
        b=FlIPpSV643Didj46DTeKqv/osLrz88On/qkYqVLqNN99jnG7+fwJinTAmZnn4lAca0
         ZQ1YEYB/RXsLAe/Q0VgNLa0vXj3OZ6hY+EoikUMXBbmbtrPHbNaVAJg6Kg9W8OdF0jSx
         gUDE4VlKQT1fXw25L6ClayiHNzCgRLGyeTLZCmUrZ7ORpWmrohv1dHmz2Om/4djbl5Q8
         MvIGtYNhGscZo87raSPwBUhlKIyaYk3yPABdc9klXLSlyeyeLpMhLyHe/lJt0pjVNJLu
         2H6ySeWi/U4yDUIrYDdujh3jZ1poJuG5733l486KgvXjUs3My3T/tXb9D1uv27MQ8zwE
         YYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=snwDSZWY2CM1IgkVFFgRZzAyAPdnSLxoi9J0awy7G58=;
        fh=1TyHJnWq75JG1iVryRqYN/CglHrrtbIyWzT3V5g4/Tg=;
        b=Oa55q0Yj/eQLbAiKJcbtLEdD5HltBSOu47fqz9lHOKPfVy9dY3ft5HE2A/e9E0uz6n
         R/4EiM5Z7YGpFlOoxPeLSKfYzUwnW729Z2iyOpkoveN1q4dnGL95oBtbcn0tpppVDzur
         r4r34hQBu5RrDFoh/LCcAcjs26aDGgH9oDQ92MmwoKq5EdMeWthfax2GoVcmD1yePGWk
         u+u53nL+FgxKaYiOX+azJgxIGAf2vTU8hDEGNQnvN+v0IStplieQrhzAsln8D7XDcITQ
         Vffynsv+TO2Lm0EUtlrpyECX2tLF4E3DoUdGVsUlC1JXMN366IIAkjoCPTaZ8ymE80gs
         9oxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768827214; x=1769432014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snwDSZWY2CM1IgkVFFgRZzAyAPdnSLxoi9J0awy7G58=;
        b=EqPi62ZKvsVugyHv7g3/t1rcjeKCMbPrjdualZnBdKvrG4nyPQri8lSKXC3cL/xITe
         Pbuny+JtQqKRnUMVBO/lUr8Iig6IMlMA1NqSnAECocPV87P8ucUhGDslVIAJIdE9VqTY
         MDTt/TyDNlxMAKoyx0stc1Cs6ItH0qhG2Z9aRe4DV3QlYidrnZruhoYb+Dhsoyjto4E2
         g1KfYHuoW+b1dEdRCB72HGIJ97Okg7IrjZT95oD79lV6IT4V+kjDU58YJZFEwyYlVpx+
         /PQZwENF7dP+9gMyoxJKIngeMg3fd3mLDvK2KJGN4O0aWkeh7O4y7pkcHZwOg+T/2iXz
         GYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768827214; x=1769432014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=snwDSZWY2CM1IgkVFFgRZzAyAPdnSLxoi9J0awy7G58=;
        b=HYrJIq+/5XbHzJWrw32YPhs3mjUw4soReblXIk7/Y7MCdQpeirZO5dvyc9rNn4lx4Y
         uxbR4qHJcBsUUzGmTnB0buimQ2aclw0t84VfP2NMLaUCdJRPFq5v+9fhAYzI/tNstugl
         9KvrbzuKwpPSXDUz9KM/TTFe1XtmpUlfkvDce+1BKrMfwHSx32UG5LjQFG73ydCnl/cn
         QyZyF/hvUMYkcebrK9N494SpL1+dP2MeVDK/L8k4Q0rhjuw5jpSp1sCqlybmMUjjOVeI
         y02rsSygEin+V72Mvi+/iRDBaZiobwkqxuM/mRUNKk6Nrz2gmR60+jtDPpav4+x474Bs
         fqdw==
X-Forwarded-Encrypted: i=1; AJvYcCVhodAWUa6OxcNy0tQIJn6Y9p/CpG2O6ioxg+oigrfxnopcR1e8Yi1gPontQLBPuZJYLcGA7TRvA2fc0avXIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0IUmEzQRG5gHb04cn9JhrDTWzxFXZmiEo763gMXQFHYM5yd9
	aBtTe3voloFI0tKbdnhZ0LM1YIn7OzeY++EB1RC0z8/k5qLNwCR209XCqga8j0oh1BXCv+hKCWW
	4HBsLhpmSoRFDaQSffHPdE12W1s0s7Pw=
X-Gm-Gg: AY/fxX4YyJQC5QbAdgQ6dI9JytUtGxQxoLuWV1x877P+IKp+N4Xq2VmHTwSVwrs1PI9
	VPXjI9zDSq+JNn7yA+/8RxgPmqjpRzBBue+hjry3GbprsWfasQLltJT/XMyQN53UKcNyjufYSTW
	oYPvVMzhl1gDWtNiB09wifcljXJtIq/5gGrhQxsF6spyvWKK8Tkxg3zUrlEVAgQyu6J6/I6RTuz
	fChbrHus0Thc1UDCj+Mv3SZIrgkvmDZ0z4eJ+YaymtH4T/QSMcwIJyoc7qkSEKWeJEKvlGgEGkY
	U4TL5ysMpKfolgcYSUzYYfGfpAkZ3CfkMvmDN0/jtfLAX1ifJI1f1LJoBizB8ToOYx+Qa7gx6e3
	qsix/VSRkvsDIrdFqwD5PGJGuhmKj69seG+vbe8VlDA==
X-Received: by 2002:ac2:4f15:0:b0:594:25a6:9996 with SMTP id
 2adb3069b0e04-59baeec5a5amr3541217e87.10.1768827214250; Mon, 19 Jan 2026
 04:53:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-vfs-v1-1-18e3d327cbd7@gmail.com> <CAJ-ks9kDy2_A+Zt4jO_h-=yzDjN024e1pmDy4kBrr5jsbJxvtQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9kDy2_A+Zt4jO_h-=yzDjN024e1pmDy4kBrr5jsbJxvtQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 19 Jan 2026 07:52:58 -0500
X-Gm-Features: AZwV_Qgn2I6o91taUKgGtxPmZ_aVxaQ6vxTGrdMI9tisi8uORrSygvdMrRfrp20
Message-ID: <CAJ-ks9nZA84HYL_7+raFvcS1G77O7FyHk7_fsPMYuv2K1Ecp8w@mail.gmail.com>
Subject: Re: [PATCH] rust: seq_file: replace `kernel::c_str!` with C-Strings
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 9:29=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Mon, Dec 22, 2025 at 7:19=E2=80=AFAM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > From: Tamir Duberstein <tamird@gmail.com>
> >
> > C-String literals were added in Rust 1.77. Replace instances of
> > `kernel::c_str!` with C-String literals where possible.
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Reviewed-by: Benno Lossin <lossin@kernel.org>
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  rust/kernel/seq_file.rs | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
> > index 855e533813a6..518265558d66 100644
> > --- a/rust/kernel/seq_file.rs
> > +++ b/rust/kernel/seq_file.rs
> > @@ -4,7 +4,7 @@
> >  //!
> >  //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_f=
ile.h)
> >
> > -use crate::{bindings, c_str, fmt, str::CStrExt as _, types::NotThreadS=
afe, types::Opaque};
> > +use crate::{bindings, fmt, str::CStrExt as _, types::NotThreadSafe, ty=
pes::Opaque};
> >
> >  /// A utility for generating the contents of a seq file.
> >  #[repr(transparent)]
> > @@ -36,7 +36,7 @@ pub fn call_printf(&self, args: fmt::Arguments<'_>) {
> >          unsafe {
> >              bindings::seq_printf(
> >                  self.inner.get(),
> > -                c_str!("%pA").as_char_ptr(),
> > +                c"%pA".as_char_ptr(),
> >                  core::ptr::from_ref(&args).cast::<crate::ffi::c_void>(=
),
> >              );
> >          }
> >
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20251222-cstr-vfs-55ca2ceca0a4
> >
> > Best regards,
> > --
> > Tamir Duberstein <tamird@gmail.com>
> >
>
> @Christian could you please have a look?
>
> Cheers.
> Tamir

Alexander or Christian: could you please take this through vfs or
would you be ok with it going through rust-next?

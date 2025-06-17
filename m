Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D30236A99
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Jun 2025 02:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750128584; cv=none; b=YeWb2ihIPw1iaVHK1ZzW15+KGQs3g1QESCLQROljGE4NAif1F0OfTSfLxZIMUkPmKDblDWjfQgfMnLhEk5rxRIjAC0ylHre9v+G+uvI1gTd2TeIhnJGa3lspLkFUKRmED5OpoTKaY1frO3hpsE+ouaDZ5p2ijPpy2FZjWcv+WHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750128584; c=relaxed/simple;
	bh=FXNUw7yeVY2NYEpWwul/C0fMJY2N+bxoURgNldXvuXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfbWZtSAu3hdmy0xaorJ5u7Sehsf4rzp9uGEGutQjikw6IBNR+7ubqMAI1TOJHCPdXf9/htZkKegucqJRBfOZJjbrRQ9GMGs226bZGMeuhLvMi8rFQmAEcue2Vuh3JrD3FKGFRov2XxgnR1gH7XzMFVZ/o793q8pXi/IqEKVf8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmNxasQf; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmNxasQf"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2da3c572a0bso2973664fac.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 19:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750128582; x=1750733382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrKuZoLKQyVBE3G7oUkrN4qf87bU7RKtVhLBpZ59b0I=;
        b=MmNxasQftW68IdsMxvJrp1mbIvxsEEp3sdVu2Q1D+Awc/9oMP/50mPqts3ToLzbe+B
         O4qbODk7Nn2rjbsQXCqLCYcdD0vIkP3VmnBGUCX0oSQ/9PnwMctwed9KW3IGFElbdxsj
         mcvr2zf+YzttAvrC9i8DwzYlMb0g3DNT7MJSvTj/9rQGzFiPkTVJ1pTjmhXiFpSdDJfX
         Clbc4lg4ASYSTfoM0RlRe7bHM2ZuO36hQKy09ohBPKAYCL+S7WdNug+21QoHJCAd2T1s
         QmTd8klm8gGy5HBevDAxkEkfYRO7UfGrkITimZL/uYBCpTkNdN462cLBhrE9A2OZA6bH
         XWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750128582; x=1750733382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrKuZoLKQyVBE3G7oUkrN4qf87bU7RKtVhLBpZ59b0I=;
        b=j6GLCQvYpNq6wPTtl7m4ok1wI7iz4+5Zigkp+7hG2Vwgf50mOs9vtWwzycco+F3eUg
         50eliI1pNTlm/YEAP7D1QSKcnD8UnGNNcrVMkwGjrCz19hVO4iKj1qBq7DZzqq4VlNbQ
         e/HMvYa+o/Q9I7jA+WzOvNXt5Wc0KICcVWoLX9QB5iaiavGujAqXshKn0J1aGZhHM1Km
         Dq6vBymMhV0V/uhSIsyc2RQvXlKNyZStdBKqrlvFekkRjY5Ho6j9NO8/H4igb0Jw6BMv
         l12haP/UrorhTkVEtVO8C0yrHCw+4PEDfx9n4vIr7aCkoqTyKNGPJCmW24L1IG4JnhXM
         byAg==
X-Forwarded-Encrypted: i=1; AJvYcCWElML3VSafDsn5ADDP2+Ou62eU03087LylH9ZzpoifoLxm/KI/e6Rb7zpQ9ziAgVrcsj8qt6M9sXr0AxQX4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZGFeghJ78iqYBxdEn3xhJeeSEKDyAi87bfshuC+K1/UkxLwJ0
	ja8d5RlNhhKsg7cbLqTmHVMTQ48z57G/P0pkp9A1rsjZPQBVuYPyzeS6H52kWfnchsD1ZW+p7am
	Nnb1GRNF9KQh5pmKwV79VXgrFBwCHEPk=
X-Gm-Gg: ASbGncuCcGZoXepPjKZRynfjxGd7wBKtRO+v5qJInC3m6WmpMsWG+q45WzpNOMfqiGm
	Ea+ED/+65TgWryVXPgC/98/oswIyp+qhDFZ4UVK690mG9es42/4UhQpIVCQJ0eSvUm3768/2Vai
	bV/3Sflfa4A1ADzSsN9eq7sRMmxrvimmIWPcUNSwNMP6U0wWN7BtVSi0o=
X-Google-Smtp-Source: AGHT+IFejwIO9dY6XMEp/bdu/dNgvpFr+aI3J2fz6U41JNYwobKmy0algWqFcSrkPWQ0LDY1vrdNiJRwcZ7mc7a6oV0=
X-Received: by 2002:a05:6871:4048:b0:28c:8476:dd76 with SMTP id
 586e51a60fabf-2eaf0a9d1b4mr7228167fac.29.1750128581858; Mon, 16 Jun 2025
 19:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com> <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
 <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org> <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
 <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
 <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com> <DANRU0TC3F11.30DUO1LQZUE42@kernel.org>
In-Reply-To: <DANRU0TC3F11.30DUO1LQZUE42@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 16 Jun 2025 23:49:30 -0300
X-Gm-Features: AX0GCFskDokQSpAscfqORglOnrGXP8TDoaZnyeqw65DQsMen0LygTqSdrvhxOO0
Message-ID: <CAPZ3m_gBEBfnCHtcFoga=HEi_acr6-eJ1a71VgrZDJbfrCz=0A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 16 de jun. de 2025 =C3=A0s 04:15, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Mon Jun 16, 2025 at 2:36 AM CEST, Marcelo Moreira wrote:
> > Em dom., 15 de jun. de 2025 =C3=A0s 05:38, Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> escreveu:
> >>
> >> On Sun, Jun 15, 2025 at 1:12=E2=80=AFAM Marcelo Moreira
> >> <marcelomoreira1905@gmail.com> wrote:
> >> >
> >> > what about:
> >> >
> >> > // SAFETY: `self.data` is valid for writes because of `Self`'s type =
invariants.
> >> > // The `&mut Self` context guarantees exclusive access, meaning no o=
ther
> >> > // thread can concurrently access `data`.
> >> > //
> >> > // - `drop_in_place` is valid to call because `drop` is only called =
once.
> >> > unsafe { drop_in_place(p.data.get()) };
> >> >
> >> > I'm not sure if the line break in the comment is okay...
> >>
> >> Benno likely meant to use bullet points for each one, rather than a
> >> bullet point after a paragraph.
> >>
> >> If you do e.g.
> >>
> >>     git grep -A5 '// SAFETY:$' -- rust/kernel
> >>
> >> you will find examples of that.
> >
> > Cool! Thanks for the command Miguel =3DD it helped a lot.
> >
> > I'm ready to send like this:
> >
> > // SAFETY:
> > // - `self.data` is valid for writes because of `Self`'s type invariant=
s.
> > // - The `&mut Self` context guarantees exclusive access, meaning no ot=
her
> > //    thread can concurrently access `data`.
>        ^ spurious space here,
>
> This argument is actually an extension of the previous one.
>
> > // - `drop_in_place` is valid to call because `drop` is only called onc=
e.
>
> This phrasing feels a bit weird to me, but I can't put my finger on what
> exactly...
>
> > unsafe { drop_in_place(p.data.get()) };
>
> How about:
>
> // - `self.data` is valid for writes because of `Self`'s type invariants:
> //   `&mut Self` guarantees exclusive access, thus no other thread can co=
ncurrently access `data`.
> // - this function is a drop function, thus this code is at most executed=
 once.

Ok! =3D)

I thought about using "so" instead of the first "thus" so I wouldn't
have to repeat the use of "thus" so many times.

Final version:
// - `self.data` is valid for writes because of `Self`'s type invariants:
//   `&mut Self` guarantees exclusive access, so no other thread can
concurrently access `data`.
// - this function is a drop function, thus this code is at most executed o=
nce.

Thanks! =3D)
--
Cheers,
Marcelo Moreira

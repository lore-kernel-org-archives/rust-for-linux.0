Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B1219E
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Mar 2024 00:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711239546; cv=none; b=GMo/fcQguboESuoX2XeQuYO163ekkci47tPwO17vwOHYd9Qigw+TwX6Y4fJTIWm0Kd9is1ZXT2osdHaHi/AieLgG+5YOye260zs+1LVnWbMRmiHLh7Ems56TFJL4rGa5Arkz/DwXzFU5KXsOQ0pX71JUCYF9Y2a3C8G4Gb2MBoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711239546; c=relaxed/simple;
	bh=gaV5zpXXXvS3l2au8Gr1BuWWy1uRt/8kCCDGFjSCFv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qn9fGEpjFdcrL4VbRT7ODvGj46O9aQJVU3rGB4z1glSK+yrMNG0Ce4LwrPgRgl5YkMWczI5nKU4/qAMne1pPZQPp5Y9BpIOn4V0jw8KG508xtkCPm4LdfwXuyieiZnTOtC+33ofknOQjMkGJU4+W+8uFeCnx0/fgLzeSsNLkqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ms9xhtPd; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ms9xhtPd"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-609f359b7b1so37485587b3.1
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Mar 2024 17:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711239544; x=1711844344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnPZX9Wri3So15j00/UmNNdW1bfCbP9PWrepfFqxNuE=;
        b=Ms9xhtPdFgPAQH92wX0qamaxZ99C2LyW7HQBWR3M+1eZswCnVcojkhRAdvK3abNnqi
         jvflKPxF+Y8nXPQN17rcDz5A2TvswGsOjluDEVx6XtJP7t9H0kD/ymKuYgVM7UJgMcEO
         5httg19dGXMhJfkpAOPqIr47kLHnDg6opQm5ZTO9L4LUQVSHgcO4ja8CcJXkhCpJNEQ4
         oZKFfkno4nt6VjiDCxoKq+sh+H6GNYhaK8DbILhu+ULFHKDPZ+/vQY1Zgd6YfKmunbP/
         Dv0/AQkcW58Fy12a9qmFCvXkfihaLAvziwZq35M1LPqrK1VVg+xVNwCnOOLZjQsE9c77
         4rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711239544; x=1711844344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tnPZX9Wri3So15j00/UmNNdW1bfCbP9PWrepfFqxNuE=;
        b=DMDEsFG54tXKyvZO045FrLgo8OHQZmZVasoKgrSfflnUWpynuAL3f5DpnnVuEhpEdi
         vIXsf4so7d9D3x5vIqh0JfBDbH2t9LFsHeHA2bXBoDbBWqPu3nrHqtyJPsxYvXVnv+NH
         eEEoMaUO1Gdv9SkBVBidaKxJmss07+VvaUf7pJXo3PBDiFHyNLr8621Su/mvAyEv1gl4
         d5Kdy9U0H9jnUaBWwkjCpDhtgGKMICJbEp21F/SlXYWBKAoWbs7XtD8cLaLn0DAHWarH
         rPteob2ID0jmK563VHZk12E3zhh98AQp68TxgyeVPyyVCCw3dkDwMVNTN6SoUpCpPkIX
         DTzA==
X-Forwarded-Encrypted: i=1; AJvYcCVOz00qmqEiQ20tGLzfhkY5LFIAqftGJj8kkCxlJHK8zXCDU2977CzFHUcLUA6Os4h/D02rJzSJrzikrqjNyS2q2c+GFYu1jjWxTmymu9k=
X-Gm-Message-State: AOJu0Yyw01B611YMRI+FJSVxmFAait4u631ihblvu0W/tIdDJgzpGpsp
	bqjc7tuIfK0WlZCgmEka+Az74Qlb368L3E0JskcJqqulAetaVamwg3y5yudRPwC/ED9N6rlPcqv
	2OG3CXk4oxTNkrsp4kfmTdf703t0=
X-Google-Smtp-Source: AGHT+IEUq0sn4ymETlE/bmJNxtz/Cf78akTHcc3z+jIZQDbD4kB8Fm+IX8ler7wxhk2PzQ5N/5ieVxqz6PLvnmoTv/g=
X-Received: by 2002:a0d:c887:0:b0:610:e1f8:22ff with SMTP id
 k129-20020a0dc887000000b00610e1f822ffmr3108180ywd.12.1711239544210; Sat, 23
 Mar 2024 17:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323074006.2940679-1-tim.chenbw@gmail.com>
 <CANiq72=v_Hw8Nbpw9Y8V5uBTAifmwAhK_iqF_eV+5MtXe_1Ohg@mail.gmail.com> <CAOUFp6w_XY4cDZwLmFQSFDvgojZkNNwZ8GCWBAW=Ax_7ubZa9Q@mail.gmail.com>
In-Reply-To: <CAOUFp6w_XY4cDZwLmFQSFDvgojZkNNwZ8GCWBAW=Ax_7ubZa9Q@mail.gmail.com>
From: Bo-Wei Chen <tim.chenbw@gmail.com>
Date: Sun, 24 Mar 2024 08:18:28 +0800
Message-ID: <CAOUFp6z4+fuUJ0RxBMbYydtVfG++3xL=1LAw0-y-DQReW+DATg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: rust: Fix improper rendering in arch
 support page
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, the backslash escaping mechanism works. I will send the version 2
of the patch.

Bo-Wei Chen


On Sun, Mar 24, 2024 at 8:15=E2=80=AFAM Bo-Wei Chen <tim.chenbw@gmail.com> =
wrote:
>
> OK, the backslash escaping mechanism works. I will send the version 2 of =
the patch.
>
> Bo-Wei Chen
>
>
> On Sun, Mar 24, 2024 at 2:57=E2=80=AFAM Miguel Ojeda <miguel.ojeda.sandon=
is@gmail.com> wrote:
>>
>> On Sat, Mar 23, 2024 at 8:40=E2=80=AFAM Bo-Wei Chen <tim.chenbw@gmail.co=
m> wrote:
>> >
>> > Fix improper rendering of table cell(empty bullet list). Rendering as =
a
>> > dash instead.
>>
>> Thanks for the patch! I hope it was easy to set it up :)
>>
>> > +``loongarch``  Maintained        ``-``
>>
>> I imagine this renders as a code block, right? That would be better
>> and we can go with it, but did you check if there was any other way to
>> get a normal text dash with rST/Sphinx? e.g. perhaps escaping with a
>> backslash? [1]
>>
>> We could also simply leave the cell empty if the escaping or similar
>> do not work.
>>
>> [1] https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#e=
scaping-mechanism
>>
>> Cheers,
>> Miguel

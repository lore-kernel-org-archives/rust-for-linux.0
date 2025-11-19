Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEB12F617B
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 21:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763587215; cv=none; b=HhmVcOv+97LWKvEpPFUjOkxcuaqGij+n7+mU+EVaXoT41jjeqs6I9FIKwDbhxRqfQM5x9T4oqSwzZn45lBACjL3nOWdVlVbdsTCkPtmpT73LrNeNss6sjGTauPWtsMwBYQZgTYUjLsGDYSUNzQDF8gyGpXtBBkWagA2S0epu8ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763587215; c=relaxed/simple;
	bh=NSGK7tHQu2hUcUo4AprotvjTSTrN4fx+5ozWpGLauaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEIZmVQM+6kgeRdTl8hqRlusyvLLvc4ErYdicDUfNsUYNlYZKOve6UE5m6764VWQok9lMUDwv2HVj61y8FX7AD0/Wdg8aqvAX4ucTvJkqYSPpg/mIl6mvjJiTz7/vDOrMTCX/mCIyg5f8cyUsScALwIjA/cvAnrFGJH4Qu7CpJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfgY4z1d; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfgY4z1d"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6575e760f06so36807eaf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 13:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763587213; x=1764192013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBE6DCM/NTh0UXEHX5QGMnJPqRaC72MDdiHH+/MLmTk=;
        b=DfgY4z1d0ePHbQ9+q6NTmdjxLxu6+ynJoohhJWCI+LwOq5PCY9dW6BUVAVXHxh/VdS
         wA+rBs3oLoyQZxAtjBWA6ka4HSQgI2Pd1QPe8ck30AK4W0uDYSi6VXZlysDiIIVCM1Os
         2qOb3+Ip7Vm5p9cJw7HItHjfV1PUjZigrSmteEE4M3xvj3tLVz5fT568p04GlqWLPShq
         EshR0GFXAMJCy8Z+4OXnK8Ef6564BUUcERQ0l1IH3RO7sxLnmtsI4pnQbeSHcgnErvP2
         AXN7ttJt+yn5G9vXBelVNDNibjUv+RBlfQqBwf9vvgPkDodSwc5mVA+xPblrU8S8kUf2
         SQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763587213; x=1764192013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBE6DCM/NTh0UXEHX5QGMnJPqRaC72MDdiHH+/MLmTk=;
        b=IQ1+Iml/MlkPq3x4nGOvuS1SPz2DGzOcLNrZK81wpOiTPRU0Pw30qkjdxFzHf2PVJU
         LrZljMZxLnyNIprsIQLyHQFQINFiNfuVcu69ubJ5nkwYEwA07rdNWQr8aNOP12BVrP+P
         Du/hp8N+XW5CgSNOLLMJA6K0ZuDcYAwJB0dIZM2eA4kmv8VlJK1ttV7fkJphP5SiMX/W
         77Iee0h4H7MqwScnbV2nEbE+vskFGo7CX+bhJa8qgSs3R6RFDPgWEcz8AGiNkSA2bOOS
         XPKT+k01Arpsia98Byg1YlsiCpaUFD3bzx6ksU0uchaS/AVVn0bLRedg02ox9CeyFvgb
         oRwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLTtliQaJycc3jVzBPXDjkFRJAFv9mK0AroPnKny+p2OEJ3KzywdTvu4sFKbm9nXT4WBTJb4dFFVfqHNV7Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLx6g8dnB6N6M4su7RAmLPRtyx+ZFgUSJc9raiD90TBwGxjP+l
	b8kMfuxe0l6DQZzoq6iSJSPNqpeguV42DlU+/3BBjE2W/tFzoZItkcWbbyrUIi0LzC6rE6t2rtV
	lx2hWHeknel4CJYqXkGcZDf/XaJQRb7g=
X-Gm-Gg: ASbGncv9rri+DHjQvgeorf8fnG9MwySoTRO8bV1v5m7xg420G2vhUbmE4Sa5DE3BtdK
	M+9PF3BskjTAtNyIVYmJzLfD6xFY4uiSNZ7Dj1Q/KPwrghKhNlCKYB8BDGB4zC8QIsfU34lGhNN
	Kwr3tiXSGJ+BovXeJOzuV4kiOp9l51RO1RebCWN2mMgOJUrz9M9yqIr25B6tDBUSypMFE9ZBZj4
	YhTU8QLKzq9wNy3dGfQjNEizyMUw4vVfg4DPwVIHS1hfPIKuO/nzKaki0y8849rralj
X-Google-Smtp-Source: AGHT+IHBFOo0G2w59eEmM9OBHKnOSkAFC2azwiaAiMnGfDyHuHGLLPAkHP6ILENd9G8p4UUILYMjr6Tn6TVAa+H7z9A=
X-Received: by 2002:a05:6871:70a:b0:3ec:3189:9671 with SMTP id
 586e51a60fabf-3ec9a487b2amr333371fac.23.1763587213290; Wed, 19 Nov 2025
 13:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016211740.653599-1-lossin@kernel.org> <CANiq72k8KmpFyKAFZ293GDUWx5=HJtksR02hTU8-H9PX7xsT+g@mail.gmail.com>
 <DDK2SA1D77HM.38KOTOTF8FJXI@kernel.org> <CANiq72=Qh9sJLKwACr_McnbGdu8JfzqDuv1AgCjSdwKtt-9Gdw@mail.gmail.com>
 <CAAOQCfQzhxDzaJOb3GyVPgcVD0npso4bJ8zuy_63ZSr-rnQ0nA@mail.gmail.com> <CANiq72mzOn7sHTMMODF4echBj0rGS=fsUesfeFDzLyXjj2xw=w@mail.gmail.com>
In-Reply-To: <CANiq72mzOn7sHTMMODF4echBj0rGS=fsUesfeFDzLyXjj2xw=w@mail.gmail.com>
From: Guillaume Gomez <guillaume1.gomez@gmail.com>
Date: Wed, 19 Nov 2025 22:20:01 +0100
X-Gm-Features: AWmQ_bk3o1IgLq4Cc0eR3ODvtnbK6RHsteRYcWpNYevel8njLV6KYz_OUzywH44
Message-ID: <CAAOQCfSFQCvca=9-nspsxg70W4vXk66sxUixH9c=R71PZHSzQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pin-init: fix broken rust doc link
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for opening them!

Gonna take a look tomorrow.

Le mer. 19 nov. 2025 =C3=A0 19:28, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> a =C3=A9crit :
>
> On Fri, Oct 17, 2025 at 3:06=E2=80=AFPM Guillaume Gomez
> <guillaume1.gomez@gmail.com> wrote:
> >
> > Indeed, although, please open an issue on rust repository so the team
> > can discuss how this feature would look like.
>
> Done -- for both the features (checking & runtime toggle):
>
>     https://github.com/rust-lang/rust/issues/149105
>     https://github.com/rust-lang/rust/issues/149106
>
> Of course, if we have the latter, then we may not need the former etc.
> I tried to add a good chunk of context in the issues, especially the
> first one.
>
> I hope that helps, and thanks Guillaume!
>
> Cheers,
> Miguel

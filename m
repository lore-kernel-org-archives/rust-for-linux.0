Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E05E217F23
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Feb 2025 23:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738796617; cv=none; b=nAV+6hTmPUteOO1qLD1Au9r2eHZUXQKoPJioEf9KhpjhJBtg/paLCZbXTJPX7jJEQbLGd0aDLJ6mt4XijxsvERhgO9odzH+1ZfnrEEZiHTywayVW7qmiMGuhwpVypV2ZvuvHEYxZJ07C+Ja/nnCvWiKg2jZerAgm5UuKI3pG5oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738796617; c=relaxed/simple;
	bh=bVdA9WZp0q+MKl+SOWUgiQ4AdO1aA5nIliGeK76LzFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4DEj0BfLJsFrBpfPg7zJgrkN8rX+wD8FBqA/eakUg99+ueti9BeRiujhWFZsZs9MsvHoeEYVpACBLUJmMcu+U2QrY0NLiP94RrTmi6ditq6GasuPh8E8Ot2CJAr855U/TpFP4n1Ju63RxZh4zAvYqms3Bwa40kozpzrWMpxTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=by4jatiq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="by4jatiq"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dcd43726ecso328a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Feb 2025 15:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738796613; x=1739401413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVdA9WZp0q+MKl+SOWUgiQ4AdO1aA5nIliGeK76LzFY=;
        b=by4jatiqbKNB/JH+b8vm1nEk4VNz1R+OAuNmXNsQjWSl4ieDP6ESwnPy8TlNC4CbwV
         SCb1n/UvcPyFtQ4XD3B/54i01Xlf80V8PtlGOyD5pAmafmxNd1kOkWApFaWpo7s4dQgU
         gbXmcex12uV7OMST3EqCLDLMroGCKuaJ0zdbJb0jYOBenA11Cl0N4KU5sx0l6BOPLsUJ
         kZlqXw3vmaKa+XwhwdjeyoHosTlwaGNe+iYNnPalnLHr7egfwekUPg+qXS64MPTK8wA0
         3cDZEHWh50MyYwZ+QFGCq93Mqg2WXPajDabajlYxg4GBptPooUx6RtK1fWsB9YHN+ptZ
         CpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738796613; x=1739401413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVdA9WZp0q+MKl+SOWUgiQ4AdO1aA5nIliGeK76LzFY=;
        b=cYD9t0JOL445QUFclvf+nxAnclUQHB9/p5HV3caq0B+UwmPR+yL988jSolS/V7Qd+L
         bwEFhR8XowHtUZHUotE1wv3FEAYEA7Lhu6PbO8sa48LpVByYfD8MsVU/ReztLZvnFVhU
         dcVk7L7OTdv0LL0wcxv9Xj9zBGBeOywavP6AIbdciWTXwIj/HbiWFqe2tTk9YoWc9Z/T
         WhH7i2N046aEoBrT7vb7zV/WkUiUsCEFf2K5E6v0OJMsZv8qmc0mLO1qH/pbzpxNxPC4
         d7inWQhxcGVZ1DvG09y6q4d/d9IKV8/CL8rDBsnoFfvvZKbEC3pRSlDGzeX6ERETWm2I
         OKgg==
X-Forwarded-Encrypted: i=1; AJvYcCVArOFabLvDbBRCX29R66jlrsbbISs8yoYGTpZWRbtyqAPCdFeu5IIkGzrDjAMrbQIpP7O46un5lOF9IMht9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5HuGixmj7EVTSnSAhuQSyxv9ARtJ0YCRTjI2cAO5dK1ESlHbO
	HCgKoADipcnKnvxyrL6R13G6M9E7ZRKtvYjs7qMrJVo4Kz/3SurGCSA75i+7NpWW8PBlnwXlXAg
	UzuYPDok2WjykyVKV4v1l3hNZhkaW8gCPvC2s
X-Gm-Gg: ASbGncvLXXJyx9wcPGbcdonjOp/CqPFuyTmJnaHHyVMTIzYb0/Ms0dXVSR7zDW4bQaS
	LY/5NShbm91n/BrWzQIZD07s/2zt4GLMrC6OsC1ta5lmm4dITjhRK+m1Yj7jTjPf3fYZzGUvl/s
	LIgNRGf/nj2DH7FCwiYXb7pek7VwA=
X-Google-Smtp-Source: AGHT+IG1ZgFZy7b7SkOidLH13XEGqi/SKDP8xNcHapN2lRUfWDV6twsz/UIOXywnQSm/yOloQKTIPZBlN1GDirL9Nk8=
X-Received: by 2002:a05:6402:1a57:b0:5dc:d909:3109 with SMTP id
 4fb4d7f45d1cf-5dcefebb161mr1518a12.7.1738796612741; Wed, 05 Feb 2025 15:03:32
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
 <CANiq72nr9vTgUF9u0uyypzprQrEpGv4qbOUJS_QgYbMZhTTrRQ@mail.gmail.com>
 <CAGSQo02HFMn0b=d6LVFr35Bc06F0AY8XmPFtqWi4b17cQSF0+g@mail.gmail.com> <CANiq72mo66FCLQTsBMU+Sc-VeS617uYgQdtCXJF9PacpUhSbLA@mail.gmail.com>
In-Reply-To: <CANiq72mo66FCLQTsBMU+Sc-VeS617uYgQdtCXJF9PacpUhSbLA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 5 Feb 2025 15:03:21 -0800
X-Gm-Features: AWEUYZm3juV6teIxJKq31Rcu7NBwseJ4mbD86_1YRjuo_aJ8xNMUm4r1fbMLV9g
Message-ID: <CAGSQo00uUYdjeiRHEz465WyN_kDyiV2L0Ojaomr8ckMYipmp6w@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not export generated KASAN ODR symbols
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixes: e3117404b41124c88a4d834fc3222669a880addc
would probably be most appropriate

On Wed, Feb 5, 2025 at 3:01=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Feb 5, 2025 at 9:08=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
> >
> > In case you were waiting for an answer on that, it's because I was
> > trying to be as loose as possible, since `__odr_asan` isn't going to
> > end up on random symbols we *intended* to export from the kernel.
> > We could technically restrict it to `__odr_asan_gen_` to be more
> > precise and it should still work.
>
> Sounds good, thanks!
>
> Should we add a Fixes tag to any particular commit?
>
> Cheers,
> Miguel

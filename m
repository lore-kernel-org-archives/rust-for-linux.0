Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D662F2F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583845; cv=none; b=s5WS0cfv6YM9YOHZfZZPr2o1WSRTcCNJU8QG/kQ2vOUg8LmD8k9QMylpk4elQ440H3Jpgtc8pHTB7/76//tqc1gJaA23DRkP92csJoc0SeyaNzabbHlRZoOHmoOQu/vGP1eX4zvatG79k5YbO5/PX9nioOwAUUgkyfYzyqbFeyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583845; c=relaxed/simple;
	bh=rYhMyYLvVyPW6rlplkX5QrbIQx/hbQ0xyXmsXms1qWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIBZF1yKtfLouv5zYNaI9vKW40X4uw8yjcV6dYpkNLfqPcCFnUkPBkm4EtzzxjwlwQcIv9sredRp8fpMaIlkjfGhKqZVylF37hwcKrOGfFvOlR/12e7stgm1fkIXxo2guSr9a1PS8d3B3oxl181dhOJacaK35yAB199MQknrVeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5lMyxZe; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5lMyxZe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235ef29524fso6611225ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 12:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749583843; x=1750188643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqgRHHT05QqhSog7OJECfBvFC6NCuSeYmSkvIwn3Pkc=;
        b=l5lMyxZe774nofD7mwe4c6E7mQD98CjZPiX61FmUFyApvu3k5EK3pIycC7tkX5nCHD
         BSrBG0TbXqNeVklnFBKj2e51CCFNSpWXXOd05DniZVMU0/49zFJY+O0de68BzqtrH0Gk
         gdJsiekF9GuUhrpxoNpvt7icgL+QfvFQTsBLah43Q9xL1NvCQeLPBprEIx/wfb9qOlND
         rvQ8TFtHYE1+EETIbBklvnvGAowp5LKeb/E5TxiA93c0uC6vhLZTv/qDwNE2P5Gc8Nc4
         Ry+7Tk30p0Sxe54JYQT1/nloRv5vbu517KN9R8khepUYmodtlpxUZGBdDQee8yHWX9Bw
         vQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749583843; x=1750188643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqgRHHT05QqhSog7OJECfBvFC6NCuSeYmSkvIwn3Pkc=;
        b=iP08YdIeJhDrnrLPGMoP8Gv8dgUpnc7wshDGY2DPMUKMAbhZ49XlZ83ovCPPsvQoSY
         mk6Uv9MI7gntOBTOqnolYVoLeLVqH+p4mn4uOnWkUaunQG4ycvltIUNdM78hbvw7Amer
         /TvIHM0Pqf/9UrCc9idCBlQCF4gc+q58W6vrNKo/B5vs+6lFBk6TiEFo1usmdjPTe3Yq
         MYuem9e5NTmRWDr65KRrBXxG74Fgu2f1cKT9t1jHU5xu2lAxYlWBYawisSc7QSky2bhL
         lRqVVWwnIDFBOd9crK7TUJBYUBJB0gwkKmvF/2talZQNogxh11LB9IDE9zZkJUyenKXO
         0VtA==
X-Forwarded-Encrypted: i=1; AJvYcCUhaxNLpitVel6yETdBWDjuXqUw2Xvj84mgIvFoR6eHqIULgmhQoe4JEzC5A0EDbVlqZ0N99DvVUOhZCLdijQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyekCO0s/AP295sPfp2obZWS6HdkR0/rirX097OYRUKLOKWPNj7
	Bxjg2QqPX2c5EP9BdQfB3RhCsdSVSJUA6w4z/nT9IXVoZ05HrIiuyg7vlmSI8Mnzo/4/dpTd2wb
	cnD/++yYDrz6ucfA9sZpe7y+F2BbkRIk=
X-Gm-Gg: ASbGncuHcNeK3WsbcT4X3lE0oop/dW0O3WD4Kb46q7InfBZQAsthexmApuMEeIMUHhI
	dPmxQpkRWuveuybn4x4GY8eG4ZN/aRjS5DKwYCIshraEH9IeG5AW92m4Yp4T+9uEl/V8NcFF5H3
	bvYnYbXO8OpCGZ++QBEcbKAAt+JbAUi8ABiAxyH0GYX+g=
X-Google-Smtp-Source: AGHT+IF7bOG6PzwFeI/UJ8qRUpf9/V/iH/JFQlEkYlegJaGVfm4Iey1K/d0dlY2fjx2cAbERfB1YJIfZy9GfrldSPgk=
X-Received: by 2002:a17:903:234a:b0:235:ca87:37d0 with SMTP id
 d9443c01a7336-23641afec37mr2441005ad.11.1749583843016; Tue, 10 Jun 2025
 12:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250606020505.3186533-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 21:30:30 +0200
X-Gm-Features: AX0GCFvzZQshH_LbLekQJJDM5q5wrAWOXVuHZuZj8Zv0MdcW_mCVQR2HHCZmQUA
Message-ID: <CANiq72nA=JoHekwfSor5c+XMYe2qKnXnsVaFELpfNYXTDaxt5A@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Fix compile error in impl_has_hr_timer macro
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, tamird@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 4:06=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Fix a compile error in the `impl_has_hr_timer!` macro as follows:
>
> error[E0599]: no method named cast_mut found for raw pointer *mut Foo in =
the current scope
>
> The `container_of!` macro already returns a mutable pointer when used
> in a `*mut T` context so the `.cast_mut()` method is not available.
>
> Fixes: 74d6a606c2b3 ("rust: retain pointer mut-ness in `container_of!`")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-fixes`, thanks everyone!

    [ We missed this one because there is no caller yet and it is
      a macro. - Miguel ]

Cheers,
Miguel

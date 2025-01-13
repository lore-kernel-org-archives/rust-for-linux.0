Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ECF1FBBF0;
	Mon, 13 Jan 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736783159; cv=none; b=km5+cV8AyfQYj9VzAVElwERID2HMOY7O7TlHFtWTW0IiNiwv9OLo1twc+hF6cPXsY+Bzysc5sg0g4JluNTgDAzdp1DnsEf/zK3NJfYnXCCpP2bxpNf7LBOz1HJ8detGxfvYLTANvAYXX67aic0dCuSPltjWSNTVIhtfX3HHNQqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736783159; c=relaxed/simple;
	bh=PAgKioLyO+700Ibt/WTWdXStANMyIDBGCjmBJJdyFC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scGTJLiAk5x5EjuYgctd+M9Yyqd5z1Vx8brgbPQrs5JKrfWVYn3U7GDE3h5uAPhSDUoPRFTNXf3j1LHj5gChje5GasBCpwdWIWDNx4Rc95quOfPUnZCN99TeAnJO6Qfg4LL3Uwc6iBQxL53ua9fq8MaVZSi8F5zqXMc6bWvacVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mes1a0JW; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mes1a0JW"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-305f529a987so33548391fa.2;
        Mon, 13 Jan 2025 07:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736783156; x=1737387956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAgKioLyO+700Ibt/WTWdXStANMyIDBGCjmBJJdyFC0=;
        b=mes1a0JWs8aD4JZ+dVjY6FoTGrto14zrPRFr3GSuyIAxEgStWWLF/TFpytSynl0pM8
         shwSxMCpHyZeI4I+B5LmRDC8aRLue5SSwweLFCAclW5UNNeBYfbfie/49eX7SHLXEXFR
         2GY1mpL+bYPBBHnOZ1CFezE70YRDt0Q5bRW/aIuXa2bnzd62qklle+oeg+JGyl/aHOl3
         rvhuKVoTNl563QZG7l1Vq4PiLkJsOQw9MnWgifqsOn0YBwx/xyk6np2EuY405hJwrWu7
         IRMNSL6lzZC4wUNytR/Pv/CUuKE2ewG/FciL5vy0auswK4adBz1PFfkYrqtMj/uhD5AE
         PN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783156; x=1737387956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAgKioLyO+700Ibt/WTWdXStANMyIDBGCjmBJJdyFC0=;
        b=V1QVCuwQuHTX1Dhpuu5sykCWS3UepTuGXbB4O83gy+5syh41SmhmJJEs63xhZDBabz
         V6HKqXlQXkWzDiN3y5l5Rhx0RWYML/g9F+7eh4DO5WmtejGjerVGqBK4/VoWAtZt7rNK
         DJ0XQPO94+IGH3tdQlIb0iOFUkJQi7tNGqYWJ2O+uHsLQeHGP8K/0hY31UAQ8Qb9Rkjh
         8iI5Qa2KMC1cSuJXhwSFdtIswMGU3e2LPb7HSnGnqj4gUcsi0ewHSE0PsV+uAmJYLf4C
         HZgC2NNlRHL3babXj4dcLGoJXBMXC9H7RzbBDCZVmAOYxZwsFS2aJui130jZB4lKvUOm
         TArQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ6HaDpwQ+d/sAffdpyyUBjF28KKPDwhPY6ltdUhcWlH6F3yZE9kZGarqzeHOi65/50HDYrcG58DaHgRc=@vger.kernel.org, AJvYcCX8vLtw6OY/Btig8RGE7rvJZr3+8Ss/7ueowJybElO9SC0zyhaskzY8mT5d4k5WtPXV5EtGQPF/nozK/GAvJlo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2FU7qwwDNrE4zRD62qIMRDjWnIOWyDJmccZJOwAi6Shir8ulF
	bG+NlituAir5aDRbomxdFx9uzMbvbnPzRdCMWwuEnP73HvgB76LRt/WCh36yOM34CMPHnQnoFr7
	qj6dC1prmOtRWcfmkBLnHZEWFZ3U=
X-Gm-Gg: ASbGnct77s+OnbV4NLhXfkjGmlXUqToXY8XXUoEg0cL6kmVF+tOZwGHj0sE+TTbd2zC
	SGjuRb8QuJS7zYeBePRnz/deffoZ1lXrrQZV5euD9UOnPQBZc1B9MSw==
X-Google-Smtp-Source: AGHT+IHdrQEU6TshviId0R/FGEDZxStKXUFgQpNm1/IW8o+kvO7U3XE/a9XDAwc+kMrvE114NeP9najKuLsYNgq98Ts=
X-Received: by 2002:a2e:bc26:0:b0:300:31db:a770 with SMTP id
 38308e7fff4ca-305f45f5aadmr74001271fa.26.1736783156014; Mon, 13 Jan 2025
 07:45:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-borrow-mut-v6-0-80dbadd00951@gmail.com>
 <20241120-borrow-mut-v6-6-80dbadd00951@gmail.com> <fc667065-6951-436c-9329-77e94a64f614@kernel.org>
In-Reply-To: <fc667065-6951-436c-9329-77e94a64f614@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Jan 2025 10:45:19 -0500
X-Gm-Features: AbW1kvZj0T0p81L4kVwuQ21C_i8cDd8N_0DQY5DBFmyOvOCJ_Oh5hDLTL7OTPRw
Message-ID: <CAJ-ks9kaj0rjNAW1CWW-qDrLvFoVY_8Q5P8ZLO1N3Tz2o_wSfg@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] rust: add improved version of `ForeignOwnable::borrow_mut`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 8:18=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The new functions in kbox.rs should probably use crate::ffi instead of
> core::ffi arguments. Besides that,

Agreed. Miguel, can you do that when you apply or should I send v7?

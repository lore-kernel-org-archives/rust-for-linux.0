Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03810266B5A
	for <rust-for-linux@vger.kernel.org>; Tue, 20 May 2025 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731311; cv=none; b=X0PC7YfkBBgJd6mtEGJyRfSUYfobAdjcjmiFvPIk4NtV3wVxgRITSiyHjQaYXA9X/AaQ8OFUQ8NogvbFE24axHSL7o6+IQn4aCRk0jmWRaDRfoLly4zhCMLGpIN9MjdHZEDxYvlkOJV9X/jwoQNPuuw/J09vGnnnXmSeUuSiWc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731311; c=relaxed/simple;
	bh=WR3Fot0ENPkw5wTllf3xfd2Y1YBpggZrV1x1uZRTylw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAt3kgOAPkS69cqCPDEkl/ghQuoVmMQhGs7raNNLPOlP9Fx1bVt9px5JKIrEeIeCT0g/gBffEs8uHG4B0r/5ZAJxZkIt99gnS0NiMo1hjxDZVBmo31sYJtU7jcAWbsQKbRbjrAhQmwVydkjG0Fs7yeVyPEgC8qGkzQM6CK3JN9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfeodMRW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfeodMRW"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-601dbd75b74so3179135a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 May 2025 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747731308; x=1748336108; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEHHY6oS939R/YxLd2YjHVRwqmuvsudeAK45ON4ltEY=;
        b=GfeodMRWoynBmgF2C8Ly4K3YICuavRNwCJ401mepxm41mgTp3OiGWaa+Byi+rYPucG
         TnHs2PoYehEnwoFZ6mO/D7VGYeJ5KaXBiDyjQEvukA/24V8YI7EAhlHncXee4DAOOvTV
         4r45AeZih84W+H2mt9z9sC+YcZDGuNhbkk8PLja+pOufyA+lQVNzJz46YZ9yXoT7YShf
         YXI2PLgKuA0LgNPyZTARSgFITtGOCs0+F2hLIUZo31L9BWz7kMyErbKHZPZmnWCnuyak
         AYc2xX4CfPOi/mQ1AwbPHLb/RnCAGZbs1TJRLeIMRkoyy+EImmMHt8ss2J4tRY3jiLAt
         tKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731308; x=1748336108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEHHY6oS939R/YxLd2YjHVRwqmuvsudeAK45ON4ltEY=;
        b=a31CzYjzkT/ifGvtcVDEz8JDyLK0U1+oVjXA/pYJMiy37NcCUaVCqHyUQMeQuZcAMe
         XPbcvBVSwe7tSKbA6mMFMUjhKXk/e+qABsYfhbvqlC5B/Vht7PGh/XFj25YFAxz4nH7j
         ESfIkoWYUbAuCDTj976COrFc2p00mMXO6yC9EPYu4gJYU0lBX84z6075zrILuraG1CT8
         7siWCtEYV79kDnYu1K3IQpcXGfJEuIm14av9xTD7HHawORcZy6vMe17yZnB0YqWSiGfP
         6ruWKDv2tn4ItbTFcgf3keo6myqEt88CfG/Mk3oyeLEJEA84Uy+Rrts2Yl7r5f5eqqNp
         KnlA==
X-Forwarded-Encrypted: i=1; AJvYcCU9IpuHoyqq9vb2LmUmWyavoVhJ7CiaVGO6Ck46I9s5r0H0rJVfVKtF7cnsVfwcz00pTSEIq1fQI8Xww0Jegg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqI2N1rzFlhfoG+wKABYsIpATVh11UtW5SOPDyOq9529A0feyK
	eEmWvRTjc0SShDGvu7gyXrmE/5dvfeBHi+10HsFrhPz5Csb/Fox8Vy5R7F1I9ybLVJiAu6bgszS
	2pCKqUcuQF3UhCgM6XBV8zdvE44W8X6E=
X-Gm-Gg: ASbGncvZsZGGsggUDNA8MpMCK612wSC8SCiHs+zyaCibQEbNwv0O8l1OKKbWVaCua3J
	A5VrtQpsqkbAElEdItH1Z2qAbLZAALup2W3rxTCHuo/5gqfvAQLutHZ1M0L9j/7J6WHofi2XM5p
	VmYVPQOvAMLkrtwc794Fg2WYq0TbApDhia
X-Google-Smtp-Source: AGHT+IH7rZzrkBkyLda37LzcjFhBFBzwgo7VzjOSx6qfdQnM2U2eHxnTSaeo7t9rzxLOlU+2pW+Sbpbl7dwxyBhEpAA=
X-Received: by 2002:a17:907:db02:b0:ad5:2d05:ba12 with SMTP id
 a640c23a62f3a-ad536f9d78amr1292016766b.46.1747731307896; Tue, 20 May 2025
 01:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516122349.1944895-1-igor.korotin@yahoo.com>
 <20250519164615.3310844-1-igor.korotin.linux@gmail.com> <CANiq72kis5ykiO8kNAB-uu84+cQ1Doip=An4B+Q2W+Zg+Y0tww@mail.gmail.com>
In-Reply-To: <CANiq72kis5ykiO8kNAB-uu84+cQ1Doip=An4B+Q2W+Zg+Y0tww@mail.gmail.com>
From: Igor Korotin <igor.korotin.linux@gmail.com>
Date: Tue, 20 May 2025 09:54:56 +0100
X-Gm-Features: AX0GCFuIMtHRTcpLsV2CQuXEa074lJJJBUOcidx1jO2Fz0f3C2dxRLHndSkqDEk
Message-ID: <CAG7QV9378C382+qSKWj7Uu+sQrS9YbsDKsttngE22hEi4UnhKA@mail.gmail.com>
Subject: Re: [PATCH v5] rust: macros: Fix macro referencing core and kernel crates
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:10=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> Couple notes (no need for v6 -- I can fix locally when applying if you pr=
efer):

Thanks =E2=80=94 please do if it's not a burden.

>   - Normally you would keep the Reviewed-by from the previous version
> if there are no big changes -- in this one Benno agreed to drop the
> `static_assert!` change I mentioned, so the Reviewed-by should still
> apply without risk.
>
>   - The email header (From) lacks the name, so Git had to add the
> From: ... at the top. I would suggest checking the email setup so that
> the email goes with the full name too.
>
>   - I normally suggest sending new versions as a new thread -- it is
> easier to read in certain clients and in Lore.

Thanks for the clarifications. Noted.

Thanks
Igor

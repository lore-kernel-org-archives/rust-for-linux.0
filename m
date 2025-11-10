Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781B531077A
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780988; cv=none; b=Sjv7BZc4OScWP1KyK7pGW8+bWsQyKiB1Xdmnqcb1rorigzzwU+ZWrSjAR5EDjgD0ngryky6exu37eJ2wWDN40ObfAVYyjMnz3ogWqWg2SfSTaKHiOu5r2WX1Cddlc6EsozPi/et5nUa2CEngnbohmk3YoQS6AQM3EdhGfHWfTDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780988; c=relaxed/simple;
	bh=C3acuH7QCQn6p/xm12ErSwRFYfxoFjG9C3ZXOi4OU58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dycPUTJ1CB6mo9qHRFWssTpPftYK8xoiJI+IBTH24lGetlJQRZNJARupmqRoGmVoeO50C9r16v7mxp+Yky6ufBUXaFwuk2016G04taK7Fwb5XQjt2J9EVKwHUeWH1PwGIy/jA60Ix/MO04RiLKM/3LGqf131CpPI/vKqv2azoFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Burq4hu4; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Burq4hu4"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b8f70154354so283450a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 05:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762780987; x=1763385787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3acuH7QCQn6p/xm12ErSwRFYfxoFjG9C3ZXOi4OU58=;
        b=Burq4hu4SRCBWq8IvkWShcKVmRVrUTLWS7G9dZOSs2N/qYDza1aDQqyf03HNvmGacX
         Sxnkm3AHK/y3AJlQsp9K9x7l0K9IYHDPfOIxZ4MVx7MAeBknIpXWlOoRDPO3soEdB3L1
         Q116CAnfikEAhQDMoh+oaOngx/ylvAjIa2depsQOaWxLllXoH3qbHDVFbelkeKXMipVL
         mUTFT155DQzvatbbU2jndpqmroGdOvyLfMXZ/6UDbcmkmi6QosoBrgx1upouDCM78V6U
         sJUjml6KJvwAn/YiQXbtUIL3sX6pRMmbLwF+fUljKRjJDnmzXxrDfB1j4+NRjQAFUl9/
         +v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780987; x=1763385787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C3acuH7QCQn6p/xm12ErSwRFYfxoFjG9C3ZXOi4OU58=;
        b=Gmmb6HdnKJE6qQ/clSUQpdlGTbEKVsgP58nTX7gk7R22hMGZEoSE1KD81z+c1f7wvI
         Jpqo60ursbmMYoBwF3j9Lp0G4T94fuvH5EOs3Heu+EkbCgoFwIDm4NphYm/5xHVwPQJ8
         lomGZKrV5ad48wi+pNUK5A/EG+9FOnnTj9NkqsSmJyZoM6Mle56FOEIzUoexer7JiD/c
         yihSjvXYHKUokqF908Kiza1NTdpkZfophCSwURMl0GvgHhQvGS7ST3K1JRLVjAZDeXzj
         96Y7NQdol30qEG+A4gcnvCDzrku4zFIY9D2BLgfg+jIARyx8Z9/0YE7ZXVqVQe1i/7GR
         WE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeM0aSHpMzCqnSY/6G5zw4YRfbDFiyH4pMaDO4HWgv5TWd0oTF4OLsVjsMVKxFNaF4cFwTTn0oxu5g5ZceUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDelulMWpxzE5p2+rnZL0vIeOl7eHwe+EeUGkWLBBrcT8WubXI
	Z72NJQyLuCvfKpa5FpwU3qPk121Om6vVOFpRnsjW6Bo9gyVvsYJaYfgSXrAP+czjgWrWy+J0K+T
	qayzaqTUYI79cXQQ4dIfdlTi3k52upUk=
X-Gm-Gg: ASbGnctKUzjNXaHSbKDmjIk39QPere+TmgQmqwN+JrnfMq/DccWrDEcuY3VsXiRDANo
	qXOXg4g/kmdlyj4er76bWnZefkx6T8CXj2u9IVw7DYzci40qDBU+WxeSvjP6BS4r+9YpBpimx4P
	knD4DqXDXvoDMo1Zmtsk/YsfpqndwCxOjmF9py8lYj1dqzJrtpaFH05Z9zxJL1HidcJI5T87vyr
	jYujEdJec0ro/T1tiGKpia7mO11VBqlNSMKSwfjsE3tG7JaaY2zQggE+0V1Mx/DtyomQs3lr+pl
	k35DPuCBLpQPMgtj6glgzKab7FxxA5XY/kin0MzM1EsSh+u0GP1eboqw2vI1iMRS1J3DwdHisaG
	ZxeI=
X-Google-Smtp-Source: AGHT+IHgHDi3q6OyQUJsolTQIPR9Fj/+81SVNx0MCb8IGd9foxsR78ymwzqgxKrlTwxxt2S941IeTNAE2DlJ0icIPNk=
X-Received: by 2002:a17:902:e809:b0:297:f2a0:fad6 with SMTP id
 d9443c01a7336-297f2a0fc40mr54637915ad.9.1762780986630; Mon, 10 Nov 2025
 05:23:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-14-ojeda@kernel.org>
 <aRHQA6FEoxACerIQ@google.com> <20251110131326.309545df@eugeo>
In-Reply-To: <20251110131326.309545df@eugeo>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 14:22:53 +0100
X-Gm-Features: AWmQ_blPKQ1VNfZu1Ux9YpaOP8DxeSL_ehdyoNT5qQqWUnszwlBjdrKVMppjRig
Message-ID: <CANiq72nkjWbtEktSU_TrEfY2Agy7FK0-OLBWPLqTvp_p-CkBUg@mail.gmail.com>
Subject: Re: [PATCH 13/18] rust: quote: enable support in kbuild
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:13=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This is to be able to skip over edition flags for `quote` when building
> the rusttestlib?

Yes, it is needed to support skipping the flags, which isn't needed
until this patch.

It can be done earlier separately since it doesn't hurt -- a simpler
option is just to mention it here in the log.

Cheers,
Miguel

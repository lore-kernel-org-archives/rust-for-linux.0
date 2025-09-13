Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3597818FC86
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Sep 2025 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757790220; cv=none; b=YzJ7LNgxhQtebTH3SVQe2kCon2Ponuo1heCZhNk+8wGq8n9br1mn428pYNKt8AsujUgIdNQoRKz4NZZV4ASOHLKApP6t0LyxvpBAabuf2hwzOKA3TZg7L6Jr5NZ6ApGCR8uFcw4UM0fVdvpekBSrtqVRSqwxYjmkTvXLBd3UIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757790220; c=relaxed/simple;
	bh=RrErQHMoufTYXa6RoaEp8zh1hIka2FwFAyx9/D2iXb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7k+tQLykoq3KDaqufbxxEqb9z9oOpD7pyzc06WJHAKiTRAk9vG6Bb4i7ZrsW0uo7D3/6EY7CLDj3eBY4DEUG8sNkcI8c7LOEw8CIGJTct0MppxKOS75txJ8+1/N9KUaUbGeLmnf9O1cIo9JaXxJlfDzmD2We/nVHHYw015P1u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqzklJNC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqzklJNC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-25c99c2aa12so3141045ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Sep 2025 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757790218; x=1758395018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrErQHMoufTYXa6RoaEp8zh1hIka2FwFAyx9/D2iXb0=;
        b=YqzklJNCC7ugoWV609NsZqLrlGyeN0HpCB/snpzeP1sLbihAMbdfDxbjov6wdNMIse
         muZEAzGT8raQc8TTrrt/DEdjjx0qTeQWnIuFDSLCKcFFYy3lNWEAVKUqlo4cVgQ1mZzf
         GZrr9haoJcM/seKiNY/ucGnZPueL/1bOLQiQnUh8fVXnm87xXJypfoTFC5pjRL3F9zV2
         XDW5fBpr8NwDrqZQ82Fl8ULGaT7yUs3TjnN6CFMQHp65pRsXgErGwPmXXHjQRVmGX7mx
         MQjsv0osmK4ZZB1FcEzJSdItLVqKJWxkGth8moAt4Fs2RcempZBNaMW9LUVrABNHzflA
         Y6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757790218; x=1758395018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrErQHMoufTYXa6RoaEp8zh1hIka2FwFAyx9/D2iXb0=;
        b=TdnMcnuYmwjlhSkI+XoGTUU1nOXzkhpj93wjborn/gFAIQ/F8N5/ZScNFgTstGajNP
         kdT0ZIFWkut45Jkse9dWHoIl3E/h5VfywbKHqZsVZU9Nj5xbn4Ibl5Q84Id+k414Ou/F
         MmxPX414e6km7zrdJFsAqRwCSZFCy8oFeqkqn5cBheFi2SE/WSaYy8Lp6z23ru3ECLk7
         GGDRpp7JlXVBNJ9Jc565ZRvyKzx179DRRUcODxkWtKPNlu1FDj8Ns2hBXFAS7U+9GnoJ
         k4fkNlOGF29dR43ksNuztJo03SscboxMPhLXCfxZJHgiP4oy6YTm8C1QT+IwbQZAkOMb
         nwXw==
X-Forwarded-Encrypted: i=1; AJvYcCVor9O8BjfmUlRQpDLadW6LaUrEfWUwiC6jqlFsfsutB7VVO9tZ/V0YyWFZeN+mCD1R0S3Y6ikdm1TdMHelLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd9UFW9gqaR3m44MfjVjp4vxdYJ3KPfdloNZdumEch9K4CKWHx
	9s6QiR8B+3poW+a409QyFkg/fvnoA/JXpXGJQ0gv3C/IX+AVH9Yj4aYGSVQ463U1bBXXTe7V4Xk
	+EqRE5Y4rfBCRP879U4xAts8pFJRJduA=
X-Gm-Gg: ASbGncvgJl79qa+vWSlVRFq1kM9LoDPmt5z3ZKxAcw5ondZMQ5bzoae5+lWUrTPxveo
	QqsnReonuUivoPxp9xF9D+aeppbM661GPcprwEZKpCGcQlBBE5SOOyFc+cKNiXvMTZUf0Ye3itM
	IBpR3Az20kuDNMDJ8K4fROXDikIrWyh1eUDezGaZyYXPtKvg3hNJ073upm1QX7IFTPT22SIQ4lP
	iGg+BIWl8OifOh+Ocb29r+HzutVghwkRFIXGmjs2Ot28UOOx8gaEuiOpfO0i6urFvKTyH1yDf/q
	id9D2yQ5gI9Q0d+Ahg+D2M8e5W6DhiNy6pRg
X-Google-Smtp-Source: AGHT+IHB/p3aamI8tG9kOMmpITgJyh98PQ9GJhpKrDDNtlxPb8Z7RQ7MmcePFRjRvqHcelMNs9pcfv+bsQ+RJAs6Q0c=
X-Received: by 2002:a17:902:da87:b0:25d:8043:7832 with SMTP id
 d9443c01a7336-25d804381d4mr48208615ad.6.1757790218426; Sat, 13 Sep 2025
 12:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <-ebVaoKp9tTjZGmdSRi8rrH1o7SgmGyyzk-g2ALSCBKPJP44z7dSPCplhwKt-sibwLwqP7IPEml6qCkSpJhd8g==@protonmail.internalid>
 <20250913100847.9234-1-work@onurozkan.dev> <87bjnei6tn.fsf@kernel.org>
In-Reply-To: <87bjnei6tn.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Sep 2025 21:03:26 +0200
X-Gm-Features: AS18NWCQkGD0dQVq9enzHNa30IHtZXRVI41tuTqtURXPnwY5pteGtWO1FPfH2ls
Message-ID: <CANiq72=zP0TLCjM+ySOu3Zbn_UnU8ntqb2MH58cN60O0Voe+hA@mail.gmail.com>
Subject: Re: [PATCH] rust: add `rustcheck` make target for check-only builds
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, nathan@kernel.org, 
	nicolas.schier@linux.dev, masahiroy@kernel.org, aliceryhl@google.com, 
	thomas.weissschuh@linutronix.de, tamird@gmail.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 7:46=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> I think this is a good idea! However, it looks like this target only
> checks rust code that live in rust/. Can we also check code that lives
> elsewhere, like drivers?

That is more involved, and I don't plan to add features to the current
system, sorry.

Cheers,
Miguel

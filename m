Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF9D5DF1E
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606332; cv=none; b=enwZMh1Lxk0iJztVFIp0k/Hs6bNt0UNK42RGnwawhPxcR4Pkl47+HMF7jAAUtSpuL4hhfj+0bs0zNnGPPCPTnzfBbgAiT8NhIzKywukHkwqEq7CDjM6OcAydvwiet5gp4dSP47HgwRmXJC1P7OXt1BH2EzIPuhbvfF6Y5N2u4A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606332; c=relaxed/simple;
	bh=F/cTM4VSLKcMhFnMv4L77ZMGQE1ijg1rGP30sPQqzyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNFpF4Fkm+q462zo7VpO9ijGZs+lIPQri1K0G7FvVpJAZDB1yNLP128C8krxmNDFW5u74QHb+55n005Go1FoPQbDEjbM6bU0rr00zWh7CDRgdJGkA/oiUfqvWtjTQG7D0Lops/dgIlVfkY64bj3nCrFi9/uqXah7cyfvWF4HPCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xVuD7ujF; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xVuD7ujF"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-46b215a0695so574725137.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jan 2024 01:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706606329; x=1707211129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pJoui15436YDNlZShmKGvqb7ZMmNypRm9KPXDZ5Kug=;
        b=xVuD7ujFH5WIw2eAF+D/ACPQloKaFP6wXO4VlLT49mIttteMTKyjYmVXAAxO5Iu3I8
         CFRUVs+bNWIoKbOSfgLBVHNfUGaB/790UAmXvnO/LwJC5mVISgHk96VgDAa3js/5YGhV
         iXV3cT85pYZ58m/uDveEDP9J388FZ3r4cZoha6YhC5CnBHfAOH8zt18HoIPn3E+JBba6
         +T4jRzVVqUBCG/uWZx32xoIk5t7ty5OCuO7ZE8QKeUd/RwPSmds+mqbCH+KsjjXj0khl
         4gUp9hoerDm0mlRlUl25HL83tdG3kkw/DaUZKOTVSAPAPqTnTzfS0ac8GgZSCUGKlNcF
         pzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706606329; x=1707211129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pJoui15436YDNlZShmKGvqb7ZMmNypRm9KPXDZ5Kug=;
        b=vPmOGJx7abFkn1TjerGbe+3TP4U6p0hyDz9VQnwEh+u9HAuQc28OcAQBgT5z2fOACH
         +LZOUxg2G6y+021HuzrKqGZUBU8objymREvf5/o5ky5q1nMjbXdGipSqXDqPeK8XB9W2
         pA8YklHco4U3biNhndcWybF6gMrfNcISxcdAGz3qdF7Ixb3Q+dfvfLFVUhRg2O2ErEF+
         2v9GZlnNDosGACbD0HQJLEVoO5MX2jLNpGufgsqe1HtvVYqdqRZPeudjzgeIShGDQn9f
         hnYt3vXZAUVKXdY9xuZz2eh1Xk/w4bUKHjlFMuHft3XoIqODpaapincVw/PotG8J+WEE
         xuWQ==
X-Gm-Message-State: AOJu0YxEe1pUnthy4oZ9ld/llk5DT7TFFaZgeZZFsrt+F6gd39/RbYBC
	SbYlilhvmWvyKqglZmpghJ3sfdsQnguKVROJCPMRMvwuws0cez8cnnwbit4IaszQtL2HfMGGy/h
	lSNi2fzP2vwm8A2QR6Tno64fMnskTt2P54YFPVAep1rhdXuDLOUbi
X-Google-Smtp-Source: AGHT+IGL9TpDEm0usJlZsZmrnrDFEOo/OkF5iOfjXZgDhZOEsbrsnK1HFGwr55WJnyuQ51NnWN6Kq8QwZ+tboOoBO9M=
X-Received: by 2002:a05:6102:66f:b0:466:e5d2:4d7a with SMTP id
 z15-20020a056102066f00b00466e5d24d7amr2462740vsf.28.1706606329521; Tue, 30
 Jan 2024 01:18:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240117001613.169177-1-kernel@valentinobst.de>
In-Reply-To: <20240117001613.169177-1-kernel@valentinobst.de>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Jan 2024 10:18:38 +0100
Message-ID: <CAH5fLghSaorRgDDuqNCN-BhQ86ysX96b=nKM_cZAN0_E6Ai04A@mail.gmail.com>
Subject: Re: [PATCH 13/13] rust: locked_by: shorten doclink preview
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 1:16=E2=80=AFAM Valentin Obst <kernel@valentinobst.=
de> wrote:
>  /// In most cases, data protected by a lock is wrapped by the appropriat=
e lock type, e.g.,
> -/// [`super::Mutex`] or [`super::SpinLock`]. [`LockedBy`] is meant for c=
ases when this is not
> +/// [`Mutex`] or [`SpinLock`]. [`LockedBy`] is meant for cases when this=
 is not
>  /// possible. For example, if a container has a lock and some data in th=
e contained elements needs
>  /// to be protected by the same lock.

It looks like the text should be reflowed here. The "possible" word
fits on the previous line.

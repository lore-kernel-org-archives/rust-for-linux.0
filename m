Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC5028D829
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Jun 2025 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030077; cv=none; b=dkG1U96urFbT32k+EmB+yuT1Rvglu0F8NhBIr0Z4nUYaL1c1PAvqLDjaRe/GE5AbIn4PnpABmw+JFZvDJAWFa0effX+YxAIpi/DxAnePM73ho9PtI04Rr5iUdNXliMe0c1sGdM9RUP0D2a7bhF2LdgTp5GfdHO2FVrDwgOwotK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030077; c=relaxed/simple;
	bh=AilsY6EElGiFXAgjqUTOk9uCK8Q+mlJytFww8/PJcQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgW4qqVhhsaKgVtxmI9fFzxjUgQFavL6IyH2hw09tYmGhBa1O1sQ2fj8EpDE+JfxXkbILcGHtoG82k33lyz56nwysnIQmoQxq5LozFom48lewnG29UW+JVmQ/4hxHLk0bN6yhkQmbBoecHHYBiLCVZ0iDu3bwkRJx8VPWDVN7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Q0SPIwY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Q0SPIwY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so2925613f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Jun 2025 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749030074; x=1749634874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AilsY6EElGiFXAgjqUTOk9uCK8Q+mlJytFww8/PJcQY=;
        b=1Q0SPIwYLMwSLpt3tXVedqB7B+31+7/7xJE9qN7O5qm/0BLrY9GWw/iVVK0PnIxfTQ
         clnskcT5okt7/cAjwcc6oNnUJeV0z+g6NLLMTBNjH1hwSCaLsR7DYb1ICOFvA7FsNJf1
         TT2xU4/fNA4n3w51BrW3LTvdmDRNo8whXmgD2LQEET3kKztjnp7DY+QlfK9egypNt6WQ
         cr7MIH77YCK8UerJeoyOH4Ug92JOOUgMmedVgH6Qox/avFJ8GDfychNVU4OWA/1Kcdrp
         u62F3fW5Cwkr/27MRjzPXDfZ9UlzFckucvjRbr4OoX6+HePQ42+zxecbcnHJPG07Uj8z
         VAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030074; x=1749634874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AilsY6EElGiFXAgjqUTOk9uCK8Q+mlJytFww8/PJcQY=;
        b=FRIPXEZ3TwqQkSd7lDH91r8Xxg4F/PaEnmQGxiFFJ/aUCl6kIg5gCv4iIEe5ia5VDn
         Jr64QgQD/up9qwNUOm9wgYxb0QKmGcFPP7On9kMdMDuu3FU4Y7YTti6jCdQRFJjqaKxa
         Y+eIa/j+vPEsByQ5pFUgTcgn0+D22qPKV6LpHOV4KbALUvhavw8fK05NGK5uuIwvGdPU
         pfr8Z/jkGzj4qTcDaryX3IDI4ryKUZfessAUYTeiv+WQVEfrHl9weIcZ0AmBRWAe4oZi
         4kmEw7BvBMTofKpQ5AJ2AbRD591zsGz06Tad7sl+waUjsxyNKTWYPneHEu5SnZfBIYcS
         MC2A==
X-Forwarded-Encrypted: i=1; AJvYcCVpu+1vGNZblkKTKMK1MVA1pYrk8/xoJUBCuOxdoosZyN5Gr88a3SWddojZ9wYElvCnyVtstqQHAjpYDjVG8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHD1kqMLBvWWM5qj7BAO/agx9FkV0QdobNIV2v5ucMvUs9h6iz
	SD2EHl6CmVgE1hL4kEiHZ4vAn5TKGql9tW2vxcqdQrDuW2kDONp3gLjrFdkwsNB5nWvhm4s13oy
	MvMxLrB6dFYXnqwPs0uje1Ydr+dq625CE0dy2t5Vo
X-Gm-Gg: ASbGnctGfjEq1KZEAEuCIGdOESb1sce1yR1rvk5lC2XdkmJGLHQh/OrJ18i9PQyDw+c
	6bP3oWcgN7iV8jCNvhPGxx9DbbKqeuZLUjSkfp/rU/PizYFIId9Xds06cQkoCRtcVnsGV0vwfp2
	PE3/eJVeRhHlVdpqD7pGRKd0TZS4j+/QLfCqbFHuqkaImzrtKePyUYrD7KuDyprPqxfU/3fu2Qr
	A==
X-Google-Smtp-Source: AGHT+IHDAbTmjf1eaFCyomYeyVDh1falOCkI0ZHgnJv31XoEItpUIeYrusiChA3cvew3koY6VaKpQlpK5zzhX05QGh4=
X-Received: by 2002:a05:6000:2306:b0:3a4:d975:7d62 with SMTP id
 ffacd0b85a97d-3a51d95a512mr1655359f8f.35.1749030073484; Wed, 04 Jun 2025
 02:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
 <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <aEAT9B669Qvi0rlR@google.com>
In-Reply-To: <aEAT9B669Qvi0rlR@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Jun 2025 11:41:00 +0200
X-Gm-Features: AX0GCFuGYMpyWuK1o8MZfqHtJCktp69_UMzyH56oWOUDGHY0MqossbvR6xJKnek
Message-ID: <CAH5fLghzLqVNYXSe3kBWPdzp3NxQ2rLAxy4h4qzoGiVT=XXh2w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to MiscDeviceRegistration
To: Benno Lossin <lossin@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	=?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 11:37=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>

Please disregard this email. It was empty by mistake.

Alice

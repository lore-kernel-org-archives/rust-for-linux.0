Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA73751C54
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Apr 2024 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712919887; cv=none; b=ESNZoa7Z+hibhiR2BqbNAhX9b5Ob/boG/7jEQnBEpGdVvS9HrhwNkmGUqzxMwOipS05EGbzBMZRt/JsB9dDqF3YYz0VRy2LhW9WXCXfSE1zY5PmY7X+lbwkE48v29IMF7762Ve6unzjC3Mz/y4OqYwesnbiGgf6iNPLl075qpzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712919887; c=relaxed/simple;
	bh=sdwH1R9n4tNKxfvqvKIo+bgKKBZKjj5KhJXWUjV31DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3DDxkCmw/cBG45ua+ef2NzXyFTBhIsPI80Ahl9kg0ChF/4rgYkuFz/P03p0jfJTNtvO7cnygeujyCzg6Nvg/QvKANCptjRrQL3TX6KIP/9T02O5m7lpuFncbT6scUVZppVgW7FJf6OxEGfxXI6dcvp/5YglPQnK1gy0EJHNb/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WoNQuoLc; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WoNQuoLc"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6184acc1ef3so7311147b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Apr 2024 04:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712919885; x=1713524685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdwH1R9n4tNKxfvqvKIo+bgKKBZKjj5KhJXWUjV31DU=;
        b=WoNQuoLcw1INOvLBKDTdHnwqevn80l6x2PT2zPyB7cIab/BIEHlKSouSm3trbwcSdR
         onzZVEKyy9kNrgeDklbG4+/zXrNmeUvGEVXrwyN/cV2PZvD82/N4LtCbPjOVgXzh/qbO
         nkNcyUZzye29jlKMXwxz3WFWkwBHgwPbHz6q3H22IjWMhtC9smSrEJ89wPpJf5Mk86AG
         Zaf5ZYnbGOS3yEgGr0zedBmHXAomw8DvC3bZgtSjH+TVMj5gyUXLMSvrziUqvYoT+F64
         NIIPWwwTY156ctEVg651PQofJNc6ID4CGPpx/OHA6DEh9Io9YRX6np5JrVTlOUnrSke7
         eDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712919885; x=1713524685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdwH1R9n4tNKxfvqvKIo+bgKKBZKjj5KhJXWUjV31DU=;
        b=JC6+w9Yhdc+YZWaNYLrlzFZaRBBqugQE1rS/xEu/ko16UyKM/dBZ/JwOuClApL4Qaz
         pQcdc3Ed5+/ImHJaKDDHQcBKFOMOdeAs+gNA3GSDFxDZblHkzWbhqrB+rHAtppQjmww7
         jM9bd93lRFGHnjYZyLF1aIw2TOexKO9Y3Fi7xTMISvdf2znk0YC7HWkDq1xe292soYeg
         5qUMgyvCl6+2vXuynl3fZk2TXdvZtcOiIKggbpvFhfsmTFu4aZhgS3cV/GugadEPkJ11
         Oq+CwPv9xnarqiV88B81G327gJFC9Fnaq6LhX3y+NEYbnYcAyzdBxbqHI6Fqw98Ti7Pn
         ULfA==
X-Forwarded-Encrypted: i=1; AJvYcCVQSjoXu+yAZmsbVGMrZMeAkGKu5M1d37/g/jVBsAcT3VFoPhuP/Ej2F3qw3rfTeAkvAwm+ErbqSxrCsvxGthlEGj1c5TR/bk0tANIyn1c=
X-Gm-Message-State: AOJu0YzcaqfXxyMOSUYXAuKtV3b3xbTbnCmznAqFYygTjywaBtl6Amwr
	Mq+VALX3nhH4ppY0jnTD2NdTfCtNr4et66yHEF1hhHMsVmO/h7nA75u9CCFNvjrqjCpozyi1HDY
	/tJmi9dpLHFZErOxQUgzW1UE8eN8H3/N9vjkg
X-Google-Smtp-Source: AGHT+IGNEjb8Y/6bEpVUOvMsUILJyavFotZHgP1bYU3MESMgRaLSsWfRA38Dfr2IgsmXW38UD1R5VJjCAcPO2VrO2Bo=
X-Received: by 2002:a81:ef0d:0:b0:611:22cb:2f40 with SMTP id
 o13-20020a81ef0d000000b0061122cb2f40mr2034797ywm.52.1712919884606; Fri, 12
 Apr 2024 04:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411230801.1504496-1-boqun.feng@gmail.com> <20240411230801.1504496-2-boqun.feng@gmail.com>
In-Reply-To: <20240411230801.1504496-2-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 12 Apr 2024 13:04:32 +0200
Message-ID: <CAH5fLgg6w5rmQSwpO=jQoveAKOcJxWRwuw5edMu23hKmSYN_fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: time: doc: Add missing C header links
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Miguel Ojeda <ojeda@kernel.org>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	bjorn3_gh@protonmail.com, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 1:08=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> The definitions related to jiffies are at linux/jiffies.h, and the
> definitions related to ktime_t are at linux/ktime.h, since
> `kernel::time` provides the functionality dealing with jiffies and
> ktime_t, it makes sense to add links to them from Rust's time module.
>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

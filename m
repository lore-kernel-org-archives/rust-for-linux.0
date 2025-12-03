Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB04328633
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 18:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764787072; cv=none; b=lTbxw8Sc6Hv86//NQyi+CuBEEPHuaRnIvyWUVE2PCvqcMAyk0L/J5rGVR4nkCDuQQK7gLOBYVGk/5sVigr41vcKYFz6pz+eyUSlR3IGH72MrK50XnoHZNkK0e/VK2aNK20hKt7x9qMO/wylhKLsw2Zrs5Q1R35D0nca4X+zl+24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764787072; c=relaxed/simple;
	bh=fa36E/WCGKRkcBNF5Z7eiZ+aSk0KDxuEtFldP/hqBs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZiWmlCzSthTYMx9X++caIjhMczjWe1JI2EbILZouH9ab29smqpQ1qDcixXxgyvvCXSvaTR+dFXQmZ9KbIt6RhXfvVqP8szWfMAoxKZ+UHrYZJMDu5FJGosIsSh06WiPo8rVdUo67gqz1iJkc24EJbey7WK0SLoNswg/fNrFdwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYkDp6k8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYkDp6k8"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29806bd4776so181475ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764787070; x=1765391870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa36E/WCGKRkcBNF5Z7eiZ+aSk0KDxuEtFldP/hqBs0=;
        b=NYkDp6k8FFjPA0AqI4OhBGnP3Z6rFc17eF1j1BbHYEg8uJ78GMndtT8+aGh4OhHqr/
         kA3nsz/Ww10pywos9/nAuT9LBAgnajf+OC0vyfzvkReMyjDizgK7zicbuNSy2nVpv0+N
         pxTzFh60hM+AAd8Qk9L79yARD1vMzx4uGHwBbfDZ8NcspOxjUF7KZDncu1Mjf7uWoT8p
         e+9gV8eK/iqfc9A4GgZPsGPBCqbC8y4au44/7VN8Fhbzb4sFTmz8IGjp7Q3SVQpgoyDR
         3yK7Y7r7/YWOUAhFjANRdHsG69qDAiKJuaic3IXHz57fpm21DHd7Z2JRcW4mHZqAqJKK
         6M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764787070; x=1765391870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fa36E/WCGKRkcBNF5Z7eiZ+aSk0KDxuEtFldP/hqBs0=;
        b=Ih9A5ltbzeN7jHtgr5kQKw2v0SajXS0Vwfny+w8OPjXg/PwXNPGtQ6PIJ6/N9bTc+N
         Kwr+gZZkcsDTmncbYPUegK9WO4+dKANYBomeW7E/v9RN5SjLDtzZ6mM2sBDm/JVlhY95
         Pnj9Wnhy/egiiOq+yX6gL/Pl3F3DlF5pPRjt7s/71O7S90y/jf6qs0leajTpO+gvY9st
         cUPbHlFy8DWAdxCBjVohVrSWAYygosyukMbtQRZMaiCoVMj6UliZYWKWujNzLxiMNnLS
         mOgIZWUyKghxlU6I3LCKmVs7hncxDw5zWQsI56uOt+S/Q/fdEKZqi5StpXz5z3numcty
         zT5g==
X-Forwarded-Encrypted: i=1; AJvYcCWJoFa7IJOpIbMR7EKP68UYvwAcfAcV/OBm8Tzknh+zUwGCRsOprc1ms1Nn35G0cf9cyZjEJBPSqzI2S65uIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaXaSwreUMMalEGxo4EXViUX/mh5+zK2tx70HVqX8oIyplt9JA
	MiJFq7l3bD5lSiiUjKpkY2gsQkX6hNvIroiE5SnY7Mc3LQenEI7hEBAcLREYqdfw/crv7U+PNbD
	ZEMh+jnAaN5fHAX6NiMv1MHv5dwNCLEs=
X-Gm-Gg: ASbGnctVwAA7LTgChT4nXNU/yQnUxV3TnbyYz6/gDQxsRWjm9wgkKJ6MW6R/hiz4URL
	wc8tx+EKrz0/vfaYEHGeeoB8tDwUbHMqbOMO4NgVSfJzx4omp/bya4msplbR0WsWoNK0CIX/53h
	z8N5zvXTTOx4CzZkFJ8w6JCzB4em427n1UGw5dEDG6QIyheoHHvPuKVZEQH3WGqrzBpHiD+T7rM
	vDXhFmqLqL6faFb+t1pV8FQjziOKOad+Nok/+eAWmwsKg97q7OFQjDGWXRcfM+hTcCa51ve1G4D
	9kVRLrYf9E1rFERwyGhxk5CkTbfevnVfgcd/zVa2YwGEjBPuDQt2etvG7AAh3zUnHoxwQvsWwAD
	sKmQRvfZPRNAROQ==
X-Google-Smtp-Source: AGHT+IFFSgEazxFGR5mTp50UmKXrVs/s+GzaL05/S+E7xHp1Ktyf5i5yPdWD96z0x0JXRct0/B7WHB461OfjX7aMOSE=
X-Received: by 2002:a05:7301:1005:b0:2a4:3592:8623 with SMTP id
 5a478bee46e88-2ab97ad920bmr1759245eec.1.1764787069794; Wed, 03 Dec 2025
 10:37:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-io-build-assert-v2-0-a9ea9ce7d45d@nvidia.com>
 <0A952509-8A00-48A0-B975-C23608A6048E@collabora.com> <CANiq72nSo4vuXc+XW6yynbNvpZi2vJEshXw2zA1RPgSUWwAZ_Q@mail.gmail.com>
 <DEO9A3YCUEBI.XTTH17KQLWP4@nvidia.com>
In-Reply-To: <DEO9A3YCUEBI.XTTH17KQLWP4@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Dec 2025 19:37:37 +0100
X-Gm-Features: AWmQ_bkuruEMK9NRwTIYlXlsOWI1vjejqBYEecpyAI0gfxbIVzUGTOLZiE6SLGw
Message-ID: <CANiq72n678u_Q2Wi5kXuWBJ1ye2E9fwb_D4N1EzzGfn_w6L+mQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] rust: build_assert: document and fix use with
 function arguments
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 4:19=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Shall I respin with some `Fixes:` tags where appropriate then?

If you can, then that would be great, yeah. Thanks!

Cheers,
Miguel

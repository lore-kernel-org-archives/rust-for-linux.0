Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C3121D590
	for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 21:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764539792; cv=none; b=S0M1VzoZhnCe0fOvLJJb6vswc0BCnWhYZSObHo4LvYOgt8rw/OnKQGvFr76q6HQ/W1b1FROUgJLXgc48v3lizpxzxTBs/bUxviRGjiTlvcc1byv1nuT1A8GwsuP9h+V1QW3JeCnSqgE1rMcUxssPraL601KFTYX7jaYnHdsOcHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764539792; c=relaxed/simple;
	bh=0AWMXTpdiaSDrpsOWQGoRWOIiHW/4SDcY2AtwQW5w6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=soYWKfxiTyOV5FPgbgczTeTJFxQYAQdfHdOtoPwOqzf4a0inwuEaYWc+9FX69qx+zE9ptFE0Ue7mgWbSuHhGjY0YxMN/B3bz9btGoVM4YM0ye5Kk1IQ/NVt7Q/4o5b7u4LG2hPrk/OvCorEeQSeUYCb6G7PPtXbHRQlDcQg71Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtevTFMt; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtevTFMt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297cf964774so5879145ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 13:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764539791; x=1765144591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AWMXTpdiaSDrpsOWQGoRWOIiHW/4SDcY2AtwQW5w6s=;
        b=AtevTFMtAx1yjDgOd1/s199JDzLSO0KFXXIZSbOgnGc4pwYSkYcqqoppZxVV2Z7pg/
         iEq/3rpct22omOF1rXKvpCQN7oGnZbaBri1vnwKaOtzXqUvmbdvKYZPKOqwcQZahz2n0
         aIwTkGHqJGT2Tl5JAChvXAcrE8ESO5zlHDbZu3jjVBuxqPCG+bn+vjanilb2HyF1EK0y
         fO/5SBikW3B15bTiI51m2BwEM0cD7G2mIiUEwVAZ35VERUdLWVhCJ9lbse1tb/2G01ZB
         IQK7+yOHRliAnBXczuXVMwld39tuJHyov3Mjed0DgLamyQL6EjSz3J1bw5BLaV32kM+g
         k/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764539791; x=1765144591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0AWMXTpdiaSDrpsOWQGoRWOIiHW/4SDcY2AtwQW5w6s=;
        b=RCGW38SD2n2L9MD0TUbOesAEbfWUq8gzIg22nGjO6LKlDb00KPj+YZ1lkZA/7ikueR
         GxAF1LdJaKKNWlpxayQyJorkCb0CmfuLZmI3Xw9JIC10HFympn10tlyxa1sMUqm948eA
         v5AzOR6tl7yequD3o/J0bgC74imZjCEbtyvP6fGdP1g/NCjM+XQm7jXHeDbsrBQzVv+r
         b/y/DUVLF/teRLLoTG7gbNmobHaaaZPyQ5HdEGkPVFwRCmIGnKFZGHmsBdpnvXZgwB6d
         RbXnGU3VRcKaCgTQJyivJB2byt+E9qAZV9bK9qp5eSjXLD5hLUIUiCxb5qIKPaQq3LyU
         NPCg==
X-Forwarded-Encrypted: i=1; AJvYcCV8mKZY78YNcT+Z5cIkTuW7EqLmozuTBQK9m5CxbeZjeGkRGZFGlNKY0PRu1O7Bl0t2bxxSlsQjayzpr8BoTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwWn7sX1u5PIbmOBYGoOFc1BdRgPEFXN5c6gFUGhZjUy2PNGDb
	L0qrJKh0NNTqwp79d2CkLI71YyYowxjxmj7JjOc1vhx2A+W2pn1uCrCoLqCrAcV42zU0jpj3cBG
	0tTA/ZvY+QNTZooiQUnEFaGVgjHfgh34=
X-Gm-Gg: ASbGncuE0NbltRT1G3lxIYdWcU42EaOX3RpQ6ONd0c2VlQ721V0qcX+eJ9yuoLo+wB0
	0sBQ7GYmMVO1qLEXOMtl1xFDiQfCqamLNrPThNZJ4dzfwkEewZLRaKhx8EoEpoJkM0/t9hlaehZ
	iN7pEhof+JdOwJ15zIXEyvO2gEYq0HvVihgofkxmMloTRAST631SwmqeQn6eoroSojht/9o4YRS
	ejaqzkBU8o9ndtZtVJwD9enzmyeb6XlelBE6VddZuzWbE3Ce5DzKwpi3Abm7IDuLXxfqa/BM7FB
	Y3MsjqKKFVmycHuFyNoSET1FCQU0oNDfbRUGg86KstDwXwji/SONCR2XlGGCBk1dGEVhin8cJ/h
	QLUfOV8jVyQTAbA==
X-Google-Smtp-Source: AGHT+IGxucqav7c0MkOoajiVWJV5pKABSTpRoQBW266I8BhqcOtWX0rHhW0PlmjPXgebUcKAK12BDaPgbDzz/dhUp4g=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr23764577eec.3.1764539790561; Sun, 30 Nov 2025
 13:56:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128-io-build-assert-v2-0-a9ea9ce7d45d@nvidia.com>
 <20251128-io-build-assert-v2-1-a9ea9ce7d45d@nvidia.com> <db6a6b28-c0be-4bd8-a0b4-70431df7737a@nvidia.com>
In-Reply-To: <db6a6b28-c0be-4bd8-a0b4-70431df7737a@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 30 Nov 2025 22:56:18 +0100
X-Gm-Features: AWmQ_blGLwgs9jikCVQO65zGxLK14KMJ4M2hbsw_hQDynbiaD7OZLB0t04yjXSA
Message-ID: <CANiq72nGUuK9VTYJGob7pnXU5zuuCzqfw6fezAFpbqvte1sDFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust: build_assert: add instructions for use with
 function arguments
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 10:44=E2=80=AFPM John Hubbard <jhubbard@nvidia.com>=
 wrote:
>
> Very interesting. So by adding a partially faulty build_assert!() call,
> these functions were actually wrong when they created! Maybe a Fixes:
> tag is warranted.

To clarify: it is the lack of optimization in certain configs (-Os,
CLIPPY=3D1...) as well as possibly certain code patterns that may
trigger it, not that the calls were faulty (note that `always` doesn't
guarantee it either anyway).

Daniel suggested Fixes in #0 -- if any of these trigger a build error
(like the `Bounded` one), then yeah. Cc: stable@ too.

Thanks!

Cheers,
Miguel

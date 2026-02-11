Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C6F244186
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770816433; cv=pass; b=OPTlfWYKQ6sisUDENTUf9rbmy2SiNAjBUu4LjG+6ujNqyd/GnMoqgqJ+31lmE46lZv7/ABjPpAJWiiUczpGaCvgZIg1ZvzTRG2+ka8pWS81FkiUb7DhdaDzPUu6S1IOOZW6MPP9unHMIE0tlJPkkZUm0jztNJKNASzQo1u6nhnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770816433; c=relaxed/simple;
	bh=4FDrHCkVWXS/VwYkhc6RadyjTesUf/W239JfUi/CFQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nB1RwWZFyPTGz9OFQZ4Dm0WhUynvay88ASRL5RZHUovCCbx/kC91QHmgCnPycwsnykG3NIHR316XOY4o98+k4MYfhVsDSltMFG6BGliONIJAWpeKsqpC5j9zJN3gER34RLODAOTs5OlerGI63GuyjYk8kxwRGa3fGQiTTJ9+ExA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnsteEVk; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnsteEVk"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba4f9df1b4so206786eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 05:27:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770816432; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4OSZTKmOkFxx5H9r8zXHMB9qBQwsgXouR9wUwEiLX57BvIpiYcTv/Z7W3fq7PRe69
         J+BJCLPSX3Z/uYszid75TpKSBixNy+tk3zfQ7yMPc9q6M5DAJlEjuQ2mtSyWsBe4d1Qr
         VtL+FEqERETUpHDItHAw1eZtd9WqKhvkjqpRNHU3MgZtlEo0lh4WINfQ4Hf6+VwBHfo8
         2ZJX1kzdR9TFP2heIVQglUOa8Fnl2veuUM1284M8bTm6UiDybRvntfQXWw11Z8R5yRas
         qJSws+oxEBsVJp4+jnWfo6DOUu/1owddjm7VkovnwLb3WAdqThMQ7tV7HkMREGNlNCzz
         wCcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ydXgQTl/HrsorvtS7pbkIpZLZb4j7VznGUWQKvfye24=;
        fh=GcTVBIyUgCjJrfEDR+xiuQ/rUbpgNH6VkAjQR99a/Sc=;
        b=KsfzO4cjRe5heasNnb8PGglY44VsHwyX6mstaMnXn6QR/YNiIoyZtQU7KDc2f4YtQP
         XNaF6jLvCVOPwIIMMOdlPwd9JgfJbd3rex5wYZ6atlbOILYepDrDD5mGigFu9n61wybX
         8dTpzBi3vNwxbPi0ZWICLoWiQ6e9wXZamcVoAlprowjAgrpZLXXdfdRAVtMXDvoLnDwl
         osGniLMz9esv1GqRtoE8wnp6dclYAsiyG49eSuRZ7nDBvWA1BhiRjo3m8J3psQStL6xN
         Wmw7Ml27nztMXDhJJsdzTqj4ZveZRJcOVf4XQUzZ/paT93qFwID32H/nQHRiBpMNTljD
         0EIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770816432; x=1771421232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydXgQTl/HrsorvtS7pbkIpZLZb4j7VznGUWQKvfye24=;
        b=ZnsteEVk/50084WLn7LwpbafnELspFOTMI72fIbPrHewRyb11mP5NdBNRLucZWjU7Z
         mWcO3EUpDAHXCZxO5yIKcq+Je6IudP94EsLX5Y2n68lWVOdwwzQPosgpf0sL5VxgtkR+
         DIS9Lz8lllN3Om27ApJ4XZnZsQ6rBisG+Pb3vi4+hed+nZE/aJiHrA9yI+kJ26qq8Lu6
         +6+kPDcu/K/CkGDJjB68/VxVZmSeZBf4zOudOmKm6zal3Qwuy0i+CU03HvAUjIbjOfHN
         6lE6Jdh2dhN3KNEljxmwidNS+QxTXzVFMAvLkyz7teeVEW5fzTPmXZUjp1sTDuyMPEIY
         JnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770816432; x=1771421232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ydXgQTl/HrsorvtS7pbkIpZLZb4j7VznGUWQKvfye24=;
        b=hsSFPUoEo5RrdokUK3JPzpSdprKrCfx6qj0fr6SFcmiDaCrmyvw0oqzfvNsBxLSjfT
         WLyHpMCnQQOfsAliTH0JmDVw9euC1JlOb12gie7D0Ka8KYjOt7r7zSw1e9KTjJt116Cn
         aPDahU6ePY3sAlTv8itGcq5SVYPFJUfboxYiaaR0RkLTPgFfbs7XwC8CSu2qMEqHCjja
         wA/WMbaVirg7/M9Vp77WevdoAFID+Wf5z0Fd4XPjNfNzj444dLzlHLZd1pw1NaS7r5tO
         TIKAyW6UNSi2oz2cvxcpy0Bv/cIl5odLl2tguBqwXeiwo18tkDg3Vmv1NvbWuNEm41qE
         Ivxw==
X-Forwarded-Encrypted: i=1; AJvYcCVmaXpZ8iLINUIOncbFJwfy9mo/3yrMkwbBtDcc8eIVsfdL6qIU4v7PLgAvL8a5mB1U+jHbM+C7I0GJn0J6pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwoGKDfxrfNhkfqwcyuUa9+8X3JF0OzsqPojERTQeSSK5tPu5f
	saCQH1pRTIeiIUzGRXHGNxkbUwMaw6H7Lahzl+OYmtOj6okEjDore1xc74moeSKas1wzAtTmFQC
	YX+tPi9vPz0HIgyIvn1kvg5ifAfyt8y0=
X-Gm-Gg: AZuq6aLICokwltgrk5SEaa8VVePtr3u8XjglIj64dWcwsK4sAxVT9vhicz1qrurk1IP
	3M/Rmgyd7yb3WrE4i3VWdgzA9fHH+2HxbzUMUWwWvwDK64f1HkZ6slfwjlQeC7M/LxGKBO0sXKG
	yIIXSM5e4mT2xtJTpZThjBvLtjB/+SCb1u2/8OgkZk8Rty4S2jO7I1ickJ8QbeDKm6h2LPWE33V
	WKCwjsAB8S14FruZD7nPhmb/O3EvGlTHF7ELfUsi6lz8PIP3el43GI+kOefqGjWrR3XBVPAgr97
	NNGQ10EmFZbfAQwysG/fXCkV5hk3M3zpqDMGdU10EWlrk7FNb/zyh58e/MI8lj5ZeaC9K2aGMnt
	dBL8m4X3sFCPcaa/g37fvxL7/
X-Received: by 2002:a05:7300:7c0f:b0:2b7:3678:2d1a with SMTP id
 5a478bee46e88-2ba9e160d88mr408678eec.6.1770816431570; Wed, 11 Feb 2026
 05:27:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-fd-leak-v1-1-945577813b20@kernel.org>
 <CANiq72=+2s48M5imZ7tZj-0SN==f_mLmw_2cWfQYKtBhD1ROCA@mail.gmail.com> <CAJ-ks9kps0L-VenCoHdYuTvRphe7-dk75koutbiRfNUKGi5zjA@mail.gmail.com>
In-Reply-To: <CAJ-ks9kps0L-VenCoHdYuTvRphe7-dk75koutbiRfNUKGi5zjA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Feb 2026 14:26:58 +0100
X-Gm-Features: AZwV_Qjw77-MwLOLcUdccsuyFc9ezvElnVTszg7lVmI6AHWii4FLt9UmkdDWYxE
Message-ID: <CANiq72n3OzakTkdWPhxS_nTAtN-9ddeaE3iNcGLnKfqV_4rgnQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: avoid FD leak
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 2:39=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> I'm not sure how CPython could close the FD immediately - it would
> require the GC to run, at least? Anyway, agree with you below:

At least it looked to be immediately closed from a quick test I did.

I assume it knows because the temporary goes away and thus the
refcount goes to zero, without needing a GC run:

  https://docs.python.org/3/reference/datamodel.html

> Thanks for reviewing!

You're welcome!

Cheers,
Miguel

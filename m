Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAA115ADB4
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 22:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567302; cv=none; b=nCyIDmsZ6HWqPIFkP+GESxLoMTUl7R9cwl/3y7BRVBWTGdMrNcGONA59+P/7Yqgm4AOuBtauciyEuh6tWaIiEPW7Y+qkt5jZgnK5GkfyR5boGsdeEuj9Fr1fzwouivPRkNpPPmhwlAEKi6tae6YDM7oBM6jTqxVQQjmBQNeZ3ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567302; c=relaxed/simple;
	bh=RGfrK/i8CqdIsUAM6F5jajU+/3DORxQP/tQIjwYyhfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cy8Bv11Wk/QZ538lc7L1xx+SjJfGnkZ96pxt7HAYOtTL2zr0JfK6wUZLZlQhPBjdXzoexkQv2pDM9V9CbHojeURn49bp7rU3JJeNmYnH2kldGjpF5Hgo9K2PHQnP6eK0U+A6xbG00F+Y4qxY3lLJi5EHqt3KJJpuZ9+dQcPBlyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzzVBXrJ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzzVBXrJ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c46d4a02ff6so20486a12.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 14:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567300; x=1768172100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGfrK/i8CqdIsUAM6F5jajU+/3DORxQP/tQIjwYyhfI=;
        b=gzzVBXrJF+a5wVtfPszObhKRfo/sEPKgSqF7n7qUqg/2BZBWl9sBqaj6TrhgSNmVGy
         KTF7pKB+BT4U6yLig1K4bIsZUgPBKliviDu0AGvYjuSU021oBcweHIp9yA3B+UWHki9k
         JOlZYvSHYLxS4eUlcmSo79YSeevEfox55Dpwuu2omz0MHXWeKXX3K7fW2uutjck0ACAr
         EaGTs614kSA5hRjQ+WMiuk0bKMJQUL9yDXrlBQgGVSbSTUm1ZLpVvLjjuPxjvyPQ70hE
         K8NAjUEUz+fv7c/in/sBgMKfyeMo/njE+DNnk8bwuX4ruWVpbxC8DYf0/F3emzGKAydx
         XuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567300; x=1768172100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RGfrK/i8CqdIsUAM6F5jajU+/3DORxQP/tQIjwYyhfI=;
        b=JYQ2dtvSBRygxga5okN6OLZh0byyNSCDli68guldlRl5jadujXV2fJLsKbtCvagbvY
         3GUgg594OiDg2I6KfvAYYGPlFvf+l/nYaBZnGnYzE3Pp3s80sVc7DprRPq/TXHrza6zY
         crse8ajoXoVS5xfqpAQue1tZY2WfanLml+1aSfBDDaV6rkQamDZvbuLUwJjGhF76MRlc
         UcpGQpHln7pmJw8rvbyWYO1sNk8I36m3IS1AgdJtgeRrNEsvWxV0tgh65dQozYlsjGU4
         GGWlxAy1N7D2DPUHDMNijnzxoS+ARiEyPn/fgNNknSmwIdeunbqIwe51tcRbsNdVrPzD
         0Ygw==
X-Forwarded-Encrypted: i=1; AJvYcCV22+9ZMai6hjkMTm/kDk6QbIXkFms7e9GahxQ9Ud5k6WEoDomCgpQ9XkhuhMjjyc3FZyZJlPuEeatsxNPGuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv5OVS98s6zpDppGs3Rc4vpIRMexueKo3Ye8/KNgXBmuYO3+Tx
	8lOdZqKwd/jIEsTAEgFaQ+lyxeM/ArzRF4rpVKStqUcR9amVD12JNs7zBtf3QeYrkGHJxUX3uF3
	7sj6C4EbMhhau+x+/8PRvgmMQUkGu4QI=
X-Gm-Gg: AY/fxX4hCTMHVnK+QQ8qaEkz9LjxRYElEUmvJhY7TMOMP3UPc0mYL3DfJ8+kGCEswQo
	falgaGHzFBoQDC7LqE/Rn2TaaenO0ugKD5eVtbZcA1mpnXeMfJaHoK+tGNoOjk7civ3psan2jej
	vOJGGM1VkA6D+6jyUs4UIX0+bP2S5p2uZz+0ly2c5dRkiETx05iSnLRonIRceL2G0qoMcD6DDs4
	1GDewpwkOd4O1bptwsLCrqAktM7LmRDtCYt7MaIFOfrAfXTa8z0Dd2C3lsqUUxZgJBI4Dp7ufWw
	tO8LQHAZ4BWFggSgTFfpNDEyOYzNk0Lr9Qef+Ur+ErfZA6vGyOyMlGTu8qw/BdvhCuXQXFaVoWj
	HsFC+1+rfPgrb
X-Google-Smtp-Source: AGHT+IGfdV3n2immeToIA2HtCjHHk7VCHJdSyBxh60KZPa7f2BlaejcNt7HViaI/dg1w225H/hp/37Uwl1/GBo8Hpbs=
X-Received: by 2002:a05:7300:724d:b0:2ae:5b23:1601 with SMTP id
 5a478bee46e88-2b05ea108fdmr23605192eec.0.1767567299771; Sun, 04 Jan 2026
 14:54:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211182208.2791025-1-gary@kernel.org>
In-Reply-To: <20251211182208.2791025-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 23:54:47 +0100
X-Gm-Features: AQt7F2oeBjY-zPeIIX8N3i0q9UZLwGEO153tgkFaokPfbh-tOwBHelwXkLfnOCE
Message-ID: <CANiq72mUR8NkymK4ZLs1Ejy5Kk6ZxCRBLd=-3UCUGjWSnDfJ9A@mail.gmail.com>
Subject: Re: [PATCH] rust: fix off-by-one line number in rustdoc tests
To: Gary Guo <gary@garyguo.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 7:22=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> When the `#![allow]` line was added, the doctest line number anchor
> isn't updated which causes the line number printed in kunit test to be
> off-by-one.
>
> Fixes: ab844cf32058 ("rust: allow `unreachable_pub` for doctests")
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel

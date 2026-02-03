Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF102D47EF;
	Tue,  3 Feb 2026 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131329; cv=none; b=dUBcE8UPF3oh1Q8GFt0mn8UvYdKqwS8hwSjG5qe7TrICKoG/ieHvfVAqV4T6GRVVrkCF4Kwi1drW8CByLb+5zZiPKbr2sKMYOR3/cgSrskpyKI/Q9E675RyomU9Xv7sGf+hnwiR959rqW2WnAYuvyoCQ1GXwtZ2Ht2U08eveZuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131329; c=relaxed/simple;
	bh=8HScTAY3H4SHB2hD4B/A5OkaVfpVOaS1ffNmLu8ZVtw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjgixalJpECJztjAxsgl0D6UD0GO7r4tOZpz1OjIrnbK2eI1z5Ar8NQtfaJnJh9vhlK4M8wrMqldUWnPyX2aXcjEU9nRnVlaVKZTXDw0NF4Ce4TWZqbue5XsPO82o1IZxnOi8c44sAVkIwTPKPcnmskDCJ5eKhN4aQ5+qq+19VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=EBKUa2Bh; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="EBKUa2Bh"
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:eaca:0:640:4fc0:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id 05524C1AF8;
	Tue, 03 Feb 2026 18:02:46 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id c2qrbAEHxKo0-ctWBflKb;
	Tue, 03 Feb 2026 18:02:44 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1770130965;
	bh=8HScTAY3H4SHB2hD4B/A5OkaVfpVOaS1ffNmLu8ZVtw=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=EBKUa2BhdK14byadQrg9kHXuNt00bIm/Z/gHbkdaCjZgQ6yeiC7iruZenfequBTp+
	 +LgYElZtV3xR9Z1Ssl9u9u72DpeP8BNDhYz1HKjzFR+ZAkRYIuTJC5gv0LHO6XOHqw
	 udUl5gSIMUnnfYcT0iOEQXHz0Qwqe3GTmCmd0f8w=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 3 Feb 2026 18:02:36 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, felipe_life@live.com,
 daniel@sedlak.dev, thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/7] rust: add C wrappers for ww_mutex inline
 functions
Message-ID: <20260203180236.13323563@nimda>
In-Reply-To: <45626ED1-9684-4FA0-8AB6-FFBB0D2BA2FE@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev>
	<20260103073554.34855-2-work@onurozkan.dev>
	<45626ED1-9684-4FA0-8AB6-FFBB0D2BA2FE@collabora.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Feb 2026 10:45:12 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> Hi Onur,
>=20
> Sorry for the delay, I=E2=80=99m finally getting back to this series.
>=20

No worries, thanks for looking on this.

>=20
> > On 3 Jan 2026, at 04:35, Onur =C3=96zkan <work@onurozkan.dev> wrote:
> >=20
> > Some of the kernel's `ww_mutex` functions are implemented as
> > `static inline`, so they are inaccessible from Rust as bindgen
> > can't generate code on them. This patch provides C function wrappers
> > around these inline implementations, so bindgen can see them and
> > generate the corresponding Rust code.
> >=20
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
>=20
> My comment remains the same as v8 [0]: did you forget to pick up
> tags? There=E2=80=99s an r-b here in v7 [1].
>=20
> Or perhaps I=E2=80=99m missing something?
>=20

I didn't forget, the patch in this file is changed since that (see
__rust_helper prefixes).

Regards,
Onur

> =E2=80=94 Daniel
>=20
> [0]:
> https://lore.kernel.org/rust-for-linux/2F879792-3C12-4C8F-8EF1-122F44EF2B=
19@collabora.com/
> [1]:
> https://lore.kernel.org/rust-for-linux/34A2E775-A47E-4D4E-A292-E12489F079=
87@collabora.com/
>=20
>=20


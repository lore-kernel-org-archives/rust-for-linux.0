Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444C54EDD7D;
	Thu,  8 Jan 2026 14:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881094; cv=none; b=SDYC7DPZd39+uJQFwjh4M+4rpiCRmwBe5PuoPezjNvfLA2qGsFex51KCOzsuIJjK6LGxUZis4mOAr0GjSFUFgHJXyPGqjLpw28kvDsDjLu0bEL/b46SDVYPBiV8J4QmoG5UwzfmqoEaFFehOufn500tZG1mUhD0k9TV3wifSo3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881094; c=relaxed/simple;
	bh=utmwlFXqyEv1hXTpYLd0w4Ku9GwrVsNL0pg8+VpDlkk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M7SnawF4qUulaeSDTmz/Uu2/1b4ghjc4JdevbikD9FJl5ok0qzN1onClFREepsul2zKp3sO6+cUqKqTynBwzDjGdmnmzMCbTPQoF0QQf8OcVPw2zSF2wSIaWVjxPuNCLf6WcGzRaIADS7kSrwUKGInYyvydTAxywR+m6YfqTPys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=fRzKcHa+; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="fRzKcHa+"
Received: from mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:4c9f:0:640:5657:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 257E580AA5;
	Thu, 08 Jan 2026 16:55:06 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id tsOZjXGG7Cg0-YSMBrny0;
	Thu, 08 Jan 2026 16:55:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767880505;
	bh=+R0zZF94KWeQC5VeLUPax9jkdKWz8l2bNUh9KHMr3Ao=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=fRzKcHa+oyPQ6pdPwfejuXAblXTF9l9NP3J9PePq1dezOvW9gMMWaSEFruDuuNDf7
	 afX/lWt2On7wYZ0iy87FeWc4sUVpdYhAZokZb73yoVdUvWLNfO4eL9lkijKU3qlU6P
	 ylmolQzAwkkRKN5SvOtq48tqTKb4qNNlKCDrhgpU=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 8 Jan 2026 16:54:53 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Gary
 Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, "=?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] scripts: atomic: check for argument in
 gen-rust-atomic-helpers.sh
Message-ID: <20260108165453.54679b9a@nimda>
In-Reply-To: <20260108-gen-rust-atomic-helpers-msg-v1-1-d895a9667148@google.com>
References: <20260108-gen-rust-atomic-helpers-msg-v1-1-d895a9667148@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 08 Jan 2026 13:08:57 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> Currently, running `scripts/atomic/gen-rust-atomic-helpers.sh` without
> arguments results in a broken header file and grep errors:
>=20
>     $ scripts/atomic/gen-rust-atomic-helpers.sh
>     grep: : No such file or directory
>     grep: : No such file or directory
>=20
> The user may do this to re-generate the Rust helpers, not realizing
> that they called the wrong script [1]. In this scenario, point the
> user to `scripts/atomic/gen-atomics.sh` instead of failing in a
> cryptic way.
>=20
>     $ scripts/atomic/gen-rust-atomic-helpers.sh
>     call scripts/atomic/gen-atomics.sh instead
>=20
> Link:
> https://lore.kernel.org/r/CAH5fLghgm2pPdKen2rv6MeSXAYG_j_eCqvM0b=3DVbTbUM=
9eswKg@mail.gmail.com
> Signed-off-by: Alice Ryhl <aliceryhl@google.com> ---
>  scripts/atomic/gen-rust-atomic-helpers.sh | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/scripts/atomic/gen-rust-atomic-helpers.sh
> b/scripts/atomic/gen-rust-atomic-helpers.sh index
> 45b1e100ed7c63108ee6cb07e48a17668f860d47..1c76f8ae731de9ac069d489469b0383=
f256b1539
> 100755 --- a/scripts/atomic/gen-rust-atomic-helpers.sh +++
> b/scripts/atomic/gen-rust-atomic-helpers.sh @@ -5,6 +5,11 @@
> ATOMICDIR=3D$(dirname $0)=20
>  . ${ATOMICDIR}/atomic-tbl.sh
> =20
> +if [ -z "$1" ]; then
> +	echo "call scripts/atomic/gen-atomics.sh instead" >&2
> +	exit 1
> +fi
> +
>  #gen_proto_order_variant(meta, pfx, name, sfx, order, atomic, int,
> arg...) gen_proto_order_variant()
>  {
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260108-gen-rust-atomic-helpers-msg-3943461645fb
>=20
> Best regards,

Makes sense.

Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>

thanks,
Onur

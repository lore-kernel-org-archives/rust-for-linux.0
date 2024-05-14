Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6AB365
	for <rust-for-linux@vger.kernel.org>; Tue, 14 May 2024 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715704278; cv=none; b=V/VU82/N4Qcs3DOf7u4usgPvMJrjHfNgcMRtVV5voT9Sa9q4vhKcpXipeVJs/zDaognWUo/jrnejd2HqEoDfwXRT1G92qaznQ6YuhfLRzRftfRjALi09PyMKuNZUVGNG+Akh9N75cgJsOxd68dz6EAvccZBTRTSY5WuziVFRSrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715704278; c=relaxed/simple;
	bh=4CRFRGZcu8b8aSLPszU557O0Bty6xfyp0S2T4/rC4Go=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Dm2w7o2DVmSdZGySnlvcYSKUYPL8fO7rh+Gw1aDhdnX2+TRvM/t0N5aig4XRGOpoIoB/hmSaCDWtRKS68ctytWhdSpt8+scriuEOMqGXG83INkjXIqR+jKmjFuIwkDyefAFGFw5MLdG7K/rI3hQlqbEsvHkU/uNQdZE8CHmTrKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZL8Ne1FT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WQok4ld7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZL8Ne1FT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WQok4ld7"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715704273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rDhRML4PY+/QyVq4+7dFvy1WvktE18n/YkWmhlEmxB8=;
	b=ZL8Ne1FTXcTRVL/71jyv9PiWzcvOubzbIQo4pjAFUBueyupjbM6+6OZhxIc7Th8pmxo3NX
	6e9Hq3aaHsPIIGsUZJ6yxwvBwoqRpkXgTBPmUhhKi4sqgV1yL/blV5ngYcr5iUuDjha9BD
	W9PpzdcOWt1a2dDB9AQQT+2QmrDcRmrIDSigerlGDdqHK/a83xZvSuFkc05i5q99MRmvlt
	aLhWCOWlO5Q0I1ImJW+bOJT33Ctxv01UD+MdcpQvZ0dKew63tFKs9rdEgOrQ/fNzs3PXdO
	ppGIPeLfj0wAT8Lzc23i9gXJ0QRVJEhd3EXY4ipOqKAzKWR7eqHPoQcK/TgsfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715704273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rDhRML4PY+/QyVq4+7dFvy1WvktE18n/YkWmhlEmxB8=;
	b=WQok4ld7B0B9Li8vwrVV3VualR8VN85cYseWXD7iHpTHDfABlC3UtAL3Wc2QgkfkkCU9Al
	LiAXqflZR98bJPAQ==
To: Sergio =?utf-8?Q?Gonz=C3=A1lez?= Collado <sergio.collado@gmail.com>,
 Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson
 Almeida Filho <wedsonaf@gmail.com>
Cc: David Rheinsberg <david@readahead.eu>, John Baublitz
 <john.m.baublitz@gmail.com>, Danilo Krummrich <danilokrummrich@yahoo.de>,
 x86@kernel.org, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <benno.lossin@proton.me>, Andreas Hindborg
 <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org, Sergio =?utf-8?Q?Gonz=C3=A1lez?= Collado
 <sergio.collado@gmail.com>
Subject: Re: [PATCH] Add room for insn-enconding and symbol name
In-Reply-To: <20240414180929.79033-1-sergio.collado@gmail.com>
References: <20240414180929.79033-1-sergio.collado@gmail.com>
Date: Tue, 14 May 2024 18:31:13 +0200
Message-ID: <87seykl5im.ffs@tglx>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sergio!

On Sun, Apr 14 2024 at 20:09, Sergio Gonz=C3=A1lez Collado wrote:

Please read through Documentation/process/maintainers-tip.rst. It
explains details about how change logs and patch subjects should be
written.

> The longest length of a symbol (KSYM_NAME_LEN) was increased to 512
> in the reference [1]. This patch adds room for insn-encoding and a
> symbol name, as proposed in [2]

This is really not a good explanation. The changelog wants to be self
contained and explain the problem to be solved. Having to follow random
archive links to get an explanation is just painful. The links can only
serve as additional material.

> [1] https://lore.kernel.org/lkml/20220802015052.10452-6-ojeda@kernel.org/
> [2] https://lore.kernel.org/lkml/16641a56-9139-4396-a5a8-89606bedd1f1@app=
.fastmail.com/
>
> Signed-off-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
> ---
>  arch/x86/tools/insn_decoder_test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/tools/insn_decoder_test.c b/arch/x86/tools/insn_dec=
oder_test.c
> index 472540aeabc2..add51bfc2260 100644
> --- a/arch/x86/tools/insn_decoder_test.c
> +++ b/arch/x86/tools/insn_decoder_test.c
> @@ -10,6 +10,7 @@
>  #include <assert.h>
>  #include <unistd.h>
>  #include <stdarg.h>
> +#include <linux/kallsym.h>

Please put a newline between the existing includes and the linux
prefixed one.

>  #define unlikely(cond) (cond)
>=20=20
> @@ -106,7 +107,7 @@ static void parse_args(int argc, char **argv)
>  	}
>  }
>=20=20
> -#define BUFSIZE 256
> +#define BUFSIZE (256 + KSYM_NAME_LEN)

What's the rationale here?

256 + KSYM_NAME_LEN is as arbitrary as defining the buffer size to
4096, i.e. it's a number pulled out of thin air.

If you really want to make this code resilent against future line length
changes then the obvious thing to do is:

static char *update_buf(char *buf, ssize_t size)
{
	buf =3D realloc(buf, size);
        if (!buf) {
        	complain();
        	exit(9);
	}
}

main()
{
	char *buffer =3D NULL, *sym =3D NULL, *copy =3D NULL;
	ssize_t size =3D 256, oldsize =3D 0, len;

	for (len =3D getline(&buffer, &size, stdin); len > 0;
             len =3D getline(&buffer, &size, stdin) {
        	if (size !=3D oldsize) {
              		update_buf(sym, size);
			update_buf(copy, size);
		}
                buffer[len - 1] =3D '\0';
                ...
        }
        if (errno)
        	complain(errno);

	free(buffer);
        free(sym);
        free(copy);
        ...

No?

Thanks,

        tglx

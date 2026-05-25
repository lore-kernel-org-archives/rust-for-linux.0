Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FE3214A84
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 18:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779733027; cv=pass; b=RPF57p3HQboTc5zsnsL8tBDmwsWpk2tHOTVgZGI26TqbSYQOzx93JdP1CtLCZ2O+XvA9Zh00G7X9XyXoBFJ5zbkiLQRSd2Ot652l+f9lrJ1uQpLn/TPx2GnmFmIq0c/yLw1t/r/X9INy4o8Ac3Mqe76MLOHhFxGKI0Sha2gA8dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779733027; c=relaxed/simple;
	bh=N/2UctasxdczuvHkDvPIxcGMO1uUr3Chr5Ej1C66Qh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppq2n1RccEVkzE+DG4xLyJmJNlB0CqBhxQY4UswLkHwfcWZowJZ1PUkNE27+SLllk/1cXDOpFzaaYZi6smqDyM6ZcyRrW33wu//gAaHPmXGWqHbu+k2rAz6fxYw/CSLaSmZxrget1ZgROFkvQbVuOVWlrwrbtPBWG/POI85p45M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW1y6/+5; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW1y6/+5"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ee34d7e55aso1137999eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 11:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779733025; cv=none;
        d=google.com; s=arc-20240605;
        b=FgY7b/lXGVH5xKOzT4MLxIkm0OscgE5XbMF4rt2bYeT2mGRcbOMd1Kgh/ApG/ti130
         W5BOSS4gTYgwPnrEqyhve4p0v3ePSrJNJBtt1RRy5Pf0dA74CBBeSSlxki5mGm22Ihfd
         J0/dfIoxtvkUgU4kC2eKRqwazokacPgYICGCGH13jtucbow3J/LAVC49/dRecHoQE1As
         oQm+EnWY0UkIJ647NCOe7U/k4zR0XRzObZ7xzcpr5BCxWaNFQ5jyeJvoQZJMQYMC1Hzb
         X12oJBIUAENW4S4DEChZjjsIRPI0gYkJcolpBN79UwnZu0wqmQOykd7doYKAuLJmd28W
         yBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N/2UctasxdczuvHkDvPIxcGMO1uUr3Chr5Ej1C66Qh8=;
        fh=wbQkgBOeM3lBkeQrEsNgGkw/KcdCXzXtK6txhh7TqMI=;
        b=Qw6Atk47g3ZhPpjxw5hdzmqcYVGXiWcKDWUExbZJf1xZ8rKp3qh2rUsnwAh8RDF0QL
         eDm3zVMmLyJfzyqhdKNHs2r9zSywF0xQ8opvjZciSKd2bax+AHz9hhQ/Wd1bZbzsHPU0
         d2C26pwp3Gr2Q9pi63IPKxYsnmVd68jAqhN0dWBVObXqGHZLOddF0hSlOcmEIdEt26Fp
         hZM85DGsoMZGcL8apAyxKDsBQ4AE+wADF1mTXoe3/vmj5JQbgnbFaTO8wrwgRTsN0dwS
         344v1qjna/7bjlGgzYa1ILPgDE/yXCOaXofzoyzOQRavNEGa/R1JKUZycldBdwJHn/IK
         7VHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779733025; x=1780337825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/2UctasxdczuvHkDvPIxcGMO1uUr3Chr5Ej1C66Qh8=;
        b=YW1y6/+5X1gQ0fmhzFbLoKSKnDZZ+zd5l+U/GUbS7ujLtJg3G15cASdS0hNlrq2vzZ
         0GYeGbTnvXk9KJmfMJSHqtRCRyZ0mV48BPcgkWtCC8gUv6AjPDGqz5OaiY7aiC9j1o43
         2zJlSSY9frtF2mECUzdabNZ2DP/yf4oddkcfS2BXEZ+jY6HsgcLeE/r8GxVKc/mJNDj1
         rghLg7o0sWF1kTIw7E5fSUtoFxXKpjlLhbaxcYjo/1ywu4ZYyKX4aMIZZ3cwGsEnvlz0
         u4P9rYO5EdWsd4exmIf9jMBPsrTDKk+VczDijQU0jFjegoEs2e/6u54PUXOMlx89zwOO
         EMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779733025; x=1780337825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/2UctasxdczuvHkDvPIxcGMO1uUr3Chr5Ej1C66Qh8=;
        b=bM5isVhppDeWGITSfVfBaPq2ZurRZBiSZN7sZ2U7Og43U7KiZ6Qbk2tSh45OflKmV9
         iqF7/HbSSOW4hBGRCuflCG83/q18YntZkkZnGpIIg011R4cIp/ypSikuNiC3NtTaHJDG
         i2uGp+DLFg3svmJ+MFLwWWkKd3elP524ccWnmLDGrPoqOIe1E0Z4IyU8revtwiyc4+su
         G7sjc+XOTAlXzQB9MLwj9ViA2ulwyMIbAmmkaT97Wrvd6PV1XEoLXlldZXuS5GgJNpeC
         Aj/ms0xm0TyHgWD09Ulz/fCua1+lk7GxRYDZTyZmA4cVvAib3nrQpJs+45QriKY3M4+u
         CMag==
X-Forwarded-Encrypted: i=1; AFNElJ/DUPGcXAa3pIOmEtPHXkmIxIFJeSC3Y61DynSr9XbtHaDftQa2zRrKbn04+VETsCJgmMYSTGIhJ7CBDBkegQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7EnA76jZcjvRQ2CRyYeeBFnM8Pugszpwn/97PAKCMkJsp4Qr+
	3oJQSMxo3eKMod+5jGrgvXIwlmToXftB05IYNZZozrZ6dn1dIIyqLnqLetK3amQy41cCUsxblzz
	KbvZ2mjT0lIOxEN6P+1jWjXJJUVss8N0=
X-Gm-Gg: Acq92OHJ5e3uyvHLzW7OMwwNySH/efHgvvUj1bh31apLiFrm9D5Lm9TpXnFeM7D5b/N
	mlVUYlDMsVZdT4nwaE6BzuiBQjQroGP6T1jFlloDzdvZ17ddkniEJ9jncpeNGKAEi3lqSZ4bza2
	hihzepCWYW0F2zPF3DcZyw5dPB2uKJfYU5vRjZUJ/DlCdRlmczocZqPFQvjfOJosLU+e1f5F3WK
	9WXZBBG57pexAXGKO96FwupHVgUDU2LSAMbasagoMqKL0z1vMA0XhMrpNYBWV9G5rX7o3rju6Gc
	qoMDlbaAPb4A5TIZK+vZ6a1wpmbx8nJosF9IWll6FNBHJV7KKbK8JWHOiNv8oRKCtbvlvn+Z+tZ
	XMdT0UAuCYgb0Z/QdLqUcamU=
X-Received: by 2002:a05:7301:2c89:b0:2ce:db5e:354b with SMTP id
 5a478bee46e88-3044912c779mr3218270eec.6.1779733025318; Mon, 25 May 2026
 11:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520064630.1785283-1-mkchauras@gmail.com> <20260520064630.1785283-5-mkchauras@gmail.com>
In-Reply-To: <20260520064630.1785283-5-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 20:16:53 +0200
X-Gm-Features: AVHnY4KNP2Nl2JQ1LBLJOr_gMKPZJcSjALxmqaPRFB0APLpX2lXytJLQunJepAg
Message-ID: <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, 
	kees@kernel.org, lyude@redhat.com, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 8:48=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> Minimum `rustc` version required for powerpc is 1.95 as some critical
> features required for compiling rust code for kernel are not there.

Which critical features?

> For example Stable inline asm support which got merged in 1.95.

It is not needed that the support is stable, but rather that
everything you may need works.

From a quick test (with a dummy example that may not be
representative), ppc64 inline assembly seems to work for a long time,
way before Rust 1.95.

So, which is the actual version that it is needed? i.e. 1.95.0 doesn't
seem to be required at least due to that.

That is why I am asking about the critical features above, because it
may be that this works since earlier versions.

(I wonder if this patch and s390's similar one influenced each other?)

Thanks!

Cheers,
Miguel

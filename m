Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABC529D277
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 21:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759258; cv=pass; b=LacnWPZtXqFYSZB8kaFg5vwTF6l1oj5sEZHrx5WLJh22yDTzTy0+5wy5i4eNvXAwytuRjhNRp7eJGr3yHU+MuC+qFq4XyVbJYVRvtkbTVk3oc1bhoRdn94GhsEWpt66O4DceeMZXQhoI1ZRnMZDkXgTCq4sZOam8Qk0dDR7H3hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759258; c=relaxed/simple;
	bh=hBUgcVLyV11rqBwx714uSaH49HmuWIg+mpTyGJSCg60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7WCEhQ9b3TB8LuxUrOWGvzGGzlRqGuQhrkOLMlwPlKtvV9RK0YgOtYRQC3p1OcBteO3lbOWU+hMO3nxD0C1mOeYlushmBON3U+GpOo7+PMT9AHe00U5VBzNqBTFC4U9l7WJVg4Etse95x+B7pFNxyv+hkI8fj6xm4lHenS4e/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=InlR1B89; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="InlR1B89"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4832701b9b7so25532655e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 13:34:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770759255; cv=none;
        d=google.com; s=arc-20240605;
        b=izZ482laxt/0n4t0fKN3grQggedjRIMKft0IptrBbIRQpn3l234j2vbMGQHUsNAB6z
         sZplJjwlPfzqKEGUOF7jZsToc7YOF2sT12PWGQ3fZPfwhm5+PjjOxy0eHr5RiRchP7V+
         LqDd9OIZAaCdXdlnjj23XHrcnTDWIsUsv90CmOwiTHB433tZ8qXcfayHW2enzJqI4urm
         6PgsjEn2VynSkE73wuWqxWy5IdSVFCg6w8ymGoXC+gw6bKONpKeo2BR9OyKc0Ctgh6MP
         NZ+sFh3y0a4mYMGE4jiCey5W8nSlpWL+k7WXlmH5hnjQCnfDkcr9EEuIF8aK2V9+hPkA
         jHkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hBUgcVLyV11rqBwx714uSaH49HmuWIg+mpTyGJSCg60=;
        fh=HYXWxnuurwWZj/QvMytalZba6Rnr3nO/PixpUIIpWZE=;
        b=Y+YOFimsT8JWqu2nigME7/4SBQ93G4PkW8OadfH9L9IPy2Y9QwrVfhcORYX5ZlcAzC
         U+CRCUZMXRckyLaxnRJsgv9gby0aCEBggKXBwmmWUv7pUrRhM9XyXzdOMOek0yaCxSrk
         lDzjqA0ueWOyktj94CB4RzCJ4k0M9kUB3RZHtbNcfUDU0Adkl9fbdzdT/neRNW3Pv72x
         PXIkA8OMpiVJXVbdGbOaQxsFzYYEu0jZ8sTSxnCwVQZzE80jDejrhZ+UzRj2nIgtUmqR
         1VC8kFntkagxAoWFeieq9KXOenzegVjAqCwUsl+PQo9cuu5wY0F06MtHnqnuHr91arbf
         5+Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770759255; x=1771364055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBUgcVLyV11rqBwx714uSaH49HmuWIg+mpTyGJSCg60=;
        b=InlR1B89WjAx/ACmQYhCFA+R/iVuRJTFMJj4nWbj2GZ9UV8TXKt17y5JhFdCkOGNIh
         xpunYXFasbiK/YrCNRjuRhYBaVfPsNUTYBd1+BIHFI6PTYlj/7laAq5KZlubIP0EBlld
         ZBNZUQloN4ahkE1KMfj7QJ/XY/E6t+L2VvY2RS30WtoPw2pThJQoip8lOd1QO7zS74/C
         xlVcNccuJZYxm51gk3wCurw1CEPbpBU/sxuVPuwvuILRNQj+/RtdeUSypXeBhMpXg1Iw
         kAm0UeXuxY7Qx7pQICH13BQNxfa9qelNO/GeZ7BIcrCusC0tVb0VJW1IN1PPWwL4kciP
         Em5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770759255; x=1771364055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hBUgcVLyV11rqBwx714uSaH49HmuWIg+mpTyGJSCg60=;
        b=nBfeI/eUJpk1/pVmGnBuwONQnFEqlRhHdl/m5FR7LWJW2EFc50pjE95Pg2Yl28H3Ce
         NW7vx1Gc/sNjAFNbOrPeDYa6WiPUaaUkeI9FQ+SFTqHGVYYNTHdy2HtuNEshRBN/cCl7
         riI9hrghMUPPMB3DgY97H1tf2AGzsoYMb04+5+VUx8hA92viQYzNjR5aHdDVEQ3Fnt7H
         2VL7DNvXFGSyJio6NstKIOzvbx2iJlO2JuPMpWmmqrIOoBbkNKey1oImDt+PaS/LgGcm
         a2qC/TbBXhUdub7J55p04PzXIFJOB10kgXlmWzossa2sDz8RDCAu79ADsVA7hr53bigg
         kXrg==
X-Forwarded-Encrypted: i=1; AJvYcCXAaXGYDbVXPaAmlryYI16W8KL94WMtR/e2IPOqcZP8Htzm8TbzrlsJL47msKjztRkaxD0M7NXAu/QevCDa4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+txbzEFFUhs+y7+JGdjEigizuqSB3Wsr3KmK5HxMRji/Y8ZAj
	P92GEpimCntA2Z8o0VI+VmVgz8LL9nASzTpqIi9FNs2G9yineeZq/BjInRlcN2GqpFtn+s2nM6+
	PG3uU4vVufk8Sa6eGctTtew6KMMXYl/5G1ll5mryX
X-Gm-Gg: AZuq6aJIddYXyyBLfm8OU/nGOZpmZFKwgy8ywf/9LsCcZHLPlbQlVVk1J/cT2mLspGO
	8JDJlb2aSvxEy2SVEI/zLd++iblWSodstWQDORsIv/qlKRhABFR328rC97hNLjOVPg2UuplDRSh
	gvKwjWp5+BYMY0sitBYBfSgQ+B6HEkpKg5+WCy5XhuJm5LAxFab9RCI1FMoOR68N/rCwmrAv+Zo
	gT3v7MRIU2zSXHvufvLtb7PTsxklQp990ijmArNUb3KBzzBN4OpN7E09DIBpRlpIJvgY4y/V7ML
	udvWbGpmwksT3yoJYOlSOIipTEsLsvejzoYBhw==
X-Received: by 2002:a05:600c:37cc:b0:476:d494:41d2 with SMTP id
 5b1f17b1804b1-4835b941188mr4236605e9.29.1770759255120; Tue, 10 Feb 2026
 13:34:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-5-f777c65b8ae2@kernel.org> <zqo3qcdqlrxnqxl63kqeuvdacpbbywdrcir2kfwh7j6zvbfuq5@wspy4e75axfz>
 <CAJ-ks9njGhT85pgUSahki989Y9vn3XOBNO5wxB8wE+KvbL00wA@mail.gmail.com>
 <6sd4numrxigibwynr2lfmtdj5uabggrx2l57igtjbnq4uwddrm@wipmwcmqbkjn> <CAJ-ks9knC3pKpiMaG6f3C1Kr6su9p26hM7YvVMzsVwYVHGtm2Q@mail.gmail.com>
In-Reply-To: <CAJ-ks9knC3pKpiMaG6f3C1Kr6su9p26hM7YvVMzsVwYVHGtm2Q@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Feb 2026 22:34:04 +0100
X-Gm-Features: AZwV_Qhr-YCHMLD4rSruxN4k-Vr0ksUt_3x_a0henm6mi-euQSTrj4jjyXJWnrg
Message-ID: <CAH5fLghKwNEdVeRi3H3LQ9NTPYprpAeY41-jgfq8YEST9PaGdw@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] rust: xarray: use `xas_load` instead of
 `xa_load` in `Guard::load`
To: Tamir Duberstein <tamird@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
	Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 10:23=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> On Tue, Feb 10, 2026 at 12:59=E2=80=AFPM Liam R. Howlett
> <Liam.Howlett@oracle.com> wrote:
> > Is this a temporary limitation?
>
> Maybe? I don't think RfL has good abstractions for RCU yet. For
> example, exposing load directly on the xarray using xa_load would
> require a way to guarantee that the returned pointer's target isn't
> being concurrently mutated (e.g. under the xarray lock). I'm not aware
> of anyone asking for this, though.

It's relatively easy to add an rcu-backed load using the RCU
abstractions we have today. I already shared an RFC containing such a
method for the maple tree, and it would not be much different for
xarray.
https://lore.kernel.org/all/20260116-rcu-box-v1-0-38ebfbcd53f0@google.com/

Alice

Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EFD364028
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 20:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172890; cv=none; b=BOyPOYymEF7Wom1hgnK+s2eiYTvgPrMsRpjRt5RCOUSiodYNZsiH041KnXhlLLZtPBki6wZy1xiw9EJ0+DQ1cPSKUrMfKLdi1OHijAtCmSq1N2sUABejMLwAOcLuLEV/zAHcdNylfzvdULvdNKkn+Dpt5CMi+vznLkPifuMmmOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172890; c=relaxed/simple;
	bh=8bbPXEMlkQcC+/HFMMdL0XRXp+/faAxt94KFN3uI6X0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gAeGXk1BZICdbFxByi9XOWOCiry8gzHjAFANIqFlNFvQXm9yeTtRXS6947MANO6qLHxbrh1AMui9VTywZ/89Ofa1Lzyn63jIdyzZych9q1f5OUEvA74ktaOaHv2j5L9zi8zVcf/pnw1rmWLbtYtWr+brxKc9bIRcnJq0FUpaZ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UMAg6QrU; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UMAg6QrU"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48535f4d5e1so26144775e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 13:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773172887; x=1773777687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fs+riCZult8rzbuRe4FFzM4OU8hFF7xnxVGqWo96vMk=;
        b=UMAg6QrUDGqf/7EXXjCcHkj/pW93B+DEaUbzVknGDu1KEt5pzDDHF4MSP23rsvNiu5
         TRagCgL16B8n213aFm4dhC4crYqy0frzU4cLM1Ko0YlUnnuVxUCFQD/k6Kwg2MtlCW9a
         PHarmA5ouV5PQ17PFpUDOo0ELZEoADEjJ7iuAQQpS6drqei+ZxGkzbUnGpiUWYBVpJSR
         Qnvrl15mEwWjQl1AOA9bdsrBwUwvf/+UeaKjpXaUqmmUCxjjKnFaIiaCx1ZQfhM0sBUt
         d3eFGLwCskMhr9hA+bnUdHbtwik+bwUl8p6cW9Pelk/f5Ib5QK5DmjYDkU0JCcGEfh8r
         8m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773172887; x=1773777687;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fs+riCZult8rzbuRe4FFzM4OU8hFF7xnxVGqWo96vMk=;
        b=N1vYC2WMEnyxyOYWWoJEM0OhzAASqvg1LpyEA1jmq24/a3vqxqxVXARpq0gqJr4mnE
         vwlnrebPwdhDLokU7JqeT7g5bk7DM5I2xOuIXnso95+PYOgyB/kNM/a1+UaTT85zX1/5
         IoHOAFjTOP3KVt46R1hHQbC0Ej3OI1IrWdjS86Gd6Dvp+V8gEDQPCJNbl1nIQnzJya2/
         DbTcQnOlXmoFLhrtxsKEeA8IGMhfng4rnUliWjIVmAF3uaqe3fM29tXFF46dNRnmE5w4
         3vi4tX4eYVbz6odfWmB+dfCPw7OveroqfT7tcOty1xUH6r6FEJNbNSGW2/tKDzcQOrZH
         pdZw==
X-Forwarded-Encrypted: i=1; AJvYcCX210gY9y3tD6AXqAEQ8b09zSNsoMfXEhxqdUkbBKPao9F3XWDyVpH7W1pxEfhUllyqto8ZBaapYAmzyMHjCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+XTavb7m2uhxaoBnkwvzSr4xhJGi+VpYVxb3ZX2fTcdLHL3m1
	hpFxXgiYVrTY/rfcOed0keX8tdOnHVhoTIGn7QeIEOwYG+tAL8vx47f43Jjyc839ibxzgKb+6uy
	bnQ0IPTpPuQqEml5KQA==
X-Received: from wmim17.prod.google.com ([2002:a7b:cb91:0:b0:485:2cfb:96e3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b16:b0:485:3ee1:eba5 with SMTP id 5b1f17b1804b1-4854b10ed0emr549635e9.27.1773172887011;
 Tue, 10 Mar 2026 13:01:27 -0700 (PDT)
Date: Tue, 10 Mar 2026 20:01:26 +0000
In-Reply-To: <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203224757.871729-1-ttabi@nvidia.com> <20260203224757.871729-3-ttabi@nvidia.com>
 <DGYIO09FC9VC.5DQNYP82VVFC@kernel.org> <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>
Message-ID: <abB4lswS6IubT644@google.com>
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "dakr@kernel.org" <dakr@kernel.org>, "gary@garyguo.net" <gary@garyguo.net>, 
	"mmaurer@google.com" <mmaurer@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 07:52:47PM +0000, Timur Tabi wrote:
> On Mon, 2026-03-09 at 20:59 +0100, Danilo Krummrich wrote:
>=20
> > > +=C2=A0=C2=A0=C2=A0 /// Low-level write from a raw pointer. Caller mu=
st ensure ptr is valid for `len` bytes.
> > > +=C2=A0=C2=A0=C2=A0 fn write_raw(&mut self, ptr: *const u8, len: usiz=
e) -> Result {
> >=20
> > The method has to be unsafe as the caller has to promise that ptr is in=
deed a
> > slice with len elements.
>=20
> Ok.
>=20
> > Another option would be to pass a fat pointer, i.e. *const [u8]. write_=
dma()
> > would then need to use ptr::slice_from_raw_parts() and the safety requi=
rement of
> > this function becomes that ptr simply has to be valid.
>=20
> So I tried this approach, but the end result was that write_raw() and wri=
te_slice() were practically
> identical.  At this point, why bother with write_raw() -- just have write=
_dma() call write_slice():
>=20
>         let src_ptr =3D unsafe { alloc.start_ptr().add(offset) };
>         let slice =3D unsafe { core::slice::from_raw_parts(src_ptr, count=
) };
>         self.write_slice(slice)
>=20
> I think this is better, but I wanted to get your opinion before I posted =
a v8 with this change.

Unfortunately, the creation of a reference into volatile memory is not
legal. Here, 'reference' includes slices. You can implement
`write_slice` in terms of `write_raw`, but the reverse will not work.

Alice

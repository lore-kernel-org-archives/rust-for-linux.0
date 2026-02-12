Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BED3451C8
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 11:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770895211; cv=pass; b=u40O9nZKRjt3CuyCzgbnrVT9VHrlWmLlGHqNGhHwPozM4JH9/VpjfbGwtzrZO/ZPDYiJvouO+tYza2U59eFSHtUDjuEUU19tMfKo8IoxzQGJQmue/LMTDUwDTsIzrgJo2hA4DKBKGwYUi2N94xY4cFl93spepvGHukjbDBKbHHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770895211; c=relaxed/simple;
	bh=uuJZ1LL+pWX0H8ov90r/VJ6P5HuHKOKqyZW4flS2e6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ejd6tqoVCWXRPgBovCRoywkNQc+4XymeZojSmuc9EwxgY1fNle9PZ/yUy4KeeTvtyLjdWT2JEEYwKp67jrjoHMemQTYo4hzJji+nC0hBILyGOggV8yX77So51DgEYFPPGyFYJZG/6DCrB6mYSpxJhSGGwi2WXkMdeLhkVPUvhwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o5jn1NN2; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o5jn1NN2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so74380625e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 03:20:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770895209; cv=none;
        d=google.com; s=arc-20240605;
        b=chosz5iRwHNacw0B/CFXSyvLspd2bimAlFSNhVL0ZIUE3cvg7c9zvDGvJW4inLHE1U
         puWwYBioKGe5Tp5rsu1+1og9ESMKAFuQXQOYlutHylzGP9rtbaUftJZ2Y0zpGAJggvS2
         2b0IrGReLF6FhpfLOBTc2chc26WSc/0c+SMEkmwuMHtd3ABUX1PtICeGegCgQVPpKVPM
         +dCKKqEIH3rxYbDqK4d640Nn3c3OZj+n2R+3uPaI37qEoc+hKSEzKdQvCwwmlljxxbXP
         dM/wsn4uHRmojIbewCOnLQYigw0yKFQqvNQHdsABNEJyWjcYduhcuQW/ODRLX1FJd4Oj
         wsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uuJZ1LL+pWX0H8ov90r/VJ6P5HuHKOKqyZW4flS2e6U=;
        fh=w6z1MJ901X/9Jx7ctgT3SYTj1CrBO3cihLNverESi1g=;
        b=kIbhenrWopUgqKGTCei9qb3CIm4m1iiDCqGp6w+9h8s9xiCudJeWKF3wsmeAceIyvw
         40NjMd0aICOU9Ev/y4ZuLSUaWruU2JfTnDVdcUNzJzu0vSrzKWqZyFb7KKVm/xN7hw8q
         peSqLuU/zWXXsQ9yyAkk5DfbB4ZEGBIyBaN1gE+kZ1dHg7rxof9NjX6IgaNMraVHIOWT
         acC4of1m8/eoer9bMEJX11mBtu1G09eaqHBzzLGRh4uh8k4OyB2c+8DCjNXcktb4dkFo
         fqoJ4LDTTNxdo5du/H8NoVDxxM8k+1ivstUhMPuPOrvIdAw35M4P58EhXf0tWs3LP0Ow
         9kqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770895209; x=1771500009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuJZ1LL+pWX0H8ov90r/VJ6P5HuHKOKqyZW4flS2e6U=;
        b=o5jn1NN2wmedIDv7LPCboQ3PZMcNzpHE2lvAVjBCvHTFIg8WHXYs4gi+McJ5Xv6SVV
         GfpswoFmEdDZe11epUPUk+KCsnNwDT/bsAH3H3DrUM4/FbANI8XMJnob5aVDHqCCHPTn
         eRDybcWMcp2pYniHDLl4uavW8xdB/54fdNq5yd/ikeWd3AXFXBcGC1pX8NI/VX/0xysS
         FKFXFvvupB+QUIJZO+jKF98YnfK3ewx4KSZgujnd7n+zswrmSeSjwDJ7FBuHQw9qXUus
         8QMd45d81AILJaYRfgXRvg4kemZH6G8esoAFef3h1NuZQfZucYbUBNGnWo5WSiMWJBwn
         fPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770895209; x=1771500009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uuJZ1LL+pWX0H8ov90r/VJ6P5HuHKOKqyZW4flS2e6U=;
        b=gKp77FDa32K5gPUfDp3XB8nt+lWN2VnMa+xjhvnKGPwYkOZJ0xHegR+DMdSMfpS6gW
         fSgQrkCuO6Xr85N0hMyoFAym+9PPk0u7Ex7OLE55EgukUO5K4s3OWrKmgpTpFtTY2a86
         XRsYTwbLEXE98Bh7FEEawa22Ci2f7J5PdC6appBRljzbEZvk6tugINrvqRLfzeUygZcO
         GgUeTOHUd/8wZ+5/u8nVyEt/Huy1KIsLz/3w/dcySuH8BA4D0oiMIISi2Y2WH1mOyWNu
         F/gyXgRprXGDUv9poRcM0hG+e6jy/gPpGzcknx6Xt/vOD5MEyv1wFqGGlTym+oAjip1N
         IrlA==
X-Forwarded-Encrypted: i=1; AJvYcCUX+GVzcabriTnDZDSPE70C+C83Q3FlEPUKsADRSNGPMfMXNahj3/AsjMbItIF0WRyZ5zd7LadNNLXOBbUm2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSk4PHm90w16Olee6e1sYoP8olClHv4nqPAX17RNzUlrAGsKVJ
	5cbV316WV43FWIEAYptGGIMR6IAs3YuKtA8hsc7yNu7C/sCVcfXOp8kDtYHfj7kVyxFfP6x4dml
	1fa5hlTcgx5Agvn8INEDF9Ak6Q3u/FnV+nkNNydFO
X-Gm-Gg: AZuq6aJVUBhKCkJ65IFnjoJ6Icix9hrGvYngcTZauxg3/ucfUQUeCquKCXNzDKXP4zb
	janCBdJvETLwFLn0VeyeqZCS402dJ23NQWm+vvmXjlN04EtComO9EszvXEELr0mLlsy1f5W+TPx
	Xwx56cUPZUUiq+/62PZT3rIj+lrvRYEMWGtnmbteGrfZNIM8U0TKUmE42DfSNaOz2hSf3lp1UY7
	oFORMXPcaeMaRW97aAr6Gk2okQeVBftK+pIrhsy2YrG5fq2KJX3t9CtOYUXvXPU5fM9whv40+tr
	gkHNm3Hvulk+FWrQjXxrHmavD3heD1IGuVuCtr0bbvANR4ICx/dMlQ1m4FUOPd9zLm33sA==
X-Received: by 2002:a05:600c:a08:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-483656ab4dbmr31192355e9.4.1770895208246; Thu, 12 Feb 2026
 03:20:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org> <q43rzzvpfh6ke74eyn3nypiek2ihaq6nat552asiobqge4vxmn@knwkb5dexnga>
 <87fr77viat.fsf@t14s.mail-host-address-is-not-set> <fU1FEYt6-SY0KlyJy4VClCr5j6P4d5-wukzc_9TkSDSBuQNlY26xyOIprMbHEVMv-H-nrAJ1iN_9tcfIXEI1iw==@protonmail.internalid>
 <gta2wjt4tkcvyu7g56gqyipiigbmbk2ca3biqzmxc2npch3rk7@ccwzwgnk7mcz>
 <87y0kytggx.fsf@kernel.org> <87v7g2tesf.fsf@kernel.org>
In-Reply-To: <87v7g2tesf.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 12:19:57 +0100
X-Gm-Features: AZwV_Qh4Uvl5z8msbaXaL0Qyn41nRXBEYB1NV8RVqoJ71paHuFQd8_cFVxm_IPw
Message-ID: <CAH5fLgjfSWfhUkmG6_ugue6Wp5LKtkEFJofWViJSNByq3sO2Sg@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
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

On Thu, Feb 12, 2026 at 11:52=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Andreas Hindborg <a.hindborg@kernel.org> writes:
>
> > As far as I understand, this is a borrow checker limitation. It is easy
> > for us to look at this code and decide that the borrow on line 51 will
> > never alias with the borrow on line 49.
>
> I did a bit of googling, and this seems to be a well known issue with
> the current implementation of lifetime analysis in the rust compiler.
> Apparently this kind of code used to be OK [1] but the Rust devs decided
> to remove the code that allowed this, because it was causing excessive
> compilation times [2]. The upside is that this is solved by the new
> lifetime analysis implementation called "Polonius" and it is the
> intention to replace the existing implementation with Polonius at some
> point [3].

I believe the standard fix for this issue is to provide an entry api
similar to HashMap::entry(). See the rbtree for an example, as it
already provides such API.

Alice

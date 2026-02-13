Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1035D31D750
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970542; cv=none; b=uL5pNAGCm+XgoxomDR7MakMPvilZtG8upkoXzvchzrX2IYsa7hI3GAn5+XtT4P2jwpd9YoCKpUifsJi/dL8po7XSSKawnJHpA1obN+qLchXH+tS0lOclSeqASDnKDYELWh0bSZ6RgnCeVvcOkPT6yYNnoCEMmSl1yfPLUmYEZpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970542; c=relaxed/simple;
	bh=ONMzuSrIGefFUjDdOGU+2PvM9DC5Ou6joU7zcGGF6tQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ZkPYbevlCOK5ujyj+2gR+aGVGBnhr/qSqIgtUchLiMDn+IVrgBerW0/fEz+7oq5/TrlBRreO5brl3tp1vBswg0Hemff/537/q6AoKPiN6N9spAvXSs7mcZTPZv7A8grLZccPzbrW2Vo4+MEh8L6oklKQclBx2V8U+tf8nhG4DvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FBt28NqB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FBt28NqB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso4249195e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 00:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770970539; x=1771575339; darn=vger.kernel.org;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONMzuSrIGefFUjDdOGU+2PvM9DC5Ou6joU7zcGGF6tQ=;
        b=FBt28NqBsfnD+CXMIIFbeQwIbZHhcNecefdiW1ycFJ4c1Fn27fViTIXuy0RkN1NaVt
         GUqRm+9xoN4DbBk/BmqCkVoxnGePnn6f6Y9ZHXUGN2noMk6fNSLs6mW46/g2UZuEI8Pj
         Ff0g7Tm1WvCR4CxCSC/fW8xuodQ/nVh4w2LpqmDYrt9oQlmRN8mWZEaQ5tti53JSxrIL
         /vz28L4tBhuAnHmGqI5KlI+mNtnB1TyLedeLGXOeSelbQ9eBpy+XOsWLK7SegXHxy27D
         c35ObPTzsf+PCOvp7GgXuJ8j3Y4lmE1G7EFfeLDXcNKFvT+83sygv2WkWKDve9l1oAnD
         aRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970539; x=1771575339;
        h=content-transfer-encoding:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ONMzuSrIGefFUjDdOGU+2PvM9DC5Ou6joU7zcGGF6tQ=;
        b=ZsSdDpn+3ukJps0W5R/B/9sfETw4ZV0ffv/IqdiBIMDo4rM1u0dYUeGToIvQajBfV1
         /ggZn/hf0nfgsHc6Sge32xZIn941HT2aCTJUjlv4sZ6LriUif/dyQwB1yHUpR9eB6H+O
         sm2WybS1gurhl7RIcxSk+yzdLjo4pgES5Na0oHEKEnQOebNYBnrUDs8/JiUG0pfQnwSF
         slRi1b095DG1QB81fE/7vhLCIEScXx3oEh3IEffERn/E9aapAEAWWfPeSLRvoGD2p1SK
         tInj7GHDWh7zp78Qf1CVdX1MNp1TjxMQNYvgxCuUg0KlIuptXGDrpmJn/laNkWonqeJy
         oq/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVA7d2nuAGFAZ/oLcEUzGuI6Q21N6M/xz02fJTsqCDl9B6maQUyE9irh9VbLuS5H+MEpXU4/v9agU+JY9pVsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+KZIAuVU++TVsnsX2oGnMdr7rRvuBF+IwsLeBFMp57JEOCjY5
	8NEP17+dYIqME5gJMORbeCCsG0qygrQ4B62m243UF+6XF4/bX5A0aHQ/IuQ0RdQl0ovmxiInko2
	73OvUw6HEvImK/zs4Ug==
X-Received: from wmil11.prod.google.com ([2002:a7b:c44b:0:b0:481:a662:2ac8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a43:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-48373a07a59mr13877305e9.13.1770970539111;
 Fri, 13 Feb 2026 00:15:39 -0800 (PST)
Date: Fri, 13 Feb 2026 08:15:37 +0000
In-Reply-To: <aczcvsaftsh3oj4e7xvm2e2m6roytdy4u6zmh66p7fpzr3npvl@ft6cmvlogsvm>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <q43rzzvpfh6ke74eyn3nypiek2ihaq6nat552asiobqge4vxmn@knwkb5dexnga>
 <87fr77viat.fsf@t14s.mail-host-address-is-not-set> <fU1FEYt6-SY0KlyJy4VClCr5j6P4d5-wukzc_9TkSDSBuQNlY26xyOIprMbHEVMv-H-nrAJ1iN_9tcfIXEI1iw==@protonmail.internalid>
 <gta2wjt4tkcvyu7g56gqyipiigbmbk2ca3biqzmxc2npch3rk7@ccwzwgnk7mcz>
 <87y0kytggx.fsf@kernel.org> <87v7g2tesf.fsf@kernel.org> <_ZaFqe4HzW4GSDQTrXKDgkSCr7L9bxUh-h5QPqVlMUHSvE0oRFuZJOPi0JItf3VJXHmaX4PA4QWAGBeG73cJYw==@protonmail.internalid>
 <CAH5fLgjfSWfhUkmG6_ugue6Wp5LKtkEFJofWViJSNByq3sO2Sg@mail.gmail.com>
 <87seb6t9t7.fsf@kernel.org> <aczcvsaftsh3oj4e7xvm2e2m6roytdy4u6zmh66p7fpzr3npvl@ft6cmvlogsvm>
Message-ID: <aY7dqe83EJWtdSMy@google.com>
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
From: Alice Ryhl <aliceryhl@google.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 12:49:09PM -0500, Liam R. Howlett wrote:
> * Andreas Hindborg <a.hindborg@kernel.org> [260212 07:40]:
> > "Alice Ryhl" <aliceryhl@google.com> writes:
> >=20
> > > On Thu, Feb 12, 2026 at 11:52=E2=80=AFAM Andreas Hindborg <a.hindborg=
@kernel.org> wrote:
> > >>
> > >> Andreas Hindborg <a.hindborg@kernel.org> writes:
> > >>
> > >> > As far as I understand, this is a borrow checker limitation. It is=
 easy
> > >> > for us to look at this code and decide that the borrow on line 51 =
will
> > >> > never alias with the borrow on line 49.
> > >>
> > >> I did a bit of googling, and this seems to be a well known issue wit=
h
> > >> the current implementation of lifetime analysis in the rust compiler=
.
> > >> Apparently this kind of code used to be OK [1] but the Rust devs dec=
ided
> > >> to remove the code that allowed this, because it was causing excessi=
ve
> > >> compilation times [2]. The upside is that this is solved by the new
> > >> lifetime analysis implementation called "Polonius" and it is the
> > >> intention to replace the existing implementation with Polonius at so=
me
> > >> point [3].
> > >
> > > I believe the standard fix for this issue is to provide an entry api
> > > similar to HashMap::entry(). See the rbtree for an example, as it
> > > already provides such API.
>=20
> Alice, can you provide a link to the rbtree code please?

Please see rust/kernel/rbtree.rs in the kernel tree.

Alice

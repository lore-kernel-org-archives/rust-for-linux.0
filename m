Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6610B30E0F2
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970676; cv=none; b=OmXRUhUJ3NctvNpRex7ldkuLb/o6DgCBw8EcXJ6aRWfNKognZJCVRq+QWw3BUwMdb5MnJs4ElSG7aHX6FHZTnHslYjNU7vhqRsQVFp4UizLt/hOK/CGgGikYvNuX2NlVcfigbYjFbXMlAfVVwq0TIwMBkGuNs3GjfiW/oGnn/fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970676; c=relaxed/simple;
	bh=jqtu4gVYM6TGuj52cfcIxyfANU65Ev2pse/0+AXaveY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Iwn0ouMRCS21JDryHnqHQHNOIKBMbdmYV8IRD6sXKUoVb75p8BDF+gabcLpkW3n4yaVA9IMnpyBIPfvGnuR24Gobq/Bhfv4b4WcOOVLzgMT7eSFrzR2Rne04/dyFaSncsudyJtO/rGzKRT1enNw1udIglnw7kTTzkEwYBU9GVsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MYPt+YFB; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MYPt+YFB"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4806b12ad3fso6788885e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 00:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770970674; x=1771575474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDWU1Lbtd0nhdeSahw2pXDytysBYHevKMggJu6wq/y8=;
        b=MYPt+YFB5tW11JLJTVrCIrJM419Yj/mrZWZUkUSEgGtOdhvyhqJ7HBhY6KNtaGmQDc
         RYdwVV+KlXpTOs/7OEsJRTbhawJGO1yQF+VCjcD0tuy34g1Z3ejJ7XNao6ONa3g5+ZfY
         /KlqTm7aS4zaMmZQDEvXyh6GKBou3pVT1oXhLMPKW8/EKLAN+cN6Cm/WdLq+Ublpw0js
         0HlkjkdcW6m9fxHUdIo5c0cNDIbLN+rVnPklwG5hbGmxv/pYhsbygpfZ9VzHqv9KnskL
         II5vJlaZhvp9TMrqWptvYMJ5wvmHAIcm+hwX2pwW9GoC7TQR1YJdtPn+jW/CoojRZvXO
         P0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970674; x=1771575474;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qDWU1Lbtd0nhdeSahw2pXDytysBYHevKMggJu6wq/y8=;
        b=W+FVoohmZ3B7pUReYYTeV9iYf6TOEKp7DOnyiCRyBMeOvYV/sxdYHGDBa4zMt+grIi
         pawcuJ/bm9fckpTcwrILR9CKmifsjwxFEXBJECtrOPcnref1S0Psjo0BFG6RoQ2gd6KM
         uV4wkaFNbwmMiTuHgA2x6JtRaeN3Ldb1PA6ENcdiukzXzS+Vl5mWic/SwD6EWX9qTOQU
         ziFcdXHUqGRDphID3KtXQv2OcbcMfW3T/rwS+TruCQ36SOQclZkQXG0W45s2iIz68QwA
         axK63iGCIvKdTthfNtsiPlGhhXM1N7vTM6q1N8MAKyfjZgugY4GZk6vKlYRCwmUZ8ARL
         Uu/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWCQcxnhhuFsOGtGm691Ho6v5L1s1FeZABY0/w4R4B4wnqFThRLXD/M/jDMNBwPXBgNrmHX7VPgq27YGKXow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxAB3ajv5bldMqFwnKLZGEo+sFC6NNRF5heRKtGoLS6mgCMxSR
	Me1B21tmetZVJiVM4OIBsLuNTDf7Qs6kL2f9qFqnfOAfMdFOKkYfvsfyPsHWN9FJPswJOyuAaB2
	kW2MZLgM6z2e/e2Wisg==
X-Received: from wmbjv13.prod.google.com ([2002:a05:600c:570d:b0:475:dadb:c8f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4687:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-48371061414mr27181855e9.15.1770970673570;
 Fri, 13 Feb 2026 00:17:53 -0800 (PST)
Date: Fri, 13 Feb 2026 08:17:52 +0000
In-Reply-To: <87seb6t9t7.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
 <q43rzzvpfh6ke74eyn3nypiek2ihaq6nat552asiobqge4vxmn@knwkb5dexnga>
 <87fr77viat.fsf@t14s.mail-host-address-is-not-set> <fU1FEYt6-SY0KlyJy4VClCr5j6P4d5-wukzc_9TkSDSBuQNlY26xyOIprMbHEVMv-H-nrAJ1iN_9tcfIXEI1iw==@protonmail.internalid>
 <gta2wjt4tkcvyu7g56gqyipiigbmbk2ca3biqzmxc2npch3rk7@ccwzwgnk7mcz>
 <87y0kytggx.fsf@kernel.org> <87v7g2tesf.fsf@kernel.org> <_ZaFqe4HzW4GSDQTrXKDgkSCr7L9bxUh-h5QPqVlMUHSvE0oRFuZJOPi0JItf3VJXHmaX4PA4QWAGBeG73cJYw==@protonmail.internalid>
 <CAH5fLgjfSWfhUkmG6_ugue6Wp5LKtkEFJofWViJSNByq3sO2Sg@mail.gmail.com> <87seb6t9t7.fsf@kernel.org>
Message-ID: <aY7eMIhkPJ3wXD51@google.com>
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
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

On Thu, Feb 12, 2026 at 01:39:48PM +0100, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
>=20
> > On Thu, Feb 12, 2026 at 11:52=E2=80=AFAM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
> >>
> >> Andreas Hindborg <a.hindborg@kernel.org> writes:
> >>
> >> > As far as I understand, this is a borrow checker limitation. It is e=
asy
> >> > for us to look at this code and decide that the borrow on line 51 wi=
ll
> >> > never alias with the borrow on line 49.
> >>
> >> I did a bit of googling, and this seems to be a well known issue with
> >> the current implementation of lifetime analysis in the rust compiler.
> >> Apparently this kind of code used to be OK [1] but the Rust devs decid=
ed
> >> to remove the code that allowed this, because it was causing excessive
> >> compilation times [2]. The upside is that this is solved by the new
> >> lifetime analysis implementation called "Polonius" and it is the
> >> intention to replace the existing implementation with Polonius at some
> >> point [3].
> >
> > I believe the standard fix for this issue is to provide an entry api
> > similar to HashMap::entry(). See the rbtree for an example, as it
> > already provides such API.
>=20
> The example above [1] is using the BTreeMap entry API to produce the
> issue. Are the BTreeMap and HashMap entry APIs significantly different,
> or is there something else I missed?
>=20
> Best regards,
> Andreas Hindborg
>=20
> [1] https://lore.kernel.org/r/87y0kytggx.fsf@kernel.org

Hrm, tricky. I think it would work if the entry type had an into_map() that
consumes the entry and returns a &mut to the original map.

  fn transaction_impl1<'a>(maps: &'a mut Maps, key: u32) -> &'a mut u32 {
      match maps.a.entry(key) {
          Entry::Occupied(o) =3D> o.into_mut()
          Entry::Vacant(v) =3D> {
              let map_a =3D v.into_map();
              let value =3D map_a.first_entry().expect("Not empty").remove(=
);
              maps.b.entry(key).or_insert(value)
          }
      }
  }

The HashMap and BTreeMap apis are not particularly different.

Alice

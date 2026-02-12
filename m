Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9414619E7F7
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770903275; cv=pass; b=paw/v3KxErgTuDUagyZHKeU3IDKIur95T9gR2zi9MzBj7d4lHlv31mGUTsohLJh/oTy/V/qaJMjhCBGouRwtvx0SscI2lU4RIVjlACNrczbqPw433QYArEkXRmV7cL+qNL902cveUbaeK+oLRk6WUhFc20bbk+wXropYzWrOyuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770903275; c=relaxed/simple;
	bh=yNMxoxwcI8k3TdcfCMBuTL3G2x/jekpsbWa9BEmFkO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaRzO9AbqmqjA8DjoF9n1xHH3GmlrpbPuj6Mx1KRFAXf8nuTZ3PFm6OGYy4d+VHlnGtj9i2o10k+e+85AFMcFMHdIP1Ybh75S2UM3Kl3fY2AyBFuflq4/ioWLoLcj1z/SQ/fhCoCnWVclaJA5tx30ozBxobmuGz/52HT/1cX7uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFUVUc5b; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFUVUc5b"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ba6d1e047cso234665eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 05:34:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770903274; cv=none;
        d=google.com; s=arc-20240605;
        b=VOkFxQ8Y9SxkpJWqahGt5pzBh+o7+KCvvD+bC/rYN0iq7Ld6IOmTwUDp6Y3kYpUl4Z
         /yhWD+YOR1XQvip7ce+pfUyrd4J4IZ81BxUZEZzmjaM0VSKoYRDRBXwcmb5bzr60WAPK
         WNfavGlC//DsV96oeYBIwMIp8pC8J+VmB6tPYD4JHzPbbHpaOe8L2p10u3Pf8S/XFv1/
         UX3RjzpH+tXmcIPYUJwk3PgkNwOOBWjJDfe7C/ffZG4uJG2APYNmBjRPo2rMbS10H037
         H/9TN3KdW/b5/8yaVyahrpiYvD8oOdmbvQF5DKJ6VJhqJPCGPSEmdXbz0Zk3vXk9bBYn
         tx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yNMxoxwcI8k3TdcfCMBuTL3G2x/jekpsbWa9BEmFkO4=;
        fh=2d2b8Ycqz0fiQE6QapdmiTn92hVKpokbwIawJuqZDtI=;
        b=h4wR70UAAblE87F1HIzD6MgqIfo2Wvj13NyjtPp5u4e3isGE9YGidulzUN1dDf9eST
         ni3/vwakobsTouXnvKT9Dk4Do75HJBeQJ9XXPAtloshW4dy+Z3YY3XMmESWCsnoboFAR
         +U84qUIJcbDaPfa6SJsrieIvC5kUnPMd4QQnAPHcPzU0mGYD4+AN2Gq2kjvDNAg5Wk9+
         /dDgn9Qt8c2vE5ADQ9ssT5bkVtnOzvJ0e7/aT4/0CySYqUwsdK76T4KKKMXFHmCk4XD9
         qIElaFUvsyepxI1VNP+Q0cw+n5JO/gKDaQW5pjJX9ZipvI+YFWsv/+CYEWPiT6wMw9fN
         1naQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770903274; x=1771508074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNMxoxwcI8k3TdcfCMBuTL3G2x/jekpsbWa9BEmFkO4=;
        b=PFUVUc5bcky0GJUVDr1usSIgPa0AyhXEbpVvz0jDRcoZ5uulxRu7N37FJFgfl53cDG
         j3T7rVWn4FqywJZzQS8jR7Wymk6LDKqyk/fNlMqVLCSNg2kj42b0Fshwoq3VFZaJm92D
         CbHCghT6G8GuSy04+b5vok0/qTk54azw3qqnd/a9pVl+yiuWY6a6JCuiGc3Uhb81nyPb
         cNwOpceukKWJQxmFlxQ7eTj9PTfUctHbSU0odu+kfb+yI6OAhxWJPMHr2eklhRGcHaY0
         yUXQ5IYr4ptB5p1IiCNU1ydox898ixFIRwWanqATxTUU0f5e7mgKIxnPdxR+iY0fqgQm
         908g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770903274; x=1771508074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yNMxoxwcI8k3TdcfCMBuTL3G2x/jekpsbWa9BEmFkO4=;
        b=p4z6tFioRbwY3t5bcgqTYb8QUtK3TEebo9hDLkOJNVr/cJhyucXISMN4xA294tv3ET
         6+Rn7yMekOO4l65DW5j6qJDaOSWXje4w3vRSoLZIojKMResG3LwjSvW9EejV4u3Qmr78
         hwjxqH0taf7WqUXKIyTHdVj14rFFRg/fLvJ2j0iA2mL1P0XQOLZ2993pANAaQAmbAeGz
         3HS8CLh6NHlltuGzVRIn3uTAUycz0bipHVccDoHDihon6Ceco7P8KarwKtqDuYzecy2F
         apk1yT4tgQN8UE0AXkZU7uR1cPEn9jdOnGt9DnWWKjwFE5WDeyjrXGxCDore/1qkJIzq
         lHaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJk1zvZqz+aDzT0KVn48BoJQn0xXJDfjEhfk9S9s2jC1MsPFUINcu9A51+uMdCg6uRQm6bBgGYAD4VEYNtzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzktityU3/OghLJisVLHFTBo7Dc5eJf3lPEV/B6aVIdjJ1h9G9b
	47QOWuBW1550tELlRspsyaEEEBoIutPWLCJ3IVb3CJShjp+yDK38u7q+7cjnmYd2zOM10quV3FA
	pcu8oHVjv2SwZEkcTX0GFXOhAe3oOo7I=
X-Gm-Gg: AZuq6aIkmHOEoSw+SG7QpR+9rE2GCm0WKT69DAzIjaIdjKxA5ZbuCMXeQs7GZpNSi8T
	VWgMHkJHkz3A7nthcXZ2awS59RLMzsejWsw05GTwphONSohOTuiOUslSF0w6kb7AVKeAY1JdZJA
	9Ryh2Ukf/tzgamsRPI3L5nBZYuA4PZF7NdIFoH4YA7QU58Ul8y+kNRMO9x40I+KgXsx0H2YUPPX
	oamCtUw0YypLtZSk+eh5AiLdRY9f8Ixk/KHNnnvzT25L1Axkfw9jdbpKdUh/XvIJmVvNpx83WV4
	uvA5uPcxHJDkWMMLPOIspdMrbG/ZnmSpsf7M7bnAnwByTCCK1dQmQ4hbOXpYDer5BkyP1YvQj4g
	Hb8U/D3s7iPHf9ytzn/Fmcb76zOgdYAxwWNo=
X-Received: by 2002:a05:7301:3c9b:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2baa8060a37mr597124eec.5.1770903273611; Thu, 12 Feb 2026
 05:34:33 -0800 (PST)
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
 <87y0kytggx.fsf@kernel.org> <87v7g2tesf.fsf@kernel.org> <WXzdKn94ED_qqocwnFPMLL4sIamZUFw57nW-NMKpdYCWhxdCutPl_wcMwF_aTpQvsmt-9NUQZMy7OokH-lQ_2w==@protonmail.internalid>
 <CANiq72=n2=96dvcLXF05Ta4+h7CyUTQNn2b64U4j=VB0xO-0GQ@mail.gmail.com> <87pl6at9h3.fsf@kernel.org>
In-Reply-To: <87pl6at9h3.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 14:34:21 +0100
X-Gm-Features: AZwV_QjGQXign6Um7FnKXJ_iFz2AuNQ5uOAIEDrUpQFsJbrnBBAxnyYX9wfkZeg
Message-ID: <CANiq72mPz3gcb7=4ONQbPasmjPeWq1Hd28ak_gzg+bgyHvL6ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 1:47=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Right. The devil is in the details. My point is that the analysis to
> support this was deemed to be too computationally expensive to roll out,
> but the intention is to achieve a similar analysis at some point in the
> future, via Polonius.

Yeah, that is fine, I just wanted to avoid confusion, because it
sounded like Rust broke (a lot of) existing code, which wouldn't have
been acceptable (for the kernel and many other projects).

Cheers,
Miguel

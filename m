Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999711FCD13;
	Mon, 27 Jan 2025 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737975216; cv=pass; b=cB/f23WaoWMZIQdrRLn/1syyF6cU2AgpBJIGZE0TxPVxS/WWAcZtLTU3nDcjngcEg4CwNNdePbgN/RcwHOFHjTC9m41y+1oPMBR1lfk6zfwiR5IjHn7CrUCHeKRrkw5yHShyEY9BOYlPz4GQIM3mkFlv8L7HbU1tQIPE+ZP56g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737975216; c=relaxed/simple;
	bh=RBMhuyaTOram7ZI311tODQh+jGCGrNi1F3gn9/ajoic=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kzpaIVF6+pQJSz7HkgpOoU3D3HMDoWFD7BWqfB5Y/b2qGGExm3/oPfhnH4Dj6wvqlf6ZqDtsGuPXZwtL65I7I/YecjkObKUK3rpKumNu1cOlQZOg64wg6t8MLxbTgtLHezoQBaRjDgSPC1+CwEOvKhSb2DNibCcCDyyHWjvG/Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ksp2sDKd; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ksp2sDKd"
ARC-Seal: i=1; a=rsa-sha256; t=1737975183; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iKeCblK+7zC0FJV3LsNr9htRJ6R/50XI4+k0Cfe+vIVmWbwp9e5JdU0rNzlW7m39jdu6s0eufzIvviDIkogsNUvhXyjBMbsVX5DpBzP874LcsQGXKq3BKPpTnQ4vxqvky45vCRORyOoDDFv1wHzC7nqILA5lDMTnXluf4RCseqo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737975183; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RBMhuyaTOram7ZI311tODQh+jGCGrNi1F3gn9/ajoic=; 
	b=bonAOTxFxIyKU03ZpCQ9cjxOVJRfjQy4dr8C8zdDBmgi/prFA1yOyjVXGyrwrZQZ5wGCcOLfsvOAYtOUqOqYvjOsH8jgYyyXxAIr6Y+GL/yAdUDlWKWwknz4muOathNBDfn90CQcvBXP95hZVdRX2tRncL2ijkHOpaz1wl6TT5c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737975183;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=RBMhuyaTOram7ZI311tODQh+jGCGrNi1F3gn9/ajoic=;
	b=ksp2sDKdJFy9FTBEatJTxBub2Iq7ipjz4o+7OUkM6yW3OrBwFFGN9wD8fXv5okS7
	csCXtVHIGhi+r4OOB1LPLTvw7IwgHj83N99ikQoav7Nl++XhVmulbNTHd4UA6NXlWA8
	iLZhDKbxr51TtJx78xDnHOx/0Za7w/5K3QAIdMg8=
Received: by mx.zohomail.com with SMTPS id 1737975177602742.970556978156;
	Mon, 27 Jan 2025 02:52:57 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <Z5dh6cSnNxwbefJX@pollux>
Date: Mon, 27 Jan 2025 07:52:42 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org,
 robin.murphy@arm.com,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7E4F0584-7C60-494A-9CE6-57840F3B7976@collabora.com>
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
 <20250123104333.1340512-3-abdiel.janulgue@gmail.com>
 <CAH5fLgjL0aGGwkjEfXH08Jopwin1NfkLzp9vQWKcHPEum8jV4g@mail.gmail.com>
 <Z5dh6cSnNxwbefJX@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External


>=20
> Why do we consider the existing one unsafe?
>=20
> Surely, it's not desirable that the contents of the buffer are =
modified by the
> HW unexpectedly, but is this a concern in terms of Rust safety =
requirements?
>=20
> And if so, how does this go away with the proposed approach?
>=20

Alice pointed out that if you hand out a &mut T, you must ensure =
exclusive access
to that memory location. So if you pass that address to some piece of =
hardware and
it writes it, that violates that expectation.

The solution was to simply not do that when the &mut T was alive, i.e. =
to ensure that
no hardware operation involving that memory was taking place while the =
slice was still
in use.

Some people then commented that they would use the abstraction for ring =
buffers, which=20
would violate this assumption in perpetuity, as both producer and =
consumer would have
the range mapped at the same time.=20

The solution was to revert back to pointers.

I think Boqun asked for the unsafe as_slice() function as a way to =
impose the safety check
on users, for the cases where it could be proved through other means =
that the reference
rules were upheld.=

Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C563093BA
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 18:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763575535; cv=pass; b=JmAlIp5/N3NWzO6kbIwWODi0A3I/pMDqJxZ1dsv5AgsPTwdTY9PYmaINAAlzfRHjqZ3mTgFkhUHK4mK4vnj4X6BAc8uCxz/VDJGc0saA6eDBJ8BxkuFGEC50sI4DQMGpi46k1s6Dv+TCtNKlNFni5ju3NV+nZCFwVsKlIxW73Bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763575535; c=relaxed/simple;
	bh=So/e6j6gh2XgPi9cznkfkxszAMGwd1l3kdMf/jPMs6k=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=L2oShvHDhBFcz62pdA/lMFNsd0P2gkS5+i9oLrSwZJM5G57arY2px07x6a4HOsQB5eFNNPsLBQ7C4zLPrULLDgLg+WmmdsFbM9QY+YUy0WQmnqi6PcXzbsFXzqOutnbnHYMieiUmUwKN2qDX0hFweqWqtmdvrp5zwutGCHFAF8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=gG9tfgv9; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="gG9tfgv9"
ARC-Seal: i=1; a=rsa-sha256; t=1763575504; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NyZKNHO09GJbr3XIXULyOpq6xiJxFcCyMrP+AnMrZ4o/V+7BDDAPV4KovhfZOn71HbirnujjeQffmi1gfMimKIAtFojcasFuDwZlMsYp/9z2AKxsZoqKQmYcAgvAhpmVi09ZoNAhLek7Q/wjEKxo6f+Cvo8/LIppbzCTrS9MY+c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763575504; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=So/e6j6gh2XgPi9cznkfkxszAMGwd1l3kdMf/jPMs6k=; 
	b=ZBditJtNSchZ+9jD0i+nbn2kwHcg6qUH5c82UahOM//SdniC1fSkmmQMDKWpUA4iEkBZF2+QIRmRBmT/VORb9CkXlptfEr2gquSp+2gqf1czs/KaQXI8UFhwP0U/QrgmaFCLyb0d0ovKQ+mHEVgga6hcfhsxhv+vZcxoxLCLQBw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763575504;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=So/e6j6gh2XgPi9cznkfkxszAMGwd1l3kdMf/jPMs6k=;
	b=gG9tfgv9VJBI7bV0FF6PkA4IK4ZAyYxr9RWsSPkUT1j+0q46hgLK5KbKz2/+Qz78
	pJswhgz/9pcO1zqMZtwy0sQ2DFVd+hMZvOohpLLZOiQuy2mf1AZZrthD8n/Y1ZQsH/r
	whV55PcThd1vxo2ySsSNuskrTLOQvODAr7v8DRXc=
Received: by mx.zohomail.com with SMTPS id 1763575501947142.27902437001057;
	Wed, 19 Nov 2025 10:05:01 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: add a function that returns a reference to the IO
 Ports Resource
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <D9CBB978-017A-4EE3-84B0-1B93AC4548E9@wyliodrin.com>
Date: Wed, 19 Nov 2025 15:04:45 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A9FC261-679B-4596-B7D2-C05466AEFABF@collabora.com>
References: <20251117163112.22515-1-alexandru.radovici@wyliodrin.com>
 <9DC413F9-40A8-44D0-9A77-D392D25F1E82@collabora.com>
 <D9CBB978-017A-4EE3-84B0-1B93AC4548E9@wyliodrin.com>
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Alexandru,


> Thank you for the quick reply. I am trying to teach Rust for the Linux =
kernel at the university and this seems to me like a chicken and egg =
problem, but I might be
> wrong. My understanding is that if there is no real drivers usage, =
this cannot be into the kernel. My concern is that if there is no API =
for this, developers will
> just ignore the port reservation or use the unsafe (and possible =
forget to release the prorts).
>=20
> =46rom the didactical point of view, for someone just starting with =
this, writing these simple QEMU drivers (debugcon and isa-debug-exit) is =
a very good exercise.
> What I wanted to avoid is them patching the kernel before they can =
write these drivers.
>=20
> If we cannot merge this due to the lack of users, could you point me =
to a driver that we could rewrite so that we actually have a user? Or, =
is it ok to add sample
> drivers that use it?
>=20
> Thank you.
>=20
> Alexandru
>>=20
>> =E2=80=94 Daniel


Have you checked the LED driver that Fiona was working on recently?

I think she did not have the time to complete it. That was the original
candidate user for this code. You may be able to pick it up.

=E2=80=94 Daniel=

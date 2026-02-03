Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9721A459;
	Tue,  3 Feb 2026 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126363; cv=pass; b=HYJgXylvTROjqsHITmWuYXUC1UMXmmKpb8/IiAJ6XFQJ3invKRazg80GUux9h4qoOQH2skxJcvsBngFPeqr3UAmAtbc2PT61T4pXcn+eeHlMtykjOG6cd/OJhigSL6Qy+0PvjvyDsPCTOxkA/DKRvwz+5LwWDDKrNCvd4t5NKdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126363; c=relaxed/simple;
	bh=OOUk87fVIgVkUAwvLOAe8djDpvCa9jlhCaeyD4uUYMk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eORI9zv/9/dQgpi/mw8eKzgDY3js0DvB1eEIELtE3+fozYDMgWBHbsSD6Nr9X1nosIrhD7UwXALNsAA/VT3VDcDX1E2Lh8i/Iiib1HGTm+9NL+/kJjHm+NEU0Z2vRDknsk219ztwRozGSAbWzq0mnd2id4gqBGlSFV6pd8UN0ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=kb9gTwMt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="kb9gTwMt"
ARC-Seal: i=1; a=rsa-sha256; t=1770126331; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cBQVX4Gmv4MhSpX0sz8Cab2eFyOAhPCdhT/7Mb7zqW61TFtS/EJtGoRH/y2XgZgCGXBa2AH+VQ7p1Wr91QgjOcoJnQRYwJ1aY4XzWyXpWcXL+dVoyGFxtKOedBognMumkA8G2fMxQWi6d62O1TX35fHUN8tNfuXMQnYVnPnInP8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770126331; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OOUk87fVIgVkUAwvLOAe8djDpvCa9jlhCaeyD4uUYMk=; 
	b=YZJD/sLRySKUdmDNjGM0r+i754/Il5ZKDSdxTMwhOc6ugv1VI+EOQyrj/9so4QuE/6nbWoeXUeNOu3QsDdogSNSKR9tzjKj75AgfpwCJkcsGJeMy1kbZ295UjukVBnAZhBN06ZfGUdJ9ZBOQ0qFGSmwyLrxIzFdiOre5gRl+iuU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770126331;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=OOUk87fVIgVkUAwvLOAe8djDpvCa9jlhCaeyD4uUYMk=;
	b=kb9gTwMtlhWR5ZlyV88p+8l8+87+SLlf+TsMPY7Y9L+ZnESA8iTMHu5EeuOLY4ZP
	f5tUMko4bd+b+IVL5uCoEnf0kZFMV8iRYkOR+C2yinOklHpJE9ttjaOz0TeWRoUOjxs
	IlB1ZqW83VT1a+mVM1i2knSrVUrXW6eduRgavU/M=
Received: by mx.zohomail.com with SMTPS id 177012633032337.63240086080771;
	Tue, 3 Feb 2026 05:45:30 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v10 1/7] rust: add C wrappers for ww_mutex inline
 functions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260103073554.34855-2-work@onurozkan.dev>
Date: Tue, 3 Feb 2026 10:45:12 -0300
Cc: rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 dakr@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 will@kernel.org,
 longman@redhat.com,
 felipe_life@live.com,
 daniel@sedlak.dev,
 thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <45626ED1-9684-4FA0-8AB6-FFBB0D2BA2FE@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev>
 <20260103073554.34855-2-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Onur,

Sorry for the delay, I=E2=80=99m finally getting back to this series.


> On 3 Jan 2026, at 04:35, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Some of the kernel's `ww_mutex` functions are implemented as
> `static inline`, so they are inaccessible from Rust as bindgen
> can't generate code on them. This patch provides C function wrappers
> around these inline implementations, so bindgen can see them and
> generate the corresponding Rust code.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

My comment remains the same as v8 [0]: did you forget to pick up tags? =
There=E2=80=99s an r-b here in v7 [1].

Or perhaps I=E2=80=99m missing something?

=E2=80=94 Daniel

[0]: =
https://lore.kernel.org/rust-for-linux/2F879792-3C12-4C8F-8EF1-122F44EF2B1=
9@collabora.com/
[1]: =
https://lore.kernel.org/rust-for-linux/34A2E775-A47E-4D4E-A292-E12489F0798=
7@collabora.com/



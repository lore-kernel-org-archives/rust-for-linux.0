Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB6E1917ED;
	Mon,  9 Feb 2026 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770625203; cv=none; b=XMhQKPcQer5+P/M3asTGYyDVHmZLpNALs4SO6FCP5O4xK9excl8LXPBRpqbkrlDXCmBGKsBNz5l+mDg1bIXI0GxDKStAlumZC3aeFdS6FV8//OVfHRM8tYuppZRCtU46VTxvaG81kzJkflPQu1iHxS01i+cHrV+JvCZao/2vLgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770625203; c=relaxed/simple;
	bh=smzVsyxdwRXKIXKq6sMRkFmH+uR9PMBvUmQtPEwEyDs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=haX0YZgaH2ZBMrXsSw/d45U4m7CVknlfjSFngt37A+uiYj/nx+1DUKJMp5IhgYge2QNKPbzzebCyy/WRIRRzV+LcNLHFzPLm/GwSo03vUcCGOb+klMxIXi2gi+81cFHyI0R3ykqZhTxGn5dxtEXDIz89HQiFISvgmI1LitPut08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IuRTF/pC; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IuRTF/pC"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4f8d0R5VL4z9tWy;
	Mon,  9 Feb 2026 09:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770625191; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smzVsyxdwRXKIXKq6sMRkFmH+uR9PMBvUmQtPEwEyDs=;
	b=IuRTF/pCVt+GjI04jKHTG2lGXtrOR70tiEFYdmqWYc3P3jB2Fi1ErXKQQJ+Avy1xRpkJQD
	qa6u0tBzwP+N/B8o3BZsKHNcFMPsQSFVwge01IMTUqxpUHFNeBGmMKaegkhiQSxQzD0b+l
	E01ZgPqQ3yZm2/ZA2jQVna5G7h55xy4yNE+U9mu0HWn8a0pehPGhdLVT7bnPXZWIKs7U+5
	Q4+ZSRYYTQZ7vllcYaEbjvrG7WDWtnfmJfE++Zd4TwJsthWknG5hjwBeK/uaI6tR12OthC
	V0MMsAgKzBHVQMbt+Drf7D91ZC4S7+YZO3oZmC0MYCpoZDmU9dISnSD6fA8eiA==
Message-ID: <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon
	 <boris.brezillon@collabora.com>
Cc: Philipp Stanner <phasta@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>,  Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
Date: Mon, 09 Feb 2026 09:19:46 +0100
In-Reply-To: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	 <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
	 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 8tun1zz3swrmw6s7exaf5jqmihwi9zxt
X-MBO-RS-ID: f88b550d4582869a55f

On Fri, 2026-02-06 at 11:23 +0100, Danilo Krummrich wrote:
> On Thu Feb 5, 2026 at 9:57 AM CET, Boris Brezillon wrote:
> > On Tue,=C2=A0 3 Feb 2026 09:14:01 +0100
> > Philipp Stanner <phasta@kernel.org> wrote:
> > Unfortunately, I don't know how to translate that in rust, but we
> > need a way to check if any path code path does a DmaFence.signal(),
> > go back to the entry point (for a WorkItem, that would be
> > WorkItem::run() for instance), and make it a DmaFenceSignallingPath.
> > Not only that, but we need to know all the deps that make it so
> > this path can be called (if I take the WorkItem example, that would
> > be the path that leads to the WorkItem being scheduled).
>=20
> I think we need a guard object for this that is not Send, just like for a=
ny
> other lock.
>=20
> Internally, those markers rely on lockdep, i.e. they just acquire and rel=
ease a
> "fake" lock.

The guard object would be created through fence.begin_signalling(), wouldn'=
t it?
And when it drops you call dma_fence_end_signalling()?

How would that ensure that the driver actually marks the signalling region =
correctly?


P.

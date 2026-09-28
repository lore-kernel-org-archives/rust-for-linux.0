Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D22E470433;
	Mon, 28 Sep 2026 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583043; cv=none; b=Lno8UzFVxJMFnjIOH0VCFVuFEW4V0ZhXJP9feDF7yYHHiXx0ZWz6ZntGlcjiJ09zn1DrV8g18UY++TlS085FlBK8vKAY4s3S7MPSm4hVm+U2e7pXNfSUez98aG0tLVFOB44pwdbM51u0XVgYB+HoITjYFZfN99Xf9+X1shXyNN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583043; c=relaxed/simple;
	bh=a8Lg9fETkgM2Pxdb8QutqdGGlgOIRfzOCGz5weQu930=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OY6Zg/eV7fs/HxssB5jqkX9P/AzqmD8YRGhttY2mx0lSIWzZw0cE4j8aARzyE3H1RuW7acrV8rCvKhgbw569pMehCg1JAntuUubzaml8DBETU6tDN8QNmdy4W+sXCvoSyfFitdwMt8/g081hwfRHM/mV7Y0VhwhrxvO9mi7rpp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dKgp/gb0; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dKgp/gb0"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4htYs81KXjzKnmg;
	Mon, 28 Sep 2026 10:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790583036; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8Lg9fETkgM2Pxdb8QutqdGGlgOIRfzOCGz5weQu930=;
	b=dKgp/gb0x1CvjDhLB571dhdRPQgcjXRy/KyBd6HWENwUzgbjO9GxmNutXrnDBOQdGCFmGg
	n1LKzK2dI7qL2Rshcl9KLRQFC3nkZukqa7/AUgLS4YOTdl/WcqqCfy38KwnmgKVvWG75SA
	cBL9+Ov0WRGqF7s/KquwtZovhWBsV8ZIyHQKArDErcAP5LhI+d91lwO9jiTuYX5QW/yZRy
	xRBD9YGVoFG4ek0wEib1Noy6Sv8/o5ApeSeYNY3RrpFMNfMya4Ahgg/+Tv1t4kBDuuHI1n
	4Jhyu9SgURps2MLcW6M8vW6BaLkIwtTOl9PQkix9u6Iav6gMCmjzt3aAZ32xwA==
Message-ID: <dc8b56abedca3c6d17649de7f682e4af0b91b645.camel@mailbox.org>
Subject: Re: [PATCH] rust: sync: Accept errors for Lock payload data
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Gary Guo <gary@garyguo.net>, Philipp Stanner <phasta@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>,  Boqun Feng <boqun@kernel.org>, Waiman Long
 <longman@redhat.com>, Alice Ryhl <aliceryhl@google.com>,  Lyude Paul
 <lyude@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, Onur
 =?ISO-8859-1?Q?=D6zkan?=	 <work@onurozkan.dev>, Miguel Ojeda
 <ojeda@kernel.org>,  =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich	 <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot	 <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Mon, 28 Sep 2026 10:10:26 +0200
In-Reply-To: <DLNHF9TPLXK2.1VQ2LJ0U6Y07K@garyguo.net>
References: <20260924085523.2620704-2-phasta@kernel.org>
	 <DLNHF9TPLXK2.1VQ2LJ0U6Y07K@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 5s4aq6a5zs5athpcfop1sf7apkqa8ay9
X-MBO-RS-ID: 35331b9477956efe94c

On Thu, 2026-09-24 at 11:41 +0100, Gary Guo wrote:
> On Thu Sep 24, 2026 at 9:55 AM BST, Philipp Stanner wrote:
> > The `Lock` baseclass currently does not allow for fallible user-data.
> > This can cause conflicts when used with other primitives, for example
> > when a lock shall be pin-initialized with payload data that is fallible=
.
> >=20
> > Add support for the lock base class so that it works with
> > try_pin_init!(). Adjust spinlock and mutex accordingly.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > Regarding removal of the CStrExt, I got "unused import" errors because
> > of it. Don't fully understand why?
>=20
> Because it's part of the prelude.

But why was it imported `as _` ?


P.

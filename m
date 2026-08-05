Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05B23D8916
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927046; cv=none; b=VWVVqjKqAQaAceVBB3jMN1cCYSxUO88rHKC4qyW5vfBN0ZTTXUYKBqEz75NAwaFJT6eMySEeY+CxYpWLIiNcefXlNqTrFAdrh0xLe439+kDoFoxqUbDN81TC76/CY35iyXFaQTnNVoo9aIAO+oKqAtP8e3vfcw7WhxzxCpe09Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927046; c=relaxed/simple;
	bh=0o/m88UxcvbNgglD/6Lw5kKc9sjpIxpmpD4ePGamtmk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VAjdNCI/9fzaNY5z5R/cIp+cPnIbpURgpmTdstc+gssjO/GIT6eSyZnBNi5+PCYZGn+T03xiITOsDw802U57Inc0ISxVQJ7lX1hPW6GQ9mwq/KVjGXR6Tt+R8l7ITAMrshW8CNKIEF8iImdTx/sfO9z50ZhjgTeZ63SzQCFl1JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7U75C4n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7U75C4n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A1B1F000E9;
	Wed,  5 Aug 2026 10:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785927045;
	bh=0o/m88UxcvbNgglD/6Lw5kKc9sjpIxpmpD4ePGamtmk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=k7U75C4nQnzrIcCNEOGripUdbxC9fzvQ/JAvGHTnarczUX59XcuXFWo1uVKs379RE
	 581Eugd1iZ6PB0Hn9HQiAxLzRvRNNGPz8KzrE/39jYO0UhX/XnpDhRJEC/mTOdU2ku
	 O1rDwLjBCelhWk0c2GK1hsLIDu8fZymQ4XA7FVDzSWvPQhdEduofuhfYE9PtmdaSQc
	 jUoqArv5Zs4sHj8j9koAKPgpmWWHlu0yzZb7jFvLCCmFCy4euttCNA5ilxxRo09vu5
	 CdLIEwh9icAQU3oj6BGxQiMqwcXkiXMSJI4yxZtoed2TV8jw5n7JpO9sHb/rmRMS6Q
	 tqhvMHuHs3pMA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>, Boqun Feng <boqun@kernel.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, Thomas Gleixner
 <tglx@kernel.org>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>, rust-for-linux@vger.kernel.org,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v3] rust: time: warn and assert out-of-range input in
 fsleep() and udelay()
In-Reply-To: <20260621105909.4055210-1-ekffu200098@gmail.com>
References: <20260621105909.4055210-1-ekffu200098@gmail.com>
Date: Wed, 05 Aug 2026 12:42:47 +0200
Message-ID: <87jyq497bs.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sang-Heon Jeon <ekffu200098@gmail.com> writes:

> fsleep() documents out-of-range input as a bug but does not check
> it, unlike udelay(). Add `debug_assert!` calls to catch it in
> debug builds.
>
> Also add `pr_warn_once!` calls in both fsleep() and udelay() so
> the clamped path is observable at runtime.
>
> Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Just FYI, I plan to queue this after the next merge window (for v6.4).


Best regards,
Andreas Hindborg




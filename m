Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE59E4A261C
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 13:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464616; cv=none; b=pyjnoDLjbJSSICmD8sRF8ZJ9JCR9NsM8sgzDk4H2gFSoCGYH3iBtSPHRR4JB5GqfMiKWjc2bLvAd4sOiNO+g2sbugloUyqmbbOa2IYdZGY3z45/F2X9dq/poozXMoJoXEbPOpHWspcSLehnrAgLYnV3EHAUkLun6ZhjBqd+QS50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464616; c=relaxed/simple;
	bh=JR+OnZ4Y8AAIqmFVgsFrKW+fjM1rConTTDAGEBur8ZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TPfxnPvN6x+exlDjJn/qQeRXCwdyTMxwzSSCDO0qsHCb5PBbfc9yvW8SpoxaDY5v/VuCQ9LRQJ9BBioyDZRrpsdnK6aIddUV+ldXAlKpMT1OhLd3YfgK/7tYcZqgXQ7kwwHNtBwaNd3wqaNa5ZSPGkCUtOsIUJ9J+N3hMdJrm18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mw9JXxGK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mw9JXxGK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898E11F00893;
	Thu,  8 Oct 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791464615;
	bh=JR+OnZ4Y8AAIqmFVgsFrKW+fjM1rConTTDAGEBur8ZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mw9JXxGKK4Qdvp4+J/AbpEn/L8VI5weM8P+74iJKqrkiz1F1nyqlovj+Y16uP984G
	 Mfohkqwp20iOO4mSMDLGo1v895PWIP1M+UFilA0D/ltFctUKvWEf4AOfFV5xypjD3v
	 m30o1u3U+y5FQeADbPWPmhkUnrsZxmtqW5jE8znBjyd8HDGMVx8Fjm7PgQFYqDEbqQ
	 hTsPBTiaNKJv/9tIJf5aA3OebO/ud9OXxCz5ne5Ey4fJNYJRdJym8I/0iIO9ra0djQ
	 HrDmkJTNDKu+svgdetFis2i1gu8xA20thj1qtYNUkOqoaanOFmOx4Mcei633ew1SGd
	 6i7h5FG0MgQ7A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tj@kernel.org, tkjos@android.com
Cc: acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, jiangshanlai@gmail.com,
 markus.probst@posteo.de, FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v8 1/4] rust: time: make Delta::ZERO generic over the
 time unit
In-Reply-To: <20261002050428.2746277-2-tomo@flapping.org>
References: <20261002050428.2746277-1-tomo@flapping.org>
 <bXgTM8QJEpZwmK_1t4nQdKOxuLp8kdSeTOnfQJKvYn0WcTmzyimLNpFgzjwMt0W6FkkMctFkywqr3u8Mmf6icg==@protonmail.internalid>
 <20261002050428.2746277-2-tomo@flapping.org>
Date: Thu, 08 Oct 2026 14:54:46 +0200
Message-ID: <877bjse4ix.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Delta::ZERO is defined only for Delta<Nsec>, so code that needs a zero
> Delta<Jiffy> has to write Delta::from_jiffies(0).
>
> Define ZERO for every Delta<U> instead. An integer literal cannot be
> used for a generic U::Repr, so add ZERO to TimeUnit.
>
> Suggested-by: Markus Probst <markus.probst@posteo.de>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

I'm not taking more patches for timekeeping this cycle. Up to Miguel if
he wants to take it through rust tree.

Best regards,
Andreas Hindborg




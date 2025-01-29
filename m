Received: from mail-10698.protonmail.ch (mail-10698.protonmail.ch [79.135.106.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67CF42049;
	Wed, 29 Jan 2025 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738160255; cv=none; b=Xeboovd72mbBS+2gRDmIx7J6jxuXKefhCs3NPhHidT2Mxr8rVl35ebb8bYt1r9BusBI4O7CkONuIi5XlXQEqXoDd7lzWt68NS4usbtxbk/IX8xTFn8F6nIrS6615ZagkZEjQvI7mXviHVZsl4Ecl+HJZtaCsD/czuov15LNjpEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738160255; c=relaxed/simple;
	bh=LjXAGDefmwGyjMzrCdYc+hQcZXod6JBQdcqTa6FjvqU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J7F827ngR4HB7tj0WrMSl4T3DWMVFtRwRcWEY5qaYridiPiYcYRMkIdd0+NGTCzSHTzYyFtamKcFKTDIYRyfd69dj5raknxyMQlSX/S1u0Dr/v6NhH93p5xK84ssowy7NRnHVB+pTzyWFcbiR23WrmmIp5CWdIyZ552pRd6XxDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=D5+TYNft; arc=none smtp.client-ip=79.135.106.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="D5+TYNft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738160251; x=1738419451;
	bh=LjXAGDefmwGyjMzrCdYc+hQcZXod6JBQdcqTa6FjvqU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=D5+TYNftcrueQbXk1U1FeoA3MC6GEwpIRqCrLiJRGr5R10Gm91chUXZoCPyy9uOEU
	 LhHjyM8BWSyTpcd4ZWxqyLtcHOgjueFdcy+yFWBvZ0vlIELbtHADwhK/t9C8aaiCxl
	 wPgPLD4GCZmDvIDt+XL53HG17LT54f1bLZ77LsLcX8CuH506LjCJi3wZINYuao/SbM
	 85wa2r+AY+lJKF/QuchFG9+hV2FI+0e6GgleQK0xBbLzEHONKvx6w6h6mooY5A5ZPi
	 grVmfByr15Zyz6laBeaCwu7NJj+xdK9oxdK1/PlcAirs8UvmQYt4BmmsJKVdCdmTAA
	 spBrAnsrDueog==
Date: Wed, 29 Jan 2025 14:17:25 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Timothy Garwood <gtimothy-dev@protonmail.com>
Cc: Timothy Garwood via B4 Relay <devnull+gtimothy-dev.protonmail.com@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] rust: HrTimerMode replacement with bitfield_options macro
Message-ID: <AYl4y55Rc9VstxPnCaFZpj1Qvp4XV4bi2dSf7rhrE6H1Iz8xaCSfLjdt2vvXEf3vSlFqsAoLWpuW8SFCHosNu82xHUx5srQ2F5oP9wJJfKc=@protonmail.com>
In-Reply-To: <87jzadlvkm.fsf@kernel.org>
References: <DS80qoWpf2_CoG8atMaPTH_9n1u1KOAzwhJfLmUVwwM9VgDvL4lsK-LCBbaJyCOUhNEZ9GicVz_x-J6Jcrm6dg==@protonmail.internalid> <20250128-bitfield-option-hrtimer-v1-1-31033d8e727f@protonmail.com> <87jzadlvkm.fsf@kernel.org>
Feedback-ID: 126901959:user:proton
X-Pm-Message-ID: d4ab8cd648a79777f788d5ce876c0104c02e9603
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Very cool!

Thank you :)

> Since `hrtimer` is not upstream yet, if you get a non RFC version ready
> before the next `hrtimer` spin, I can put a dependency on that if you
> want?

Sure, that would be nice.

Thanks Andreas,

Timothy

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F92021C16A;
	Thu, 12 Feb 2026 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770916232; cv=none; b=drFM9RcC02vJPPLuuYNaS9ZNHoc1MbpINi+fNJ0NLiTRZbvThYnOimguqgsWzpd171+U3xBJgS61vSrAyuWHoGrjx3UNMVc9PcGjGH2/8vOkRZcRubYB9+GzmFHi1eBMZkHq3NRE/8jD50E3vW6o/N4q7j90k3NsjGJuR8DkDgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770916232; c=relaxed/simple;
	bh=egDP+GNUqpk7QyEQK7XNmj1Lhup3j1XGac1JCewfJvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CgYNeBb/6kxteJvMHVTeVx0M6f9eXbFAhD/SnRJtbH4s66NdEtpScrVIK+IKHjELwGQKwht+LhqR0bJwga/yUFCKAhj0VYeGQcbaTUo749L+MeKPi1CnDCdLkn+1q12Xnx+uOPdAZo59RMZpAP8FyZmVy6CQ6g2K9XP9fazrDOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vD5hjra0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vD5hjra0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AC2C4CEF7;
	Thu, 12 Feb 2026 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770916232;
	bh=egDP+GNUqpk7QyEQK7XNmj1Lhup3j1XGac1JCewfJvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vD5hjra0cEokyYJeRb6OgWF5Tl6n8RNf6aCRwAet21PsUJd7RvhrZAYg6aPTW5F/4
	 LTE7ARMFtocT5pIviwiD6MRb0o/LJutXUi6NGBZxIGMWGj36KAyfcC5B1przUeH2d+
	 G7grr+ynu250ondqKo6zCC2ZCwCCPawq5SqI+8WoqiX8U72l2bUCVsIlTON79/VwnS
	 +vsluxuNW9iZV5ea/6II2XPeN2X17Impf/zcDfI26rj4E6D2Um04ODB7vHRQQ7l2Up
	 MC+JtJSlRt+K7P+3XkPfWChRvzI/06u1Cv2qptutGP+11gUXVlhp85MPFafRgSlgpM
	 gAEP616YFutpg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will
 Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Mark
 Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <aY4CuCtBfkWZne0d@tardis.local>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
 <W3U8SrC8rs4Ivq5fjTvV2BD2K5BO4RxRg8tyWuntERIaS_RqDgtfBq5y0zcnazWgNJyT5ECvutnzV9d2UPDzOw==@protonmail.internalid>
 <aY4CuCtBfkWZne0d@tardis.local>
Date: Thu, 12 Feb 2026 18:10:13 +0100
Message-ID: <87ikc1ubuy.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun@kernel.org> writes:

> On Thu, Feb 12, 2026 at 03:51:24PM +0100, Andreas Hindborg wrote:
>> When copying data from buffers that are mapped to user space, it is
>> impossible to guarantee absence of concurrent memory operations on those
>> buffers. Copying data to/from `Page` from/to these buffers would be
>> undefined behavior if no special considerations are made.
>>
>> Add methods on `Page` to read and write the contents using byte-wise atomic
>> operations.
>>
>
> Thank you, but in this patch we still have "the given IO memory" and use
> memcpy_{from,to}io() as the implementation, is that intended?

No that is a mistake. Please pretend it is regular `memcpy`. I'll send
v3 soon.

Best regards,
Andreas Hindborg



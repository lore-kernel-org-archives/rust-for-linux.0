Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CBA37755A;
	Sat,  3 Oct 2026 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029051; cv=none; b=ihoyRnq4B9Tga7iu93XL3KKOSvpp6h+hiiefIgewkDk6rr6Ue9SMowrSlot+4avWsLbm9i9VW8JebFm8V4dzskO2cjzC/jkHBtaPTU22/DoSFAGJWJYYuCtNIhn6y2YieUU41ATcXVFtr1gMxnBxN7+xlLclI3g+SUbKp4lN4oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029051; c=relaxed/simple;
	bh=rQ8a8Vzo4hOWG9r0zw5Ff4k/JQyx0c7vueqlDxv4Ox8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uY62JRaUncEkPJwFrRnOdyL2VV3jQqPWix4Y+MU8ed35nyjJPs8wKo+LTp2dXuAy8kyKGdSmyo06GvUiokZJJyjsoiEOac1utQISeCrUvfK2MPsaDhq3ZKyNxQyDCdEKILQlUu30+yj5IbTvL8Qv7b5MEOVi3hnHEdMlCf7/yPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBNa/FZS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBNa/FZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63491F0089B;
	Sat,  3 Oct 2026 12:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791029050;
	bh=3Lg/O5y0YHkxK1rpIdLp1w11O0oICeYWpmZ/wuLWhMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=QBNa/FZSr5XQOXTC+LHYrv4J7wqr9xOqxzR583R10o8QKgB2/MsSNVGQLGIRpT7QY
	 9IgNE+8H8VsuF4y4EVmpjKi+A+F5frVDQyR94/sALr60sp4NACl9aJRVBUNLbmyITB
	 zfRbgHC0p8AqY+WlxqyrFxiyX9a2ZapQ5F5bnPY+wGiM6OWDmtK7VuRTeaoxdJmAzm
	 VZbatl3xe2UwD0HEKP08YxYGim/5YVAH8wnsUpdUlM/Qp08f9+8WlDWftCE4+W1o7N
	 zGZYOprPEJErOijQs0nYLEXHujeL84E7KW+5E5pV6vVGCeTkqbcPZZSbIIDyMi+Q1g
	 5xPz3orzfmSmQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>, Thomas Gleixner <tglx@kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus`
 C function
In-Reply-To: <20261002092438.GA2823843@noisy.programming.kicks-ass.net>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
 <20261002092438.GA2823843@noisy.programming.kicks-ass.net>
Date: Sat, 03 Oct 2026 14:03:57 +0200
Message-ID: <87o6db9ej6.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Peter Zijlstra <peterz@infradead.org> writes:

> On Tue, Sep 29, 2026 at 07:56:48PM +0200, Andreas Hindborg wrote:
>> This function returns the maximum number of CPUs that can be online.
>> 
>> The wrapper is needed by the Rust null block driver.
>
> What does it need it for?

Setting an upper bound on the number of submit and poll queues.

Best regards,
Andreas Hindborg


Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5CC14C5A1
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Jan 2025 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736082113; cv=none; b=ZyVdxGvghw+mwD+RTiT7Q5uqGlG/Vri13kRBEg7Fj7W0/G4VjJ+F+YC3vbqdkuVTvZtp0Mjn8AqZjLwIBwaQkMYGuUu1bjwI9HnRxOB+sGz9Ntdr2w4CmJBpVTROY7+Lu4poAHpZ+G/cyvIeZCmSkVDM/WDFT0VGx1/zLm1H0fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736082113; c=relaxed/simple;
	bh=cAZ/UVOmy3h5Edo8pBDzVhgjHgmybs8Cw4CcL0q7Kpg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GowSTqa/5PgnzMggQXZYVmaJsOcKzt2akSTPbTNo16DSrH5hoPRFJz8sOdf5n4rxwDZFCW8eY0FbEdS9UVFW29v5EEQ429N0A+W4I1gTtKI/Ci1vSlhhCxTXe6fqKgMwjf5vPzg29oWFxlnJrOmhg3IuNt/2rp8e6R+lJdlxDXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=njpq4wpu; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="njpq4wpu"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 62E5E240105
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Jan 2025 14:01:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736082108; bh=cAZ/UVOmy3h5Edo8pBDzVhgjHgmybs8Cw4CcL0q7Kpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=njpq4wpuau3Dgo0udc9Ae790xkCnYaqVQ3gbaNZHnVUNZww/dHOouTAftXB+7ijMK
	 nxxWMl3BInJ0eRdtvhXGBTfBUPd1if03QmBbMKBlJjnWF/g9oxK9ged2vwpGXm6OyQ
	 WKeVRL3IlCuR3Euuos2KUDVMgVFS8qf6fGjvBmb7ZbPncMQ5TTDvFGPyquy7aacvFS
	 itzwjVKy3LBQmZCcF5C8pMXPX1GGMHBklbHhahwmd/Mhyv/h88ViHY+YJgfz3eoejt
	 tseI2DVtZh8hUCwKbrm/583Dla9wRQrLP771Nit3nSR/fxTT+OHybv8cUq0xq39S66
	 oitoV4ZGsPzJA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YQyBJ47Wjz6tvl;
	Sun,  5 Jan 2025 14:01:44 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Mitchell Levy <levymitchell0@gmail.com>,  Miguel Ojeda
 <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
 <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Benno Lossin <benno.lossin@proton.me>,
  Andreas Hindborg <a.hindborg@kernel.org>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Andrew Morton
 <akpm@linux-foundation.org>,  Dennis Zhou <dennis@kernel.org>,  Tejun Heo
 <tj@kernel.org>,  linux-kernel@vger.kernel.org,
  rust-for-linux@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [PATCH RFC 3/3] rust: percpu: add a rust per-CPU variable test
In-Reply-To: <5374de79-0ee6-e817-0f87-c800a6fbb733@gentwo.org> (Christoph
	Lameter's message of "Fri, 20 Dec 2024 09:56:54 -0800 (PST)")
References: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
	<20241219-rust-percpu-v1-3-209117e822b1@gmail.com>
	<5374de79-0ee6-e817-0f87-c800a6fbb733@gentwo.org>
Date: Sun, 05 Jan 2025 13:01:43 +0000
Message-ID: <m28qrpbeiw.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Christoph Lameter (Ampere)" <cl@gentwo.org> writes:

> On Thu, 19 Dec 2024, Mitchell Levy wrote:
>
>> +        let mut native: i64 = 0;
>> +        let mut pcpu: PerCpuRef<i64> = unsafe { unsafe_get_per_cpu_ref!(PERCPU, CpuGuard::new()) };
>
> A bit complex.

I agree with this, maybe a helper function would suffise? Something in
terms of,
  unsafe fn get_per_cpu<T>(var: &PerCpuVariable<T>) -> PerCpuRef<T> {
	  unsafe_get_per_cpu_ref!(var, CpuGuard::new())
  }

>
>> +        native += -1;
>> +        *pcpu += -1;
>> +        assert!(native == *pcpu && native == -1);
>> +
>> +        native += 1;
>> +        *pcpu += 1;
>> +        assert!(native == *pcpu && native == 0);
>> +
>
> That's pretty straightforward..... But is there no symbolic access to the
> per cpu namespace? How would you access the kernel per cpu variables
> defined in C?
>
> How do you go about using per cpu atomics like
>
> this_cpu_inc(nr_dentry_unused);

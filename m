Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11AB2116F4
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763128536; cv=none; b=WyahMHcWoFjLtCAOomE7WKGtHrFXUVG/o2EtQNn/AUGVoFCHsbYmynzqPsMuSZVxxcm5DIHltzLr4r02ekzWClIeT7PwOVW+LQdApB7DBKw78mNrhuhSJ32b+xsz6EucTAhw/X9RsuM9IZyx7MNJBG04kVTllJE8PIzQe8CgWqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763128536; c=relaxed/simple;
	bh=GnbklHzgC9G6Wdk7eX4zKAFmiJcA952Xm/nVPxRz9YQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dln538wLAJmH/86xGVQuYOE08s/Dpl8VuP0yeU8dN/d6y74mS4GSzpu944/YKzTUA5gutthjSZGTsdB7179NKbkYD3KD3TsJMzpFO6SDZrqv8D1l2Oe+rKAN6oQ5IGlwf0yf7bSvUFesWdvD3QAr4sVfvFMD2dIZpAFkMZ3wLHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRpES9nU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRpES9nU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2984dfae043so17935605ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 05:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763128534; x=1763733334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7N8NHp50nfyBG05sw1yUU0M0g5CQybINUgn8lngu64o=;
        b=MRpES9nUnnkGuKB+8VxdueWvXiCG6+6n47oym98LEw73B7wHIi3DKp9NRZwZv9GHK3
         7m/0PtKe9GUvCT5G7/doZ7kbCv0P90UaIhUfDm30jZVVnnc60eLz9jNfSEEj0tSlhkFE
         AUlZ0/oimwqII3iKQVku8uI8/OrB0xTR4teGiflfa4rKvpKcnBXJoPOccdALIwAs1ZFQ
         yUDDxC6A6PUn+nN9BPy2aePMQPXBPpNDhWMBLCkYE4rBiN5qcopQgdrcN5rkGyDgYHeE
         6hYWU93bQIyv/5o1ULtCqYKs7qga8fcaxEb2tcCxCAkHLwe6xhWOKJcN+w0lo41rjMkI
         R0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763128534; x=1763733334;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7N8NHp50nfyBG05sw1yUU0M0g5CQybINUgn8lngu64o=;
        b=it5Gwu1KWCPf84jRm2EL2/ZUjxdtqG5shmuxHwNLdsTR4LZzmMuq/BzbfSxuAaWY5d
         9bhDGaSzXpcLfim9t7dbT+hyB/V5QzxhblTp++e2r7o0edITqlV6DAdFQ9QrGeYppY78
         MgpJG1GAE0W41Wvf1xorR98a3193InfAflUDtgIhVlyNp5yPnjbR6U6tpeY/o1YHJFrN
         lz9txdiQfu9VZID3DDTSblrava3A9NnTzyYr+mTSLSAMbblDHYh28CXoarrOfvleZMWT
         SzofO9Et6dow8LASqCP+RdQ9YH4O/Q7NEQODyskpJc8LauUTTU5lHAzVVPGiYBL6rtzh
         dBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSBe/gVJgzO+cttmV9UQ1KEAU1EJaD4Z06Y14TWWRjJDbH8BV2YE+731InE8Fhl8JZTHLRwgOryydF7KwcFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+FJ5tQEpaKvrqj1WpWc8R7h4DBUMPNs2kNFVw9vyL/eB1TwA
	RjK1a8ae9BlSO+Tnk0p4r/YoJNb/N4uxjeoYT0P4Uq9WOzisTJxSTsLU
X-Gm-Gg: ASbGnctaX3lB+nhz/i9OCNfLC4wvhDExDuG83kvDMQ6+fj9NOe+6i7WN61nrWuBJ4yd
	OSxzTAOLmmpLShiKjqmmGrh3j3VvsueqNBbMpjvDNwL8rirPE9GbdPnxUYvRL1hRi1oEOW2TJhs
	aGyTwQxkhFsyzhqn+A4umrt8t6ZYjQCY3btcEBnH6k38ENc4N9XXl6y8sqLE19kYjqz0T8HPdMX
	Bkxc0AIHwy0BgAAuYo1Xk4CqCOY5Vqcyo8LDVwcPQzZF8vJoz6oZ+5LVEr5boZPgsYrstFBQ8/G
	8Uxc2XvN0soUx2YkPZ60z/nqLV6M/KVH0sKZq4JWBDXIFLRGI2022U09Mo/eJOlaXazZYP5ovWn
	4pvc8/tWX7Dac4krpNvJFWbNJq2NRT7fP3V+B1YoU1piGSoYUgCZdrxmIwiK9tmoUvJ/Vkj00uZ
	Bd8q5dXJrtR0M12UAY/nAjVV9dQZhqmvEmBx67r5e7AOjHQbxCey+1dc1R31ZTH54C
X-Google-Smtp-Source: AGHT+IH4Zm3SzNLPW9Nhvey/nuYETJzhZnRFBCHDTS7sN47KGUgWQKyjVxqI8q7aHJ62TqjPV2EqoA==
X-Received: by 2002:a17:902:f60e:b0:295:9db1:ff3a with SMTP id d9443c01a7336-2986a73b3c1mr40437555ad.28.1763128534148;
        Fri, 14 Nov 2025 05:55:34 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0710sm55932825ad.66.2025.11.14.05.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:55:33 -0800 (PST)
Date: Fri, 14 Nov 2025 22:55:19 +0900 (JST)
Message-Id: <20251114.225519.83812886745946153.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, ojeda@kernel.org,
 a.hindborg@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRb6_v9BSpC6pVT_@google.com>
References: <20251114.101208.202243876104759244.fujita.tomonori@gmail.com>
	<aRaDjpYMPJtOfxPM@tardis.local>
	<aRb6_v9BSpC6pVT_@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 14 Nov 2025 09:48:46 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Thu, Nov 13, 2025 at 05:19:10PM -0800, Boqun Feng wrote:
>> On Fri, Nov 14, 2025 at 10:12:08AM +0900, FUJITA Tomonori wrote:
>> > On Thu, 13 Nov 2025 16:57:18 -0800
>> > Boqun Feng <boqun.feng@gmail.com> wrote:
>> > 
>> > > On Fri, Nov 14, 2025 at 09:47:30AM +0900, FUJITA Tomonori wrote:
>> > > [...]
>> > >> >> Using u8 as atomic type instead of i32 would require a fair amount of
>> > >> >> work, since at the moment only i32 and i64 are supported as atomic
>> > >> >> types, right?
>> > >> > 
>> > >> > Supporting u8 atomics in general is tricky, but I think *specifically*
>> > >> > load/store should not be a problem.
>> > >> 
>> > >> You meant using read_volatile/write_volatile? Since we only need
>> > >> "Relaxed" order so something like the following?
>> > >> 
>> > >> #[repr(transparent)]
>> > >> struct AtomicU8(UnsafeCell<u8>);
>> > >> 
>> > > 
>> > > Please don't. Please make it work with Atomic<T>, also store release and
>> > > load acquire should be introduced as well.
>> > 
>> > I wanted to confirm what kind of u8 load/store implementation Alice
>> > has in mind, and whether it would be used only for OnceLite.
>> > 
>> > Of course. If we add something like that to kernel/sync, I agree that
>> > it should be implemented in that way. If not, I'm not sure.
>> > 
>> 
>> Yeah, I'm afraid that you want to implement something only for OneLite,
>> and that'll introduce fragments for maintaining.
>> 
>> For Atomic<T>, supporting load/store/xchg/cmpxchg is definitely the
>> plan, so appreciate if you could help while working on this pr_*_once().
>> 
>> Alternatively, we can start with i32, and improve that later.
> 
> I read over this discussion. Perhaps it's best that we go with i32 with
> xchg after all to avoid adding new atomic types for this feature.
> 
> Still needs a load, though.
> 
> 	/// Calls the provided function exactly once.
> 	pub fn call_once<F>(&self, f: F) -> bool
> 	where
> 	    F: FnOnce(),
> 	{
> 	    let old = self.0.load(Relaxed);
> 	    if old == State::Complete {
> 	        return false;
> 	    }
> 
> 	    let old = self.0.xchg(State::Complete, Relaxed);
> 	    if old == State::Complete {
> 	        return false;
> 	    }
> 	
> 	    f();
> 	    true
> 	}
> 
> This ensures that we do not perform a write operation when we don't need
> to.

Yes, that makes sense. Let's proceed with this for now. Once support
for Atomic<u8> load/store is available, we can revisit it.



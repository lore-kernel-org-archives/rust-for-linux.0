Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDC036C5A1
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768830588; cv=none; b=XoGDcLpqsd46QUUa2a2nQNO0EWiYs0jjN8+W8vKa0clpJT1wi2I0qrxCuPlBokClydUZ0Co4ogEICC/MFf5HXkRnA+31VxFrsop8m+LM+RwrKr0tNaXFmGpeNUjV+g493zslsTS9qD1UusX32Vkk5ihoFbedxoXHCq4Kzpa17z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768830588; c=relaxed/simple;
	bh=M0gOzK34Io945NeYSkAEaVhm/whuG/jPKWvI1wcg8/E=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=elIliNO7Rf3s5KYN64G1f9NmOz2BDk3Pq23zJL/4Oxv1JWFlQ2X93GXxcdGxu0bwQmO/mi/a45OO3kTB1xDq9kYLHRXHZXkwm9QJvPwLGd/tuOrJz4/04i+NDZlQhXkw1vO1iTBvADTmVqqf3n52MuBzRJpdbrbchElhmAn+c3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8QQJqs4; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8QQJqs4"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-34c21417781so2219915a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 05:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768830587; x=1769435387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ME3xcLnkyvoOmHYqsWZrxFtA9sjdhYk7JPPiQzitkMM=;
        b=J8QQJqs4pD6s+n5ZQrke164fUkA7eXTA7YhElfN7kEU4fjoR2m2CJ4bjnCtDF/fkFb
         K3aFIAdEsngOnyEqRl4LmoytbCvfkPPcuuSX7pElsvascEIQCCguB2T04CXlBOraC6go
         5sAZrR6DA37yo2CGdRiqJNwqBjmrie0YZskd2dvVWl8U7R6He9EXK6Fbp1fH4k+J6C9e
         gH3vYj/z9rWp2tIaB5T69Vji8+CbOd3YghYyN2/l2tdyKz1x+oAZH5zX+tmSCNnchf5y
         Q2/EZ8JHOskz500YiU9pItvAZU2FCCKPl/+Vx4SxWJgXRLtPmttYcRLqiAtxoQNbKkRH
         KljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768830587; x=1769435387;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ME3xcLnkyvoOmHYqsWZrxFtA9sjdhYk7JPPiQzitkMM=;
        b=s8fxbtSfxOAj90uNv6hGywWZIUoieusJXJRCK6Qg7PEJsCGCNGgO/CTKzfQhNvCcrZ
         cdfDEUZJsiDgspeK498zW6OBWUiLepSbgd5dzYgfyaK3W7UrKwKdKhkZxZKzWA1MjXn9
         EB6nlUbC2sIxz2KZmV95rIJwC320bcLHNZ4E53wfda117i8CUEHsF2Kxor7C1J7Aa1t2
         4N7uSoHsiyRAiSLGw/v/gtzuknStOR88wGSXMUwF0vFeror+PKyE1OFiGjIoHskG5QuE
         Ws85uQ9Xa1swV0NHm24en9D0yd8U2uyC4HozHi/sRL4I5Bt9hNGwFG8X/VFwGR6q9uPE
         GQqg==
X-Forwarded-Encrypted: i=1; AJvYcCUqHZDrzxYxCuSlaELY2m/bQAa9S1vZzaJXpWv/BbwxKkgPkBzQ/HGnlBmcsqQoAa5mnH5vgh6f/4w/2MjJyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytoSM++53GFD9K3xvFViv8VxEMpkT57/NXE3uDvwKc/HYki1rz
	FCU9MLR3+SczhysklCyI28UK6gUMeaud34i8yIKS3adWVG+1+CH0/hvl
X-Gm-Gg: AZuq6aId+B7u6mnHT75JYx1zg+g3MKyuBzcHB+biy1aDO0QFg4tC11MhV5Fp30EHMm2
	GqIc0erbtqGKiIQBdtPn2l+/fEiddBFGnPaqyucbNel7RqjO15iNEbu+FBKOXcyrxB2UmYw/fxi
	bRKAZLXcbcXka+mjQqWIYRUtZyHVQFGlN+8kq4Gk5l+Gmcd9520zFUX5N2mhpTg/WXlaETT3C4h
	8El+KcMKozhGI3haNrj1dOuF+UDwKw95pZcTsby+pvxXXPFae0wXYGbLDLKXjAR0qi8YDvnQSBB
	r3JD7LNKp6mReRo4V0lj5EEY4539+q5P8uOMnAYIbqQEpTuOEdSZdLO/xR80k6WiBgKJovq6doB
	DUVwsHqYTGjPO5jXMpMO0bnvXxcNq2F3oQKhFDtVX3pwFGOY9JbXNzhuXMkdyJFwUN/g/FeDK96
	H4AZNv4oCMuZ11AOw53xwu6icyOdROCJxwVz+1gp1IzWlI01GibOfX67QqF9ashwtLx/s=
X-Received: by 2002:a17:90b:58c8:b0:343:b610:901c with SMTP id 98e67ed59e1d1-35272fbcb37mr9741691a91.26.1768830586898;
        Mon, 19 Jan 2026 05:49:46 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35272f4a9a1sm9304161a91.0.2026.01.19.05.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:49:46 -0800 (PST)
Date: Mon, 19 Jan 2026 22:49:42 +0900 (JST)
Message-Id: <20260119.224942.2031351100749299829.fujita.tomonori@gmail.com>
To: dakr@kernel.org, boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, gregkh@linuxfoundation.org,
 ojeda@kernel.org, rafael@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, gary@garyguo.net,
 lossin@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: debugfs: Use kernel Atomic type in docs
 example
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aS-ULCZAdj_l_j63@tardis.local>
References: <20251203000411.30434-1-fujita.tomonori@gmail.com>
	<aS-ULCZAdj_l_j63@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 2 Dec 2025 17:36:44 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Wed, Dec 03, 2025 at 09:04:11AM +0900, FUJITA Tomonori wrote:
>> Switch the read_callback_file() documentation example from
>> core::sync::atomic::AtomicU32 to the kernel's Atomic because Rust
>> native atomics are not allowed to use in kernel.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Can this patch be merged via the driver-core tree, or should it go
through a different tree? 

> Regards,
> Boqun
> 
>> ---
>>  rust/kernel/debugfs.rs | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
>> index 381c23b3dd83..9236866d6285 100644
>> --- a/rust/kernel/debugfs.rs
>> +++ b/rust/kernel/debugfs.rs
>> @@ -158,21 +158,21 @@ pub fn read_only_file<'a, T, E: 'a>(
>>      /// # Examples
>>      ///
>>      /// ```
>> -    /// # use core::sync::atomic::{AtomicU32, Ordering};
>> +    /// # use kernel::sync::atomic::{Atomic, Relaxed};
>>      /// # use kernel::c_str;
>>      /// # use kernel::debugfs::Dir;
>>      /// # use kernel::prelude::*;
>>      /// # let dir = Dir::new(c_str!("foo"));
>>      /// let file = KBox::pin_init(
>>      ///     dir.read_callback_file(c_str!("bar"),
>> -    ///     AtomicU32::new(3),
>> +    ///     Atomic::<u32>::new(3),
>>      ///     &|val, f| {
>> -    ///       let out = val.load(Ordering::Relaxed);
>> +    ///       let out = val.load(Relaxed);
>>      ///       writeln!(f, "{out:#010x}")
>>      ///     }),
>>      ///     GFP_KERNEL)?;
>>      /// // Reading "foo/bar" will show "0x00000003".
>> -    /// file.store(10, Ordering::Relaxed);
>> +    /// file.store(10, Relaxed);
>>      /// // Reading "foo/bar" will now show "0x0000000a".
>>      /// # Ok::<(), Error>(())
>>      /// ```
>> 
>> base-commit: d61f1cc5db799f4e44a63418b2dc19396787427b
>> -- 
>> 2.43.0
>> 
>> 
> 

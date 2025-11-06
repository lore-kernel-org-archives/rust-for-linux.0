Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17034145FE0
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762389260; cv=none; b=sZCOwgjToS8dvS8gNR4xX48Pi0lIUXb91vIjk4cxLqY7SUP2vQu4mhCgBSPJdBQBWq2+bM8FIczXPNPisLLffBKnLVn+IkC1SkgqI20+7cpmQrxXQ65DFvB/neuXWuYjmyArRKy0LA5mVROKoSjUyaR59Ckl+lu8tyVPYDY+yOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762389260; c=relaxed/simple;
	bh=FOIO48oMRggon8AwX+TpwHXuzEMe8DGysvnX8ueu6zI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mhzCB7EMA8wyToaf1kuB1gk8i6Lfeh2X8fmb6GzOJxVXFAiFTMOaROw3k+kvcKkMgeLM8/LfMFp1adSfMXXKm+SYQoFe9Ah4Wi1AQoJjtFLEJgNDs2D4hVCoM+99C38cY3ichOjoL0Rn0E1f+wHmpCaTjx34ZbTC/+17EXe50Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nU4UcUVX; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nU4UcUVX"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-33b5a3e8ae2so1228808a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 16:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762389258; x=1762994058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HC9TaW1rULAAHwJ+qglvnLaI3flhAdE+eML/wmI6ul0=;
        b=nU4UcUVXsXQcR59EjP3xx9J4VjNA+t9PtxeobFPUrMOUA9wEPXt/FNGXxqPujfelLw
         GSkIPYyWgE+U5GG5GtcnMXp9NbehDxRVKQc3c874V/wD0I2V+dl8R+qzZcQ7hVXXaKbU
         eaJ76s64MMdmYOKLfgUfCYBlL0VyJf/+dOIeTwI/lKmV42e/P0an/AOLs+OQtihK8Rqp
         HS8FwgpQ66GyhtfKK7TK/2DcfoG+tOAEOjpK4RHBbixiSA08JmeyU2slPNyXxtiFAcoa
         yjIp5P7+jq1U1AiWZGxXtChLlaglnzZyfL82cWCzjxidGPVW2RwcK4LQSptCswYpNsOt
         z7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762389258; x=1762994058;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HC9TaW1rULAAHwJ+qglvnLaI3flhAdE+eML/wmI6ul0=;
        b=k4GVLMGxyyIozJB4CwS/nSHMQ5xgbemzVdm9vSo1PwYmRlGYroXVQLNo2rj2pB7/aE
         PbVk5N9KOZmxGb0wF0o+vhfynmb2c20pZSR03I3QM80SFsxsMV51GeBW1U4erumFdaZ9
         YqzG330mUi5yD8p/9bxXvejwFATHIwnZhXz2UL1Ddno3trkWYoHT8T5wuJFWI0xkT0K9
         xVOPjXak5pEHUm11nQLT89arqNDza7zgg9scOhF30Cct2BSHF4qlTD7JJgebd8YuF3/r
         csNxivVp2QWil3pA35b5hM7iruV7bT0N8nTk1gcuzzwHhA7JcbBJb/qIWDsSU9d5JiWt
         SO8w==
X-Forwarded-Encrypted: i=1; AJvYcCWBsGxuZdUrVFPbiQWJ7965uNYy52unlO6AAOtTDjFX/Vq7fWGE8G12MO0UJrYPotZKRFbdGx+Mn4QE4dKxCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3/k4SePI1ecC0410DwLo0YWrUEK6a7W5MRWmXYgndNOhoYrAb
	SKoapBKp6mIJVQ/+byW7deFhIyAWF3zRBB4vtSIHeKnpT2iPbort6vyc
X-Gm-Gg: ASbGnctDm/8Xowo+cDIj1nE2E2fHnNAg3wrKYR7kr3MszKxoTHBV15MZjm0st6OMZ2e
	Vi2bS4szXFi9rG2mz75UAq5AeAbcjLMmItEz13ouhZ3Oe3oxk1szsbzFeuRShvQhCuTrpajl3Nq
	WyDOkmnJVz1/fYVtI6S7IkoPA05jQzlqRMg+wGt2cL0r8xUgaGOx/RUKdfGRD17+44qWfmzHZ6w
	8vjPFoP417BP8ImddBCGFKHk0n5/4u3vqBs9py4N2vErO2IndZuCSeBcwuSSg1801oQ5UDV4aSi
	e85FrMwNCtAr0Jb2hiERt7r0CO8i7/btakFf3XZVMb0gd36QjH3dVD7l1B4xLRGJytyfIhVYybe
	9i4i/3vfhc515T7duQcZo5IiGfsNQe/JRwDB+mnj5eQ3sFY/wqzZoC799+hrVYdSoAgcyg9PlZw
	3kiKIcpur8Ikre+aUdhkEo/dAVRevBpAGivwRccrM/P3eb2MsGOXmz6Q==
X-Google-Smtp-Source: AGHT+IGsHH4QHMbJDRc9qouWqgApYLEE9CwHM0YiaK6q212DW7m679H/UpWLWf2EEXAOQNFl54uoFQ==
X-Received: by 2002:a17:90b:5343:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-341cd136e0amr1424210a91.10.1762389258305;
        Wed, 05 Nov 2025 16:34:18 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d0c9be2fsm169820a91.7.2025.11.05.16.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 16:34:17 -0800 (PST)
Date: Thu, 06 Nov 2025 09:34:03 +0900 (JST)
Message-Id: <20251106.093403.1018201099258988884.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function
 exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aQsnybOPSkRUEA_v@google.com>
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
	<20251105054731.3194118-2-fujita.tomonori@gmail.com>
	<aQsnybOPSkRUEA_v@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 5 Nov 2025 10:32:41 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Wed, Nov 05, 2025 at 02:47:30PM +0900, FUJITA Tomonori wrote:
>> Add the Rust equivalent of the kernel's `DO_ONCE_LITE` macro. While it
>> would be possible to implement the feature entirely as a Rust macro,
>> the functionality that can be implemented as regular functions has
>> been extracted and implemented as the `OnceLite` struct for better
>> code maintainability.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> The OnceLite implementation LGTM, but I have suggestions for the macro.
> 
>> +/// Run the given function exactly once.
>> +///
>> +/// This is equivalent to the kernel's `DO_ONCE_LITE` macro.
>> +///
>> +/// # Examples
>> +///
>> +/// ```
>> +/// kernel::do_once_lite!(|| {
>> +///     kernel::pr_info!("This will be printed only once\n");
>> +/// });
>> +/// ```
>> +#[macro_export]
>> +macro_rules! do_once_lite {
>> +    ($e:expr) => {{
>> +        #[link_section = ".data..once"]
>> +        static ONCE: $crate::once_lite::OnceLite = $crate::once_lite::OnceLite::new();
>> +        ONCE.call_once($e)
>> +    }};
>> +}
> 
> Wouldn't it be nicer if the macro syntax looks like this?
> 
> 	kernel::do_once_lite! {
> 	    kernel::pr_info!("This will be printed only once\n");
> 	}
> 
> You might implement it like this:
> 
> 	macro_rules! do_once_lite {
> 	    { $($e:tt)* } => {{
> 	        #[link_section = ".data..once"]
> 	        static ONCE: $crate::once_lite::OnceLite = $crate::once_lite::OnceLite::new();
> 	        ONCE.call_once(|| {
> 		    $($e)*
> 		})
> 	    }};
> 	}

Indeed, looks more readable and flexible. I'll use the syntax in the
next version.

Thanks!

Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725431E89C
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 04:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765428390; cv=none; b=eySuMZnMrxtTRNBSsc1h87H+MSxfA+yAHPYWw42zVR5D6K4LXcwmOaEVYe/DVXgvIt9V/1nCf8R2ORpnYYd4WW1zhSSO0BRDHWVAzP3KULy7gXWNJNMkm0EFl20Px289pe2mRRo17c8DU0CEIN9Sd9QmPno06By1lUnm6Zs8lzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765428390; c=relaxed/simple;
	bh=VwI9oFoDwdYCptbVp+Sb9ZsvNQ0vUEIRqzVnCu68nS8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ixlKD+IUAWsTZzEA+OEnNsJcE/r29PFB/KdwvGOw9nMj0fXyNRtSMDtoii3FAdd8FE5T3lANqQSaXjDdpn2I/7SYh0/FcENOx3ZkMrc2h6//sFQ/BZJ1+fMAiWeG6OqydonVfYTJ9ezLUP/va78dbyvLvOJCt7/CPqVO2QC18EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuTb1Azh; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuTb1Azh"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-343806688c5so521055a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 20:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765428389; x=1766033189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5OM531HtBLnTHeTHi6+/xZayIsz1FLS+Cltgw3s7Kc=;
        b=QuTb1AzhUDUA3UAs4OVyvUD1+pjHr8lFTPYBnUT5OgG3pbMOpumhtBUxUwTsHv/oXo
         8kwnSKJn9OzFJ/Fw4uW1qa2IAyEeceiabHY8CG79FHvvSOfblAmxt8G74CHt1VrObwEx
         c2uZBLlmgDv3d+rFHChugnME9nb+Sx2nHOOEbwaUYKIejeLB1oxzIqyLzefwAVzMJaUG
         PDbZQk6pcr2HuxiBfiJlVgjRC037xLNH6ttvqjZQ/sbyAAdJA4/nCv0tm6eBWcU5WuU/
         Xh9/nvp5B4+w5RFVMa7EosDbaYqvboJ9uSmQeews6S7yk2p+SjdWqInMyRUxdtPbxTvA
         +sVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765428389; x=1766033189;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5OM531HtBLnTHeTHi6+/xZayIsz1FLS+Cltgw3s7Kc=;
        b=LhVMGUPjUfwTsLUwBfDfsRwUYhvpytML8Jh6eob/3fXSdZ2BmkVVzLmXo+1SIno7oQ
         cnZH7ookov8H6nHINB76+NMtiaFbrN38XlYmkHcamMh7wE344CHwC478ameMXBg/K6bq
         oKiY0lGydGug8u4BeyOAvPkxkFnQBWpQ/GnPm1dFvDMW8bx/cGWy+X+L1A0ZtyhpeKIH
         73QqbLmbdTsaGRjOS3vZkuTWMjg5IvzkktKsoxv5AIoWAGkalDA+Oe7Lrad1uKvNg/yn
         6NtBWi+tr5HifJ55ZAFVJdAPDrjTWu8GnDvo6dQHzWTXAa4f88QfSsbwP29ZBDnhjQZb
         mc4g==
X-Forwarded-Encrypted: i=1; AJvYcCX9ZXg9bp/c+59e4Zn7kAF4UGC72F68O1hk3WaIhl1IbZDYd+GWa00uX1dhuIeJ/DKTWKY5VXw4nLIVoOd2bA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2tsk2KkR7D/rjv/BtXaN6Uets6LSlcz3sGpVxbj4lzNfQLhkW
	54N8/mZ3MD9pwLOoP99/j78P1Vi5WaNHho5mF84/DEmh1Z0Q89/bhJ11
X-Gm-Gg: AY/fxX7iMEM1C+waaeHKHjfSYmWAfqlc80eOgwZEDMwR9mZbKNKi052cvOwSGoQimIF
	+lGC6dPKLiup7Ihp8S9E8MWIK54NmK7uk3v1HsRx9yWB20xEkhaFPQikz4tzel/nJNbfgXtgVgd
	QmhCzBwLPh+k0HPvIejAtcld3eMm8lOCwKPw02CF73QikXzubJkqPwYwIU9rcUKJ3GGyMecdF4J
	kN8S+f/n7TRfif8o9e0Eaa1QFo80OpjxQZQlrRsUU/Ysa/EsPqS5puaBUGsxrGq2Ci1Fmc+37yM
	iapusakU1/TWjwGsOM7YN4O/Ze/ya6w/3Lpuuur9n6Qv/5le/Iewh5yEb8OYP91RCMbm5/XlK6n
	8bwS7MhU4ES6DXOtM9DijpQwloOFwEQ2DwPI6gPvtXO+M+jCoMlTshaIkwmRAHqvpQ86y+zbujQ
	KKh58a2xkyjDN+4ad25voD5TGQ2nh9iHKyzuFj9JmuLMXP8NJzfU0dE1x81G8aztxW7mI=
X-Google-Smtp-Source: AGHT+IF3QTgShXDX+F2c/1U7fC49TD3FKp3gBGqMQTKAtiAq8seb8WrzbOspMG0Fy6KBxtiOIY8BkQ==
X-Received: by 2002:a17:90b:1c01:b0:32e:d599:1f66 with SMTP id 98e67ed59e1d1-34a72886bcfmr4414379a91.30.1765428388666;
        Wed, 10 Dec 2025 20:46:28 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9275601dsm509772a91.0.2025.12.10.20.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 20:46:28 -0800 (PST)
Date: Thu, 11 Dec 2025 13:46:08 +0900 (JST)
Message-Id: <20251211.134608.1131326511882463023.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, acourbot@nvidia.com, alex.gaynor@gmail.com,
 ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 mark.rutland@arm.com, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v2 3/4] rust: sync: atomic: Add i8/i16 load and store
 support
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aTn794JgkRrwGpzm@tardis-2.local>
References: <DESI62R10XIZ.245BISU72Z2V8@nvidia.com>
	<20251209.081456.1519886345847572170.fujita.tomonori@gmail.com>
	<aTn794JgkRrwGpzm@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 11 Dec 2025 08:02:15 +0900
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Tue, Dec 09, 2025 at 08:14:56AM +0900, FUJITA Tomonori wrote:
>> On Mon, 08 Dec 2025 12:08:23 +0900
>> "Alexandre Courbot" <acourbot@nvidia.com> wrote:
>> 
>> > On Mon Nov 17, 2025 at 9:10 AM JST, FUJITA Tomonori wrote:
>> >> Add atomic operation support for i8 and i16 types using volatile
>> >> read/write and smp_load_acquire/smp_store_release helpers.
>> >>
>> >> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> >> ---
>> >>  rust/kernel/sync/atomic/internal.rs  | 48 ++++++++++++++++++++++++++++
>> >>  rust/kernel/sync/atomic/predefine.rs | 14 +++++++-
>> >>  2 files changed, 61 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
>> >> index 6fdd8e59f45b..4c9f4f76dbdf 100644
>> >> --- a/rust/kernel/sync/atomic/internal.rs
>> >> +++ b/rust/kernel/sync/atomic/internal.rs
>> >> @@ -263,3 +263,51 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
>> >>          }
>> >>      }
>> >>  );
>> >> +
>> >> +impl private::Sealed for i8 {}
>> >> +impl private::Sealed for i16 {}
>> >> +
>> >> +impl AtomicImpl for i8 {
>> >> +    type Delta = Self;
>> >> +}
>> >> +
>> >> +impl AtomicImpl for i16 {
>> >> +    type Delta = Self;
>> >> +}
>> > 
>> > I'd suggest putting these next to the impls for `i32` and `i64`, for clarity.
>> 
>> I'm fine with either. Boqun, what do you think?
>> 
> 
> I think we should put them together.

Thanks for the confirming. I'll move them in v3.


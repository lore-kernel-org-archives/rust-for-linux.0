Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84A32D2384
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 23:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762904297; cv=none; b=BU3yxAjt3whwSnv5HrTardxqXPeXkbAZBIMx/0y29//T10d+kAxRm8Fk6jFwr6H0UNNFhAj+OF9vGvy/YRDl5cGik7F0Fkt39J/FtsEvHMTfasSUesMnhM1lESJnZFCyf7hCEOqtjqWqyJBlFTMcgJ8zm0xdamTIQb/yPr/igAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762904297; c=relaxed/simple;
	bh=Mi9odovMQsKC5xAVanqjNOmS9cfKBPMJX44WQV38508=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dNRTAAcsuLxVSN6rjYwquZkMIjIG37OQWKzGIZ3biekUeRbvHNfEreFOo5dW3W1f9i7NQn+1guv2W1gpLhCnB8G0UXWTDzQe1laGYA4MJDEPRZTteVSTQ8UM839I8Ho2YOXqdh/uWwlwqFFjPRRYY3oHwC/4rPEq0UlpNshduCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OT+oEof/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OT+oEof/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7ae4656d6e4so291356b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Nov 2025 15:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762904295; x=1763509095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQxH28SJ8gFxE4Kxv9G/DSi5xZxSr2kgeW0EStTvfd0=;
        b=OT+oEof/g+mtGk17BUxHNNcX246wpw8ePfexbrN2nqSwCYurgSJ93YRdIrgW4Hc+nM
         0NbCvayD5xpdx5rja5xF6zEXJggYBE2b8v1Cf1UnRnNljOqd2BnkqliOqXmKb/MBGdmj
         v6YN8noTk9389BQvYgm6KkC3r/FBetHexP48kVB9X2WsPEhbEEeX/O8L3c7SIPmwPKNL
         x4z4J15znYAjcBK5abviv3WzkbTChsbYtQFUBitvjuk6dJBbp/fQZMozjkjvjZR2nNMK
         3eXKZ6CLU8L+UU8jqzTHcYBuTHcchmCwGUU7KNd7zhEn76D9XfmXqqVWTSCBVqP1Qn2q
         T4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762904295; x=1763509095;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQxH28SJ8gFxE4Kxv9G/DSi5xZxSr2kgeW0EStTvfd0=;
        b=wGEEMNM+xw77pnfQ9j5eRAV4qPIlmv9YpFts0Usp91Tur6ZQsHgfaGOczYIBqhMYj2
         ggGs/VmscpDyDj7c8Or2SGmYok50W2sOtlVv8Z1ftX6ior076FOvECxH6k2nZRsJf9Eb
         v1kkeKRQx5Qs7v7GvCnHW9LX6RdPD+d9/s+Wirv3QE4gMdzHkopheqBFliw4gm88aoNR
         BGxzmY8uO9zfmUgLOWfgSnvYDZ9YX+fqr2hECzGCB2ZKuwvkHdux7hBSniRsih/kPZS2
         6oYVbmICKjfB824axMotV3wdGcqVx3+pwrKFVf6Ov91o7KSRDTZCUz2w5ecOehz7FesU
         jrZg==
X-Forwarded-Encrypted: i=1; AJvYcCW3oVHhoP2+sFD+AN3Ih6bkuu8Dxjq+wqo9mgFOePrKtjTbWdO+gn28XovSyW7dzh1LsUz5NRbUM3pyZfk4AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8nOu1zLRiI7ZsoIQGVl8XInbEflgnOP5mzvFN9ZI+neW9F7Bz
	jkJL8KoggUSNm/VzyR3bkvRDrmHfKFWlB/O2yRZc3TxPSKAEMO5NhCnj
X-Gm-Gg: ASbGncuE8woaaHICtQJRaJnwwCCoYLKJZC2rf8B55WBeWf1XVwoUEhu/STZIPp9vvfA
	zsKITdBFNu+IET+vmAy2IRSB9uw7hSXTjs4t9R5ACxrE1mcgMfThS9OiLrjVpy1tblY7Ev19lFI
	x2oBaFO1UNPxxKFEpKXU4Kqc7AxcRwW/3ExJ0rSEiy4wpcv3sZsQrEVbgTOdR65JQJPj5NkL45m
	cC3i597w8IJtR9BAPsgxCGqNT9mh3yo1e0tuGIZSMns7M9a2shYwCxW4Tvvd3uC9f4CbYZUxl1a
	ZIuqvtLUpabxJ7J7pXTdVuzqwGik0LHgti1uCQych4/tqxH1HbxPRqswO3qKqmGrq//X6NK7fdC
	0bYNBPCDAn1STJR/dgwdxwxngt1P7VjT9krUBSMCjCbP4B5LSMd/eoqYREsqR9/hfDwjrtB91Jr
	g2PSAUrjWU8BBtX0RsodlyoqmuaTsCEUfl/P6hsev/7QccnaUOjO7IJg==
X-Google-Smtp-Source: AGHT+IHjmYxz+MZCYkQhEFLCWVaATLQBpK1xwxMAOz7b47QqHwvT8XIpj0Yj056Cl+/cwYkDImvTYA==
X-Received: by 2002:a17:902:d54f:b0:295:9b73:b15c with SMTP id d9443c01a7336-2984eddf6e6mr11535925ad.42.1762904295079;
        Tue, 11 Nov 2025 15:38:15 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bbf18968e1dsm720269a12.33.2025.11.11.15.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 15:38:14 -0800 (PST)
Date: Wed, 12 Nov 2025 08:38:10 +0900 (JST)
Message-Id: <20251112.083810.193018002393490094.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: boqun.feng@gmail.com, fujita.tomonori@gmail.com, aliceryhl@google.com,
 ojeda@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function
 exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87h5v16igr.fsf@t14s.mail-host-address-is-not-set>
References: <20251111.120949.1793896304189618185.fujita.tomonori@gmail.com>
	<aRLG1Ofr5QpJGFaB@tardis.local>
	<87h5v16igr.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 11 Nov 2025 10:12:36 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>>> error[E0277]: `core::cell::UnsafeCell<core::mem::MaybeUninit<()>>` cannot be shared between threads safely
>>>    --> /home/fujita/git/linux-rust/samples/rust/rust_configfs.rs:109:9
>>>     |
>>> 109 |         kernel::pr_info_once!("print once\n");
>>>     |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `core::cell::UnsafeCell<core::mem::MaybeUninit<()>>` cannot be shared between threads safely
>>> 
>>> 
>>> We need Sync for SetOnce? I haven't been following the SetOnce
>>
>> Yes, I think `SetOnce<T>` should be `Sync` if T is `Sync`. So good
>> finding!
> 
> @Tomonori you can include a patch to add the impl, if you end up using
> `SetOnce`.

I was planning to send a patch for adding Send and Sync anyway,
regardless of whether I end up using SetOnce for OnceLite.

Another change I'd like to propose is to use an enum, such as State,
instead of u32 for the init member, as I did in the OnceLite
implementation [1], something like:

+#[derive(Clone, Copy, PartialEq, Eq)]
+#[repr(i32)]
+enum State {
+    NotStarted = 0,
+    InProgress = 1,
+    Completed = 2,
+}
+
+unsafe impl AtomicType for State {
+    type Repr = i32;
+}
+

I think that this would make the code's intent clearer. What do you
think?

If you think that change sounds reasonable, I can send a patch.


[1] https://lore.kernel.org/rust-for-linux/20251105054731.3194118-2-fujita.tomonori@gmail.com/

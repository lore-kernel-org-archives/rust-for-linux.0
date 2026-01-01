Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207DD1CAA6C
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 03:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767238039; cv=none; b=rxcuNmUibpFKol8a/7AdsJCaWDWnRtA0X7/Sx7llRHKG93tIqks8qB+s4ENt9i8C3abfqC6skzsrEwy2nm8j0lfbJHbUhgybOUqKHNIMo+gau9iuv+r2pxhCYdLo3OYEbldB7oj5mADNrpZ2JKzK204/exj0Xm1ZluLvAonmFNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767238039; c=relaxed/simple;
	bh=eW21rXYuAMNL/Q/NB+5NsUTIo96fybhUX4uk4OSHdg4=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GjuZsCjkKT7tW2ATWomgRzSw9fgyzwfQU4hjEo0fjjg1P9kTt0DJ1A7m/hZ0X4WehOJIiJrj+YhEd08l6vGe89f44XzFSYtXuE/ZZofOS6tDJqz0pZnDjeX6FNI0Vbz2DIBMITqXpQxFOkQAbEBMWpBLDOcNbdqtrJeWiUEzOvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkCgjdJ0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkCgjdJ0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0c20ee83dso143504615ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 19:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767238037; x=1767842837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URkzJF6KuwnH0SlAYpJCl1hDAluJTaS1mvC2L+e7OI4=;
        b=UkCgjdJ0YGZoK26p19zls1bBRkLmr834Z4mM0VaoWzpiDsHgiFNkxJfVi8M63D69o9
         +yLKSl8NOm0SGdLBa8XSGSd4QUC3GRue9FzXw3Y9VOuM1OX2faoxHjMAgeUIQ5IBWsbJ
         LS5wQCTzDlXaf2lXivLKljw2nWZXRu0TKiyYrK+o2Shox4qQRUpXBjgAtn+IIUUKLISa
         8eLtG8SIRNZneC4KaJ/e4ENlj0TS0Ngr3459/VRAk2VolZh3vMPw1fJucqrgcj5/6Hxe
         VQD0jLn4TarbYcoORUBCDpt2qeQQwlwPofTgjQnvhQ1pGBzDJbisJNDWZo/y5CJ5Xrdo
         xngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767238037; x=1767842837;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URkzJF6KuwnH0SlAYpJCl1hDAluJTaS1mvC2L+e7OI4=;
        b=v1A7ELzURL2bHrhuOsk6hwI1MuVSPbhD5m+cqjxfJFRDd+fbEJcl0cYacXkdSYbsY0
         mIl18Y2oVrYZU9VzRU6K82slhQredRvJec7W1HgFP/A+vDFpqWymzRd/9QV9iv+wUPqr
         uFOwcfIWTJlV+82oADNimn7DAtD3U6lcJaSu7l5XrJuame2c5aOTKL0qlzsoDI5qYyZE
         kkOUI0dapp6cxLrKo4jcR6IxOVpZ/CvZyT8+j8PvgflfV+Uk3dC1pUd9J3tMi7IV0QCy
         i00yok01Ykfyy2S9nXFKOTDei7oEObiiaZhJgkmv5HlZbpKCJ8MyQcJiIXZaH4eLGrF6
         KXow==
X-Forwarded-Encrypted: i=1; AJvYcCWFAW3I4eg7X81plSb9Tf4DretKU0eRbO1TliZ4fTysqbtzk+Phewi++3TJNBsYgDrnm4PhFCUbXC7H92/88Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0mWopsegyh5UJHw/CNwQTYC+DFFQO2LplYqBBXDqtbRcKeRKC
	p1gTi9Z+mG4gOl1bxBHOTQ9lunTcRaAY21JWdvmvMO/Nyw7mXGqd4M7t
X-Gm-Gg: AY/fxX5Rz74V55bFJ+bUPc2WVUjtbT519ma+WquDZznqbeBkF0dTzm3XXLu01v80qrc
	iQy7cR9IkEb+sxliJomQIH2+TKc8h84i2SFkubuVH62YFyAEA7NQInRy8Pp4M3hvp9d0H0ZQlEe
	pia5cg3iwPTBx07zaD9+iiE7MSyNAhj8X/pgEKzPoWineikHeoxfrZ0Ux16UzlD4GoRa7MRKsrl
	pxitsD9Ox36xTRKPCYIz46nEDiQpYPzL57NmwF9+nDzTWXU9/tEuZYtj/Alvcue27c5yJ46TXM0
	RnSG5MjK5O120d+n4NyV+CMS+7UjrkV0rBbYGxVk6lT8Ki6xIHIGGw6jRgSW1uwq0+Xw3ajfGwD
	ddv9JvJFoHIy9/pS8qBwmZA16u+MATdVorQ2Tjz2lcGHDVIv7cHjGdxPQqD+11qSdX2V+ntD709
	3+24QmO+48+q7W+LeSK2Cfcm63m/J9O+2Om6YOvBgmmG80jBCW5QQmmnJxHDwPISRlV5J/2rjGs
	rxATQ==
X-Google-Smtp-Source: AGHT+IH6AF6a1j3gYbiGUaYhPP4PidZgt6F/PO/iHaW4dHygCi0e7n87vvw6c1RFB7wkVjmYs8XEEA==
X-Received: by 2002:a17:903:b90:b0:29d:7b9b:515b with SMTP id d9443c01a7336-2a2f2527092mr393241735ad.20.1767238037313;
        Wed, 31 Dec 2025 19:27:17 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6b7b0sm340978965ad.16.2025.12.31.19.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:27:16 -0800 (PST)
Date: Thu, 01 Jan 2026 12:27:02 +0900 (JST)
Message-Id: <20260101.122702.1297255764389254863.fujita.tomonori@gmail.com>
To: gary@garyguo.net
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, ojeda@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, lossin@kernel.org, tmgross@umich.edu,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Add atomic bool support
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251231153431.4a48816c.gary@garyguo.net>
References: <20251230045028.1773445-1-fujita.tomonori@gmail.com>
	<20251231153431.4a48816c.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 31 Dec 2025 15:34:31 +0000
Gary Guo <gary@garyguo.net> wrote:

> On Tue, 30 Dec 2025 13:50:26 +0900
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
>> This adds `bool` support to the Rust LKMM atomics.
>> 
>> Rust specifies that `bool` has size 1 and alignment 1 [1], so it can
>> be represented using an `i8` backing type.
>> 
>> Since `bool` only permits the bit patterns 0x00 and 0x01, the first
>> patch also documents an additional safety preconditions for unsafe
>> `Atomic::<T>::from_ptr`.
>> 
>> `from_ptr()` exists to operate on C-side storage so I don't think it
>> makes sense for bool. We could restrict from_ptr() via a marker trait.
> 
> The C-side does have `bool` type, too (`_Bool` has been there since C99 and
> we have typedef'd it to `bool`). User might still want to perform relaxed
> load/store on these C-side bool storage.
> 
> I think it's fine to leave out this line too (given Boqun also points out
> that the additional safety precondition is not needed for `from_ptr).

I see. I'll drop the description in v2.

Thanks!

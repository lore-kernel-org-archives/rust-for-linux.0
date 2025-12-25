Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890B241C63
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 00:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766624234; cv=none; b=oo5fhuEKddqlv+7Azw2TFsHSjkiJ4CFJelhqmJtnPV6ZXP2wJd9R5LLLdAYJ3AHhasFcOVjAP5nSCasQ1Z80U9jCiS3umNd4NwgxsyTD9a+sVvoTkpTdSyRpZCDBwTAnn9xNXNEHG5a11QopWWv/wiDusPbqNRYHvu7uZUZtl0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766624234; c=relaxed/simple;
	bh=jMNmLY7Zo0vR1Cv2A9ndNwj9r7H8MNy8rl3djWJOSzA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JSlFQVGI/dFozFd0MhRO6J3g1uYlsQ4ZTtkW4StiYRTNLOOAhDe3rxHYLwT6FJd6N9d92K0VKn6/K8bEEW/EQTEtYCcgYF50PvVA3jNZqB9DVPQkj/FYwEMX21PtoZNcFeoSkOoyYZSb/CIQMq+8shcz3v/Dka0rb8AdlbAyPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxKh7DCN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxKh7DCN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f0f875bc5so92595605ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 16:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766624231; x=1767229031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmJlYQp0WKEJKAjJG22CkYH57UeuO3Uma6IPeBjDN9w=;
        b=WxKh7DCNoY0fTRiUss/ROUqrxbA4Ng8PgTC2fXNVFy6NuZy9RK77dVU7S8Ax1aR71Z
         ZQXLdmc3HtIXd5mmENCNsRP7iVBEwwuXbfJMXMYRXd8IabZgfaO9REzGdSgi2D6spXcH
         T+6s4E5iouDgrYXQnNH19KSokIB2OkIm9AA1BDR8BH8M0z5122xZHKPeAWvN52P+wf6G
         vm59w6RtCSQOtBc7sgVKW7IRzBfCy3hB9qNH+Enj+sPX6rufJHfz5rPhSa6eHvPr5Kb4
         37qbkMe2GCYKIT9mr6ffxFcQ5dysFvDKagqII9fbYz4DwCXURcDvwMEHjd2vTlSmjdtI
         L2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766624231; x=1767229031;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmJlYQp0WKEJKAjJG22CkYH57UeuO3Uma6IPeBjDN9w=;
        b=cOLPlm6bSP1C0sqDJYEI6ztOio64irGagXivlulauJgWxDpRM7wQMytOoehXqMSOQq
         VlIum7o/ob9ajJu7pb4uODBIeHxrXPR4r3tNnzeieUXefgjwmCuXdFwgJiqWdZh52tLq
         wTtTG3uW6IRfVj7//1jXvqvxXcVlB43QdjREg5OPuRWyP5fUkNU3ESgIezZxWj2yeD4h
         T2shVA6S42Qqm0w0KZR/WUysOb+URdSmSiY5k/9WaaRylYdcxnohGW/mbWVLQo/78fhG
         DVYeNMX97D1QKIAR2GMu+F21afqU7cRinXBcGZ4len9IMfKbinbhaF+jtuEBGPwz2yxt
         mKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX33gg3yBoPK5CTaP1nx6o1XFhANsYFSTriGBEUQizQHtxS/INvT/5P6no+KSojLi5+TQDrYoDm8Aoj+yqtSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3C8EHbu4uKniCJs2DlZnfUW/eHRRpFA2CH5QxxO4Me5xbnCkT
	Iwa/A1FN5bFpiyYN8eqs6a88vha0dkhGfgCSu3d1PwVMqdAKwUn6TrYw
X-Gm-Gg: AY/fxX4jrIRJj7vfWAm2515AFFR3iRvjP3UbMG3U6cmUD4RjNuaRf/IIC2H4hrRZ7+E
	uZLX39ZiI7W2UIqmP75+sV2XDmAyot2QF/3SzOv8wgrx5W6u9d7yTidkkgRxB9PF7fz3SjJsXvH
	5jZGyU9zIy+DkHPqFNhL97GR9uGpijbtKFHq6VpHGFUgFYB/3jn6b/aqbOsQS1oZ6l7PFB3WF4r
	K+apR9t5zZijlhwF00Rs1SJ/xqxgeehyCdicM6OaSZdEC5Nq+hn7lSykMkL5MOTtuurJ0mh0tnX
	ThezZkuvGXUN8JdAjD1crhmyQ2Orya50XQrNRC52myROeMgVbUPxx6e2JwsSka4wSHzTLkjG1yj
	n9FlIj/o+coI9+tyDyWKwWnUqiIU2wi4j8lXHdyntE6RKyJa8HIG+oPeyWMP7ahi7Csnl1EULhx
	zpXWWkrURzdZ1Zq2OAZIbuoBJXk2EKXNvuDtqcvmbhxWFoc8hkcrW692Z6Cln7OHd6p/s=
X-Google-Smtp-Source: AGHT+IHYIT1UKD7G6j1zsAt0oUwMwGT3axWIz87jexYXkCraW4OS8iooI5EJ+aLcAb3WfuCb5sp3Gg==
X-Received: by 2002:a17:902:f70d:b0:2a0:be68:9456 with SMTP id d9443c01a7336-2a2f28404a0mr186470385ad.46.1766624230775;
        Wed, 24 Dec 2025 16:57:10 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm164703275ad.21.2025.12.24.16.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 16:57:10 -0800 (PST)
Date: Thu, 25 Dec 2025 09:56:55 +0900 (JST)
Message-Id: <20251225.095655.275822477142372376.fujita.tomonori@gmail.com>
To: gary@garyguo.net
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, ojeda@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, lossin@kernel.org, tmgross@umich.edu,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] rust: Add i8/i16 atomic xchg helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251223124639.7771082d.gary@garyguo.net>
References: <20251223062140.938325-1-fujita.tomonori@gmail.com>
	<20251223124639.7771082d.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 23 Dec 2025 12:46:39 +0000
Gary Guo <gary@garyguo.net> wrote:

> On Tue, 23 Dec 2025 15:21:36 +0900
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
>> This adds atomic xchg helpers with full, acquire, release, and relaxed
>> orderings in preparation for i8/i16 atomic xchg support.
> 
> 
> Any reason this series is not sent together with the user (i.e.
> Rust support) that uses it?

The users are generated via macros that add xchg/try_cmpxchg methods
and their tests, so sending everything together would result in more
than ten patches at once.

I wanted to send the bindings first to make it easier to review them
on their own. In this case the API is already clear, so I don't think
it is strictly necessary to include the users in the same series.


>> The architectures supporting Rust, implement atomic xchg families
>> using architecture-specific instructions. They work for i8/i16 too so
>> the helpers just call them.
>> 
>> Tested on QEMU (86_64, arm64, riscv, loongarch, and armv7).
>> 
>> Note the architectures that support Rust handle xchg differently:
>> 
>> - arm64 and riscv support xchg with all the orderings.
>> 
>> - x86_64 and loongarch support only full-ordering xchg. They calls the
>>   full-ordering xchg for any orderings.
> 
> Maybe it's just that I'm reading this differently, but I think this is a
> bit confusing, as if there's an optimisation opportunity.
> 
> x86 is TSO, so even a relaxed xchg is a full xchg. So in this sense x86
> has implemented all orderings.

For x86_64, I agree that the wording is confusing. xchg always implies
lock so different memory orderings all map to the same full-ordered
xchg there.


> Looking at loongarch ISA manual it's suggested that apart from load/store,
> all other atomic memory instructions are also always full ordering.

On loongarch there are two possible implementations: an LL/SC-based
one, which is effectively always full-ordered (similar to x86), and an
AMO-based on, where weaker orderings may be possible, as only the AM
variants with the DBAR function appear to be full-ordered.


> The change themselves LGTM, so
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>

Thanks a lot!


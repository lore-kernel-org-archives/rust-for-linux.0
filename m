Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4F43A1E60
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766827044; cv=none; b=A83evgQzKNYKAO+OA6qKmSCOUBJ1cnUsvXIISHOwZ7Hbk1gqlhg8C8abnLyn49Y6amIfZ+afl7455kuHf7LD9VKYkoAoMCWryzRbo914IRTYljNLAkLp0O/qRm+ujYB6LeHnYRwjqOhjwwhTk+vgPl75fGPTiWmpw4uyu4rrEII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766827044; c=relaxed/simple;
	bh=6k8i2HyDBlJeEmoAzrTDq8MMdF3dAWje2vWj2UgKJe8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=O+4PnNA3uMh3h8v8x8sntCDKoFDTEgNpklABxX5zxWPKl3KFQOixf5u9UUSjWQ7563j7veRdYY2z1E05IS3O8afscW1r/JbnvtPjTbo869I8vu3osuP06iPar72tX+1IQNj7QuRWzpikEPJQkQaDHRj7G4nqu4op1sJAlAHAD2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUp/M71f; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUp/M71f"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a12ebe4b74so138483695ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 01:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766827042; x=1767431842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lb2awl5oM8YhXOdTB1C7Rw3aEZxsQeDmJkQlR7fqJIc=;
        b=iUp/M71fVorpw9SiCCm7DX0i0QTZ/heSOT13Z9RD6C81Xa05Po0AjsPLDn1iZi55w3
         M4+Rljutd69DIPgXaRjl34H127psNuEGPQ2HWPF7VJlKXklGUMu2JjRPKdDoDdW7U82G
         dtvCtSvY2nSyIJEM35XcNjaks/rr5OfKcHREo0oKr8Cgo7tWpnTHpvMiBtzPtK0zVRp6
         2p2aBMK1FlYU7Ltgaush5vSptXCVdYHLk0LqVqM5twptWjC+WSlsgk7XZj9LUep85IVV
         JhL49v6HDNoBI9sMG+LeZ9h0Wr3ZyARIWHNDz6587aX9rcVSCodQ0RlUL/G2vuUd3LtK
         QDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766827042; x=1767431842;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lb2awl5oM8YhXOdTB1C7Rw3aEZxsQeDmJkQlR7fqJIc=;
        b=OtxYHeGBIV37EplKpUEl+rMsJZPn2fAfPHeeh5eSiwgUbzB2ykD0a/gIDGqTtfGuRp
         Z/LdPvy8uQt/6mfqlTNA2Ve2wP0Lo/8LeGl4/DVhP9pWeTmQ493BwU5uaOQ1J9s8FEY4
         VEcZtwfETMoCDYOiqf1aS7WGSOFIp97NY6JLGRlbruf3x3Y7WCwRc123sl3QiaDo/GPr
         P8S1f8emSSRuE7AZrgeKC4r5LQy5qQg3utKtu0imrlADw0q334FE1UVeDJuc1vsTfUd0
         /nU2w0+x1AUinCWQCJG+8hND9bjYg+KeVOD98OAE0Mk9INhM04q/AAW+Gmf9bs+6fJ0z
         z2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXh7FdNtVbESIa/1flB4NFQ9M5jg4XT+QtgH7fbI+hqEoldqin6RWrDrC8kG9u09dX3d3btzXtJdmz4rGbgOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypaoYpVmkngf2Kas7QdbhfdZ1z0Yku4fSTZf/OArqoyDtVBq/T
	7ZCPGK3yhKAtfQN/ZGQnGhXXvIVjX27WpIJecTk9Wlp60F/BQZCpMwf4
X-Gm-Gg: AY/fxX7wevoyFCRS5UT4UQUSfDvWpoPwba4gk5cnhwJRcWqx2j3cMB8/9cHN4ELUCXD
	AHOClWLpGlSwD57p41vDxFxR/9qp9Sk1PznaOOujNkyl+UnotThlX95wt4lU5qqW8dVvLifU1r3
	XdKDhf0chsFgTHQAyp/gXFMxz1VbKfWzDNUJ5WmWqSmM2pvGPDs8B45h5t01J1Bj7urKTWt5+6U
	deLk+p8XU1cGOi4duTTT6VrzcTxiPtrxsdQtVbT081WN4+8hvU2P2YUE3ModSv6JVH8shSfffDk
	k61djfzXBbukvWjrXIspW09dBWYqjhNqq51OUL/0BSObTrHxBFKn0zXAezld35Qxm2sf581t2JV
	9Fq1D1pqSfEGltCTxMs8eXAbOmvYBDxMCJr5OhiM/k7ZRFSYNgYnwPgDvJqyGNXDn+QzEooJr+H
	xbLFX+IHN1FYl1qrw9pACpRrnCYknELKAL5jZRI7hoJVweWnkmcNF6GcnJDajZjCYFqHM=
X-Google-Smtp-Source: AGHT+IFa7jdipzgdchTyteOBcXw28bMexQC8evBC7LfTv8XSFSYVzX4/9rs9easWyCzzYXX4arjVUA==
X-Received: by 2002:a17:902:f542:b0:2a0:c20e:e4d6 with SMTP id d9443c01a7336-2a2f283de1amr234502165ad.39.1766827041936;
        Sat, 27 Dec 2025 01:17:21 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d76ce3sm226642125ad.90.2025.12.27.01.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 01:17:21 -0800 (PST)
Date: Sat, 27 Dec 2025 18:17:17 +0900 (JST)
Message-Id: <20251227.181717.1843883205283099818.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, gary@garyguo.net, ojeda@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, lossin@kernel.org, tmgross@umich.edu,
 acourbot@nvidia.com, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] rust: Add i8/i16 atomic xchg helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aU-JcvYaOYznqD-M@tardis-2.local>
References: <20251223124639.7771082d.gary@garyguo.net>
	<20251225.095655.275822477142372376.fujita.tomonori@gmail.com>
	<aU-JcvYaOYznqD-M@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sat, 27 Dec 2025 15:23:30 +0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Thu, Dec 25, 2025 at 09:56:55AM +0900, FUJITA Tomonori wrote:
> [...]
>> >> The architectures supporting Rust, implement atomic xchg families
>> >> using architecture-specific instructions. They work for i8/i16 too so
>> >> the helpers just call them.
>> >> 
>> >> Tested on QEMU (86_64, arm64, riscv, loongarch, and armv7).
>> >> 
>> >> Note the architectures that support Rust handle xchg differently:
>> >> 
>> >> - arm64 and riscv support xchg with all the orderings.
>> >> 
>> >> - x86_64 and loongarch support only full-ordering xchg. They calls the
>> >>   full-ordering xchg for any orderings.
>> > 
>> > Maybe it's just that I'm reading this differently, but I think this is a
>> > bit confusing, as if there's an optimisation opportunity.
>> > 
>> > x86 is TSO, so even a relaxed xchg is a full xchg. So in this sense x86
>> > has implemented all orderings.
>> 
>> For x86_64, I agree that the wording is confusing. xchg always implies
>> lock so different memory orderings all map to the same full-ordered
>> xchg there.
>> 
> 
> I feel a bit confusing as well about the need of mentioning the exact
> ordering of these primitives on each arch. In my opinion, as long as
> rust_helper_xchg_X() is mapped to xchg_X() in C, then it's clear that
> they have the ordering of the corresponding C APIs. But I keep it as it
> is for now, I may remove them from the commit logs later after I
> re-think about this.

Given the current implementation, I agree that the ordering
explanation is redundant.

When I started working on this, I initially thought we would need
architecture-specific ifdefs to select the appropriate implementation
for each ordering, rather than having a straightforward per-ordering
mapping like this. That's why I added the explanation about how xchg
is handled on each architecture.


> Thank you all! Applied in rust-sync:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ rust-sync

Thanks a lot!


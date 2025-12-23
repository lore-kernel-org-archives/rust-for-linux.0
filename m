Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6638B33AD9B
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494267; cv=none; b=mOoo8Hd0eJQr9+hMmLBLFZgahcARN1sndkXwBnI6BfwTZ3KyR8+u3pbaryphSs8HnwkMyBzgliKfwDfwjlOnTBor0mZZp0gLWMl1FNFbBe8G2Ipd+ZyQFWIA12gSe6YFmEC4RWG2W8dODa1NGpDUw47AMC7pNaBpSPJC5pwnadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494267; c=relaxed/simple;
	bh=mBkbJS2J+y697LV76VdrD/L4zDga0KCQkfpOno+j3iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKHxiQ41CyIJGipvQekKyWbB26by520Qu7n8dRI0Th65snhO64UGpZPdtQFi+gnIXze4HU6/sPGkUk+nwr4bSAOThzmCq6jeE5BQFKJRkofqVGGAUVb90xodguXiNcUKnx3NluH52hFnjRKin6KJBEtDvWJ3J+mIdvf9emKUHWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjOrpq0Q; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjOrpq0Q"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34c565b888dso5487538a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 04:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766494263; x=1767099063; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=94oLudekiif5HeilrLZvUbicmHfgUxsRz7xoRTDax8c=;
        b=SjOrpq0QeNfpaQrlLpfIBgFqSSEG2kbaZitM3W90av2bfg1QcnXeXZM20ra4zS7ixN
         OkAqgDcq0Hk7ev90nZkawY+vZhdMAIrcN7mD2nLtVR480fcBaX1ordntQjjZpvt1FDJ8
         wGZwJ/fcyJMAD53X7EWheXRihQCKRVGTegQo0dmiNMqd1lN+OFlqYxelWfI+3j386KI8
         c6nSxeHdJExdKYJ3u/xSOSuBiOxE4pKq9L6r2nWWHA/dU67qWYhMbsa9lI/quFaJ8MDp
         JKdDUiLJjV45gzo2SKYkSt4+RkmiH0j+NAoN+Z1q02pWQ+4iC75wBch2nm8LwxkA6BxB
         p6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766494263; x=1767099063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94oLudekiif5HeilrLZvUbicmHfgUxsRz7xoRTDax8c=;
        b=uzmfnV6ft1iQxYRxbsVbGnSejajyy15Cj6I4+oCrvEdgu3/EVi1uLfd4li4UEvj9Ci
         oNwV+kiLtY5RfPmDkX8zy9bFqq/jIkHvYTRsoSSvl8NnZkM7oL4mnZ78AZnkQPY1rExr
         70YxA1Z+divNSrKZBtxrppUTk1Tf2BHB/U4biXv8OwRdF06MDIfaxE6aoBSosv4Cx1D/
         NsGddHrnw9Gq8WomuIjJEsN8KfAAzYkODGYCCf+xL4+VlzhUURSP2mCQyWuVNf9i8lx6
         ht6Lau1v1dgGHboZ43zZWwZiBVX95mFiACJaNLdsU3ySx/RKC3aL89Hy+2bhs7AsoN+8
         PSYA==
X-Forwarded-Encrypted: i=1; AJvYcCXYD0IsdP64E1OpeWuGpYx8/JBjYXPPi1niitcODe346WqltX98svco1P/OtRTgtxq+cRHZwaT5VrSd0m9iYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7AEtA9bGDIKzfuwmeOOcGOcI8tIJaUKPwcpl4fwXhe1nyQWvx
	WcMfkhFbg+isJlFXuxYjTtyEelapj/o8dpvQxStCtuT0sKhLveyc4D5dlesT8B0wZ+sWSs6O3TE
	h8sIQyLBS70JyG14Un5ZwxYXtcu93jpg=
X-Gm-Gg: AY/fxX4i4PBmlfGqZwFQAAoDp3vRCU/NvFWZrOlvUIbUFUgXS/8U5UlHaX/ExT67xFs
	ovPH4i0secMeHjVZptlkRLg6tXe5zXIMvEWPyXSbDKf5qZAmYItJG8eTNsc2R83mmFegEMRb1tK
	gpXQ7Oc1rEvKBDk5vJwP8iP00UBJ+w7eWj3oDMRDytSFNqEekG6hQBRj7YdAndnHxznG3urJwLh
	WqvYpkmbDVaojyLUVBky7Zelzl15jM/+1ZvXtD6tAuF6pgO5LBvBTa6razuohf4dCgZ9Lpehe51
	SLcuTFcg8RVc98C34Y6ny5nhMTykF5sPf+8U1g==
X-Google-Smtp-Source: AGHT+IEyXen1C1B8ovK20y6lttFcVNSX1HJ8t8g6zVHxBqNhBj98DsBKXvaXLLqY6Msx/fJ20+CpJ/vT7PMw8NgCuG4=
X-Received: by 2002:a17:90b:524b:b0:343:6a79:6c75 with SMTP id
 98e67ed59e1d1-34e921e05bcmr12664658a91.29.1766494263489; Tue, 23 Dec 2025
 04:51:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-rust-page-check-v2-1-fba3dbdde1d8@gmail.com>
 <20251223115726.621bfa38.gary@garyguo.net> <46e188a4-4b74-4206-ba18-f107f45bb98d@gmail.com>
In-Reply-To: <46e188a4-4b74-4206-ba18-f107f45bb98d@gmail.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Tue, 23 Dec 2025 14:50:46 +0200
X-Gm-Features: AQt7F2q8qcvJUN3cNbmkB3zGBaUJ3rux4__s9gM96stJQSLixTZEWUtt842AGQI
Message-ID: <CAC=eVgQBrfcWSgmLAqL-RqQr8FrcCS0e1j4aQ-ck5dBSJt4zNA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: page: Simplify overflow check using checked_add()
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 23.12.2025 14.29 +0200 Dirk Behme (dirk.behme@gmail.com) wrote:
>
> On 23.12.25 12:57, Gary Guo wrote:
> > On Tue, 23 Dec 2025 12:06:17 +0200
> > Kari Argillander <kari.argillander@gmail.com> wrote:
> >
> >> Replace the explicit bounds comparisons with a single checked_add()-based
> >> range check. This avoids redundant comparisons, makes the overflow case
> >> explicit, and results in simpler generated code (checked with godbolt
> >> for x86).
> >>
> >> No functional change intended.
> >>
> >> Reviewed-by: Dirk Behme <dirk.behme@de.bosch.com>
> >> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> >> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> >> ---
> >> Changes in v2:
> >> - Added MSVR todo (Dirk Behme)
> >> - Link to v1: https://lore.kernel.org/r/20251219-rust-page-check-v1-1-df2e52fa3bd5@gmail.com
> >> ---
> >>  rust/kernel/page.rs | 19 +++++++++----------
> >>  1 file changed, 9 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> >> index 432fc0297d4a..cd2af7e4c357 100644
> >> --- a/rust/kernel/page.rs
> >> +++ b/rust/kernel/page.rs
> >> @@ -239,17 +239,16 @@ fn with_pointer_into_page<T>(
> >>          len: usize,
> >>          f: impl FnOnce(*mut u8) -> Result<T>,
> >>      ) -> Result<T> {
> >> -        let bounds_ok = off <= PAGE_SIZE && len <= PAGE_SIZE && (off + len) <= PAGE_SIZE;
> >> -
> >> -        if bounds_ok {
> >> -            self.with_page_mapped(move |page_addr| {
> >> -                // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
> >> -                // result in a pointer that is in bounds or one off the end of the page.
> >> -                f(unsafe { page_addr.add(off) })
> >> -            })
> >> -        } else {
> >> -            Err(EINVAL)
> >> +        // TODO: Replace `map_or` with `is_none_or` once the MSRV is >= 1.82.
> >
> > I was about to suggest just enable the feature gate, but turns out it was
> > only added in 1.81. That's a fast one to stabilize!
>
>
> With Alexandre's `matches!` proposal I was thinking that we could drop
> the TODO comment and we won't need to touch this file again once MSRV
> is >= 1.82. Opinions?

Personally I like `is_none_or` more than `matches!` but then thinking again I
agree that it might be better because we do not have to leave TODO here. I will
respin again tomorrow.

I also checked that output for at least x86 is identical.

> Cheers
>
> Dirk
>
>
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> >
> > Best,
> > Gary
> >
> >> +        if off.checked_add(len).map_or(true, |end| end > PAGE_SIZE) {
> >> +            return Err(EINVAL);
> >>          }
> >> +
> >> +        self.with_page_mapped(move |page_addr| {
> >> +            // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
> >> +            // result in a pointer that is in bounds or one off the end of the page.
> >> +            f(unsafe { page_addr.add(off) })
> >> +        })
> >>      }
> >>
> >>      /// Maps the page and reads from it into the given buffer.
> >>
> >> ---
> >> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> >> change-id: 20251219-rust-page-check-819ccc39c53a
> >>
> >> Best regards,
> >
> >
>

Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B22D3EEE
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 16:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763397250; cv=none; b=r50kAWYwIBjnTnr7UUNcXJDgUzmp5Ip+Trx4RbqoSEWm9qpG8zZJ8nEHJjv6fchXZm0TlPCSZ+Qf1HG9iZ7vvXyQGUsO53x7BANWvLvA+HllLTKnhUthG8M2MOXPCxIrMYCqWxOuCw8vz9p4yHQD6e/tngIgPfq18L4t7T9wlzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763397250; c=relaxed/simple;
	bh=zzWdLmtGggW9oRj+naWFU0UlArBlbWzK2DFfx8jpMSs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W5y9FWTOeO717rlNrclzH7DXPgZfW3Lg+bz/WFVY8j99BENC8Ule1RrMcqlEiXCiYNT9mPevicccuHyURQLbOSiTnOXhgd3Qa6QMRGS3Ozd9sM/uJuMmeDlnwiPq/dpdrQdBx4ajLvfdwRhN7UnJY5BrO5bMZiYUTF1uwMTWsdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eTytEbeb; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eTytEbeb"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429c5da68e5so2564440f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 08:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763397247; x=1764002047; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dnt6AMffwSDJMbW+9hMVzLqsThvI95BECbEYPsOm0UQ=;
        b=eTytEbebWgBhwLdQxoe3SUU8HznWDTv9uA4/4JI/Hg+zab97LsJVHJ8WTJaQ6P+jWX
         Qvp+90702a76H4RM09JXBagspy+WYwck6NcQz3tefwXk+HokkA6mxGIzkhIUi3pB+3Oj
         nH4H/djICCZ53gGRbiVTgWmLk2AFhgZi4kjZR0u1r8yLl0FiZDjKXrSF66HgSHsV+67O
         /Oz08krRZ/9ykkGv7zOZCm1wWMyaGZvm0E1iGbEFDgxIWcvLCx2tQIK+B+tITPqhlcAL
         sSevMuOF07DmpATkLXiQwtKlw340yn09w4mmNBV9oKppbIyJ/dbaZv3xge8tsUIEVazb
         Gstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763397247; x=1764002047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnt6AMffwSDJMbW+9hMVzLqsThvI95BECbEYPsOm0UQ=;
        b=vkg1eHLUaQq76HPjBSV28iNI2AcypADYWyyEjJsJrpJHr7ChqNCsLtbEMN467cOGJ5
         tlQFtQkpw0NKx0S4YTr9ta8zW/PKC2V+98CNo+hZnCvsKrzp/iGhpq3umlDIuP84pMhe
         nKgtBlQhHu5/sEY/IrKzeOkSIAFeMH5ArOkwJEJ96HloUC1wLuVmz5NOPrJj5zxChadK
         pqbq1PpQmjnUvMs/bPo1C5gyZA15hjuBAfEllrYmRjBAlnHOAEL5v3EbSdjECo+vFWoj
         JKt8i4Hdrbs7IuK6tP5dWGBAfTphDbPTwpdjP/lhZnYoO/cEXSVwz4/g0DUUWq0uScyK
         9/pA==
X-Forwarded-Encrypted: i=1; AJvYcCWd/sOasiLQwH/tzFXWc1W94w7uFoxLO/cwbbO/IuQyrxGHmV4CDQ0I70VwelMcpFDbh9uSAd0j2CpRKb5fNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnueozQE2wLqEoa1hxfk3zxyJuw2W6itasExJzRyWuFaCBH6Tw
	irWtxvYV8nzZtezWtWOh/Z7rzXlxNWSPnklwdTX5EwQAFG98GMZwDLyUwBQJc/xsLDa5izMEkl0
	8kZDrdktcseZsd/BSWg==
X-Google-Smtp-Source: AGHT+IGf3SSTcSDNX35lGHyTDeVfIkh75oyqd6PvBpSYTmqxSNGCpLyaYAzVUgwUDnODNmGVYD8Jy8eTO5xF54g=
X-Received: from wrbeh10.prod.google.com ([2002:a05:6000:410a:b0:42b:33e5:ebb6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2911:b0:429:cc35:7032 with SMTP id ffacd0b85a97d-42b52821778mr17645835f8f.23.1763397247461;
 Mon, 17 Nov 2025 08:34:07 -0800 (PST)
Date: Mon, 17 Nov 2025 16:34:06 +0000
In-Reply-To: <8A5C6836-992B-477A-A77C-EE0736166552@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251112-io-pgtable-v3-1-b00c2e6b951a@google.com> <8A5C6836-992B-477A-A77C-EE0736166552@collabora.com>
Message-ID: <aRtOfhNjlCavCTjU@google.com>
Subject: Re: [PATCH v3] io: add io_pgtable abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 12, 2025 at 09:57:09AM -0300, Daniel Almeida wrote:
> Hi Alice,
> 
> > On 12 Nov 2025, at 07:15, Alice Ryhl <aliceryhl@google.com> wrote:
> > +    /// Map a physically contiguous range of pages of the same size.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// * This page table must not contain any mapping that overlaps with the mapping created by
> > +    ///   this call.
> 
> I don't think there is a restriction that forbids you from mapping a region that has already been mapped.
> 
> If A->B->C are adjacent regions, and you try to map A -> C when B->C is already mapped, I think this
> call will simply return length(A->B).

I think that such overlapping ranges are not allowed. It triggers a
warn:

        } else if (pte) {                                                           
                /* We require an unmap first */                                 
                WARN_ON(!(cfg->quirks & IO_PGTABLE_QUIRK_NO_WARN));             
                return -EEXIST;

Alice

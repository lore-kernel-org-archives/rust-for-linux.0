Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99002EA156
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805298; cv=none; b=eNrkdgpfsahY2COmW+APiymjIUlbVn4HXlQFQrDb9Q7U5U6+FbD054cV8MevcABnoJFTLobbCDlQFAVi/fUzuUWutvWM037rrftph02Pa2Mnur4QYqhESFt1zqW+qGdCD/Khpr1pBmEYxlW9kBAgUCvD31KK4bDvOClvp5+u+XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805298; c=relaxed/simple;
	bh=hDrwJYxWWqkrJIEuHuXjbmHLdUcSRCWVKLwVz7xz7mE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YdNOoyKMKY+3lwIRDrx0A+68gIw0jirBHh0I/7azk3hlbmGES/XPPQwLUr+c94JJM4oRM2QHS1o8bdsQVOxMdin7BIsviiAohExiJSlJywBF9w6bSoPlcm6FmrgXCb7mHYGgetmI83UX7pR/yn6dHCH0nNSFyzqWJnSQZXvd/1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QpcK6Zzg; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QpcK6Zzg"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b9635bcc7so3145105e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Sep 2025 02:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756805293; x=1757410093; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WCJ5Pd5hSyUTTNVQBWxsmI+HwwsqepTaJK7vsUpGjOQ=;
        b=QpcK6ZzgmV4uqR5BiChyerTMGPVQP3Hg2DGaXRIPIbofCGREBEoaeiTfSuI6Yq9uDF
         PQUboLAc17mAsQr/HgcR16hMaItYknWoCxNPRYdkekwKIA3q/A5aL8ik+jlgTidgRUyL
         QTuexbyl+sAZBotRyM/Nw8mlpHCuhpAKYZAwAKP6eFpUO1iSnvfaRKazTBjdo/8ckAzF
         gJcfydvtaDjF3vCgfLVkoS5ZgOXUtLEkyGI34AYODJqRqsNAPUnmQnmbZxutjJQDU2Ht
         KOvXUtjfwrboislcixu2m+8kbKgceAEVCiIWdQ7qfzgy2FadpnD0uqyF4gRwdmVcKOIH
         jjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805293; x=1757410093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCJ5Pd5hSyUTTNVQBWxsmI+HwwsqepTaJK7vsUpGjOQ=;
        b=pjjUNp4ukU5qayk2c30ZBXzQnVEYi3bzMfZhaGEgTcr0cqtHUbP8mpm3k4zldHCdR0
         0CahPoRXQQjxHOhElYvJkc8gsFIETt0wTTQHHvdJ+T0+CPvTnt7Kuhaco70tsh4DjLmf
         pAOHofGIQguuw0VFf1k/XYcm0/eAFWOVv3dCgJVVgirZz5FKIfLru9J0rowWAnkc5seU
         o1sRWGbfVNRk31dHXFiOxQnwEoxV658zuSLVN+6vjHe978knQOLHhc+EBWef2wKTMAep
         eHg4GRFp7HWnBzotZTKuq1VzcSob5Qc9GtsyBSDfLhiTCI2tIPYMvjGVbk6xzRsbsszf
         aXyA==
X-Forwarded-Encrypted: i=1; AJvYcCWjLQsUFrw1pwe/buw0O0ytKiTWAiINcuflH7Hae6G2C872iU+yrJUnFUnxquYW9QOF/e0iUJmPSFeEJ+GiKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyryPE8YUZk7CM5QbKSlrXshmjfhon2HhU5hjSEFDXbF/fz9R6u
	gOfP3QQEK1Lu8PvRPxeMAAqGjkNWzMmf0tgJELxkbN0iyz1uZz6qJzr0HpK+TlOfkQZpv2VZySE
	5PcC3sYmOPATnXqzpeg==
X-Google-Smtp-Source: AGHT+IEHQOyKU6+Ue9693mOKlMNG23uPJov9FA9k1toBo6GMI9ziGkGJK7zza0Cq4est0sUsZ8sgEdWMBaBwbSI=
X-Received: from wmbji5.prod.google.com ([2002:a05:600c:a345:b0:45b:6337:ab6b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b22:b0:45b:4a98:91cf with SMTP id 5b1f17b1804b1-45b8554fa14mr103519015e9.15.1756805292964;
 Tue, 02 Sep 2025 02:28:12 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:28:12 +0000
In-Reply-To: <DCI6XGR65KH9.27TWYVKNZNGHV@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250902-maple-tree-v3-0-fb5c8958fb1e@google.com>
 <20250902-maple-tree-v3-1-fb5c8958fb1e@google.com> <DCI6XGR65KH9.27TWYVKNZNGHV@kernel.org>
Message-ID: <aLa4rNojDIeShIrw@google.com>
Subject: Re: [PATCH v3 1/3] rust: maple_tree: add MapleTree
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 02, 2025 at 11:01:19AM +0200, Danilo Krummrich wrote:
> On Tue Sep 2, 2025 at 10:35 AM CEST, Alice Ryhl wrote:
> > The maple tree will be used in the Tyr driver to allocate and keep track
> > of GPU allocations created internally (i.e. not by userspace). It will
> > likely also be used in the Nova driver eventually.
> >
> > This adds the simplest methods for additional and removal that do not
> > require any special care with respect to concurrency.
> >
> > This implementation is based on the RFC by Andrew but with significant
> > changes to simplify the implementation.
> >
> > Co-developed-by: Andrew Ballance <andrewjballance@gmail.com>
> > Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> One nit below, otherwise:
> 
> 	Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Thanks!

> > +    pub fn insert_range<R>(&self, range: R, value: T, gfp: Flags) -> Result<(), InsertError<T>>
> > +    where
> > +        R: RangeBounds<usize>,
> > +    {
> > +        let Some((first, last)) = to_maple_range(range) else {
> > +            return Err(InsertError {
> > +                value,
> > +                cause: InsertErrorKind::InvalidRequest,
> > +            });
> > +        };
> > +
> > +        let ptr = T::into_foreign(value);
> > +
> > +        // SAFETY: The tree is valid, and we are passing a pointer to an owned instance of `T`.
> > +        let res = to_result(unsafe {
> > +            bindings::mtree_insert_range(self.tree.get(), first, last, ptr, gfp.as_raw())
> > +        });
> > +
> > +        if let Err(err) = res {
> > +            // SAFETY: As `mtree_insert_range` failed, it is safe to take back ownership.
> > +            let value = unsafe { T::from_foreign(ptr) };
> > +
> > +            let cause = if err == ENOMEM {
> > +                InsertErrorKind::AllocError(kernel::alloc::AllocError)
> > +            } else if err == EEXIST {
> > +                InsertErrorKind::Occupied
> > +            } else {
> > +                InsertErrorKind::InvalidRequest
> > +            };
> > +            Err(InsertError { value, cause })
> > +        } else {
> > +            Ok(())
> > +        }
> > +    }
> 
> 	// SAFETY: The tree is valid, and we are passing a pointer to an owned instance of `T`.
> 	to_result(unsafe {
> 	    bindings::mtree_insert_range(self.tree.get(), first, last, ptr, gfp.as_raw())
> 	}).map_err(|err| {
> 	    // SAFETY: As `mtree_insert_range` failed, it is safe to take back ownership.
> 	    let value = unsafe { T::from_foreign(ptr) };
> 	
> 	    let cause = if err == ENOMEM {
> 	        InsertErrorKind::AllocError(kernel::alloc::AllocError)
> 	    } else if err == EEXIST {
> 	        InsertErrorKind::Occupied
> 	    } else {
> 	        InsertErrorKind::InvalidRequest
> 	    };
> 	    Err(InsertError { value, cause })
> 	})
> 
> I think that's a bit cleaner than the above (not compile tested).

I don't love it. How about a match instead of if/else?

Alice

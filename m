Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A28F1DE898
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742386127; cv=none; b=SdNtPAFGgPXKfmXwWfIsO7JoYacWenyqvh1TqkUHIbimAIyFH0k8OaRPyu0wFE8p6JaoKuuAVWhExMof2jMYqymrhGzckvO9DHZ34JvfyTsXzOzZXsf2gynUjexetHdWCoRumdJ0RVRsM7y3k9TYiTSi78J70wtIuKNBDrIKM+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742386127; c=relaxed/simple;
	bh=Uu5dXM9ILfjH5TJ5YQGk13KTL641uUmhuLSYu+lGQ+c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZhcKaGguXYS2nbJUY24cY0FfS1zU7Sto7ITPh0uO02bkiEPvD2psKRSFkc/oSxIBcktyS771HP7IJVWJifLALPv1TTqFTSYXYl6V8croHoqyTFBQT3RGLu0u3FzhU81RIPXq0mJSKFbj76yaFuBYP0hsTOy3E5f+ZfnryrGDhkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZtxnKYjT; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZtxnKYjT"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cec217977so29611905e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 05:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742386125; x=1742990925; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hsK/Ju+fyU70N3qDFOX/p7Jl1CF8IdfwtoJGuoZeV9Y=;
        b=ZtxnKYjTAlTa1cP7E1/KhbmDJCa6uc6A/cer+RsFTBVKprXnJFo+eoxKXEixGS5dkl
         L2N5SkSUjcGXm4qWZVfpVrcCEwsejuW+Q/zsMYX/ZdZLS+0jN/0hmWqV8KknvS9yqriJ
         CbZfN8fc5hEA/+ZhC6txS/N7++1Ym64Cj9BGQ/772we3ohHcP/RKA+SEm1YysdntCNoe
         QT3CTLX+HXX02glmJVeYDn8qJwc2Y6tgGLtMVVCICVEcT/QcyoZtV4WL23J9AuY1iz29
         2wN26wh6aCHQGB6pbY9NrwvVJxcew6pFho80Wwlxn2dBY0dvEHOdDcyE+786Xicx7DMZ
         tj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742386125; x=1742990925;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsK/Ju+fyU70N3qDFOX/p7Jl1CF8IdfwtoJGuoZeV9Y=;
        b=RPmwePrNZYX6w2KozIYheir20xILmcFY3yQf5dhJl+an5AsmQRYTqBfqd/XC/EVdYM
         UIZUSgR3MRupyCMP4rds8KRlGz/EMuvRJZcDHj3NBO5XC07uGQrhihbKrPNBHW7HhppQ
         NGGFSogijBsotepmTCwByzPZKY3LnbP42ACj9bdWv0OD/cflXkZJNuwMCzF1GFjt4iwl
         Rp7Syq4Mj6qNx7r41owQ7y771+ZWMz1S/LfNIZbm3tbDSkgCaI0mBc4bHLFfMarhkHij
         gRdmaB17TvCxpczIN6pVjOjo+gZ9JeJkzXIve3gvn1IotkNDwrWXWejDcRrVizrn0j+E
         kSZg==
X-Forwarded-Encrypted: i=1; AJvYcCWf7yrm8mWy5ek7/JRhkKwId0E6mJiYvh1h5G4mgb/E16cKtdZ3AUqnRbqyrzLtni/jj1h5Jr+eNPb5OHwRsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEBl7SHR+D5SmCjMsF7alSkpz+E7CcqBDdlpE4X4niEKRKJh/P
	9RaxNH/JeZVtAinyQxObMnHCr49/a/6F2ZWlOLSdMoCAXC2gVP+WD9aoaCuMCz1t4ncU6htI7Yd
	QOkN0KNDIS7I+VQ==
X-Google-Smtp-Source: AGHT+IHd1aW4u/kzG/dypqQfgnodStD5Twuyynf5bbudirbCcFVKmaxlhD5DRkvuqFc/qi4LsGdKy4E0fjxPxp4=
X-Received: from wmqd12.prod.google.com ([2002:a05:600c:34cc:b0:43b:d6ca:6dd3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8187:b0:43d:47e:3205 with SMTP id 5b1f17b1804b1-43d43793a12mr23610325e9.11.1742386124780;
 Wed, 19 Mar 2025 05:08:44 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:08:42 +0000
In-Reply-To: <123de698-190f-460c-af8c-e51bcd948c0f@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250311-iov-iter-v1-0-f6c9134ea824@google.com>
 <20250311-iov-iter-v1-1-f6c9134ea824@google.com> <123de698-190f-460c-af8c-e51bcd948c0f@gmail.com>
Message-ID: <Z9qzytBl2GLztjwC@google.com>
Subject: Re: [PATCH 1/5] rust: iov: add iov_iter abstractions for ITER_SOURCE
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 18, 2025 at 09:10:47PM +0100, Christian Schrefl wrote:
> Hi Alice
> 
> On 11.03.25 3:25 PM, Alice Ryhl wrote:
> > This adds abstractions for the iov_iter type in the case where
> > data_source is ITER_SOURCE. This will make Rust implementations of
> > fops->write_iter possible.
> > 
> > This series only has support for using existing IO vectors created by C
> > code. Additional abstractions will be needed to support the creation of
> > IO vectors in Rust code.
> > 
> > These abstractions make the assumption that `struct iov_iter` does not
> > have internal self-references, which implies that it is valid to move it
> > between different local variables, and that you can make a copy of it to
> > get two IO vectors into the same buffers.
> 
> Would it make sense to add comments in the C side `struct iov_iter` for
> these assumptions?

Good idea.

> > +    /// Returns the number of bytes available in this IO vector.
> > +    ///
> > +    /// Note that this may overestimate the number of bytes. For example, reading from userspace
> > +    /// memory could fail with EFAULT, which will be treated as the end of the IO vector.
> > +    #[inline]
> > +    pub fn len(&self) -> usize {
> > +        // SAFETY: It is safe to access the `count` field.
> > +        unsafe {
> > +            (*self.iov.get())
> > +                .__bindgen_anon_1
> > +                .__bindgen_anon_1
> > +                .as_ref()
> > +                .count
> > +        }
> > +    }
> 
> Maybe add a C helper to avoid having to use '__bindgen_anon_1'?

I guess I could do that. Though it introduces a mandatory function call
that can't be inlined to get the length.

Alice

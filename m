Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDE62E764E
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 19:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763495516; cv=none; b=IQv43iRTrwVbgfBs4oRY/y4mSjHbK6BIzqjKhL0d/1uruseNMK1/amLYhcVWaiOmZAEkUfI/gzuXHDsilcxdpzg7uvcNStk7et2qLozGfuT9R8+ZLemv1/P9vOlS5OrPPgkao+yw7oCLFSfTmg/JQy3/Mv5OTpULfni7BKAGce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763495516; c=relaxed/simple;
	bh=FjgN4iTbczMjaHV4KfmghHqOQIrOAVkG9Xiyk3MTk6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlxoTcSon+AqpuNu81MW2XKnvilybzo9mLShzyuD3G7f1oUKFU4ILofaNB0QdOiv82288dSX2NeD8T/r/rxn6aEkOatndD11bQ9bY9OOuoeD+PPI3v8h2fg6HsI6QD3iQxIRzPAhlx8m3ANZd+MxYtkecEm7JpEw73yI1QbaeCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Da7eEe1r; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Da7eEe1r"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-882399d60baso51905696d6.0
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 11:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763495514; x=1764100314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3U6a0C6zAq+P8XmzOE6KvU5TPlaO7U/ZGGupk7jN8To=;
        b=Da7eEe1rDUzd/RkrGeFGwtmGHH2cBRlbytMrCi+kMzkrE0KJi24VCtWKik+g0Dro8f
         QrbPWZ8aDGmGVht1ua3TIKobe3Zhggpk8EP4N/221MARpMWp5jeHwMiWW4HCFcs0wsHJ
         P+akfPfYmnAUgT8iDom6C1MVwNqKyLwajrh31W+rrnlNGvvCRSMeQ1ogEeLVXzw6pV5W
         ohlJCYCQstaUD3MHPOSYa88sVuImkNGRRoP8heQHuZKz5Sywe+2go+Vtx2n+F95A6DFG
         NWDBMJGO/tjK6Kxrce1DicK8cR5e5f/n5IfiqAXcZJXAGg7FZSUJm3rpkrziAiO/jaP4
         Fa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763495514; x=1764100314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3U6a0C6zAq+P8XmzOE6KvU5TPlaO7U/ZGGupk7jN8To=;
        b=JIGbz4B6d524GOM8J/MGhjRsv8kQJS73SOwBJGQB4w4/iE3D036kxtevGhP4DdblMJ
         mDBDrhtX/OrHusQv3qayY3NwUeZfeJHR7HKczSfyq6rhhzgimo2nqNyqyZVFGtuRB8T6
         KBAEByL7e3AXugPdOK3CF9RZSa64viGBK5Po0eE2IfSfDbpu6hxrXeV+/6/ZzV1KGPVS
         qzSgD9tThrTwiSoyAYYmDFN/Z1JlRosQAcN9QgOw2PuCNBbtw3FB6dfDcsGEqyDhsVQU
         vp1GTzx+bf65+vD9gg3vtsps1fszi/c5qN504g0s3R54vo2Vn2bnOuI8uEXa4MNSs7M3
         S3lA==
X-Forwarded-Encrypted: i=1; AJvYcCWFbIUxmXIRGaLl7FwqsgFZfFAgSECMZADawP2DB2KLvPRg6yVm1B9WH9aY56CD71jCOnjE5A6E4eYGDUWC1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkjiWBMUNHs8Q80hfR02RYyYszoISYzaLDaEROM42tK77V3MgT
	de0N/FTH0HhP21R/zpPtWFwt8e8mKSaqf/sa79gyYZ5LufzKbLMM+GmC
X-Gm-Gg: ASbGncs5WLSX0dBn5t7CcEjatIXYuqTzQCuI0ppWTYTVgOR8LJi/IKrqLmiBIMDaA3n
	99xLaDlz+sd7OhQ0q2w9PuHvkLmPqi+M0+U/FKrQ906xjwCgVoCl+EbUVuZvD5qVajvgvaw/uM9
	cf0Q7Ld4Ok9wDRvJU4W40OfxTN3oGxP6oYfJy8Uqwz55oGzcujf+62ovPGOioaIhLAX7pYKejmc
	IMVKJ+JXqllpLL792xA67moxumleZJgfKC/BPTY4graSyBLdIxupaPT6ZAYx2vEIBB4zdw4cU9V
	70QWyxQXOPyeZnDc6oE5XYNPPN37Z/llUA7NRkME+ztrMwdZGMPS1sl/0sE27x+NbJljX1zlr/N
	4UheLfqQ34RVm8VgQUAlb2ZYGQMBvr7ki5fkx+QQxDk0hdnVXWieyy0G5UvX0YvsHVx+M1Vxj4d
	WvJ3P3Rb+YkIXUFfFqY8pGXvSSzBJP
X-Google-Smtp-Source: AGHT+IHcZHHq5Ew86cqIrw2y+MSAwIuX4sBlOk6o1QiqEXu+Vm21QBTbY93cK0qP8ikX/8261fI8Xw==
X-Received: by 2002:a05:6214:21e2:b0:880:415d:a9ee with SMTP id 6a1803df08f44-882925e0267mr257882856d6.26.1763495513989;
        Tue, 18 Nov 2025 11:51:53 -0800 (PST)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882863923fcsm118778136d6.25.2025.11.18.11.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:51:53 -0800 (PST)
Date: Tue, 18 Nov 2025 14:51:52 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Philip Li <philip.li@intel.com>,
	Yujie Liu <yujie.liu@intel.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] uaccess: decouple INLINE_COPY_FROM_USER and
 CONFIG_RUST
Message-ID: <aRzOWCcyJmGZ0hiq@yury>
References: <20251024154754.99768-1-yury.norov@gmail.com>
 <aRxM_NHhekMl9joH@google.com>
 <20251118091818.152ba4fc0c8a6f3092a36fbc@linux-foundation.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118091818.152ba4fc0c8a6f3092a36fbc@linux-foundation.org>

+ Philip, Yujie

On Tue, Nov 18, 2025 at 09:18:18AM -0800, Andrew Morton wrote:
> On Tue, 18 Nov 2025 10:39:56 +0000 Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Fri, Oct 24, 2025 at 11:47:53AM -0400, Yury Norov (NVIDIA) wrote:
> > > Commit 1f9a8286bc0c ("uaccess: always export _copy_[from|to]_user with
> > > CONFIG_RUST") exports _copy_{from,to}_user() unconditionally, if RUST
> > > is enabled. This pollutes exported symbols namespace, and spreads RUST
> > > ifdefery in core files.
> > > 
> > > It's better to declare a corresponding helper under the rust/helpers,
> > > similarly to how non-underscored copy_{from,to}_user() is handled.
> > > 
> > > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > > Tested-by: Alice Ryhl <aliceryhl@google.com>
> > > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > 
> > It looks like this is not quite correct. The header file still has this
> > declaration unconditionally:
> > 
> > extern __must_check unsigned long
> > _copy_from_user(void *, const void __user *, unsigned long);
> > 
> > extern __must_check unsigned long
> > _copy_to_user(void __user *, const void *, unsigned long);
> > 
> > this causes:
> > 
> > ERROR: modpost: "_copy_from_user" [samples/rust/rust_misc_device.ko] undefined!
> > ERROR: modpost: "_copy_to_user" [samples/rust/rust_misc_device.ko] undefined!
> 
> I wonder why this wasn't caught in linux-next testing.
> 
> Please check the rust Kconfig defaults, see if there's something we can
> do to get more compilation test coverage?

I'm second to that.

Philip added my git repo under his testing a while ago, and also enabled
Rust config. I received a 'build success' email from his robot before
submitting this.

Alice, can you please share your config? Philip, can you add Alice's
config in the testing grid so that we don't slip through such things
in future?

Thanks,
Yury

Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4940126F0A
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 22:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759445417; cv=none; b=QVXyzfEwC41j3tgoIt3YahWrEVD94Y98E3WRewHcP4nA/yZOChKfMWCKFUEpG664nem7uOsOzOcGSwZwlUJO0U2I/3BMWRntI4auDX+jWssOkpM0pGMc0DEjMo58P4FAK697yTFzcC0ma1il8G5UVeLe9LWVzDSF4qcWOgZGqcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759445417; c=relaxed/simple;
	bh=Qmpdc6/sbik4VaieEZS+f1dvOk6Obsyso+80HFO5YuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXOB+uPukLVzClO+mZVojYmcO29cm6olW3gt/it8PDyMhfDaDQo03nvRme/VDq5e5e6tNRjDJ1Lzr4MhQI6cGVpYCRRXELYShiWBR6vumJddj4/+V6/7S/8VKDgZyqdCtM05G6aJYYyCMSf4A/8PdxdUeLeIDAQqefPqjViwHTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JbR347Ps; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JbR347Ps"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e6674caa5so8283425e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759445414; x=1760050214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxtPQe1b0MgbxjGfVgNQaGXQeWz7VgG8PZ8uWv1F070=;
        b=JbR347Ps4cOAUWkUENhXNy7zNkc66ct8sKOoZlQHrwJ78Ogjhev5sjJRU96hqE/Mro
         tqyihRQawxC3hvu7fgu98SSXDmwLbsPRe63bcX71RKicKnxHF8Vk97mUnMh0JMHYR6OC
         zQkgnWkFzo+h1KXAu13yGFml9HbY7z7tXzvWdUfXhPd6Gav2QuHqt7/XpdzSZ9TO4Xuz
         Kg/xugyDCUDeDYwih5NiXh04XEFb8Ioh/2MJ4mq/7UW04pIAIno7eW5lpd5/z4BZawRJ
         tyhEiTpJA4zTFN0quLMXCenn1N+PA2LS6VJHvUDrduHVrezLmKa+Hd5x3RqwSgtgaIck
         NbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759445414; x=1760050214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxtPQe1b0MgbxjGfVgNQaGXQeWz7VgG8PZ8uWv1F070=;
        b=JyQC3Up7Mter01cT6TrFMCxMW/rKxoxAn1WmRayDLgyJ2XSx9+EG8k+8pVGonoVFoU
         gMsjzUsja4eIQj37KunkYi8CO/3/Yxm87P4K7tQKJHdO6kpIzGNE6Nv7KtCTwNhdBLnB
         6ZxDevTRWcLZJJbXnrtqlhfJU0RffuKxGmbzA62MB4injsOOK1s+Gs3Q3vwD/98v1AUD
         H57XtTEV7ovqQTAYqO25/g+YagN3sLx+HlENWiOd272MWI3ZJcnKbVb9+aQcOlFvmC5e
         rE7L6yV57Kk5H7eA3wh5GefPQJfzTotdf3xwFIa982G+FLqo4d66Fdenyjne8QVAtIgn
         13NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUYBxUI6qBTFVP/FiCwNVMQ84PIJv4fiFYtaPkCT+d41l/cKjy9oKRFVs7zxw1rxKw9H88jvR+Qne4Wmu/2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGFyLezrsLong0m7pRTv265JUv5n19G4D29ltURwjtU7fMK6t2
	9lko5uxSuJho3hLSEmSXPDKPvg4QGZsEOXVgz0usQ6tSwUUPh4jMDBTDZSWfp8nvQve1TY51O10
	OyVIwvn0zcbi9GMAkfySUA2cGlsaqkLQGT5dbg8p+
X-Gm-Gg: ASbGnctmGZqaAiH9dXNDVyijTRqTAnCQJ1eWDNnIdJ7B7ihFs4axDB9Djcbaar+t/Rs
	n/SPO1Fj/tsC+GB/OfOi68anVjuifALFuAkVSVBJhb/JxXT8DU3CSdtZdv3haomohm6tPS06aFJ
	Dl4F/UmE0OHKoCXyE/0JMmGbvPKFfAXPwh9yzUfrkfiOGyhOCgpUF+tJsSjjLixQ9KsnItQ8F1q
	Lx3N+EGF2HqGIzTwBrET2YCL0LReMpQ9f68NhOON77WmlrYSA==
X-Google-Smtp-Source: AGHT+IEBz6Cy6eB61n4T9EDKMcjbX1FzickEfiY4Bp05xtOY6F9ZP0v6HQaE003SmqjEHrULNb4Tsv5CwqwTNxWL3o4=
X-Received: by 2002:a05:600c:34c7:b0:46e:5302:7751 with SMTP id
 5b1f17b1804b1-46e70c9bf2amr7897855e9.9.1759445413960; Thu, 02 Oct 2025
 15:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
 <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
 <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com> <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
In-Reply-To: <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 3 Oct 2025 00:50:01 +0200
X-Gm-Features: AS18NWD-PBkNKF8kB6hVqVgtujt3IbYom_QTRnw_XVpZ4QPMK6DidM0i44zAG74
Message-ID: <CAH5fLghjjKG6h+T2TFmtz3jPvRxL-u1szLVs8aEs5S+0bCUcLQ@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, kernel test robot <lkp@intel.com>, 
	Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:43=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 3 Oct 2025 00:39:16 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gma=
il.com> wrote:
>
> > On Fri, Oct 3, 2025 at 12:27=E2=80=AFAM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > > Sorry, this is rather annoying.  Rust is breaking the build for a ver=
y
> > > simple patch.  Many developers aren't rust-enabled and probably aren'=
t
> > > even able to test a fix - my attempt to get a rust build setup workin=
g
> > > didn't end happily.
> > >
> > > Jakub's patch fixes a kernel crash and needs to be merged into mainli=
ne
> > > and -stable reasonably soon.  But that is now blocked until someone w=
ho
> > > knows how to fix this error and how to test it gets down and does tho=
se
> > > things.
> > >
> > > Jakub's patch is present in current linux-next.  Can someone please
> > > send us a fix?
> >
> > I am not sure I follow -- the diff I gave you should work.
>
> It would be nice if someone were to test it!
>
> > If you have a branch you want me to test and/or give you a formal
> > patch on top of that or similar, I can do that.
>
> Thanks.  As mentioned, today's linux-next is where the problem is being
> observed.
>
> I'm queueing the below as a fixup against Jakub's original.  This should
> appear in tomorrow's linux-next.  Or the day after - it's a timezone
> thing.
>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise-fix
> Date: Thu Oct  2 03:37:47 PM PDT 2025
>
> Rust bindgen wasn't able to handle the BIT() macro.  Add a helper (from
> Miguel) to fix this.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510030449.VfSaAjvd-lkp@i=
ntel.com/
> Cc: Axel Rasmussen <axelrasmussen@google.com>
> Cc: Chengming Zhou <chengming.zhou@linux.dev>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Jakub Acs <acsjakub@amazon.de>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: SeongJae Park <sj@kernel.org>
> Cc: Xu Xin <xu.xin16@zte.com.cn>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>
>  rust/bindings/bindings_helper.h |    1 +
>  1 file changed, 1 insertion(+)
>
> --- a/rust/bindings/bindings_helper.h~mm-ksm-fix-flag-dropping-behavior-i=
n-ksm_madvise-fix
> +++ a/rust/bindings/bindings_helper.h
> @@ -99,3 +99,4 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRE
>
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
>  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
> +const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;

Tested-by: Alice Ryhl <aliceryhl@google.com>

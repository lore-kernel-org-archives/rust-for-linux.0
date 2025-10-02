Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24E19C556
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 22:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759444374; cv=none; b=rMwtW+I6IEOCiEPMxIFScwIs1FqvMYsLCIYdcC1T9nWJGf+NU2ywdj1O52Tod9kYXmjBoJwplJoIKfbaKD2IkcLR1Wpy0bIlio80ugW/0OCa86vN6kSXVJhuXJu/Vc8Cxn2wgZNV6v/HU2pZhnsqq8X7ZUhVyF3YWSKpa1TeWbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759444374; c=relaxed/simple;
	bh=S+1bWtKOYwigu0+XpEoNbQ5mowIEfWBLYIkns68Vnyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z95X2gVbJFG0BGevOaAtbQ916blcO+5xgOVf/lmeXRgjG7czScgF1VNCDq1lQ9BHSwJ3e5LR0clhicj9hidQESYiL3gXVaAcQeOQgDaBeUJCNy83jGg6izbPyHWSS6VB+FHlupL86E4XTNYmTMkS3ir82M/gPHGD2JIk7+DvSI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xmy7DpHz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xmy7DpHz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42557c5cedcso902482f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 15:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759444370; x=1760049170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUtPgFs+a1OL7nG/nqf9VG8T8Iw8/JxdJFSGGo+Duvw=;
        b=xmy7DpHzsef4GuKYcXZrHImWpn9jl4Iq+NDneiiHrVqTzqjWu5TMRJMTWluUgQYnWR
         Pp8ExHPshStznFIeB4/BYo4+0orPoBYsRfjwlDELOokNjKgiixk0AMMdN0wuRrGdgcp3
         1w1cEIII6UkdgMBN+pjxZUnb88QyT9eCDPHRO3RdT7n3LlvtpOauux2NwqS4N/hx0vET
         IfxceLiRIjlOknsL8tEx4bCiyfWznGPDn77XCxxzls5+06BzBPZMBy3QrxNvLw4laat9
         wnhTNkoKMpVWkW6apyFgFZxMXhjKp++xIc5OVvMGZfpXmsoSwe9Fu8wxJSsfbzCTNNhv
         C6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759444370; x=1760049170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUtPgFs+a1OL7nG/nqf9VG8T8Iw8/JxdJFSGGo+Duvw=;
        b=Zac47LuMz+bMgSkPjP3KfqcJDnrhJ2wnBSoZX9VO9LawllWYedmY+RfTlNhlNBjCTP
         4vAtFOG+efch4R9P+TUOG0MBB2BbgIaLi5Wucwm5PG0dy0lwX5cHq8aVPX1xuUPsmOdg
         1DzsXiWfmqx+hsoVqCS7d+RFOMKM1yWozfjc1xM3fZPN/GR/genArV0OdQYGtLQHd9zY
         Ro4YbIWRofYo69PvmsLQ9yc05CXCceFbTO3KdcQhPcUCymZV/QMfCWUr2vJWQlSlzpP1
         WEyIMxWSoITz0mj3agFvCDsDJSo/SNUoUB5D8VarGpB2wPdVxmvXBg2ef5gYwfW7QKc+
         UaRw==
X-Forwarded-Encrypted: i=1; AJvYcCVDXVOvr6RKHNCnRTEK3n7cEdCu4ph4UIf7f34VD965/UkyGCRoccoPJp8yIEYtVwzs4VNdnVrcA6UILP1PSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+9P1rTAgUjmsZlYrVwfTKNh3ydR/jK6DE0t7YUgxLfSULLwS
	GuznHk887VRmnWuXKAJvzyFcX1H6+OT54nWImxLr14SkuMBhVLCzqcnPYwI/b0ZodL8jiVKPo3Q
	EbO79346hJGZZXAkFKMUFxbxy1HOMHdOopOeUw73E37oaq7jKVssgH98Zgqk=
X-Gm-Gg: ASbGncuF9Xs9I3mrVJ2ADT8dn8bQFq4P+deuBhyQaDfLaVuYdaCQwj7fJ1yTu6MoX2c
	N0DVhLj0BLctHxnDCkHcZPgv8+DVP47ghMIzrM/YHdwGmVfgEFjrdcpuf7Ph+Ncm46jLd2RixZa
	LdvRrF5d3GLLRs5xWaySZA0YBKQo3CWDWsMVxbOHyhokJZ+w3PoxSAj5hj8qx9e78y6rNAZptfP
	O/9h5cuvVT+ReM1qLi02hXTRmPMsTLeyzxBsOc=
X-Google-Smtp-Source: AGHT+IGdWGPoz5PKrFGJEg2IcZ3ZPwnel+t94IMPQoWxzpXWAW09OSY4bzY7R+GccI211DbppmE2wBVRR005RgsZt+w=
X-Received: by 2002:a5d:5d07:0:b0:414:6fe6:8fa1 with SMTP id
 ffacd0b85a97d-4256719dfa1mr547619f8f.38.1759444370371; Thu, 02 Oct 2025
 15:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com> <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
In-Reply-To: <20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 3 Oct 2025 00:32:37 +0200
X-Gm-Features: AS18NWD-5OHn1TKOTve9_yuzsaz2MvZIT_RmmhqjCCsJ6y7cPsY7xJ_qWzQC8XQ
Message-ID: <CAH5fLggBkR=n-8UfVcOhHTQ-gda0VLBpaK1p5aA=3s=tWSiGRw@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, kernel test robot <lkp@intel.com>, 
	Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 12:28=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 2 Oct 2025 23:42:59 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gma=
il.com> wrote:
>
> > On Thu, Oct 2, 2025 at 11:19=E2=80=AFPM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > > No idea.  Let me cc rust-for-linux.
> > >
> > > It's a one-line patch:
> > >
> > > --- a/include/linux/mm.h~mm-ksm-fix-flag-dropping-behavior-in-ksm_mad=
vise
> > > +++ a/include/linux/mm.h
> > > @@ -296,7 +296,7 @@ extern unsigned int kobjsize(const void
> > >  #define VM_MIXEDMAP    0x10000000      /* Can contain "struct page" =
and pure PFN pages */
> > >  #define VM_HUGEPAGE    0x20000000      /* MADV_HUGEPAGE marked this =
vma */
> > >  #define VM_NOHUGEPAGE  0x40000000      /* MADV_NOHUGEPAGE marked thi=
s vma */
> > > -#define VM_MERGEABLE   0x80000000      /* KSM may merge identical pa=
ges */
> > > +#define VM_MERGEABLE   BIT(31)         /* KSM may merge identical pa=
ges */
> > >
> > >  #ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
> > >  #define VM_HIGH_ARCH_BIT_0     32      /* bit only usable on 64-bit =
architectures */
> >
> > Yeah, non-trivial macros confuse `bindgen`.
> >
> > For the moment, you can do e.g. [1].
> >
> > Other times, we have changed `#define`s into `enum`s -- that also works=
.
> >
> > ...
> >
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -106,3 +106,5 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA=
_PRESENT;
> >
> >  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
> >  const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
> > +
> > +const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
>
> Sorry, this is rather annoying.  Rust is breaking the build for a very
> simple patch.  Many developers aren't rust-enabled and probably aren't
> even able to test a fix - my attempt to get a rust build setup working
> didn't end happily.
>
> Jakub's patch fixes a kernel crash and needs to be merged into mainline
> and -stable reasonably soon.  But that is now blocked until someone who
> knows how to fix this error and how to test it gets down and does those
> things.
>
> Jakub's patch is present in current linux-next.  Can someone please
> send us a fix?

I don't have my git-send-mail-capable laptop with me right now, but
the diff Miguel shared that adds one line to
rust/bindings/bindings_helper.h will fix this build error.

Alice

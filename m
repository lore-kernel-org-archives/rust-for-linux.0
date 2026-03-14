Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379E62522BA
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Mar 2026 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773489511; cv=pass; b=Fs5/lHvggJFYhXkZu+7Ur7F7+fna7scVzgKcTqMEaebcihVz6Zf+GCu+Xr7Xh6JmiNj7z1EBEWtpQL9KMqbdCf8PVxtOGeKGuIHqBuEKh+dqHppRTM9cz13QA722ABmnlonWecxL3dvScM4kENe66Ouw2nvRa4MqiuGdfHvAlmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773489511; c=relaxed/simple;
	bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+GExK1m86BQkAyIk7nKUX5dzQCnTlc+dQGTIp7Pofd0hh7hwDyoh3/2iZEfiYpwEwNEZ+wrcd8VzQAkfW5Y1HSac3lmEWfooJAIcBMMJsGbWL4wHk2JIWWHZHqNyF2FHODrzbRnLLRWi/bEtivsvyEXMvbfbVu/ZZUnn3OtKQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l39RmXM2; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l39RmXM2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b78b638eso3216023f8f.2
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Mar 2026 04:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773489508; cv=none;
        d=google.com; s=arc-20240605;
        b=VV00Rx1aNSOrUrGkYqL7Sd6SAPa8qPY+yVU1O+CtOJrrZr/iw/wILdBqYczkFbbouH
         kRqhCeZrto3D9bSMhhatVaOASl6yttENXUbmuxrpv0Nt/KTcIX/1aN4bMeUOlQ++9YZ6
         UV90y8lumtXI0gybtVWVhWI7aezRuv+0BWdJjNgH+WaCLVYDxsKeEH8y+73mffJ9a62a
         9+vHNQQ4ma4N8JDJVOjGFBs1FvdqIDjkgzO8EA6cZbvhgcqXT0l0lIgJ0y6mVT1orThZ
         pGqVNP7ewxYKdqt0aDwgLam3FxFo2oYStm1ZOE5ZyGqZVDxYDmPlbfofv1IjMr8R1Zep
         dQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
        fh=BxKDfuX08vI2dV5rW6Iauog/vyt4nxWpgRuB0epRNio=;
        b=FeEfKcBjKo+LOt7mjvsEu7wqtYYFZ6AKFQUk0ZfHd2p1FFdS8Z39eHqGi8VnMroAq2
         fOwtsR4o3PI1f+gsDWfmdN3gIf878QeDC9J+PA7kPYQTcwvrrhLKJCUiECACJedv0M3Q
         TU1ryGJIljGCZMIIWCslszAaVONeTXPvRhl7Tzv7NHIyNxs3FKzKk9Cy/grml5R4dpzW
         8zXFTTLafPWRNr4ikyzovpy9wsXO/doCnkBd4NrP4dZVL7CoPBnGx7tvTbN8ENg/sMVO
         61+N+jPHSaC6GXvfYHoMgbR473uU1EkcS0vmJxZLV5dyJ88Exr//n0wH9FWekXdmpniP
         MSJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773489508; x=1774094308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
        b=l39RmXM2doKDmGbe7Oh8hdXBLKDnx/4FdPPhtmeFlnGfBMRtbN6FJHTv1PWp70C13Z
         BC09cbTBOJazvjrGyRmhU8H0FjxM+NpLRGeuEGxdicAb9YEkUXd2IG7XTmEpgH08QnUa
         at850/DFxZga3WEIx8b0fsAv71E3ccfmMbAh19toNhJLu6L/C805/YR6GBlrFbMKeTbN
         wxJYvKtTXWOb6y5EtgMSr6rGPrlCv6bseKrh3Df8kMy3ks/gf4v2Ync/5aj2Wfvq0M53
         e8cBmsn/0aedgwTqS0Yu/X2Vh+vKNFUEUyfqGUHBZBMEOVNfHobxig0lQ7KlPopAKfp6
         Hz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773489508; x=1774094308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
        b=HtekQdKDCd3jjf2cL0hflII4IY0Aah7cPmN4zMUKo/0H5pRJ/TPTfvMa2Md7N/HiPz
         lq/NoVbc1/jiBHMX97bLV7DgE2UefLw6yc4jtej533IkuNnNxowMbRThfmN4kwNBd6cg
         RwPDQFDq0SxvZQOOe7/fnzVMv4udK9+1ZJfDppYe6yha1QMogFEClGNidQK35ZLICy0x
         gXeuDvR7pAQBwC/yD393WIkZ4WbiWPJm32ZjxSgGhJ+ZeL39KXtOpfGw8d+1wkzwgTg3
         mX8RwAocPJM/Cp7ex1pTAVoiQbVmxloywn4NCy/Kw8b7vRPxYoEOcsFXG7p3JdhN+UNK
         7YSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAc3F6ATACSuDqoeAIPM6maidfs6I80GQLS5DKqF9rN3BlOGFSiy9AJlUyv0y4B/gZClx6IiTefzMyh1NYiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv4CVQJSf5GqqaRIqD8rODlPb6KH8Mg2IC+1DzC1mnlIUCUVDT
	xybPSUCxhaUXy7s6IeleNOiDuDqEOq1JY5EfzYeS6RVsvTwQYwt0qaVJF0sj9FRjlhnqMO0/3ye
	FxOWmfBvf1tNLXpre9bGGglyc9POEpRTmSgaXDIo/
X-Gm-Gg: ATEYQzzsq48+WlybQzkSH0K3anLhWJuSCrIFcGD7kFS4mQ+zYaOSVb2G3TSuWey/YS1
	O6qDcFLNKXoByMuYVz1V8gjAv/6OvIOM3JU55ym8XRIOJOgUQMproPNFFMkPP5dxERu/I1+BE/V
	j0StITYpVJOsKGBdo6QcubrXa2XYgXzi06hXL1zYupJlPUQa54vHjizyQxyMn8J9HJuKS39uFIB
	mQ8wyesrk5XZywuaV5JPlJckgD4jCk7hn+hrWCS0UhKETwdHG5WRrJcT5+HdOt/RDxTO8/UPoEz
	ul5l3FUeudjtNFlkdfCsGwuf9xoaLYQvPXiKdw==
X-Received: by 2002:a05:6000:1885:b0:439:cd8c:209f with SMTP id
 ffacd0b85a97d-43a04d87c31mr12531040f8f.23.1773489508090; Sat, 14 Mar 2026
 04:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
 <2026031422-catsup-rectal-f886@gregkh> <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
 <abVG0JypVhDxx1Tt@google.com> <2026031444-wriggle-tradition-245f@gregkh>
In-Reply-To: <2026031444-wriggle-tradition-245f@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 14 Mar 2026 12:58:15 +0100
X-Gm-Features: AaiRm53w--KuwJ99Osd9jUt6yvtILxF4awX5YKpSHdok6ctk4q24IRBVS1ZMNeo
Message-ID: <CAH5fLgjruspkrLagRirzfDbq=k3OEnA5JBLY-BNXMD+JsJam2w@mail.gmail.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, kernel test robot <lkp@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 12:53=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Mar 14, 2026 at 11:30:24AM +0000, Alice Ryhl wrote:
> > On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> > > On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > > > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <natha=
n@kernel.org> wrote:
> > > > > >
> > > > > > It looks like this is a conflict between Alice's "rust_binder: =
check ownership
> > > > > > before using vma" [1] (currently in char-misc-linus [2]) and Mi=
ke's
> > > > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unsta=
ble [4]),
> > > > > > hence why it was bisected to the -next merge commit.
> > > > >
> > > > > Thanks Nathan, yeah, adding a raw pointer (not function pointer) =
to
> > > > > the struct makes the type `!Sync` in Rust.
> > > > >
> > > > > I assume this is best handled with a patch on top of char-misc-li=
nus.
> > > > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > > > `BINDER_VM_OPS` contents are unused (so far).
> > > > >
> > > > > Cc'ing more folks related to the commit.
> > > >
> > > > char-misc-linus should get merged into Linus's tree "soon" and then=
 we
> > > > can fix up the mm-unstable change for this.
> > >
> > > I'm working on the fix as we speak. It would be ideal if it went into
> > > char-misc-linus, because the commit that is wrong is mine, not the on=
e
> > > in mm.
> >
> > To clarify, to avoid breaking bisection, the commit needs to land
> > somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: check
> > ownership before using vma"), and before the mm commit. But I guess
> > there are several options for how to do that other than landing it
> > through char-misc-linus right now.
>
> I've sent off a pull request for the char-misc-linus branch now, and
> after -rc4 is out I'll queue this up on top of that to get merged for
> -rc5 to make this all work out ok.

That works, thanks!

Alice

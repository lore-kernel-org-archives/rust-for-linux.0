Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864AD3E4C84
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962301; cv=pass; b=WYZ1cZHUA7yMvwafTtOz//ygJl1wuvGNo409X42ETdSl/MfYEV2zfGrfhZk4YG+WA9c4zI3k4ezU/bK2zP96NcRm/c11XLWKAEUZlmD0Kvxyy18HHeojIiu2n1g1UwYE5iv30TXlDWMx+AaIVq2aqh4dhPwrNxzLC2sSE4ZOBcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962301; c=relaxed/simple;
	bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0JcUu7/XNPqN1iCLyhydexGlwOePFDDaAM1V40q/11zR/rLXkwHL3Z8B8Wq0bBJklJOzpzqimGWzbAPud+z/VBSfVOX+ktNVIy0DkDnxty8inoTaIEqsDWRtKiNb57yPQtsdilAZcBp5Ecv3xqTPzMjf7dcRfWwBzonValagdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V626D/Dz; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V626D/Dz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so52005575e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 06:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774962296; cv=none;
        d=google.com; s=arc-20240605;
        b=LpCv3EYgjP7vfqRTllCIQ73Hka+S+eDISBZXsBhwMEXrBYVv6QUqXxc4IN2TWn6rlG
         Div/LqpBL09+KTjkcynmQDwGTNdphCtllK1IF/6D/96CG/Hy8WU+x+LM6KYCgs3gP+eB
         uIY8Yp1M1TpBMLajlpvtjoAgKObG8QDMlDnNyqMFGpCJsrEDRFRlXfwBshB4nogCLiZX
         zw3PDC4nxhqnBF6wGgxmzIAtVqu5h/UmS/KUB6ENkyFuFeRceEsFYNuXew+z8lLlvnE1
         x5wIVkQcOucnCeupNU38l3K+U7NTQdC1PmZWkpU22IriTg6BqmvMx0/YVI+S0fEp9VtO
         Vl/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
        fh=Xt+KBMPwsvetiaYrT7TqNIq5xfK8rjhEjLGjEv4MxNI=;
        b=eG3GzVhrLr//mn7NNqbg7qecnnRq4mLYb7gcykaEMDTqiSxXqHVRcOwlH5eYltso03
         4fR5zs3c2mPD9OgWBCoCdmhiPG0WZDEnw4qEfderlA1VkkbXXbQcuO9Au5xwGmxWVzoO
         cgpDzicvFFW/xeTqoUQRqplXKI4tmBtPDt/dk4ucuJm8RoJetci1rJDwPSfTut/bX9Qa
         Zs/IkL3Ap4RWwZieyEzOFBOOmv+19wXhWa4N4mwB7KHamqfwVgzDz8TfiPoQo8OvYdCk
         7BNV+4LWXCmiUr/uzoQV7WZozX+bYchzM4GK8NjSbXmwWqoF2J9PTv4Wn2La/VTMv7rs
         rVUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774962296; x=1775567096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
        b=V626D/DzhOnQP9xo3xhc+gOBytvqMpx+av/ngLSWoY2ILmzPwKHl9ZR97qpyd/WVuA
         9HYpY08rjQrs22mAqT1K5KFSwQLME6EWIqTvKoWsF54PMh2Qr2YsaVDKq+WvfV+N1gXS
         +Tfrg9M68iMnDVsEmSscarBSHT6QMufFV+vkDkaIhhEKEW6Ct7suo0XH19iHx7S28+cr
         B6cezy6f7HhtptgSEwMAS7Dndfpb2E0tPQFvKg8obOaFw2wwdV/hGwVJ644knmbZopw6
         vVZt52kdEvZ2WgLMXlUz2WihMnPJ1iwsJBsiEs9vHC8YQ8O9Fj+f9KoUGeoZ+2/Ed6if
         NXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774962296; x=1775567096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
        b=d6paj6Ss/3XDrAfSbkfcrDmhJNexe0qsqDJ0TEiawPb2tvLnA0/bcrIoq9X2PTGP9N
         5fpAld1hTCN3FvrSPMX1ukNbT+ej9/rY8WWaQWJi3G8F9GI1+Nkl0V6T8YakeKUnI63E
         re56vJrpmKQYM4WaRWl5HTaDiwdlgY9VzPSEzwKOM7/+UcMJozA5mfWEJAkcuP9FEUNH
         OuZlzWdsq/Wh3stvXBH1Fm2a4pa4laEJJ8YfBFz+J/Yzh8J8uzw+AMjbleam6T/olV7u
         jszfJpKgHNfmeqDhAZfNHZbh3B64cmRB4vacezMPkEtksanYBZzQlo0gd0RWJa/JmVKX
         RdgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdN+5ea9pR5brZaNRyVFB09Z+O/5XVwvw/E/IKvLYfvH+nK4Sq0W7vLTXd7dvXQdwbMGS3OJuJlw7tVpgWhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZDLkL5+J2qFhhpKVNQBbhMPwvbx8A+EsbrQwldfJNNbS4iCbV
	3bFwiqgFpVBbjJifXJTI1F5sYgywhgpui2MvqQG6bmyEwYfWamBWNjmIeSM9MpX/G2tpGXbwzpn
	GRDETpHeWW3EKygZ9N5UU+KWD0bq2zRchR9Zkyrc/
X-Gm-Gg: ATEYQzxjIEuGhAqSX080GVj6RZQGdnfQAP5/+8QUTBSnUSilHPyasOIN7nlguUizRFg
	1w19KW3Gvv1xSs7IfGkfzxuvRZssr9zpe2gvlRrxD+kglyhLJW2FWwgh5GZGw4ly3yg0sBk1L3Y
	j4HaSRoU1PZdssnDhrmhzbV6XuD0jaTDNXDBEFtVK4tG5ccr0x9oelggsC4Hl7gpNt1hUHLItEW
	SqxKUkdnksDbXXT81ZvhnEyLUFfHOKAlovEutpvUTctDSzYzS2MMeD+2okua+bAeeR7pk7hO/NQ
	TFoI5Qb0/cO/xisn+iJjuvCFCw6atMMEC8gLXQ==
X-Received: by 2002:a05:600c:c493:b0:486:fd3a:fd22 with SMTP id
 5b1f17b1804b1-48727ef163bmr265057995e9.4.1774962296021; Tue, 31 Mar 2026
 06:04:56 -0700 (PDT)
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
 <CAH5fLggMZM3kYWO3xqb4o-mQG27aCYOmiiODW67CKLTstkB-PQ@mail.gmail.com> <2026033142-distinct-tanned-f749@gregkh>
In-Reply-To: <2026033142-distinct-tanned-f749@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 31 Mar 2026 15:04:41 +0200
X-Gm-Features: AQROBzCLOGQX2tSfSkAhkWuzSolMKQYyl-U7kjRDRXWr57ayx_jzC1qnpjdIn-Q
Message-ID: <CAH5fLgg63SYHQ34yqy7o2cA5f2Gh0aNTwTeQkzbWb+kV4Rr3Qw@mail.gmail.com>
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

On Tue, Mar 31, 2026 at 2:59=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 31, 2026 at 01:32:03PM +0200, Alice Ryhl wrote:
> > On Sat, Mar 14, 2026 at 12:53=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sat, Mar 14, 2026 at 11:30:24AM +0000, Alice Ryhl wrote:
> > > > On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> > > > > On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > > > > > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <n=
athan@kernel.org> wrote:
> > > > > > > >
> > > > > > > > It looks like this is a conflict between Alice's "rust_bind=
er: check ownership
> > > > > > > > before using vma" [1] (currently in char-misc-linus [2]) an=
d Mike's
> > > > > > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-u=
nstable [4]),
> > > > > > > > hence why it was bisected to the -next merge commit.
> > > > > > >
> > > > > > > Thanks Nathan, yeah, adding a raw pointer (not function point=
er) to
> > > > > > > the struct makes the type `!Sync` in Rust.
> > > > > > >
> > > > > > > I assume this is best handled with a patch on top of char-mis=
c-linus.
> > > > > > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > > > > > `BINDER_VM_OPS` contents are unused (so far).
> > > > > > >
> > > > > > > Cc'ing more folks related to the commit.
> > > > > >
> > > > > > char-misc-linus should get merged into Linus's tree "soon" and =
then we
> > > > > > can fix up the mm-unstable change for this.
> > > > >
> > > > > I'm working on the fix as we speak. It would be ideal if it went =
into
> > > > > char-misc-linus, because the commit that is wrong is mine, not th=
e one
> > > > > in mm.
> > > >
> > > > To clarify, to avoid breaking bisection, the commit needs to land
> > > > somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: chec=
k
> > > > ownership before using vma"), and before the mm commit. But I guess
> > > > there are several options for how to do that other than landing it
> > > > through char-misc-linus right now.
> > >
> > > I've sent off a pull request for the char-misc-linus branch now, and
> > > after -rc4 is out I'll queue this up on top of that to get merged for
> > > -rc5 to make this all work out ok.
> >
> > Friendly ping on this. I don't see this applied yet.
>
> Sorry for the delay, now queued up.

Thanks!

Alice

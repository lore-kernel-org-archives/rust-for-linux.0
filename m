Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8219D3C5DCD
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048621; cv=none; b=mGI0euyfPEXIsfAEctbxLSzxwRaFzfT7YQXQNskLah/xxl/dwnYJ7P8l92wbupj0NLpzAIfixNJXzw64Pi0YZHqZALA8Ik5wV+LgUhNsZ66tRy6fmRWDsb7SFZPwySl9zmr45otVH/ruOgZNBTIGrtC35tjzUbzIEWZY+Ty93ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048621; c=relaxed/simple;
	bh=iFw/8BkhljJQlRHHBzf/b4mDuUrjpyoKH5F3LNR1EkI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fsHlYwJXSVqRAAve5g3N6U5Wo2Sy/VEY1+EDDkrk9FZ7y4hT+3QHu08BJc55z27JCcgqRwtHlz4278PP9PmWqos/MzMXpWZXS0Aj0f0Y4PIGuzn5XRlhTgXXRuZwv81+L03YiM6We8gbSeNqOq7CiiWBf+LtXYI0FQdSB4/D9vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lq5Zmd1Z; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lq5Zmd1Z"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4904ee02e72so58568495e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 02:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780048619; x=1780653419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOM0bcW5xWhsYzyhSobjFggziDaHZiF9ZxgQl/a448k=;
        b=lq5Zmd1ZVuypI+BKifgdmLnm3zQCJZxKpGjPhPAJg8OUEsbROStDRvrnHld42/6GYb
         NLL0jSkJoi9GXR4ZWPB8kGywPA4eIRag4g+YNjmrb4U/ox1olyoDJI0zuM+QHaJap4dO
         sHE03G0bksLkX7drRMHghf4HBjxAV5lxXB9MKm4sQM5ZAIDtT1BKQvldUCYLz3VBd8HF
         xZIMyYw9UtUHNtoNXTmdp94D0JL7G8apZ1udtcAXg9IvmEAssqRyKhjHLQrUgO2IqDjT
         n3vugoenUaH10RtcqOvnCqO35yeQJb6cU90zL8Hk+bf13wcnMoQ7UIswRVJ2ehDIXl08
         DWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048619; x=1780653419;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mOM0bcW5xWhsYzyhSobjFggziDaHZiF9ZxgQl/a448k=;
        b=mMOol7FN5kaDNfDTQolYh++1EMPGZ0sMf1JZ5g6p6us9LrX1Ckeq4V/MAiafpEUX+Z
         z5u7f8QQyA2/tJFigyU0M3D8LBn/zL5t58VPFyAo4I2sWS524/F61e5IsPovkZk2dtNs
         r93s/AVYPLhhN+W8q/g9m0snrDvMKmrKTsV8nQR2CwvJD5NBK3WNl95yxUa7/9UKhG2e
         +xfxjCWw/Gt9/XLFwsFyxS6qlVZqfXgJaVEK8MXr2ut0YyVhTm1Q6FDJyMkuYbva9PAm
         1uv//S21CnYFmXd8cO4BY/iCoRRRP1h3Io1QyKFMXwLePoNaR00/zm2CWKoUiTkrxN4U
         DZNA==
X-Forwarded-Encrypted: i=1; AFNElJ94SEwsPHpJyHuM3gKNBcmEigZ5TJFHVQycCWr0Jp5CI976r/S4gfb1sCB6X0ss+Doi1MCguMkZABEUSXdEzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR9C4ZpjOQ/B4YB5Lf14fR66yMYujGsVbOD8JL5byygVE9Vl/t
	ijSWFKJeOWDIbUVO5U+njTp9BmW6qKOUQjeYlE1I0It1OGHJf6ZlDELiU9wYDvpCpeRrt7Wn35C
	rd8ee6jb7RwONWf0k1Q==
X-Received: from wmpe37.prod.google.com ([2002:a05:600c:4ba5:b0:490:3b64:cc75])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6287:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-4909c0d6780mr39515255e9.16.1780048618811;
 Fri, 29 May 2026 02:56:58 -0700 (PDT)
Date: Fri, 29 May 2026 09:56:57 +0000
In-Reply-To: <DIV0HOKW3R1L.2ZK80B9TV36H7@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <202605291041.seNEWvLQ-lkp@intel.com> <ahkzosbjO4NdSyD8@google.com>
 <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com> <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
 <DIV0HOKW3R1L.2ZK80B9TV36H7@nvidia.com>
Message-ID: <ahli6f1pVlWgbm59@google.com>
Subject: Re: [linux-next:master 3728/9137] samples/rust/rust_driver_auxiliary.o:
 warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, Danilo Krummrich <dakr@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 05:19:06PM +0900, Alexandre Courbot wrote:
> On Fri May 29, 2026 at 5:00 PM JST, Alice Ryhl wrote:
> > On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@nvi=
dia.com> wrote:
> >>
> >> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
> >> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
> >> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git master
> >> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
> >> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: =
auxiliary: add registration data to auxiliary devices
> >> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0da=
y-ci/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
> >> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-projec=
t 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> >> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> >> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
> >> >>
> >> >> If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> >> >> the same patch/commit), kindly add following tags
> >> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWv=
LQ-lkp@intel.com/
> >> >>
> >> >> All warnings (new ones prefixed by >>):
> >> >>
> >> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.mod=
ule_ctor+0xd: call without frame pointer save/setup
> >> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.mod=
ule_dtor+0x1: call without frame pointer save/setup
> >> >
> >> > This one looks like this bug:
> >> > https://github.com/rust-lang/rust/pull/156980
> >>
> >> Does [1] work around the problem by any chance?
> >>
> >> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d5=
5@nvidia.com/
> >
> > The asan.module_ctor error? I don't see how it would work around that.
>=20
> I was referring to this error on the report:
>=20
> _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPl=
h9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationData=
NtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB8_9allocator7KmallocEINt=
Cs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5Err=
orINtNtB3y_10___internal11InitClosureNCINvYIBH_B1L_B35_EINtNtBa_4init11InPl=
aceInitB1L_E8pin_initB4u_IB4O_NCINvMsc_B1O_INtB1O_12RegistrationB2l_E3newNt=
NtBX_7convert10InfallibleB2l_Es_0B1L_B4u_EE0B1L_B4u_EEB2n_: symbol name too=
 long, can't create __pfx_ symbol
>=20
> As this patch might help shorten the symbol.

That is plausible.

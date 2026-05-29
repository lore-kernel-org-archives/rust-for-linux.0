Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF439EF2E
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 08:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041675; cv=pass; b=EVZOlzkcVzcdgEp3DwSe6ldno2U9yuSEK9sSzesMLPR5W7YdvCBmY4LoM5k9TAGoghNKcpQvljSVncjNFG3fJEirJb7+28ZPZGzdUdrvgOrBbJ7cAYLHW8xo84Gpjj8giLOrt9dd7SluNnNV+yd/rBDyDW4iYNAL6IEAY0uwqE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041675; c=relaxed/simple;
	bh=H7PKQ1V0ixvaX8oVe7cpQhD7iZmduazOfTs/hxY5WJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0Dbw4PJnAC1SslddEn/Y+S/I21ChXmGNiBQeFjQBCNXo+PkNiL4JN+Fg+EpX84v8s2fSmldTbYJv8hY182o39f+8FLKWNAdSPL+OA12bsdVNk2g8RFtXhstxkfUDlNzBDn/333gRLcOL4X8o0J6V2Psp5gJ9Jb1N0QmNmfWc2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QMZXWtq6; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QMZXWtq6"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1331e851faaso7545973c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 01:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780041672; cv=none;
        d=google.com; s=arc-20240605;
        b=X7IynuJlCRr/k1vY6+93eyOLpk+yTBz80JxMEMwWolQw9U8eDUHNRGoAdwrnQvtpG4
         qRkmSSZ+fcBmsvnakymVrdHT6wttEu/rdkaIOWoo5Z4NG5hcBfe5ybWXYXkFeStar6Q6
         7aiGHkyFbNCQrTTqip1+apIKVMAuW66C4GV3eXxjKb/9jXz+KHWVY9tI9H0rdVl/eAM/
         Q28WXm3rSIRmJTVSCqgkMf8hLVTJ9SClQzNXixE9NDnU51vfOXqid0+CUgaROjy1KtMo
         8AS0HK+RLkwrXfhk7+dCQrpF1Ulaj4Opua2CDsvMH7E+MG3YwBA9Sw25DAoytlLNvPvW
         wqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h9IaWS9MuReoJAQbEMj+Jq8lZE97ObkkLWcHV/Hs4x8=;
        fh=m+4wUWUU8hacemSKaqiQD7M7Mg9PEuVb7TgKs8NrIkg=;
        b=ldO480t6qRYpCFsowldfpJHFrOultBeLx9lYqzWxeWxn4N4J3Qcw3pjcb/l6jOoG17
         /sZaBQi2QlnUoUdTkUEWtOeU1+RctmLvQdO00IBaL/sQRnAkitXTS6ljqH/CoOWGyO6M
         AdODLPtheYic1SM4up2DRKvCGeKku0aO09x4tjZ5hdjIcJe3qQ3CA6E29TVIZMkf6Ht8
         befKLznmo5XytNmO0mypN1IN3cc0Q0eS8EuJoNdo51FxlImQtfXElEaO7XXzNtFjU83x
         Wg/LTREvqpDA2KHYWwTbw1n2aqMQ3VDAilhtPkDwtZTToHL1j/IpYN1M6xTdHuWbCRUG
         DyPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780041672; x=1780646472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9IaWS9MuReoJAQbEMj+Jq8lZE97ObkkLWcHV/Hs4x8=;
        b=QMZXWtq6IUUmOgDvByp67IdRpl8GqW5chrBG75VTFMDvBdAVyJIr4G+RB30jN8/zme
         OfPZSBiIYeVUa3wgSzcwJICR7mcsE/0nSWYMx0bFfboil+M+bgGTXDPS+OFYnKzccAKU
         VVOz2NU37QcEUwUwmPOZl5qEn6iHTSihQi+B9TmAzqYkqxBKuikuhDRtELzzJI9vY0u8
         2dB837wE4OHrZzytzP8MVbTfY2TQiSwBntqvoV8lmBZHyKijShdQDi5/TUQLdx06YzDG
         Hwwp3WNr6zHB8s6+5/B3taRE3lPkMrJsJf1HWCysfiApC5AfFW0t0RSEL5UPItaNT2g4
         62AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780041672; x=1780646472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9IaWS9MuReoJAQbEMj+Jq8lZE97ObkkLWcHV/Hs4x8=;
        b=ZZrBICveHJT/EG2DXim4VwEEjrzeHNbNxHttCKAsDBge8nR1zfSixdpLKNLo45ENvs
         AJJ1d20eHan/wm/+MkMooay2lprjHjO9KDPkycjxhmq1fme8z7PKRKV8WJdLu212eBQ3
         LuhaeymooV3e+bTZqQnxvUkKrD/aTo56LwfFUxwloVFUgGvETkaofNlKXl/1fKR6J78W
         wsZRZFFzOnIWy3BgiTFXQSrf2SqOkLNOshp28DiFqr0rwNN1bFz7ZydY6yPo+NW/WYpA
         mx34/xoSOD5NpYIf8z417h4DuyIf4hQRvw0rXrxuppI6aeGE1UlfxEWLr1LIjwidxESM
         gCSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9t1bHjcOlfMvU6rXuNthHnhUQddcOoI2bzsfhCjNFmwBIgCXrUy1syrp0nQtd6zymWPhaIurWsdJsKJcQmKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfu+h8m1lLu0x1sywxIoTlLbA3rP2emFqDGwfPQoWdi8oDr3x
	EAUUiRCA9cjhbh1cH2LcDRc4idf9xvSPBNndZ8PjQ553mARjbCFDJbY6PTGqZ1mYqE/oUHnqvrE
	wXXMeoeOSNwDGCdQEftI05WXuweS4E+CwRNzWSxAA
X-Gm-Gg: Acq92OHCeaoUeyNE5xRZO5nAPB5A9z4c7sCDYnf0aA3nbRepdkY7ycbcw8QJu64kk7Q
	Rb6QqOIfsoiOXX4ZapvhtFNJ21siBRut8glwU97EMapYaVn+IeaF8e9HsYTdkU64A9hZPFRc1M7
	E4Htcgbeco2ER46PFEBIrR5nbsXoXpqQO8WY6B/nZLtFwnl/1aeUl17usgkQ4lYkdZmeXEYh4QM
	IgjTL8yNxn5QZH3ZLh6hzfmthNH/O7hZgFXFJqWT7uovSHHf6NOPsvvYKwyYeqr7psXvPDRI/1d
	kXOFcjf1JwA+aCeJNri/JHFjfCjrNYs/fREYnLYjX2L7C9GnRqCsEGSrehlrAbmqI7b1PucOkaI
	xyUMw
X-Received: by 2002:a05:7022:2221:b0:136:4bbe:9524 with SMTP id
 a92af1059eb24-137ae61dbe5mr768951c88.10.1780041671463; Fri, 29 May 2026
 01:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202605291041.seNEWvLQ-lkp@intel.com> <ahkzosbjO4NdSyD8@google.com>
 <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
In-Reply-To: <DIUZYLZW1KTM.VRI2RJ8DXEGQ@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 29 May 2026 10:00:51 +0200
X-Gm-Features: AVHnY4JLxRuhL58doZ06uRkm-dD6MUWwn2fk8nlzOdANNCE59i3vCeVtWZh7p04
Message-ID: <CAH5fLgiFo1rep3N5qGWGsTXT177hfSwW0=e1KsVCrrz2uRMoBw@mail.gmail.com>
Subject: Re: [linux-next:master 3728/9137] samples/rust/rust_driver_auxiliary.o:
 warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16RegistrationDataNtCseULRbgTYaTO_21rust_driver_auxiliary4DataEENtNtB...
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, Danilo Krummrich <dakr@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 9:54=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Fri May 29, 2026 at 3:35 PM JST, Alice Ryhl wrote:
> > On Fri, May 29, 2026 at 10:52:52AM +0800, kernel test robot wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git master
> >> head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
> >> commit: fd3b87ff0232f46e1ad53a48609a3853c8757c6c [3728/9137] rust: aux=
iliary: add registration data to auxiliary devices
> >> config: x86_64-randconfig-004-20260529 (https://download.01.org/0day-c=
i/archive/20260529/202605291041.seNEWvLQ-lkp@intel.com/config)
> >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 8=
7f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> >> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20260529/202605291041.seNEWvLQ-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202605291041.seNEWvLQ-=
lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> >>
> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module=
_ctor+0xd: call without frame pointer save/setup
> >>    samples/rust/rust_driver_auxiliary.o: warning: objtool: asan.module=
_dtor+0x1: call without frame pointer save/setup
> >
> > This one looks like this bug:
> > https://github.com/rust-lang/rust/pull/156980
>
> Does [1] work around the problem by any chance?
>
> [1] https://lore.kernel.org/all/20260527-nova-exports-v2-3-06de4c556d55@n=
vidia.com/

The asan.module_ctor error? I don't see how it would work around that.

Alice

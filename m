Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9226E3EE1EE
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876535; cv=pass; b=Ot3zlz3uDG1+7XeTUNVd+AVxCyNVEHKYKPDZAtQWh2MZ7H4QdxlSHwqG3xzxFnXFnhXr00JRygKK4KUF92au8xwdHPKpUFJ7uPuAH8LMgOmkDUXsuzE3s1rr+orxjkoLwzL4CW96phXF0nuLz0s15Iyc6lTvsf0eYDvu2rEOpE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876535; c=relaxed/simple;
	bh=hT/+UCuuo+DvFfXXo+F6kaaBMNv1f6p/5PzMcFn/hSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEo7Y6gHd09OPIZSccDAzgDdMvrIwNGLTUXrZZvuvz6VuucHJP7A0etKCRk3xixqysYZ+Pr+jBfbwIwnqGvZRLHi9PpUB3PtinNpIfJealnylGJ95jHkFZ86h/2YCNV/eugnQa0gqw9VeYquh4ou4HiznSMDfoH2gBxuQmKlYnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5kc9Zxz; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5kc9Zxz"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2eeafc50c87so764101eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 03:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779876532; cv=none;
        d=google.com; s=arc-20240605;
        b=JqKP5CzNldtHY2cHM20w02Ob4dRLgoBqkw4pDlFi26PGUuiTxk3YllqtRhN6An3Lfj
         OIidZEbDzaqPQcg89++OhEwoi55eNebenGAcH6K9Hj6sQWQPfubRSwlXISvH3aF64vi1
         Q0TNm80wVTUdZB+k5wzoDKKzsvzCbfOIi8IwkXIPzE9U4qt5laXGZkLg+mOgztMXK0MS
         a/3/bpfIOOqRyuV8xJ7+LXbB+iv5flyqeMHlAN2y3+MHTeGOv11n9EDp9FuCE2YGmlSo
         Ew8LnBBiU2YAwi8FEN3m26P8EB0v2Cyf4VDxrmZ3J4gBSPWZ2jxWUvFiHYfu7CXzOqyD
         S3lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=70BoTdN1xe6Q1QjPEAxC8jYGA2tUpZrPUCZd2Vm5ygg=;
        fh=y+8lo4JXDq6K0FdXomNZHqJrFaRd8BlmXipUMORWoCk=;
        b=HesuLnIFlSYMV4lWHWZ+8coVjWNQbqsvWWQxf8GrfroC0wLYbsCON32+yYzsOhZS3z
         LCfjugzMATxCjaKm5NnvRJcPoKvDxDXk1K44CHh8Z/XN0lhQdkL7AS8xd2Pl1cz2iKA7
         JecHFegHgOXXC45I0qYxD6q7hPp5Q7a5LAgFtIktBkNAizNB4pZjfo4vr9QQhFz9h5oN
         xwdURIum/gtjiPknxqmLqXMMyHIeT0cNUR+cQ67D0zPbtKHuDEXSepDAORxtzH5Esy6g
         cci1lliwHiatZ8JfK7OxK69psNmqPV/UtlRUAZyz822ekeO9n5ciyblWmRF4V6isqAx3
         XVTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779876532; x=1780481332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70BoTdN1xe6Q1QjPEAxC8jYGA2tUpZrPUCZd2Vm5ygg=;
        b=O5kc9ZxznxtsMD0ebeCu3v6boLrwb3ebaQir6e71XXoY81Mjh7pClZ7b8uEfHnnvmK
         MRlY2hmevo+xe115SqCDCoCcZsqyqXRuRWcrN4vu28AEdsahuZBcFUHf5HPQXgLsE/gW
         mu6dZduNOedAEFMggkO33speP0Cl8ewHguEnecXImg8E0m77iZFjiyNDyYvqC7J4Wlvt
         x9OKYXkFUfzUVO65sHPyFjXToG+WdWiWW9ffjPTDHxMY4Fkru48Gfp684o5Z1LnY6Yz4
         37zUZzwDgjtxtL0jOL9Gf8u4pyAcwXlpiwgPsSnB7f7QLXv7m89GrGE5UvJuzFItOpDr
         oiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876532; x=1780481332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=70BoTdN1xe6Q1QjPEAxC8jYGA2tUpZrPUCZd2Vm5ygg=;
        b=RWjekc26yAr2srIZepBSL1c4KOIg1V+CbI9E81/OclZu05OweNgyzgx7Vd4E9XY/Hh
         Zh7sd4+dzBZfpZy2gxvRObTJ61D0K2LN2+ygPow0dOGDU4wWAVyTr5Va4PTt2NzHDWEt
         r2uUo7vY8mB3yrZpEq6fiUUC6PIIFefxG6f0DEcdMmG7uV5LstVbWWywdY+Q0EZ7Lnc5
         oFQzWUJAuJP8uo2ECWraQn0L64Crqbm08q05L8vnKiA1wfuuUd0OECFiJV3Je4G4lt3C
         SX2UkMPPtajH8q8L6HVfQy5UnNm8+FrHObNWGXv4e3D/NpidstyBY4yfVveqg4WqDRIM
         9Igg==
X-Forwarded-Encrypted: i=1; AFNElJ+SN7Dk+CiJsuQ9fxHpdOdP7r3N0UjTdt6JxMC75nDOvLiX/E+maS0LzTzXCRV0Y8Je+E6vY3R5gos0z9zmjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3bYoVhjjxvrM0PVwep+7+OU1V/PFUudfNRjP2mEdCePq2AZFO
	XiNJByJBrzOxt7aS0ctdih6SC21kBM7cz1BwxUkz2AgzkDb3oZg/a3cqAmP85+vw5nApRCzwB9n
	QrYJJ9tRwlSJ8kmVQ9QuOEllKY5tsJVk=
X-Gm-Gg: Acq92OG+lNlsxOH6yrV8OPwxRAumNIvDbEwdQ4Q0IWiPYpleBLsbYDaJHiFAAkbImb5
	QIWOt0LULd0DpqlZ41XWyWYepj6zXK5cDTSulRzBUStgMOEyACwqvYELUIzXc4ZoNCyUdrTaIae
	C/HgIKeVsP0W5e69R3NtCmDMCmif7IH8N9g+8TR3efUsW++8ZWb5khRDzUzhKeO1PRnIIGpuzLH
	Xem1qyWB6WNM/29TiSlkDVylq5X3mGRu2DptTwBWMO4nKsGxs095ZA34pJKjomFAmHv97bZfm0t
	E9uHaXZNzU1w6EokMrp4u9XL+/CMMG2XHmeauMDa0XiJwyZnhAg08gciDKEDh0El/kd1X6Mz2TO
	DGIBkV3Yo5tfx9jyzWuFAoIJWWSHhhfTeqA==
X-Received: by 2002:a05:7300:681e:b0:304:8860:74dd with SMTP id
 5a478bee46e88-3048860771fmr1656163eec.8.1779876531528; Wed, 27 May 2026
 03:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521165622.279953-1-japo@linux.ibm.com> <CANiq72kT7YEuMaM7wkOtCz8ZqEXbPLniA-x4L7E=B+x0zXt_2Q@mail.gmail.com>
 <20260526161312.19291A8f-hca@linux.ibm.com>
In-Reply-To: <20260526161312.19291A8f-hca@linux.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 12:08:38 +0200
X-Gm-Features: AVHnY4Lhc9XY1ZU87Y4GDJJb8ZsmhkoBAt44lJKGQPBXxXSclSwjwRb2dwDmwVA
Message-ID: <CANiq72m4GVWFYqnxNtCHTPu7XcGewHB5LNwOoayTfnXs9pPbNg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] s390: Enable Rust support and add required arch glue
To: Heiko Carstens <hca@linux.ibm.com>, Boqun Feng <boqun@kernel.org>
Cc: Jan Polensky <japo@linux.ibm.com>, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rostedt@goodmis.org, ardb@kernel.org, linux-s390@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 6:13=E2=80=AFPM Heiko Carstens <hca@linux.ibm.com> =
wrote:
>
> An Ack from you would be appreciated, even though you made it already
> clear that this series looks ok.

I did a quick `LLVM=3D1` test and booted it in QEMU. That worked and I
could see the KUnit tests, though we get the:

  warning: unstable feature specified for `-Ctarget-feature`: `backchain`

But I assume you are OK with that for now (and if you are, then
avoiding a custom target is worth it, I would say).

I also found a couple bits: in a KASAN build, I got [1] -- Cc'ing
Boqun in case he is interested:

  [    5.323670] ok 5 rust_allocator
  [    5.324134]     KTAP version 1
  [    5.324194]     # Subtest: rust_atomics
  [    5.324251]     # speed: normal
  [    5.324367]     1..8
  [    5.332184]     # atomic_basic_tests.speed: normal
  [    5.332356]     ok 1 atomic_basic_tests
  [    5.340797]     # atomic_acquire_release_tests.speed: normal
  [    5.341054]     ok 2 atomic_acquire_release_tests
  [    5.344127]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  [    5.344584] BUG: KASAN: stack-out-of-bounds in
rust_helper_atomic_i8_xchg+0xb2/0xc0
  [    5.345283] Read of size 4 at addr 001bff7ffdbefcf0 by task
kunit_try_catch/142
  [    5.345493]
  [    5.346499] CPU: 2 UID: 0 PID: 142 Comm: kunit_try_catch Tainted:
G                 N  7.1.0-rc4-00009-g60c6b4b89923 #10 PREEMPTLAZY
  [    5.347065] Tainted: [N]=3DTEST
  [    5.347124] Hardware name: QEMU 8561 QEMU (KVM/Linux)
  [    5.347323] Call Trace:
  [    5.347408]  [<001bfffffcb9c6b0>] dump_stack_lvl+0x80/0xa0
  [    5.347663]  [<001bfffffcb90846>] print_report+0xd6/0x310
  [    5.347784]  [<001bfffffd596e08>] kasan_report+0xe8/0x110
  [    5.347895]  [<001bfffffde5a042>] rust_helper_atomic_i8_xchg+0xb2/0xc0
  [    5.347983]  [<001bfffffde917fe>]
_RNvNtNtNtNtCseBLeUu9QniM_6kernel4sync6atomic9predefine5tests36kunit_rust_w=
rapper_atomic_xchg_tests+0x5be/0x4f90
  [    5.348088]  [<001bfffffdf59e50>] kunit_try_run_case+0x150/0x3d0
  [    5.348194]  [<001bfffffdf60500>]
kunit_generic_run_threadfn_adapter+0x90/0x130
  [    5.348257]  [<001bfffffccf9fde>] kthread+0x33e/0x410
  [    5.348309]  [<001bfffffcba122e>] __ret_from_fork+0x9e/0x3c0
  [    5.348357]  [<001bfffffec96faa>] ret_from_fork+0xa/0x30
  [    5.348531]
  [    5.349184]
  [    5.349261] The buggy address belongs to a vmalloc virtual mapping
  [    5.349620] The buggy address belongs to the physical page:
  [    5.350145] page: refcount:1 mapcount:0 mapping:0000000000000000
index:0x0 pfn:0x791f
  [    5.350563] flags: 0x1ffff00000000000(node=3D0|zone=3D0|lastcpupid=3D0=
x1ffff)
  [    5.351563] raw: 1ffff00000000000 0000000000000000
001b913b001e47c8 0000000000000000
  [    5.351694] raw: 0000000000000000 0000000000000000
ffffffff00000001 0000000000000000
  [    5.351808] page dumped because: kasan: bad access detected
  [    5.351912]
  [    5.351989] Memory state around the buggy address:
  [    5.352240]  001bff7ffdbefb80: f2 f2 f8 f8 f8 f8 f8 f8 f2 f2 f2
f2 f8 f2 f2 f2
  [    5.352338]  001bff7ffdbefc00: f8 f2 f2 f2 f8 f8 f2 f2 f8 f2 f2
f2 f8 f8 f8 f8
  [    5.352428] >001bff7ffdbefc80: f8 f8 f2 f2 f2 f2 f8 f2 f2 f2 f8
f2 f2 f2 01 f3
  [    5.352553]                                                           =
   ^
  [    5.352762]  001bff7ffdbefd00: 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00
  [    5.352862]  001bff7ffdbefd80: 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00
  [    5.352976]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I also tried a GCC one without KASAN/KUnit, and got:

  error[E0425]: cannot find function `memchr` in crate `bindings`
       --> rust/kernel/str.rs:857:38
        |
    857 |         let ptr =3D unsafe {
bindings::memchr(buf.as_ptr().cast(), 0, f.bytes_written() - 1) };
        |                                      ^^^^^^
        |
       ::: rust/bindings/bindings_generated.rs:20572:5
        |
  20572 |     pub fn memcmp(s1: *const ffi::c_void, s2: *const
ffi::c_void, n: usize) -> ffi::c_int;
        |     -------------------------------------------------------------=
-------------------------
similarly named function `memcmp` defined here
        |

So we likely want a Rust helper here in `rust/helpers/`.

Up to you which configs you want to support initially and how clean
you want everything to be, of course, so:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I hope this helps!

Cheers,
Miguel

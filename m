Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279B628A414
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291140; cv=none; b=oaJOfWuTZ2+mufdL8AKNHSpAQiaK0WWni1jb3GZC0tgDGNGIRFrSQWDYLlTmhCI/KIx4VRmkuxz9QmqWbS1bEAKLlr9DSqrIGloR8xo/r9nPnNHz/+ooCuzz8JZxsL2uhl7JkhDzoHyRvWYUiiliu9BMSA6Q4LJXkWCBL2KQZOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291140; c=relaxed/simple;
	bh=TD2kAX8AWctnhkBdQqzlUwRnK2bi72fQwVcrm77fnoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YS+3cUUJ/QxAisTD70Br7SMQINt6j8GvmQLxfFUOqEwD+94c8KbVf6k7z6KqMLGVOOY9rrRlp3ChFQt6RmjnztLTVgRrOkkZGkUbp/p06bboto/mjtHk5MaTd6pTX+LrR0N4m0pfVm3zJZ2p75e9VPqTcaMeSSnQF0DZTGJ0HKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hriHLBuE; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hriHLBuE"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4769aef457bso7968461cf.2
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Apr 2025 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744291138; x=1744895938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RECTiMcC+557K/lJHY/XYRryOu8upKT/5f++KDdNV8E=;
        b=hriHLBuE8Uwkj1TfPfgevSV1PhWgy/7u6Akm6nmio/c3GNtDeCLKvFOPfGWJsI+PO+
         pbTA5S199iKpQJWyTCOY+Vm35qjuTdplcUpLDGtfMn2dABeeRUAR7l1UbwU5rBWf6UjM
         r3gou9bXyLdKh+OFbtMV0nq1FyhSAJ5wu/NvZZK9mTLEq3Vt74LIpHlhkyNi9kEBOpIf
         NZbVuasGDE/Wkrxr3ttQaZaF82K16PDJF/jVd7E9MfqIVdyEY3wdbg8K6geDi+qBUU11
         QhcTfX+f9dq3qrbo8EwIbO/HHUKRQH6xSGAfW7fEdGwMK7R3NIArtrg+J91sZlYWEL5a
         EsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744291138; x=1744895938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RECTiMcC+557K/lJHY/XYRryOu8upKT/5f++KDdNV8E=;
        b=Nh8pmMyruC8m/HuC9gM5RosD5+84VCRmYJB32PhXXylyb8X8k3cBkl4ElXKzvFjutW
         j5r6aR4qGvpfllhFDrvEdlW1bgIdfEon5G/K0bloz+Sm10f8e43i0fkI0no9ITXWknnw
         WLIrJ1wo85sggTRmgNTUe7220d5YF66uQLuG15dNsTBgByDQILEU81X/6uIJK5NPfR/8
         U8T9dLfP1RMEElUyjm+Sh01h4tWJvm34mlvhwVrt0Jrbu8BUPIfdHKo7CZ8kn0gwnseM
         IVCQeB8BGTsEt80KSl7VvL0DZn2MXuhz0hCcEi+ORx8fsfLwFjVJoHYCdkR4RuR6+Hb3
         XffA==
X-Forwarded-Encrypted: i=1; AJvYcCUobbw2vULDB7NtQX7zKm2YUHKli7xNqelISdbgpyuS2tYuQbBkPe79ZG5lCcSuvZ9jdxGmpCElIKeNtMM3hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGE0721JLXDdfdmQJmckTYb2laLTUEX8gvOG94ypw6lWJBp37a
	ZqeambnB7J/DpP7UlOuLyXmRDW1sr2vv5RAlORk4WsTiqrv3UJfGk0kAUIkXFPmY64oEdcvS3I0
	MGIr1W3hF7ypGLgXOUqAXnfNDwE3K+YuBfNpI
X-Gm-Gg: ASbGncvxCHO4eekg0fzIlaz+Yxm73tC0CzUtJ4LV23mNeWwNdNOa0KmJgYGNHFlEh00
	1JagJvo4zMu4D95AK7Y2RhbHuaBsm3Hq1l/yB7jy8Bpzn9O/u9HeNF9O25LeFPi1CwDX916E3zh
	4Rq33IsP0hM298FmKy7/NaFlbgq+BOFao/vU1p8tQB3vqBF+aakA==
X-Google-Smtp-Source: AGHT+IFM9R0KDrUDXvIWznyIlZNJeKPixRG3knas9UkUV/6uvxLmlq3y55CKGShhOWhmJlaf2KlaW0pxqXplB0I95nU=
X-Received: by 2002:a05:622a:1350:b0:477:1f59:2876 with SMTP id
 d75a77b69052e-4796e30ed38mr28573481cf.28.1744291137916; Thu, 10 Apr 2025
 06:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <20250410130944.GA9003@noisy.programming.kicks-ass.net>
In-Reply-To: <20250410130944.GA9003@noisy.programming.kicks-ass.net>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Thu, 10 Apr 2025 15:18:47 +0200
X-Gm-Features: ATxdqUHOT9LJFv7kMp17OwoE5sfggBtIdydnpTG6jIbYvTM-zxq-kR9tYSU32DI
Message-ID: <CAM5zL5r-oZXYKwctjTTtWAsTPHCWzAq9vRduZ1E1L-EDMv8Rmw@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 3:09=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Apr 10, 2025 at 02:45:26PM +0200, Peter Zijlstra wrote:
> > On Thu, Apr 10, 2025 at 02:36:02PM +0200, Peter Zijlstra wrote:
> > > On Thu, Apr 10, 2025 at 11:54:20AM +0000, Pawe=C5=82 Anikiel wrote:
> > > > Calling core::fmt::write() from rust code while FineIBT is enabled
> > > > results in a kernel panic:
>
> > > > This happens because core::fmt::write() calls
> > > > core::fmt::rt::Argument::fmt(), which currently has CFI disabled:
> > > >
> > > > library/core/src/fmt/rt.rs:
> > > > 171     // FIXME: Transmuting formatter in new and indirectly branc=
hing to/calling
> > > > 172     // it here is an explicit CFI violation.
> > > > 173     #[allow(inline_no_sanitize)]
> > > > 174     #[no_sanitize(cfi, kcfi)]
> > > > 175     #[inline]
> > > > 176     pub(super) unsafe fn fmt(&self, f: &mut Formatter<'_>) -> R=
esult {
> > > >
>
> Miguel, I cannot find this code in the kernel tree. Is this again
> because Rust is not free-standing and relies on external code?

The code I referenced is from here:
https://github.com/rust-lang/rust/blob/master/library/core/src/fmt/rt.rs#L1=
39

Received: from mail-pz2-f18.google.com (mail-pz2-f18.google.com [74.125.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36C6274FE3
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 05:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790487719; cv=pass; b=mMxxBmdLWZOj37J5n9zeE+DeDqmaYu0F3h7XvVtli6DMXtz68smDe0cRZoIN/uxBYXaFGZSY0pwM47P/w4k9GzQPdgKnniISHJWsZR7g3Xci3B+hCpmy1pm2ttub+l2P3HgfGGh3PjWjTGehT2gZ9BkLFKbBILPV8wMLUWF6Vvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790487719; c=relaxed/simple;
	bh=27D2fLeWQT7F2VZmC8hen3ewt7kPzBeONm/IArdrf7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeawAgFPCRp6Mi6vmxTvtlLQJ3qp8NzJ8ji6feyUQKakUzrIKA9dHjuEQtXN5qcf2w5vYigs6rO6q/uPMe/GZ3CST4XrUv93jntxw77cznnFrUgEas5hGNLx0Iu6zbHu2a3zyaaBg6NvqXjAfwcNkoMpDiFgqeUfRizH2zD0bqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nltE30G3; arc=pass smtp.client-ip=74.125.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nltE30G3"
Received: by mail-pz2-f18.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso1326720a12.2
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 22:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790487717; cv=none;
        d=google.com; s=arc-20260327;
        b=Ht5+cQnzByV7BWPwRTJe2gHMNJImUTCXipnTpfi6VHLw6fE89gPh6t6+f6lGtzy+gL
         /9t90dkmZ7Vk8WEex74vIRaqKfu4msh2BulLuL5ZxOPQ8i0so7HRVaB0dbQNFl+0GcRd
         0+fpZB2cPFVTczmWvLBdqrI9v1VgAuyFIfbAfJQ4kMdmensowW+RCp6fernMlIQmSH5w
         r4dF6yYbifpz/zpSGUfepgK/3qk0XOTWxxYtceZWyzfgFJzb5GuxP87uVMORcH0gNCgQ
         mPZoZiR3uNnWMFs/d/6v9dZWCBAjCzQGP7izq20I0qBtoDw6+O4e3ayMAp3QcwXDUU+O
         9E7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Jzd+idKGu3lG22aKjMViCjfN0are7tE01diIZ0CFAc=;
        fh=30KWkn5K7B2595asvHPr0C1YykpM5Mp7Cl1P928dG9s=;
        b=bqiVgZycdjNkdrNpYJAmwxmVhENObhseFHyLCBM3uNzv/xDiCVx9FDn6rFgJKKQulA
         TOj/8duEB5SyN9U9xx93ftBdFpnkAjCQ9/lqrLPPfYdP3T7NRXlIztn68nyFxHdEb5Pf
         PmFYEvw9uIL4Pv9ilDYfLFgQ+oceanqqGtJFoixcNT+/psVKV+O5rXw7psUGvv/i259B
         PT+Hdu/iU1UTWfnHDCifJ+qOqb3u8wWVT6j8VnH9Rn6IckE5ozFCQ6flgsRAKviX2P9t
         TSch/aHV3tMr/qOndeNW6pYRCRyAKSg/SyfGgICm2hIpA6TOf5qi7RmHEX5CRfcxlEFC
         Z1CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790487717; x=1791092517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Jzd+idKGu3lG22aKjMViCjfN0are7tE01diIZ0CFAc=;
        b=nltE30G3KNYF9CfRxx1YYy+zsS/hMgE7d1gQZTfFTnYZ/OCbdlkpyJIrJHUreWFWbK
         cXNXWELdebREOTPaCtgzmmrh+QXbHgbWt3q3DJL0wsWJh6TBVqMn1UsifywcLpSJhdHO
         wWZJtS+IWdYQjWI/08OqC6EDkBrPHtvw60/vf/wRrcA4juLAk4MzUQ0RmUw7ExUbTEwN
         jGpIRjYmhvH9HEcHxwkhqK3S53g2LwQFAHs5IKTkCONvgNhHdqzk705EQ4ba5z1rEnZI
         Me32QQOfhKk7x0OCQ7ruwqyrD29JByoZOS0o/IVlqCqAUtUdfzDy+tPSrQ1bN9ien1Eu
         Jftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790487717; x=1791092517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Jzd+idKGu3lG22aKjMViCjfN0are7tE01diIZ0CFAc=;
        b=JwvvVthDtuqFvRUp2npJjlk8a5olf76SHu+JqBp0R5b4f2F6/365n0bvMUjwU4OQAM
         4+UoNKkg+a6pgFdGI8+qQb0iBWhxfqYlNAfE+JpM1RLApXsWsRE/WAz0A03w99HzR0ty
         M3dPoefTl2CALSA9A93SS6BaHPAs+XyQZfAhWU1Gb6HrXCqI9xX8vKE2E8d6kqhVfnN7
         Yx0OtT1X3oFJGWMpdutfe/WmZMhtsrSezefUNQYbNtA1NHK98+iSwnedZxiRnl7VoMjf
         ol1EV5R+DsQLIjT7maYem9vIyMs3VREamVjWB9bI5jwCdcn5I5zl7CnZYlfEQp8T+etH
         hCWA==
X-Forwarded-Encrypted: i=1; AKwUvBxo57B0yThs37DHWa/i+xQIF0Q7uPCgma/ElT13JUEJq2pPET+bB8sLbe7nXuCPU4uWXtSuH4kYMhMAOeHunQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKLVmF14DUwTGCyLxUYC4WZokzCXTRD6CXu0Wjj6tjKFxB3m5qJ
	QsZ3JNtbkGxfgfXBSTycshDNNs7oO4FECL7CgOA6RLZqFTpeUp+7q5+UiLZYXWKSWIaOzUzpggf
	0CmWIhyBYMyIllFUl1+dFTGUrbyas92w=
X-Gm-Gg: AYBFou0KpAXIq3xtz2N0zUW0a4P637mFFTF4BRUBZJwGvzFn8qWj4VERDYpx+bsUjh1
	h/CAbzpT4oG/X/YBqAQea6GPPe0WX0KxQRu/wJ4R6PVY4+X8dB2ejpG0LMsNInMNOsws7qSUDuR
	ht7272/qXZ81mzlfOfzqaLWo7I+uewpkz1NtGaO1rxzx8Ca49+8RHXdzPQHfgO81KumKtgSodpy
	qt9gjLEpjEr6s1vIGgo/bre5IdQq51M26R/5jMmCypErZ4FL/TqvDyUi/UvavZhdfZu8q202RKt
	vbcbaH5cAKdSq9Cipiaz4rbhZQXuyfKMWkL5P6M2tA3XMu76ACR6
X-Received: by 2002:a17:90a:51e5:b0:3a0:a83d:dd0c with SMTP id
 98e67ed59e1d1-3a0a83de3c6mr4871580a91.17.1790487717187; Sat, 26 Sep 2026
 22:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <qBPUAToMpl5CvVd22lUrJOgsVSuqVYKsjEHpbs1UK-VTO-vN8UFOa35fFMsYOHoBuUp9HcP65ljAxmLQMcGS9w==@protonmail.internalid>
 <20260508173827.1123011-1-ekffu200098@gmail.com> <87a4u96m4c.fsf@t14s.mail-host-address-is-not-set>
 <DIE4WB0VE43Z.2ALSYOD50N5X7@garyguo.net> <87pl346466.fsf@t14s.mail-host-address-is-not-set>
 <DIE8AGXTZXBL.2RY8JCWNOD2HG@garyguo.net> <87mry85vh7.fsf@t14s.mail-host-address-is-not-set>
 <CABFDxME98=KTERw17UYEs-5yKJvibXd-RZQ5rUOt7QgE4zk3vw@mail.gmail.com> <87o6do2x3u.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87o6do2x3u.fsf@t14s.mail-host-address-is-not-set>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Sun, 27 Sep 2026 14:41:44 +0900
X-Gm-Features: AclHuK-M0QGz1cnlzL2SJX-q16WFwa_TPoq59OpU4UU5IEC4O5CIvT-eBDQ7kUw
Message-ID: <CABFDxMGJeQO87vG1wKZ2UecKMy450NohJnr4EPDBXqj7HvJG-Q@mail.gmail.com>
Subject: Re: [PATCH] rust: time: add debug assertions for out-of-range input
 in fsleep()
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, boqun@kernel.org, fujita.tomonori@gmail.com, 
	frederic@kernel.org, lyude@redhat.com, tglx@kernel.org, 
	anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andreas

2026=EB=85=84 9=EC=9B=94 23=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 5:25, A=
ndreas Hindborg <a.hindborg@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> Sang-Heon Jeon <ekffu200098@gmail.com> writes:
>
> > On Sun, May 10, 2026 at 2:44=E2=80=AFAM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
> >>
> >> "Gary Guo" <gary@garyguo.net> writes:
> >>
> >> > On Sat May 9, 2026 at 3:36 PM BST, Andreas Hindborg wrote:
> >> >> "Gary Guo" <gary@garyguo.net> writes:
> >> >>
> >> >>> On Sat May 9, 2026 at 9:08 AM BST, Andreas Hindborg wrote:
> >> >>>> "Sang-Heon Jeon" <ekffu200098@gmail.com> writes:
> >> >>>>
> >> >>>>> fsleep() documents out-of-range input as a bug but does not chec=
k
> >> >>>>> it, unlike udelay(). Add `debug_assert!` calls to catch it in
> >> >>>>> debug builds.
> >> >>>>>
> >> >>>>> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> >> >>>>> ---
> >> >>>>> Hello,
> >> >>>>>
> >> >>>>> I found this small inconsistency while reading the code. The sam=
e
> >> >>>>> check was applied to udelay() [1] but does not seem to have been
> >> >>>>> extended to fsleep(). Please let me know if I have misunderstood
> >> >>>>> anything.
> >> >>>>>
> >> >>>>> [1] https://lore.kernel.org/all/20251103112958.2961517-2-fujita.=
tomonori@gmail.com
> >> >>>>>
> >> >>>>> Best Regards,
> >> >>>>> Sang-Heon Jeon
> >> >>>>
> >> >>>> Looks good to me. Could you add the warn_once and remove the todo=
 as
> >> >>>> well? And add the warn_once to udelay as well, so both functions =
have
> >> >>>> same shape.
> >> >>>
> >> >>> If `warn_once` is added then the debug assert would be unnecessary=
.
> >> >>
> >> >> It is different mechanisms in different situations, right?
> >> >> `pr_warn_once` prints a warning once (and a stack trace depending o=
n
> >> >> kernel configuration?). It would be enabled in production environme=
nts,
> >> >> and it allows the thread to continue executing after triggering.
> >> >
> >> > The existing comment and your message says `warn_once`, not `pr_warn=
_once`.
> >>
> >> I actually mixed these up, thanks for pointing that out. We do not hav=
e
> >> `warn_once!` yet.
> >>
> >> >
> >> >>
> >> >> `debug_assert` panics when debug assertions are enabled, otherwise =
is
> >> >> compiled out.
> >> >>
> >> >> I don't think one makes the other unnecessary.
> >> >
> >> > I don't think there should be two checks of the same thing. Even if =
we want
> >> > different behaviour depending on if debug assertions are enabled or =
not, it
> >> > should be a single macro that switches behaviour based on that confi=
g.
> >>
> >> Apparently this was discussed in start of April [1] (I somehow missed
> >> it), and as far as I can tell, consensus is that we do not use
> >> `WARN_ONCE`. Instead we use `debug_assert` with `pr_warn_once`. That
> >> sounds reasonable to me.
> >
> > Above explanation is reasonable to me. So I'll add `pr_warn_once`  to
> > fsleep() and udelay() both.
> >
> >> This can be a combined macro or open coded, either way is fine with me=
.
> >
> > I don't have a strong preference about this either. Maybe we can
> > handle it in a separate patch.
> >
> >> I think we should add the `debug_assert` as suggested by this patch, a=
dd
> >> the `pr_warn_once` in the not taken branch, and remove the TODO about
> >> `WARN_ONCE`. We can bike-shed a combined macro on the side.
> >>
> >> Sounds reasonable @Gary?
> >
> > Any other opinions are welcome including Gary.
>
> Still waiting for a new version of this patch. Let me know if I missed
> it somehow.

You already replied to v3 [1] :) Let me know if I missed it somehow as well=
.

[1]  https://lore.kernel.org/all/20260621105909.4055210-1-ekffu200098@gmail=
.com/#t

>
> Best regards,
> Andreas Hindborg
>
>
>

Best regards,
Sang-Heon Jeon

Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C41272E56
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 09:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639339; cv=pass; b=FrrhTMVbfmo2KxI3LwSU0N7/BfH7R+jNfZirKlECQXorMyU5HcZ6i98TAnIJY7MNUDWXXjIY8YC89pxhiT4nxNlwoU9FBd0b/zZlDps6SbvQFW/yWY1kXnl7S5kxN45xmh7nz1McxRm+MmUO17vFPw7PC99vJxqw24gNlntzkrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639339; c=relaxed/simple;
	bh=b6XvMP+UrxAAUARKbzxu3J5IkfJ+/3flz8dX13NSDs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hl/838H1F0JSAXTg6yqmeT8kFcxM4l/FeMTovl2XvD7D2OUvlDYXwNIIQc8Vmi0nwYRXE8p+ka9ETtb9plhJHGWwlSYfMtMWs++WKeWTTmqntmp9Yo6gvhkQxB0AEFOYCnnx/zoTtgTRKqtANFXoMikCB4qblda0yHzop5EJev0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCJBrQKM; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCJBrQKM"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12714f01940so400126c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 02:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775639337; cv=none;
        d=google.com; s=arc-20240605;
        b=WpHXTX5clu5NW0uRCkLOt110/wGmF5JNgeQJ9Zshzg6KEI5ksEuByJC4i1cWgLBgDu
         xwCJhBr2CAMeTtah7Q0G88gEaexGVIoMufcEOlX38pM9wusuO7ysdBnnObQKDEz7o5ot
         BFKhADpaZgdOpugrMZl3O9WJFVKDOz8mjmvxzBhC7ZfPeQf+mJQFrI+PKR/msBwKt4Kk
         c4Zxl8oGmyOlfMYzNMXRGFBq30Ro/jizh8+BAQ3dsarcM+GRSWOmi4fSO2jL2nS5Kb/Q
         qR3yWbzJv2C4Xipj9Dpm+1Ovy7K+rd7DB+1K5A3p2hsRlOBGvJSK2giUSvONotZpGti2
         zEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wpjbpjgyt3kVL9CDl3fb9bhrtp1TlgbfTEeDJRX1nKo=;
        fh=YSM5xJIUptEtKl4hAl+WzBNhN6uYy8Dal/SeqV6BkHE=;
        b=e9ZFD47ohM1vl7Z6B5C7Rm9JX/Q6YpgyIah0JpX6RmCQsl8ueZG0YldK0aCwJTO3CU
         aPyERQ2PplOqJN6r0HUnTGZ17yWWbeEC7gYi7LYgTVJ05Hsb5gaVyk4o5T7r8Te5CpI4
         FhsRU61u+cuefq2thDpVkD0ffctpVuZ9WhDubyGck3+ceuqAFCRNHVym1NRUwsnd0Cid
         Qxc2neS3kNP5N5jmUUQKqho74R3cWNNfOH+Y7SYH2/B/NsBPj6MMPgPWgYK0NcoTivWD
         vnamTyR+B//N5ZQrOspDC6VuO7qASCAU+09EAwdn3IuRTdADYD5n3lUA2C8nWwO4q8Vi
         BuSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775639337; x=1776244137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wpjbpjgyt3kVL9CDl3fb9bhrtp1TlgbfTEeDJRX1nKo=;
        b=mCJBrQKM4KPQRENhPKuq0hDIWEySzABQYHJlAK75G++HvE/31kHXAR8uOJVSWkWJlZ
         GTbI5XaNCgDn3MbwzEyDwDHkl5qj4pcxg5GKBapSe+3Am1S6ed6yUxBkoZz0seqx2zC1
         NJGiQEsvflXtlHsgYpD/suNWUiZGrTtxpYLa+BFwakahKOEtXzgvn3fx6oPYff+37K5Z
         +QoMB5qWQ5wmvj/V/SkbXkR8N7WcKmn4rnLNhHb1KCOKMEqLmvwO7Hg5/O8ik74/nBkI
         PWpmREphlK3MrLxAhSiT5aFIY/kR+sGMd3aJT7bswfWRBp/ZI+nYi1DtqhNieBP3cf9O
         0bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639337; x=1776244137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wpjbpjgyt3kVL9CDl3fb9bhrtp1TlgbfTEeDJRX1nKo=;
        b=hnQWVKEXhYqPQbL7Df3aDrT3nOwooNR6Up8rj8+S5OQAeQxCv9CsOHxalVnF3bIuOV
         M/v8/HPISmAKJmmX65WYd604LeDJkXOglxn2W5NM56htUJsLX7N9tY9nxPzTs5Ngrl+J
         tbN0RLW8HznTG6NRM9/wy7+5TU4XL8QXI+UYGpM7Xzls5RZBTEd/4H8d0+HmlDMh3WcF
         SYs7tLZGxfLa74GUI4AUM5OtpQTfI74RBG+5uKXJraAtiEVGjonahPpaLYnsRqgRr3+6
         APNLBrmPIE1et//LNP9lIb10f45wfmcJDv7LmDzIbD9rl43O6gIoKDTE+Mf+5P5C4gIk
         aDCg==
X-Forwarded-Encrypted: i=1; AJvYcCXozJXX1KDFaqmQYcjSZdcCG6HwvKg5uPh31NSXbg7ubBbD+sTj9JXNscABxvFBO/9L+B1DLa73AWLBInVjzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8giqirk/EdVXq+eVv4fuF9oWEvSEgcCp4WKvUENAjjuoz3Kcc
	l4fuHSj95/bT7OAdhM2vsdbRyYnTb2ANzvfIU8fShEmZJUAaVb4VGf/KbynFuibLH3NaRQWU9wt
	vAuY87/H8r5NASczPK9YJ0Jq3PC+6R7lKf3hOk8w=
X-Gm-Gg: AeBDiet1s/I1rSFGpmiCsZIlEZ/KlfchndX9hMkCuAgncRNHKyF+U8vAK0W0AS5POfI
	vaq+zo0OquZ31xQYas/Nl3LV26cW1EpZ6LNgMuIn4gPPb51JiLGK+J9CnrS62mRs7fqI8WrgIhI
	Rrsx0RB0L0+mklV0WSHKS1+XtV3dcZmMOk5VinepX3frqLmFRmLRZVw+IYN973DoTrlIF2NNc7J
	FmPEDsJO1187rpD1frPyhWhZxEtQ1f+vlWVfmt7YiNXrOYODeKYYNtopvNbGdFN5qimyfxpzokm
	475Cj52ubeuv/XP8Mz/HC5A3dw4wPBBBZANbHCNZyamjpYvl4o2tXjV0EbhXNYMIk9I4m5Cy1Zx
	TQDtduXm/ktuiP88gGPL8J9c=
X-Received: by 2002:a05:693c:3005:b0:2cb:8d2f:e235 with SMTP id
 5a478bee46e88-2cbf9af8b84mr4309595eec.1.1775639336798; Wed, 08 Apr 2026
 02:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87wlytwts6.fsf@kernel.org>
In-Reply-To: <87wlytwts6.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Apr 2026 11:08:44 +0200
X-Gm-Features: AQROBzCIQCGr3vr0hvu1uL62OsJdf4isAkq_PDV6FVhjfrAJRG3jsbPvYUuap-w
Message-ID: <CANiq72nDmZtN5-BCPPWhL5jyBi15eNqUnjJoEjOx7=sn=aPj+Q@mail.gmail.com>
Subject: Re: [GIT PULL] Rust timekeeping for v7.1
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 11:28=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Pleas pull these changes for rust timekeeping.

Merged into `rust-next` -- thanks!

As discussed offline, this counts as a back merge, so let's avoid it
in the future unless justified. For this time around, I provided this
context in the merge commit:

    This is a back merge since the pull request has a newer base -- we will
    avoid that in the future.

    And, given it is a back merge, it happens to resolve the "subtle" confl=
ict
    around '--remap-path-{prefix,scope}' that I discussed in linux-next [1]=
,
    plus a few other common conflicts. The result matches what we did for
    next-20260407.

    The actual diffstat (i.e. using a temporary merge of upstream first) is=
:

        rust/kernel/time.rs         |  32 ++++-
        rust/kernel/time/hrtimer.rs | 336
++++++++++++++++++++++++++++++++++++++++++++
        2 files changed, 362 insertions(+), 6 deletions(-)

    Link: https://lore.kernel.org/linux-next/CANiq72kdxB=3DW3_CV1U44oOK3Sss=
ztPo2wLDZt6LP94TEO+Kj4g@mail.gmail.com/
[1]

    * tag 'rust-timekeeping-for-v7.1' of
https://github.com/Rust-for-Linux/linux:
      hrtimer: add usage examples to documentation
      rust: time: make ClockSource unsafe trait
      rust/time: Add Delta::from_nanos()

Cheers,
Miguel

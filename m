Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5A93624CB
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776797235; cv=pass; b=RyGD2jf/qHQGFzE5URHM1g22OA2L3jcgAZ1qgNYm9+7LqB89bJkUAI9ftZDcN3eVRK0uwNDoGGgK+OlHYDy7j/MpwW4XCYjR7FowTUnUOPF2P2/45+QHVNRBEtyJ4Ekk3J+mWLHB7nkP6mdfA2c5ctM3J/G1ZxMawZkXZBd+GTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776797235; c=relaxed/simple;
	bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V28IkH81hPSeTl/qsQuqPm2l28AnXQh7baIGyjMf7k7QfPGJJekuLwIWt72Mf7BQezDN3kVfQEgqxFXwM3OMDCIzHuwHLiQ1dpjhtY8t+ZPWGKC6qNMCOiMv/xxlTCqbKHuv80CZnXtqmUF3vPcJ0xMLn0KSoJtkMsJEPAov+KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY2hPFkR; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY2hPFkR"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12714f01940so283878c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 11:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776797233; cv=none;
        d=google.com; s=arc-20240605;
        b=HcnkI7dyf+6n91P5j6GIe7aYvFGck0SYDziYhrJ7RnkDdERQMSe+ShmrmH7PnEcKTy
         l2FVQJdrlu+sgc7hz985HJ8gsyXqwEi9m/pgHJ3SeU6NBKJ58kxMkDrjdLlTvazz4VBl
         pkLWto/HmyzdeUolqUFE/PYryHDck3rG5c0R5rEeuvT4NtRNIy7Z7UrsQtZ1JZuTjSXp
         mzFhEHsre5MX0VDpFEiq5Ifga64mkpggd7PlQHcdmL7D1XTBeqMVhmzYieN/NDZ90K/T
         hrwIZFTMIzuxFcVQfKQBMn2Oejb4V6Mc5ffsh014f5I8LEHvZzhurP65hkcSGNR6CqdB
         5VCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        fh=PTdXwqC3bbAE75YY3IVYTPLbdH2jN/RGdTSe+6HsCtc=;
        b=EN0mTIQXmQxfNVvxbPd5c4emORA9Gf+q+e2SuOYshpsjmEnc0fu46akfaMw6PktG7A
         JBMf9TX9a6CjLTDRVXZUOWDNO8ckBZYhT3f2JynIuf97yWM45yLWwbDkH2/gpwUje+J3
         Sx+91FcOI6Q6ovzf8c3NNGNAEgHBKY6eJpYxTYEd0DjIvaw40HeYSBabLzAo/C6RUOJ/
         IMQ6ZXhgktJ9KF/7LR6qR1u/nTP2IEtT4Mx7tsU6vbkitbR5qjfCVdf26TE/WuTnxNDZ
         t6t7H66owPCDZR7jvV+uz3aJB/92e5KxuFJoti7uZHGQULZRG1ZPwi94q/vvLRVXE9NO
         siWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776797233; x=1777402033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        b=lY2hPFkRzSq0i1RtibAyiaYlSfJT9MCga6ODlOILOzE3hy3pzy1KE1XhdjDDOhFtCy
         NQpH5CwR6RJu9e67ONSkgrVu8NTubVsEdi25y5VmxyJkAmDCwh+lWkJwaQmPHIwbmroT
         PS4IrEXF7GZoTZWqGbunpMBr6IcFcqAsNsGGbAXuxhPQOUUpLTcSyyxgyzfvtWBAVjiB
         kAzh4b7q+msAEnoXUPhvFES/5vrMq69RPJ6eeZX63CsGe/idjCcrOltXmlWosmnUBj7c
         ppGhVvypCTYjmoWOdwo0EXMZ0PCgmWSB/+ucyZc9i957cNGUmYmalruc9hxNvLd/nHsI
         kUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776797233; x=1777402033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nxMVd9OHSpuGcSYtsfr53tYbcrChA8wOvkQbNhNm+r4=;
        b=iYIiJmd08JSjkDRYoxmQKjifr5KtTxG61hqsXZ7fwITJum6HWT/VxqPrud96Xm7Usq
         p0n7ElHR+6dV1+VZMgUb2E08T9cMNLJcNPIyaw2CNxBFhI+fC8QsNxHwhBBtVbIzJkKU
         rjE46gnQ7QdsrCoYnsA4sQuWhrDQCX0tamGtPe6dpSvCLNgyJ6aFXI07L/d7FOfkeGTG
         rnpbII8twGUG/sRLMnX3Q05BNFIBasBLw4+1jZuU3Ye9UrtXn5151wdSA5B7DWOFyGSB
         dZBsnw1l0BNct3D0Ar3dRaTjg/BxRv0jA/Uf1YZ2QrO0Qde1XXg1g31+GFg6YwYrrfxo
         HH/A==
X-Forwarded-Encrypted: i=1; AFNElJ+0N7GEorasG0Po9LmNZyNdAGHr/da4WWENeDsDPc+VGpE4/c9wjdXH8o3ePNNfw74hNYyF8TSk3+6ZUzlSQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQQ9pQshoK2tf/FvSmaRsDT8o+USLulJ7Kj1W9/C2p+lNehR4
	ph+sMXc/jzmWJt9fyLXP1kBHEiN+AC53je3oR4MYX+3SrpLHCOrSbOUVQjTD9FgITQMhg+i+DSh
	GNVbwOqpvdzGg9Is1Mryh77pIZKhQg1c=
X-Gm-Gg: AeBDietLO4Tlrhs1uxvhwC9++c7OWVNMKmn8P0YAe10G+2We41ZCDFo/kLvBcJdkhZj
	7SIu0I+r3JsNpi7tOE1qdeYfqMckwTpXa73q7Qg+1+IV2024nqXveTjwbNAwM2CD138kiQfq0S8
	WXas53aa6QFzP7KpIJQOHFotNsszEHwXzRBmyNFw1HoFwIR6rEMiiJFpzYmA48QnJM3+kUr2mZU
	pfMRymMBNbi6JuvKP1lvRBaH0DDNdgY2V3wUuiZjiLmbgyNid+3ojGDWMUdLd8n5JGdu/dJyukq
	czL2ahRfUlwoQda/Qdi/BOfnwIKjgayjm0z7ZsD0EBvn9aoR4Knb0AUW6A5aTrUjpp7brcOiVIh
	WMZXx5tyFN3hU02ToHRWusOZRUq72uA/cP+APSZ5MfqWc
X-Received: by 2002:a05:7300:fd07:b0:2cb:8d2f:e235 with SMTP id
 5a478bee46e88-2e466043efemr3780881eec.1.1776797233495; Tue, 21 Apr 2026
 11:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
 <20260420-synology_microp_initial-v8-2-7946a9124491@posteo.de>
 <6104a5fe-a6e3-4c35-ff4f-731d1a5e4acb@linux.intel.com> <c4964138177c4455f5eb07d0e23db2dfec40bf9c.camel@posteo.de>
 <e166861c-e75d-d1c2-61e8-f611e6ee1ef2@linux.intel.com> <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
In-Reply-To: <1cc39657ac50f3930dfa27de41a1b4605a7167d9.camel@posteo.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 20:46:59 +0200
X-Gm-Features: AQROBzD7jw36OIB5Thxw8iYFM3lU80V29LqkzQd_l1DKXUW04JWxY4nHk4yFQzg
Message-ID: <CANiq72k=8fmi0fJnNV=GgR5_HO_COWGynKDF-xzoX1nDAdxdrw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] platform: Add initial synology microp driver
To: Markus Probst <markus.probst@posteo.de>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 8:21=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> Delta stores it in nano seconds, so it will require an additional
> `.as_millis()` call on use. I assume rust will optimize that out, so it
> will be fine. I will use the `Delta` type like Miguel suggested in the
> next revision.

I think it should (at least in the 64-bit case -- we do have a
`bindings::` C call in the 32-bit case, so likely not in that case),
but please double-check the codegen.

In any case, my suggestion wasn't necessarily about using `Delta`,
which is definitely an option to consider, but rather more generally
about using newtypes, e.g. it may be that we want to have a few simple
time unit types (probably with support for `const`) for cases like
these if people are going to use primitives everywhere to define their
`const`s -- Cc'ing the timekeeping Rust folks.

Thanks!

Cheers,
Miguel

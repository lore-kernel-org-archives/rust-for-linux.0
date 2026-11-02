Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793585366;
	b=BZpWNvQ+qqitZWzTlzQRCjXrVhJQmH4WhW3nUFGmSiMp9oA3/8J/JkUlxmvipNpsWNtq
	 /yf48F1reQaX8uyclDxfkMxYklrkNiAJdOnpKaA6dH0SQTmtc4rRR/5s+MgIrh2oadme3
	 QmLWRebc+PxHN0Qha3YBRlCSG4h1GP18x6hAmAGITGIcvEX3yYJNx4uN6+Wg1cDzp7v3R
	 kGbzSX6ag980amC4GIlcKZpr7naWqIRcpgZdfkqFxqkF49PUQD/BjcvlChX1C+jSN1O1H
	 dQmtiCWaK5mhZ6q0M0KN2BZ4iVPOohoVOIsHIRowuW8w2wbg4/Q/3cyEunzXtzsboww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JM+w6aBnc/6mcug/U+Sf72nhtCKL0cl1TGwbfpZXBto=;
	b=ixo/v49/Xe6WQlE7NNbzaLdIEMhz9s4s//6twtWJmuK4hM7Nf5AT1bWvd9NaEHCOrPou
	 XQTUqYPVRcKoFHYxC0hbHA/5v8hslBkqCSqF/0o2BQ1YQgTolJgzTGOxJ7lyk6bXe8OVj
	 BJBRHBfy3VDV2h+xxKWcDIrW9jkdU1K4HOPPtwBaKAwhdOGSwBse2xZ0vVXgL/QPOPogJ
	 qQQFSU00E448EixfeY5sqz2/Ya5NvmiTOKpOCGXVMX83lolQiefGtzNGgH/Qdop94iUQ4
	 QMXNvRzdQR076G1qGlms6FWpr0LfeduovMhZF0TejEZ7Ojp7ECxVI/RY7RxqjPheNUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLli9ooL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1058606A324
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 02:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1058606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLli9ooL
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bb5afa736so340458eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Nov 2026 18:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793585365; cv=none;
        d=google.com; s=arc-20260327;
        b=c4KabzPvNME+b5iWCIfH13WeMpBfesJr/58VAAZGcI13TXkgCdzwOjYJB33Q4ivbEf
         USWXtt44h2k+19nClbXiYa6BrxbDDFBTmSwfHTdV/nNOD/DP6ToV1Fd/WogYifR6u9M1
         T1QxPkkoDHclE4IAtbhHiEZdEh6RxoW/NUKHBWL7yGOKAwL6Q++cOz7zibGTXW7L84o1
         M/SMQpgYFgMpan79iD6zN+RtnLS8lP504RWEai5+1XGEJ+QlCbWOkpvVeH2sEuG7U4ET
         j9zLDQgbQAnoqFlWW+M+naZAFS9Fyq9z9LiMA+dLVAYdnmyrPXldRcvDHqMdL7LjncMJ
         pxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JM+w6aBnc/6mcug/U+Sf72nhtCKL0cl1TGwbfpZXBto=;
        fh=6ff+C0DG/43V75sv/ThtbNymJSV6gLvTX9M0FbCEa3E=;
        b=fDPlS2WmidSMHLBBJfaeQT8SlwKuQgcI+cSPloi0g1MDsIyxSzKgAEMIsmnrf/3xDQ
         AtK7oDsXMJH1lP4vGsvgvZMxuo3KIeJeRpE61b1zwSsl8UviIQzLMgtE//WQMykMH3AJ
         0rgjPoOiYLEInGT6Hr03ai6MGsGhxCWg2bPaP+Evc+B4beKTa8C3DS0jHHFxNC6Mnmg2
         Jygu49qvIUARLibCQDKkYYOM9kvsct12btlCUrWepesabuX50Zn8JSoEiK4oaBO/D584
         ASvSdurkLWqWfnUXLPIg7pbBuMyh1RjGEpbjuUDCJN+740XZ54qyysDTJEaCmCqcF68j
         qL0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793585365; x=1794190165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JM+w6aBnc/6mcug/U+Sf72nhtCKL0cl1TGwbfpZXBto=;
        b=xLli9ooLhzieBA7ShWegrKHg7wsQlkXwGdZxFt4Ehnp8tKPxxEJShw6Vd5tIKTsbaV
         1YnzdlwFEmRnrgn0AhMdBFet7R6GVJ9ZDs6oJIyCzVkVyaC0GFZKzdh6VvbCaZTRjPzF
         TLI2zjZBfGs25VnHv8pszD23F7dFRTR2OCZ8ezOnSK9AC/Lvo4Cq05MxTICnxPp1K1Wq
         8nQnrJ66XVyiZ9ikzfKA+7KWcZeD9mlPz52kfEqAAjvGi1tLG4sjNRCGfHKZZl8dOgJz
         i4ar3liEMt8MTMo0h4mptYCaLpR5HBLxabA+UsOzEjpCLJ7MizXTqNZbMx7vKTeDBswR
         kLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793585365; x=1794190165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JM+w6aBnc/6mcug/U+Sf72nhtCKL0cl1TGwbfpZXBto=;
        b=K0oMlEXDRS9DGqgoAlCy2XXlOabW9Aj0z5o0SuDIK1uo2ugQ1JIlzCB2hmRqYFgXfd
         G7DtmiplkKIft70IP7/ECJmp30rHFFd5FH7Mb/vTfE31SDHEmHYuE9RPlJzT/V8h9mZY
         TC891q/B8bvgcxLvbh3C1giWN93e42vFMPI/S8BURL+AzWo30dzEKn4G2bFaCaTTHeGD
         I3hckTt+PvREUph7QFWttfiaOHcAD0bN/RvJlI1IjuYPV0Zs4WphZEczTlUEoM/UojQd
         tySfX0UBjgR7uoF6T6A7bfCT78BOcMCiUFpa0JN76cORQ2QiWtVqzeERp+fRQ+tQwuM9
         11Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxFLV+w7bbjq7751bkDZWnNWTdW0juq0rwTEjG+zF6EM/sUdMUO/Wb0VTZGg/XImNW9S5lXdVk9ANKIh03cnA==@vger.kernel.org
X-Gm-Message-State: APuU4Z83i7R/X0Itca/T6ZSsGnUCv3qQ7bXHI2hlMbchX4isH2BsOmpc
	cMVgPjpMZaYDQBYMDsiW08+cGCvYHvhuQS4egTctLQoiZzbVoIyNtBYxUJRR3IpwaYn/xeqNSYx
	2lnAEkiauLxxSJTk93p3HUKYyAi61OQk=
X-Gm-Gg: AYBFou3aBuqLvt+IMRaRFl9forrBmj1T9gHFvdCTSj+eUjLY769mp34dEtWwz4p4TKl
	weRsWzpcFks7jVI3NvsmD5PjfepVOEHhXhCTsZjPWjG1DZJJPMbuRs1A9l83dTup14Ni8Umgkzp
	hntqpGdawmJqR8zQksxkx2D3U3GQky+iOH0D9Ihho9mWkLzRXZoWmDi0cAHRcKUrNJ+SmEM43Bt
	ojAa6CE4dpKPr6xn2vGYUYSrABqmYT+tguooj20/vNkPuwAWKf/EBbmZB/o1kEvh3+AqnwWen2y
	g3roS8aeqe6Iu1zQTeYbPLN73O1/er6p/sQLmSWlIh2qj433SmAMXDn51PkX5ryFmSCCAUVNMJ9
	nJZe/cn0PUzZl0PdzXVBT+ijiSWiNaYGopYNQDy7bsqWFwiSKVIfCianwP+9nukDmHIOJLZcw0X
	X10Le/MxdaNTYwF0SMieFrCvr+mPFjoxzwgrmWRcokMNUGReTWzmRRl6aW/s+bhO3RfAKyyjwDR
	tf+eis4MtFcKSLavet8R4AYE8gfjNwLKqOz
X-Received: by 2002:a05:7300:d090:b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-36a4239cc86mr20960721eec.2.1793585364848; Sun, 01 Nov 2026
 18:09:24 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <27b58e47-723b-4d67-a1f0-ccb8b0ae66a9@kernel.dk> <20261031152846.746656-1-sashal@kernel.org>
In-Reply-To: <20261031152846.746656-1-sashal@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Nov 2026 03:09:10 +0100
X-Gm-Features: AclHuK9ySQ6mOkAgL_UJrSzXhdUVu9i8QnIVYFXWb_u0s7kLFxls3StjHm71adg
Message-ID: <CANiq72=jdQdNeTNoSxnMGvQ9URQ7yJjLWceYiB1ZcbpoYxj7wA@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: derive Zeroable for bindgen's opaque
 array wrappers
To: Sasha Levin <sashal@kernel.org>, =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Josef Bacik <josef@toxicpanda.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:28=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> bindgen 0.73 emits the blob of some opaque types, such as ones aligned
> to more than 4 bytes, as a `__BindgenOpaqueArray` or
> `__BindgenOpaqueArray<align>` newtype instead of a plain array. The
> newtype only derives `PartialEq`, `Eq`, `Copy`, `Clone`, `Debug` and
> `Hash`, and the `MaybeZeroable` custom derive does not reach it, so a
> struct that embeds such an opaque type is no longer `Zeroable`.
>
> `spinlock` is opaque (see rust/bindgen_parameters), and with lockdep its
> blob becomes a `__BindgenOpaqueArray8<[u8; 72]>`. Commit 71ec3c7d6db8
> ("blk-mq: quiesce a queue that joins a quiesced tag set") added a
> `spinlock_t` to `struct blk_mq_tag_set`, so an allmodconfig build with
> bindgen 0.73 now fails:
>
>   error[E0277]: the trait bound `bindings::__BindgenOpaqueArray8<[u8; 72]=
>: pin_init::Zeroable` is not satisfied
>     --> rust/kernel/block/mq/tag_set.rs:41:49
>
> Which wrappers exist depends on the bindgen version and on the opaque
> types of the configuration, so they cannot be covered by unconditional
> impls in rust/bindings/lib.rs like `__BindgenBitfieldUnit` is. Derive
> `Zeroable` for each wrapper in the generated bindings instead. The
> pattern allows for the spacing of bindgen's output when rustfmt is not
> available.
>
> Fixes: 71ec3c7d6db8 ("blk-mq: quiesce a queue that joins a quiesced tag s=
et")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

I can send this to Linus in a couple days, unless Andreas shouts or
Jens prefer to take it through his tree for some reason (now that
v7.4-rc1 is out, it shouldn't matter).

Cc'ing Emilio as well so that he is aware that this means we are using
a regex to match the source code that `bindgen` emits, which isn't
great (fragile etc.) -- you can see the context at:

  https://lore.kernel.org/rust-for-linux/20261031152846.746656-1-sashal@ker=
nel.org/T/

Cheers,
Miguel

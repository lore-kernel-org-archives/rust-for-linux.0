Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793436405;
	b=Xj33U1ZhtdXPLli3Lz9aevfZuroyHyjE9beo59YhyX818tf9KxvmyDAx0Y6ohd93AyDS
	 e/rTXjrxQUGg+OYnw6NB3wfTyTnPlwpPVsCYmQt4symESb0fQ80kjRULcNA3AZnUg+dIN
	 UF2WiEN5geoJuGbCrG4MCSmpqorh962ba/dZ8sZ3+kYBaOefEDtVuFwUQcXBVqpxgB13r
	 za5ANvVIHwIikSIYsTy8NE1rbPMfcRnRuZvchhYw9nnpiMZS9fgMTnejYe34N5lulgSaA
	 4ekreYOHx5FlCiFN2C9bbtlSpSeKuH4Uj8Gj25HgHlYSeLB/C/DPnkjKHYr4ZBxCfWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793436405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:Content-Type:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ADFJourLj++R5GH+t9pIXonKOLiFA6JXJ+zYJJ9JLn8=;
	b=I9ZaAzyUtUJ04tMYNxl1sxQVcAacqnpx9bE5jMt1wVfs56+cPRlgichUqzYK/JVOTI8M
	 xjq88GpPtEsMd6WAmYpLNfHqaZrRtkdSB81RrBGTDpBIFyz5wHqKkqMAybvskI8ql0TWK
	 Sdv2+HNFJAjmQVy5QK9K2yG/HDPXQOAeHakavY0Ln+yxjrTzgLImwB7xYrBlMmCHNt+bD
	 /xPZJZfmZFzJTM9U1wzoU6IZasU289pqjguLRnBjbqXGd4cKA7Y6jvF7NRwd0LYJR2go3
	 FYDa+gLsXBMhXvhpjZsXZrG98K1UZ9OCqWEiMrwO+NT5RAbIe18pKSR4WEvU8NUZyYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oOJ62FCQ;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03E1606A31C
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 08:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F03E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oOJ62FCQ
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c1c8so5758195ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 01:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793436404; x=1794041204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ADFJourLj++R5GH+t9pIXonKOLiFA6JXJ+zYJJ9JLn8=;
        b=oOJ62FCQ2LNaqHJK4k6l2uTtYPCA2hD0PEmRn3vdYi+Bo2hnnqDBvJw4z6fEVaOauK
         EUnyNf8Cc2OIuzJOqX70/vOLgHR6YunD40orkxbhK7UNFIMMjL6h+qhKSenSxjKqldbI
         LQh+FAS8m2gaUtaaYfn3CTpCXSry1bo0LnmuaNogaBgT7D4KIMbKNcZQZf3L95j/YHIl
         7/3iIR+Ee9ZymPwZRPT9pjrVxYlwcq1ZoM/HlutTVoKVFun2S7ezykfiFEXUk7qaDZgZ
         2IIz8Ti/yhWyDCwq35CpW5fedNk54hkQujwwnyQKQ8iHS/4n7vxlsn9coOlxk5F+xWFI
         FDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793436404; x=1794041204;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADFJourLj++R5GH+t9pIXonKOLiFA6JXJ+zYJJ9JLn8=;
        b=RjG+0iEbyJ7mFRx0dSu0MWlRQEYCAZGBrbfTSsZ2LWwTeF9fN3BIbTZNxw7oXvpFe/
         yYyvTMRxorLR8lqlBQSsJ6TPJhCKBxZwGQeEooZ+W+XYhIObJF7HELAHexa9eLSWctG+
         4E6Kg6019JLHNJ3iJOV/1uyWJIcC+0f/DbU3S61xi1d8UruqWtikT6L1h9lesVM4hvOH
         kBYs48qgonkwbXHIILbh5J2EttbqIxu/bEhPEeHbHmbW+GXsbMuL0+qQC3SIminsa3Fm
         ktsBwGmlrWDqiQESjpUyDrzT6wxyp0pGUPImsXfEbavR6aves80D/jkZ01DrzAGS8c1j
         QgPA==
X-Gm-Message-State: AFq9FYIGFiEe1TivsuuvpyQFn2bmm4nyKbK41a28MAghuLY8Ofts3ssu
	/XNEX20ixknVlh4mKJCb3Y2IeS+sf3oBazitQFci9Kk9ZqNEtbUGjd4=
X-Gm-Gg: AYBFou3Ff4s/cfFCrTmngX8mehmAn6GaKBc8ITmJ7B7diYcwmHRYEpS9lAm5EgqUTs4
	5bhTdGse+sy3Iyjjqgx9f06lyrgdUz4Fwu/d/Ghl+5RW7uNvp59ByqsYH+ywCt69RXEmpLolNi9
	yyf+vRNZIWP6SMzgjj3Bm5dr49nrYXiXTNM7XR8I4sLkxUgnQ6sfVyLqYPmFmb2aW0vCxqrvnfL
	0XC1aoHDhw26OVxOf/XTguelr7AkfdbP0L/mPdP2PxDvM6QlEcyiCiT66d5TugfJluLJ5uBVMCe
	MBct5sDAxNLigWIEdavEX+qNSu6XMBUW7AK8taBM+XusMfiyFgeToM1JDXbn0QhbBOKQ8aeYhHh
	iYArFgof4NeMPS7cCgSA106vzi9wjgKJSeC+K3zNMROAXPWFHvgsp+Au7Cg+qnXzS09788zUfCa
	9SifSS+c1I/n/KAHgtOJFuOGBClFdPcWUIJ2lDBVrV5ZHhxbzXpUtUqrJ9yxwlNwwpRTc95iRx0
	XoX9/Rnhn3gq/cuh2os5uDhquQcMgyZrOuR5g5mqNiXVc2e9joH37odB5JMSP82vlBRfaMY0GUc
	b5yJq2Omh0L67gpsLPSQElncyit9b6uYHXC11zkPAFUE4vU=
X-Received: by 2002:a17:902:da4d:b0:2ea:4c42:573c with SMTP id d9443c01a7336-2eb364823cemr42643475ad.51.1793436404146;
        Sat, 31 Oct 2026 01:46:44 -0700 (PDT)
Received: from WIN-2DEDQG69EF6.localdomain ([2a06:a005:87f:ffff::102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3927ff6bsm14261305ad.52.2026.10.31.01.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:46:42 -0700 (PDT)
From: chenhan <chenhan0017.work@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	boqun@kernel.org,
	fujita.tomonori@gmail.com,
	frederic@kernel.org,
	lyude@redhat.com,
	tglx@kernel.org,
	anna-maria@linutronix.de,
	jstultz@google.com,
	sboyd@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	miguel.ojeda.sandonis@gmail.com,
	tomo@flapping.org,
	georgeandrout13@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 2/3] rust: time: make Delta division and remainder fail
 consistently
Date: Sat, 31 Oct 2026 16:46:28 +0800
Message-Id: <20261031084628.13273-1-chenhan0017.work@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87bj8goc6x.fsf@t14s.mail-host-address-is-not-set>
References: <20261023130413.178487-1-chenhan0017.work@gmail.com> =?utf-8?q??=
 =?utf-8?q?=3Com4kxbW6RonEr7EJOnn5nizbkBZi1B662AdSPv=5FiWS7XNJXuPCDAsOeWG0SM?=
 =?utf-8?q?SeK7XqoTrwOPzwMC1jS2nKknXQ=3D=3D=40protonmail=2Einternalid=3E?=
 <20261023130413.178487-3-chenhan0017.work@gmail.com>
 <87bj8goc6x.fsf@t14s.mail-host-address-is-not-set>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andreas,=0D
=0D
Thanks for asking. I should have distinguished the non-zero-divisor=0D
requirement from the MIN/-1 check in those comments.=0D
=0D
> Why change the safety comment here? If the function is always safe to=0D
> call, the exclusion is not relevant. Was the old comment wrong?=0D
=0D
The old "regardless of the input values" statement is too broad. In the=0D
generic 32-bit implementation, div64_s64() goes through div64_u64() and=0D
div_u64_rem() to do_div(). The latter contains C division and remainder=0D
operations which require a non-zero divisor. The kernel's=0D
-fno-strict-overflow does not define division by zero. An architecture's=0D
divide-by-zero handling therefore does not establish that the C call is=0D
safe for every input across implementations.=0D
=0D
The zero-divisor check above the call supplies that precondition. I have=0D
updated the local comments for the next revision to cite that check=0D
explicitly, without grouping it with MIN/-1. For the division call:=0D
=0D
    // SAFETY: `rhs.value` is non-zero due to the check above.=0D
=0D
The MIN/-1 check preserves Rust's panic semantics; the generic=0D
32-bit helpers use unsigned magnitude division and wrapping sign=0D
arithmetic, so I should not present its rejection as a necessary safety=0D
precondition of those implementations.=0D
=0D
> Again, was the old safety comment wrong?=0D
=0D
The old pointer explanation was correct: the local rem supplies valid=0D
storage for the output. I expanded it to make the validity, alignment=0D
and writability of &mut rem explicit. The signed remainder helper also=0D
reaches the division path above, so the comment should explain both=0D
the non-zero divisor, established by the check, and the valid output=0D
pointer. The updated comments keep these separate from the MIN/-1=0D
behavior check; both runtime checks are unchanged.=0D
=0D
I have made the corresponding comment changes in the math helpers in=0D
patch 3 as well, so the explanation remains consistent after extraction.=0D
=0D
> Once kunit supports the `#[should_panic]` attribute, we can assert the=0D
> behavior on all platforms.=0D
=0D
Agreed; that would let us keep these panic cases as in-tree regression=0D
tests when the support is available.=0D
=0D
Best regards,=0D
chenhan=0D

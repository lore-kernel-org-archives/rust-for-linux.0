Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC0733B964
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761057592; cv=none; b=tQC3pL+0bTsXjzGKHnWNawVE+/TL+lJr7KBHzvArbjUVbZglvV/tl8hyLpP0+///rxkKqFOSBe3qTXzrDzg14+RyCMbEyoxUiatxvSPmPIfQEHMVyhTbgcBFUrcx8RqY825rPWJWtS0WAGOI7f3DKIIXPkIpULJ/C83w9LvvwHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761057592; c=relaxed/simple;
	bh=AF0MYSRO7xir5V+2SJ3IRYQ9BPELsaow//THttJ29N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyLqWDmkCGyiZWpZwaofgmWQnHavJVm4EQln7KzLvbUXMzC1gECh1RkhtSkTTKtWysn1fUAWsREjoAI1guDoqsoCOSDYkaSGHg8yIKTVGpyiuTNY/NzzXKgQPV9NIctQZxH6B/mz3LBpKJLc3YcqMtfqVoaHxKr+Ik/hjArZ6q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkZw5XuY; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkZw5XuY"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-781257bd4e2so547462b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761057590; x=1761662390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AF0MYSRO7xir5V+2SJ3IRYQ9BPELsaow//THttJ29N8=;
        b=YkZw5XuYQ2/vufj94Av+7xiwm8K67g7X1Tl6eEX2dauQKufAYP4Iv96GOwVKe3vxGC
         8wT+80NbIb0t+4+0ULmRrR13mOsuFIAQrD2O3KyCoEAkVvbL1VfeJ3v/icEP/X0dm40W
         cD2CQHJo3pd+Zll+lEaMJzA27Ry/lW+oKw9uxOay2gHlO+WrOOF616G8KR44S60IcuJW
         5aj4M/5l3oFiebWd3N1Q1dLPXI8K2j6d+o1j2MK6RkvH+MBiz0nOdh87kyXpDZ9xicXF
         L0GKmm6KEdrrK0Rq5Y4MEOSnc+uBOIxKh/e6Jo1iSjb8R3pTEDdr3tyU3URhW8YvFm9o
         1LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761057590; x=1761662390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AF0MYSRO7xir5V+2SJ3IRYQ9BPELsaow//THttJ29N8=;
        b=Tka4HjvIMq2r6H26yTJamPVrsgN/pl1HI4ewslMmwXuPcdHVRmDZiEHGTqGf3cAdX1
         eCkLQif9HRHmVFx4fXZq1mRAbsMOHdU77AhuoP2gY7F7e6bdOhUG6gIzOApxRbLVZ7SI
         tq7tt8kHuEEAJK7cdh/Ao0OkxbEP76RdvtgVFNPXosQ1RWJPrTI4Jr+INCfAffH3PMno
         QS4JT9UBAzPIvsrQkNhK2u3fyKkrUlfCU0KSqFLVOBFhoNQndGwyX19d9ZYcMLxaOdoB
         7mDAg6sBoihDbAWaLoFADHWRGVbwIEOQi7i84ataCTISR/AyDalzeRie4hFwnykUQV7i
         vjOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpyRtT8ojEZrtqvxi+4cMtvAsTOYfHsiPv38LPv60YBKLhEEuyr7ISerusbp1cZPmjwoAYj8XUcATWNCZ0ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX5GiKWUCW0kTNCWmUFRT8KZz4IRWN1vsSL8aYqqgIcFwqI49+
	JKeNMAL+mkfZUijPByLNkRa4BuMFZDEK60XcuG83EnbavxB22HgNmgDparZpNHDPzjvDZ/0H7m2
	arg+c9o5svCWB7b0ez259meoajFedCks=
X-Gm-Gg: ASbGncsZWcmfmodPh9ggSEzBDZtqj2u4xUItKfmkQKVevYsx7+tgxAJH15svEZ2Krhy
	2G+rbwZvr/sDlxGkOqRo2/QILpE296S2Sy1tSk2dlD5ggDVO2kkUpq6Nkwu45z6zMgpCzu7rxaA
	OTdPyziciytS7L2591rBdOhw3iy6kzgp568z9akL2BKuWEp5dC0+gl2mD0IbBBSgN3m4a5HcEyC
	ykZzxLXbPyB8DTLToKqvCW0hnKZcA0g4xQOiahuSYjra5BiDymvmTPm4ewISfMCZpr526O2oaDj
	rk4Rx4LssKkzgsO1VAGi+EO+hnxyZvuaqEDrJon62q1wWt7cB28Vm70y65jm8Uvzg8qpeIO42R/
	yslc=
X-Google-Smtp-Source: AGHT+IFYHUluW54cUyhVulkbdkNZXZcDhPPHb7nZCkyHBnuovoADLLoGyusmRAq0qT9arioxt5XtO9ouHB3a6Feskkc=
X-Received: by 2002:a17:903:2a8d:b0:27e:eee6:6df2 with SMTP id
 d9443c01a7336-292d3fb7f47mr22829165ad.7.1761057590537; Tue, 21 Oct 2025
 07:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021071146.2357069-1-fujita.tomonori@gmail.com>
 <20251021071146.2357069-2-fujita.tomonori@gmail.com> <DDNZL452A8JR.K1AA7LHZEXW8@kernel.org>
In-Reply-To: <DDNZL452A8JR.K1AA7LHZEXW8@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Oct 2025 16:39:37 +0200
X-Gm-Features: AS18NWCeaZrSN8h8sg6KXRqo4acP85HkWOrqgIecvvyChp-G1McnQ_eQXJMkkg8
Message-ID: <CANiq72m+uAWyRf6y6vAKjCQnwsMqVVGQx3VrHW1yAp4a-5eWew@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: add udelay() function
To: Danilo Krummrich <dakr@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com, 
	daniel.almeida@collabora.com, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 2:08=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> However, if we want to consider it an error if an out of range value is g=
iven,
> we should just return a Result. (A simple out of range condition, that ca=
n be
> handled by the user easily shouldn't result into a potential WARN()).

I think most callers that will hit this are just buggy, and C is EB
(or worse, UB) as well here, so `Result` isn't great.

I agree that a compile-time one is best, since many (most?) cases will
be constants anyway, so we should definitely have that and avoid
calling the runtime one as much as possible.

Now, for runtime values, since random drivers will call this with
possibly computed values based on who knows what, a warn once may be
too much. A debug assert instead would be less risky if it makes
people more comfortable.

Cheers,
Miguel

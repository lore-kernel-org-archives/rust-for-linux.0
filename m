Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB936B059
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 22:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181427; cv=pass; b=nZExNmBNLczkUqYHz+SR9O60iph344hz9Irv+JjBaSuS4/G06sUV3Vt2iDq8NBBXvGOW48S/7RIJexMRRMw7A6BlxALbURrnYHQWjjNx7S3nuumOrmQ1dLwSNwG0BYrURLTZs27//k0P+o0UWnV9ERzCHo9FORXxRSgN86su98w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181427; c=relaxed/simple;
	bh=IR5XIOr9M9c90XbmdG+R4d7wCxP63FgIKJD/Jqm34yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwuIk1Lj/vsX9yqiD+u4YEE2KE1EtUNohwEvjcHifox6VgFMOhY90YQqmgLkLzq5XkE4NFoulFrtt5jjftUlQXduMJzA3/3SF+MeYnru4sCtXu9kaJJIDV/hDq0kadz7vN+jWu8X3DZt/vh0pVtFZWVk4Ym+SqWXgn0wjSn6Uyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFTw/OP5; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFTw/OP5"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2be2ce5b538so753795eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 15:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773181426; cv=none;
        d=google.com; s=arc-20240605;
        b=OPWdzXh754TX5TiJcHIzWcd+S2KKIeOT7gaBNUQQj/mRIQTEEG+5K56dGLylspt910
         gmgnre3e8dSe90h8icw7auZzjzMezF8qBPZpHq1AKaMx9tt7bTdORQr3CPtSgOQY5EVa
         QzqeS3orKqbsQgU59zLUURG4t6hgo6ySlbFOB3UqjRsbyhysvFzRJg4Tn5q3vv6XSHLC
         NwW3fLyrZRQU1lPjUXj01yoHLYQQxvvQkT07re3xSQgWaMi9bNDT8n/WHbJE7csa5+Kl
         8m0Mg6HgZGgWgCN25NQ3yVAMnUQNmo69Z/VBOUcsqD5JEd0b7sc2EYWDbK5qzc6KjwsL
         oe+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IR5XIOr9M9c90XbmdG+R4d7wCxP63FgIKJD/Jqm34yc=;
        fh=nl06L01jGAhfkrii24vgFlpkbvo2CHI+kL9vp93P3s4=;
        b=Qh/TvWpjMZj8GhXoUDcotUbEXi1CwTaf41sNV2H3iDldPeHvkRGs3nvJqD7IUV1qaJ
         jrXkM0/kJRQrCJaBo0e2fWZPfzpBDJW4+1vJfMf4CsGOYMloYAXOjrH0/4iL4z8Y82n8
         36wAimFIxhHB5AWS0Jzlsy6A8gsFeJomXitJPMXb35L8vI1lUE5Nn2IxsqHQMNvA5kju
         x8kjt2D3I2HAMNswcAbEpaxRyUena/EypWRkcibQ60A1n/6ow4ADckG1KxEy/pb4Gmai
         9Vi6EbbqmtjWksoVxsiPTesyqqQWipVMUKAqiCd/Or2i+5X0ezx3hhCv+ZknpebbgdMt
         B+Sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773181426; x=1773786226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IR5XIOr9M9c90XbmdG+R4d7wCxP63FgIKJD/Jqm34yc=;
        b=SFTw/OP56xRBVD41Vu1OWmm4IiuYFqShGVaFZev4Z52MHcg9vNWJbZ2b6zyjxQ0E12
         WsMA3Qdw82DHG+X6NVv2+avgmGPUiputUPmV7DFceUIaiVzB1hLWKu/hz4K51Pb+Sb/Z
         NAkvdzr+mv6SYYlPGlspRRaetcvZt9DbdTKE0b1cCPtHRWpdWRxNo9hykjZYdfMs26B3
         VtuQonrOL6b25q8ZeUEgd17GNBvXpE2Wiz5od6LDZlVswZt5PPdmEN+tcGJJvrJ9EjTC
         Kmzrzro7r+WBD0KxWbsdG31TzeL8FOuZoBD6cU6Z82q8Ul4w6d1s/Xywl3eW7iRnEeZm
         WFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773181426; x=1773786226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IR5XIOr9M9c90XbmdG+R4d7wCxP63FgIKJD/Jqm34yc=;
        b=V27My8Ke4Wh/bULzwnYNu16h0bpCUpKbCOOnX6W/ho/qSCxvKeeb25iRrYNFsDtgIE
         pjPKWgzCFLMxPyyKSYEXEGNFBIdXP/fh8wfwAZJDnx5qo3so97BKh/DKn7SBMSGJf8S6
         yqJj8knlx00gXiU4SfAlX78g6MdaX8AjXMvAFeqs1d9OPpLghvUN9LdsMW5hhduZNYJL
         3OYzylMyltKeOosQXlhFwxiAsdmhm8tdXJIEYeHx/HRwWl+eLgPitZwjsI+AcEfjqh79
         snbBEeCZnEi0OUBD3E+vVHDdela7UvPjSBpv9mTBTIl6lfbIrdhAGk18oeQdGkHQ6mpw
         XasQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzCIoLe/Y01mpjhxoP5K62s4L12XMjpNtJaW3AThGbB/nys2jSLK90zw5LNgmRnyqLS1J6OzdEEyY+znS5ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMs2eDFyjEReaXJc6BxxWov67DUAgF3+It+A6HgP16+wbC3aIs
	seHP5uB8UKqBxvxVdW+xHPJbsZiRBbhdrGegZUl0DrjknpVoZNeDXkY8cU5383zL+xPfUYniyOm
	bcx1FfRah7IzfF/vNI3zxR3RqsZP4gi01MOzgrnaukSHw
X-Gm-Gg: ATEYQzzLpvX0B4kt3A+WhAu2J1Ai3ALsg2lhtiOpRjS/bc9qM4HSOpX2xAyHwXnmPRP
	Rcc8HkGivMlgBoOIBfHPJy1k3e5sOrV1wNgrrzcMo+RNF88J47tcuPO9ERJkcXj4oaJM84HgmGX
	QXQ4C+2XmIBSGxAcvPkF2mJGDh36SX2Ms5DhaBE/SV5R0jGiaJrW4cWKEOBUMOlbkkSeohHecFL
	JxuwB32iDu7H+SqRtQLpr/fXXTtDGSCZXOMfg907ZiN5cmmF5G8ARmCgG5TBZfLbmiteX8HCkGK
	gwnyaP2qeGUZ8/RWxfacc++lJQdGBzD2YbB3ur0roBTKn7b+5YcFkIsWYKj7Rnzf+aD9yHrnTIF
	vut7vKjp8QHm2iMSWXUJ/7Gc=
X-Received: by 2002:a05:7300:a892:b0:2bd:bc33:ca32 with SMTP id
 5a478bee46e88-2be8a2c838fmr80887eec.4.1773181425788; Tue, 10 Mar 2026
 15:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221081659.1742800-1-stijn@linux-ipv6.be>
In-Reply-To: <20251221081659.1742800-1-stijn@linux-ipv6.be>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 23:23:33 +0100
X-Gm-Features: AaiRm53_xtSabglxYfM-Zs1TX1GFZ3b6sGgxPFmT2NQjOxnjDvUk6Ps65COlorw
Message-ID: <CANiq72kfBZi7_W0=CZYinQc3ZohNiBWt_Naoqe_m+fvCj8ii+Q@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: disable GCC latent entropy plugin
To: stijn@linux-ipv6.be
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 9:17=E2=80=AFAM <stijn@linux-ipv6.be> wrote:
>
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")

Before commit f1385dc670fe ("init/Kconfig: Only block on RANDSTRUCT
for RUST") we didn't allow any GCC plugin at all, so I think this
should be instead:

Fixes: f1385dc670fe ("init/Kconfig: Only block on RANDSTRUCT for RUST")

Cheers,
Miguel

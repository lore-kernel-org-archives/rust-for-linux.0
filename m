Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AA8380FEE
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 17:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779125004; cv=pass; b=ThS6+I3FJkNm/dIwZ88KSdGV7qTC/z8WHr99GraK9HcAHl/ihjU6/+tUqd3yLq/Mtvp4GjMkqd05VV39h1syvNduD5EBVsA3BfsmFk+KWMtv5VZ4KC4uCJLy7jSMh0bBibOiSpCtuQCO4ZzywXP34tR+TV0PybYKyoFeDvwyru0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779125004; c=relaxed/simple;
	bh=5wTBnz0+i3ISL3Zyum3gqhGm+RFUqBEnuW+xR4YEt4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSrmoaqHHIZEdzA1FFdxmP9Zg8puWRB4yCoEsY6GNFQGWGI1O1klncwVjky936p08Mbj4O/CUgo+Mrhbo1Bd03jn5rJzfeLuRDx5qHcU39d/pob6PwWkLkNxh5wZBSyc4jE9vc338ow2iK7wcS6BiJC4p/qUZOam5beFjWB28sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8aHG1iw; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8aHG1iw"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f5ae07e2b5so147650eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 10:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779125002; cv=none;
        d=google.com; s=arc-20240605;
        b=GpJUMgJOSBfvaeiQGu7IkiKD9l+qGr5zByS1xsHSFYLHJu/HlePxwUAy5wRO6UVXWY
         Jjtg9V1yVS4i2laLqfpAjgjAh6yHANnRHcnOO/cmaFb7Fguek2LrZOD+bWm5sodfKkv6
         zZM5HoYe/QAfbZTHawhDVXjLPefS43OBGtTHpvoGCeAP7Q5/Wb8yVMON2czPGeo0vFa+
         bXghrRd+N5yiQAwfQ99VuY0j7sxVTS5l2hqExBfDV+q26LAc5sxR5oK6TwMD+uC+nnjo
         yRZtxVFvAUF1DQ7RmHFUkO1hA340m2+CGydVMXAVOdvsVRL+1iS99LT+1OTjemffvjeB
         FMAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w3nVsLIEE+SRnP1Ds8aDc9zMZh5tMR+zQuCIDrAAQT8=;
        fh=xi6sr/iRI3nNl4LcVAlY6NVy+qd+Lu5ZRaw2RFXKgCI=;
        b=GwLRT7cSyP/jz2MV5Iy6oahg+kbyGzxcL0ZmYF8lRl/72AYfZoeD3HZsw5nAWRl7ip
         EPKQ1gVYwaAT+XNqWuJ3ocRhf9zmWVRofcEwWwFIfi1v68mXh0s9ieNMPaR6r/yzutxN
         mnKd3/tvzIaM5QJUB1wN7o3mNaN+cXKaAw9dHIHn+Zv91AAL8H2V9Em8w5LUd3Unikwp
         baMmhKvcHsn2+W59C5KeHnX80ZNNRp9X5NTSpJWV+joARPhBX36AfYZZJ+eIrzeJy779
         hNO1E4z4a86XCjHP+EdWsA6pudyd50Ae3qX3PIgcg8Cm0Zo55Ux3WAUgZPzo7tYexeuy
         WjqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779125002; x=1779729802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3nVsLIEE+SRnP1Ds8aDc9zMZh5tMR+zQuCIDrAAQT8=;
        b=s8aHG1iwLob51otXn5ErgGuFk9XosFPwwkujxVuV3dq6p+swFPRkuPfyvxMtUKataE
         Un/6MYj3Phcz5JitIMnznpBPsYEPQuVDw5SI9CEdbUenHa+Ind872JafZfKE8LFtivvm
         TGIlrdyGL9C0KFblEgYUef7i9i2eRhwqDH9U8X7isLEpmwKfycInGNlHim75vbtcMG8t
         t/OidjoI7jt9P0SDjxDJKL/7qCYVDaWMdoP9xN3GrO2GnjDDqXu33pxDmzt8AhAe/Hsr
         0pSGTcDOKfLie5e/XGNf6TEWumsPU7NCJYAahaYTr4yH9pPo1HYngf7zOne7fj5iJ/c5
         hcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779125002; x=1779729802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w3nVsLIEE+SRnP1Ds8aDc9zMZh5tMR+zQuCIDrAAQT8=;
        b=NSw38LlxThbYR/Vws0tsfKifbP2dL/f8/uatIO+boO6eCCPYpx20PsdhZAlf6Ssw2f
         crPaU2y1xyq9je2xRAfnUkx5+9k9KJPiiKxWz8hIQnWqnxkXPo3+2p9bjcJ7UxU2mXvR
         ncuPgsHib1IKjF5YUFTaqh+WyY9X6/UbVZd11NlVRcL6ZZFjBGJrjIKJxrFK/uHAneJL
         PezKBlLSZkYhwQhTnzRh2O1ocshXFjAH+pzdQ9HacEjAws7YJQlThSwUKqvNo+8VvZ3i
         uTUnU4hYC7+bcOxAveD1MEtTaWwO6ivi5GbGr1F+uYmA8BSv6q1YDmuA/7hLxq7JXLIL
         DlzA==
X-Forwarded-Encrypted: i=1; AFNElJ9aDgPgGwRNo4xS4AwvIxO2OiERX1Y4QEeR14aSk/lm92uAQXlNjtrH2OAz4jYhmejl+va+85UiaG8W404b/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YytNnHbh12dpOiu0i+P1FtcEcLr1BNWLqmq0UvXqiAeIM5N/Njj
	ipy0jY5ld3dWnYV9eoO1iARBeCRbzXIq6aAPRfZqPSJJMi/a9UGh14iRBY1KVsmobHpEYsJI06X
	GCkhC76KOXYHUlevnOkiNZD/zeHLDeaU=
X-Gm-Gg: Acq92OHL1/RXR6LWlrLriN6vtI6mxpAw7TUB0KTHIy0G1rF8dzmrdr7y+3p/EHPVvwK
	OaC8k8nAVdkRnNa8lKW87UMSQh2RhMw1a5/GXJSemTn9p5Td0DqkHSQ7gHRPEv8rzz4P1RuUY0C
	CUddSH7m7eNxwImrjiRExla8fjgux8ERro5tKtbfS4jx44pKLS85yhgq8fCglUo6sIXLEgU4mm0
	SI5CFvtWg/ALx6HF5sYPte27LAkx/Zf1e0NSCeowNlyXh985lDj8oeGAjIJ9hIoCWOXUxbpk9vp
	N4hT8IaQ6KT1w01xpmo3i3X8c92Puww83CzsmaqlNU8JnfSoiYZ7DC6H0Eimm91YuDvrgTwABO1
	bNf4CGODI2mty7/C5Og2TjNI=
X-Received: by 2002:a05:7301:290b:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-3039870695fmr3304519eec.6.1779125002109; Mon, 18 May 2026
 10:23:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512105920.2426293-1-japo@linux.ibm.com> <20260512105920.2426293-5-japo@linux.ibm.com>
 <CANiq72=dD5fw6XmLJ=zSq_k_ZQy8sLLMs3m1xjX=UTpO7tLisw@mail.gmail.com> <agst-5rhj2mFF448@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
In-Reply-To: <agst-5rhj2mFF448@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 May 2026 19:23:09 +0200
X-Gm-Features: AVHnY4IK-M67CvLHFRzUPM6nAeo8_fnYi9ogEHZP-7Jbacygwvp1BWpmv2Vuvys
Message-ID: <CANiq72m0n4M=Yyb2=Hhrpg3EWk2-a2Q8V0Fc=0Ss50HuBO5hHw@mail.gmail.com>
Subject: Re: [PATCH 4/4] s390: enable Rust support
To: Jan Polensky <japo@linux.ibm.com>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, rostedt@goodmis.org, ardb@kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 5:19=E2=80=AFPM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> thanks for the review.

You're welcome!

> -Zpacked-stack: I=E2=80=99m not aware of a dedicated rust-lang/rust track=
ing
> issue for this flag. The implementation landed via rust-lang/rust PR
> 152432, but it doesn=E2=80=99t appear to reference a tracking issue.

Yeah, #152432 is the one I linked in our live list.

Sometimes tracking issues are missing, but I think upstream Rust is
generally OK adding them -- I have created one, tagged and linked it,
please feel free to modify it, close it, etc. if needed:

  https://github.com/rust-lang/rust/issues/156724

I hope that helps.

> minimum toolchain version / beta: as long as we pass -Zpacked-stack in
> KBUILD_RUSTFLAGS, we need a nightly compiler; beta/stable won=E2=80=99t a=
ccept -Z
> flags. In v2 I=E2=80=99ll drop the 1.97.0-nightly guess and set the minim=
um to
> 1.96.0-nightly (the first release line that includes -Zpacked-stack).
> We=E2=80=99ll keep the =E2=80=9C-nightly=E2=80=9D suffix while this remai=
ns a -Z flag. If it gets
> stabilized and nothing blocks, the earliest stable release that could
> plausibly carry it would be 1.98.

No, it is meant to work -- we use `-Z` flags (and other unstable
features) on a regular basis, as you can see in our issue #2 that I
linked above, e.g. you can see some of them with:

  git grep '\-Z' Makefile

Please see:

  https://rust-for-linux.com/unstable-features

for some more details.

That is why I was suggesting that you test the current beta, because
it will become soon 1.96. If it doesn't, then it would be wise to try
to see why it doesn't! :)

Thanks!

Cheers,
Miguel

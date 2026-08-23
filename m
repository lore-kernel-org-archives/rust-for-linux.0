Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B03374E5B
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787482255; cv=pass; b=KEXkZp5ScMx+xXUvZL9xgWVIzbT5xQ7ZgCEyMPtG1Bzq/YmWvkrX6Z6N8YuJUblysc4xwa05+ktNP0gLx4NLezOnLwwjJa/CsrauAKBWwi10+vnrPFddg7PNJgsObARy48mgTlkPdOqRHwss49bJHSEqS2ucpQBoL0+H0uHPikw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787482255; c=relaxed/simple;
	bh=8kglFWqTCwHtE9XrFU6hsXHswROaTysasuAI1AQqwzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BX2yiyoUJhsVudteQqOW0YMYVsT38xetX+KQRY2g41a/0tnp205w6k9qHvzLy0CIM595yn4Nj8vfcOO3NEwFEflZF8SHWRy3XvgZ9le1RS1+WoNml1dZ4tiCoUgZQlwk70hqGE+IrN2hnC3eQLeuJ1NHxSvsBrtw58gPUXbBVTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pR24J/Tl; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pR24J/Tl"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d5862bc921so5514605ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Aug 2026 03:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787482252; cv=none;
        d=google.com; s=arc-20260327;
        b=KMnjzvGZGGGu+6C7mtpalUKVWQNtwCVxe/KapX/t1sotwdku8BNm8JLPJ4aPoAQXnT
         ys+smCQ5QHwvqfq84ZbYzKzDpsFa5WlRjC9Hxdb24Wbae1ObKaQ//JSDHToP/6xGkb8R
         /nnoaCF9DXC5L095F1KPErgBImv35rJrrKxPkJDSlXycwuIwR6gWpITwELk2FXb3GN5t
         cqSljQAdS9zjxbw1/QWU2+J6DVE1y3ZjHMJDqQONE3Fcq/3yEL+kY92cwYjcKpPf07Je
         uzUsuEMoyWR8MPlgikrJYCQTdTGQEhwOia2j9/euoomH1O9CdPwQffgcS2FsRbA9j46f
         AvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8kglFWqTCwHtE9XrFU6hsXHswROaTysasuAI1AQqwzA=;
        fh=fE/U7dT7EkDVndiedGKS0UyS3dr+US1yEbuLr2Zcmts=;
        b=pDlrHyla5vp19VHg7BxWMynNq7Qc/qBTUl1GbJzr2qUhxUoRj0S28orbBoWSZbm7z5
         gpkL+6sN+9DflhRRl5V6Q9L9kwvsu4zckLZ/C3DRKasmcuiXsMEENXovEvRZNLTqHDL2
         vFKbm29fsxa/ctAfycfkJqMQYGSaz2TjQZ6L4oCCO1lPI4iBFLWVrrEKGSger9DTBN74
         1NGAxw0OMmn6Z/738XkOEOuBO09wy1dycvdip3RUujXjsKEeqG1MY+DR0foZfpzwyUcH
         FVauIqo3YUhiKRr1uTUBTZWCYx6XldVE6ooJp3zSK0QORl9B+FkRE/pCAnWfKzV73w1L
         qomQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787482252; x=1788087052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8kglFWqTCwHtE9XrFU6hsXHswROaTysasuAI1AQqwzA=;
        b=pR24J/TlYUjxGBCt7rWgY4YDRb9RbnNX4F6ZfQolxvk5VDmndiGEcWTTTPhP1fJlpj
         /mdgfOONgDCHqyDm0yR8bWjPLQ4hdmrlrQ2TkmvGsOPB/aQtgeVxlyaaw3ZNuqxC/UjH
         Z37e211/Xfg/drIXMZmIDLz7bNd8U1bvqvQLHgBEVsgFAqV0zd+HXcl2zO+Vf5IK9j1f
         RvJPE5m3XzdpxafDYTIRhUA4M7aqOq3F2XVU5KdN9DLCr7xHP0gZeu7j2//hN1gObZb8
         AYE+pq+WH10qhehdXc0zr2RFmSZz1HPlxwMsdVbJOQr/v+yFwOL9TN4d3Q1+HVfKHy3x
         f3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787482252; x=1788087052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8kglFWqTCwHtE9XrFU6hsXHswROaTysasuAI1AQqwzA=;
        b=Idwig/3f2ICf/iwS6XRcGtihSZM1kzzpxV31zYI6vf7dldVoH/drBYsBz8dDuxrt8O
         wESgQ99jqbVgtUyvtoNNfpni/b1dza4Z0/e8TlhkQSYYhN2A9KIaRsslORtk6v1Ndmg1
         M5nI604MKDHwHasRZDGxWuQ/P+erqCHcjblcPiIqIPEbfOdIPzL+7X8PinooO6cJNQS6
         GovlftkpKidIG28Imwa0jcS2qAEmyPG9UqFDxiwncPcxIQEzNAHeUfHZECUBS3lRzAVy
         DrEPUYPYOPK/B8lMqMG8HqK7ge2KZsFA81KeOd0fIgAM3igPPfiDBfYbyHKupylxmKY9
         m8XA==
X-Gm-Message-State: AFuF++mzH0eN93vRgFUMaO0uV7g/rocxqvxk3T5VU5abjeNgTE/mte8l
	GeSJk7LgNykzIJbMKPmB6aSYhzO58gXlnfR085qwmnn+UrFJjGgtLFA963DDEZOH6cMa1BY+yhv
	OYU48Du7cGAEvXwHfcnH/CovGd2IWzGk=
X-Gm-Gg: AR+sD13yO4en2RFmSzoElB701dhCT8H6Z30RnIxAndrWbLv0MdhmmTFCsLaUZrwq4FZ
	qnSeXs+XUj4G2NdqvNuUXYGTHB1uBhXS+PVU2uFmy7wgTyY72rAIl5fQyTwNDb/X68+Q6sRnw/Q
	VaHNOgVGDCOQhEKxSs4fnHyu9PbnPr4wvqec/XiqGBjBDHToKyncEo+wvoru8A5VyQlsCYoEoD7
	JiqLfgA3Dz8j9uanb+A27/WjWT3KNxT0sud1J+hWaeMlEoxB74ohSMW2ddJl9jExRt4G3kxJsPM
	G8R1/ZfSStC8Tz97tfVcewX9FEmEjpRfBcGcRFm6y/ai61vrT5WYgkMjZIDm1llmirKpLuHp9Xc
	k5WINz6vRq21uIXILcMMZbwiPSQaWMeMoJB2JkrII146m48Ct2LzqruD3jtwT
X-Received: by 2002:a17:902:ef01:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2d64aff2aa4mr169800735ad.2.1787482251737; Sun, 23 Aug 2026
 03:50:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823103644.342849-1-springbreeze@stu.pku.edu.cn>
In-Reply-To: <20260823103644.342849-1-springbreeze@stu.pku.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Aug 2026 12:50:39 +0200
X-Gm-Features: AcwNN1U32Y3hhanB8r-CtzhdGzr7wCxmADWbHO0oI_XJH4CRbLj7vuGyKQElzTQ
Message-ID: <CANiq72mUbkEcvffQV-mNLfCxGkgTqwq1qQLuWpENsUCCBAHOqw@mail.gmail.com>
Subject: Re: [PATCH] rust: net: phy: fix off-by-one bit positions in device
 status accessors
To: Chunfeng Song <springbreeze@stu.pku.edu.cn>
Cc: rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 12:37=E2=80=AFPM Chunfeng Song
<springbreeze@stu.pku.edu.cn> wrote:
>
> Fixes: f20fd5449ada ("rust: core abstractions for network PHY drivers")
> Link: https://www.spinics.net/lists/netdev/msg951815.html (v8 cover lette=
r, where the bitfield access was flagged as needing a fix)

I assume that this will need:

| Cc: stable@vger.kernel.org

By the way, a link to lore.kernel.org would be better.

In addition, is there a way to avoid this to begin with? e.g. why are
hardcoded literals used?

Thanks!

Cheers,
Miguel

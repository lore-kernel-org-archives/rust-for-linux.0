Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B6F40F72F
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 20:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786653893; cv=pass; b=k3hEJKKJ8litkrrLoDMcBp4cJzyoPxk4Vsg/r+Bn+7rmxL3GdB9Jh8WNRFqAMNkl050pJwNaA+7duS5ZkAef7HgGzhJQdBwUbjE/AaRrmVraCe+M6zkp5MS1WWStc5k35u7hs8qX93eb6KkXBKdk7XkswqpZwBG2la8gqYjSKTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786653893; c=relaxed/simple;
	bh=3ANOmIVZKjiNfsRjizM/w0WPDLd3yj70EpTnZ8I9xfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gzdp6Ww2+of07sVduDxL8w8o/sLfc+VFUMTFugJN9L5EPxDHE+2MV7//Isiloghte1SXUTBVOyoilXmhxDSkCrlCH2k1hGJZYvh4wn/mY93KI5qaMohRgIMmoRogW8/aeYR8QXMRP+KUiO+xTJskgxqgvT/T7IyHB8GQ/QGi9kE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvA7cunf; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvA7cunf"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cffd93cdedso471085ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 13:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786653891; cv=none;
        d=google.com; s=arc-20260327;
        b=mMmnWExkVNL3LjSPeAHNbLPsyUVfOyPIgtaicLVyj3DXY21TG08+3c+iOiJqXti4r1
         XTn0uxem1NvDh0NJuhW740hNnv1glO4za4BWHrwNV+WcHAMTznKxAo3AiGPM2KsMF6RO
         H9ex0N0IgYG60xjQccmtk8ARKK4Q33lSVnzBmPW1hyfGNZiPxhJCuhksmIxKOF1NFS/N
         TfvZxZ71Vr0UnWkpEzZvuhxq6vLpeuHrI4q+th5xg8y4CddmYZy2KAqymsubwmectpMN
         wg/YyzBUuYJ8lPV/kW938GsyqB4kXWkhlEDAFxFAlcKMGBWiCQaKNxyKgzvENe0DoPsU
         PDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3ANOmIVZKjiNfsRjizM/w0WPDLd3yj70EpTnZ8I9xfs=;
        fh=gj52+X4Xtih51ZgEST9CRpIRSqJUwAiRhsm1fmAd2RY=;
        b=Iz2sC0U1Oywi+SHfVsdJkzWhLUSXasZO7qvjERnXDxPacVV4VW9mmD1uIDmOlnba6p
         TzXysVQGj/crHuyiWYqOPLrJldA4HLXfI/+ccooT8ySzzjwXsMHY1ZEriBYXfOC1aHYa
         tshv52fRxkxkoCWT070HImQzFhL1pRGRonjHc7J9X/mQet0V6KSkaHwzfju1fLoeXW+x
         0KM4g4Yli4trVrNPW0rElm+U7aq+W79cj3ZL8vYb148QCe6JpwOXMlYBo5Xb6fSwJns6
         vdnzEbypFrL/adJ5brnVt9EK+kOn0W9/ZqdHZ8fUDSJ2/Coa+clHoWR/oOQBEktktCLY
         S63Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786653891; x=1787258691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ANOmIVZKjiNfsRjizM/w0WPDLd3yj70EpTnZ8I9xfs=;
        b=JvA7cunfLAe24ywppxXm1Oq7Rv8Qohg8ZgSLgjGRuvzLUGTOH99qS8KS/KwnNnHfgr
         8GwAhBSJJ0i17SBF/QqSMR9RfGF4mk2xpZ1y6SOvHCUoys9l7bypvDbkkp5+aT0luWUj
         Mi+lnPj9Hotf5tBAQc12A9c6AC9fjiodBTIeRWSLwBoIjKl84G3GmfE/R/qAknQEMdFg
         L+s1eyjDkLpnXpsyBE0Csqfuud4139lTJVUaZcsnuDXMfj1JJqiBkYKmXu8mNSoQQhMb
         e+fZs9WOPGGk/vn0Nb4JOus/+Qwfm5EZDSG3u0ztgO3msO38en8Hl7gRqpt02QhzRXm5
         xHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786653891; x=1787258691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ANOmIVZKjiNfsRjizM/w0WPDLd3yj70EpTnZ8I9xfs=;
        b=kWExCUDU8krgkUJsWQsvcexKYoSYzGOb9eS2LOZAIIrFeAejQCzwGE4kkLF9GA9/MY
         wt3wYQMuPxvkhDS6ANG6kEhG3B0CX/YcNtsa0XRESOV++46k45yf5ixhoSaGctxTUhMb
         YnJWN5DugTsUrBYBBOL8k0MyGhhEGi8dhxo3zkJER5BvqwxxHlVAPHXI9ChJk5XZ6Hh2
         p/bzq/FmO3fIK2C3cD4jz8m0C5S+1YJgff+cV/baDftbTICxbjSwZN9yJad2sTAI3RLd
         r5mwsI/ezGTEEQ6Z8GiSRrMdYj02u9+IY5lfVq32fF7T/rF6KFz0LMJrXmvoO75iHk9n
         GT7g==
X-Gm-Message-State: AOJu0YxylczslvZMPY+rLOgdtJ+mTgpyKgeulspKnbnJGTYbpkg/GeJq
	302uYHLvKN/or0dHAjJk32W8KtZrg5wh8XmcwnYgxprMal1QTH11wTi08xFyXpu2lVRFwOPVN1r
	dPn6AyoUJ96WFjxOrSexQTY2QMlXgg30E3WLP7kM=
X-Gm-Gg: AR+sD13j5idGKLfA2Km+IDmlDNHtRP3vcab+sO1jh1mA/71hSKP/SbKHBAwamBHdLtZ
	UXzuyInyBnUD1W3h8RgjBRODOKUmapBdjzay4rtI8gbk1UIaCriFmrVtkPWoYNk0SDUv4WTxZyo
	FI1HmMGI63dhktBR7nL6HJQHNtqTc7MIDTHqW855EHEZBgyLc3xEvrMmB/r3TY9rF0sRAokS1mv
	MPWKS/q545t85HgvRKFnL8cOCQkf51cqkqQaku0uyKjpEYT5Bv8dvH441uz2AIWl+wvStbYVSPz
	CNLPqfhHLIxOqeGwUABFaA0YbqfR9OST6RiJTwwARTC32PXvK2B/7JjPU9flcEoAfhOmlFr/Cay
	BXrYQg13PwUKNQ2Jvmdzx77s3uVlgQk2yypPjRUKnbC4rW/BEhCBQOtkTgcCk
X-Received: by 2002:a17:902:c944:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d3b04fdcb2mr6960695ad.0.1786653891214; Thu, 13 Aug 2026
 13:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG4rwVS1PCyBi7=rv_2OCLE1PvjyD-ng5=vsGcTyG_=wQfR0yA@mail.gmail.com>
In-Reply-To: <CAG4rwVS1PCyBi7=rv_2OCLE1PvjyD-ng5=vsGcTyG_=wQfR0yA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 22:44:38 +0200
X-Gm-Features: AUfX_mxKF4WPX9RWD6CMyzs0kZyLZNVxHyWv5e5T8linwnIuz4ynKOMoUX52pIA
Message-ID: <CANiq72n6XAw2Y=uwOziP-vFi24MZ7C7+-2Wut1U23cMaj6Z--A@mail.gmail.com>
Subject: Re: Heads-up: Fixing rust packaging in Proxmox kernel
To: Krzysztof Hajdamowicz <krzysztof@hajdamowicz.info>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 7:28=E2=80=AFPM Krzysztof Hajdamowicz
<krzysztof@hajdamowicz.info> wrote:
>
> I was informed by Kent Overstreet that there are some talks about
> providing a unified build target for Linux kernels.

Yeah, I think it is time to provide it from upstream, assuming it
simplifies things for distributions etc., especially in the future
when we start e.g. emitting more `.rmeta`s.

It may also give us more flexibility in the future if we need to
change things in the build system.

Do you think it is better to error out if you try to call it for a
configuration that disables Rust, or to let it be a no-op? The latter
may be nicer, but it does mean mistakes may be silent.

Thanks!

Cheers,
Miguel

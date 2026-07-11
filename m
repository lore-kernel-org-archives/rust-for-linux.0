Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FC026ACC
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 22:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783809668; cv=pass; b=OQlQJLhjrDEoY+mCxGp2JvoIzkJgzj9vlu9KVITOQ6ZoVIDqjZ5hT7z88b1DdqbndWDsaBykILqsOvclwCUlTitZBLg++S7sUHm4hfZF+AUYVkGvSlCbdAqyXuEe+A/UPtnj+nGUZQ/BtgAuWg/FSr/eA2+G2m2nIQ4rfKJcXDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783809668; c=relaxed/simple;
	bh=e+mkzUxBannlFNR5FDdt8VBJjX3oh34QqFwdfWoc7+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogSd7DYlyZY+5wI2ngqJblr2xLeskMtIr2jodm8rSyY73XNljeHmNZHM2thCsPViQcLALmQe0rYrHZESDo0ym5gYB5RHfizJyR8a83NU2/rUawcBGnYrXoRqoWouoLTh9IXPJ8dY3P83ryFwhiQTIsZJ3jHfCle66QR/yrA1Hlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdkx9UYW; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdkx9UYW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so47882a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 15:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783809666; cv=none;
        d=google.com; s=arc-20260327;
        b=K7ci6Pt0+ceNbdk6wM+6bzEE21FQvEneSclZjntutCbtBUDzw51hylbUlNxsednpB2
         di7FBgS9z+Ro7iCrgHvBdi23Epn1WzSeeueLJAQScOV6Oqy/mob7t0xlxIeCHF11tI3j
         z8WSYbCApluuSNM77BxYZ9xp8+LRiQgCA59QntnxF2/PqlrYymo2mx+qGu/q0Dtpz9cK
         vJ/Fatcj/WYh/QAzHt2ckNoORvFwCzShUnvmI9n4P8fuF2bV/SFSQkggJeJ0UjUwGOxO
         +FXlGoaw1RQ2SyyBJLrPj4skTtHBkaaVk97G6hPpaIzKE40MrPwRJcIf4Rl26hmpDJ8O
         Fvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/t69APWaLYqRrskhhUUfQXSrEsAg16iXn0Wb9k8Ab08=;
        fh=xhUFqRb5Tq0HC2yQeml4PKQiDuy/9uuSIfBLNrZBtVc=;
        b=qfXB1IThgne8zh4jKksIyjSXI/Q42ss7kspPxHpekH56iIzbIo7m16EKsA6PoFFRrM
         M5OEhmmEUclu8s0WJm18qrtivUWj3vlZu7qIvO4HEJ4Gsvz+Y93PbhIrkHRttmOHIKrv
         045vPH7jzESdI5ATDLj+edY9uxHN9cowGN7Gah9uGyc2vAPac2H4y7qWI11ukaTJaTiP
         sGqdHKipots+crahkNfdHEt8v6wbgLX1HD4XKLvOswZ/+1JSyMWwPxkXWaQS9bTcc9mn
         rKAMMnZOgiNM241XuWPUz7RH1ESTnlccHgTqvVAmVGn3uURYXRuWJZBVKisbIYObPepH
         bsfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783809666; x=1784414466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/t69APWaLYqRrskhhUUfQXSrEsAg16iXn0Wb9k8Ab08=;
        b=gdkx9UYW6KnA0ChVLmciGRA/FUIylu4l2jNaQoKtWKZm8WdVB+KoAnDI/wfT2/xv/A
         WDtHco5+H/tTJLBTpe+HGEI6bdr+d3KglnqFDt2SVZmfG01T/XyEImIGvzm8JDgcxIeO
         AxzFt4mRbhpNwo06ujhdYJiDeIlB1gqXEnGmivyqa5ReiR6aUg2lkgPp0umsTQymrxca
         HtQqbZUJnKp9zUho+MlafLiTknMbcFo2t2dWjk3d85fiEadKCUx4bwwrHAhug/Q7FtYO
         TmVQ20wK4qrWRG44C6HsstvOkwC37BsA9XIyc3K1TIFfvzu2OI8Lt2EefZsoZ+4UbEiC
         K81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783809666; x=1784414466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/t69APWaLYqRrskhhUUfQXSrEsAg16iXn0Wb9k8Ab08=;
        b=bzRwu/Nu88cwAl/2p3SpGBcyddZoFdQMCSnWqHfD+SkvUJxkiRTGQCNT6NSH6vTAqe
         2wEwbi05aFyFumcL2BSCdFUHe+mNn2XAlHrjgktvsFNUzaaLcsB5bL552HOZ9KqAVq/x
         aC2uVYHRD0NYUjDTEwgmwYbOx0HqRvtKIx96uCMGBpUU9BR4Fffzp4QfyWfy0Hko6IqP
         dC3LD+1FBBFz+JmB5RFYxsoDsFAQJif1rXx+0bH07YXPCQ9VbvCuzTHgLQGBwuGvJ4Yl
         iTFPWFl51H0aEEjSRwTDcYX1PosoKjrigOrd1KRQqFZxHng/Ae/kEXLF+5kPMdg3o4Va
         oV4A==
X-Forwarded-Encrypted: i=1; AHgh+RrDAq/oMiuospM0vPhBV6grLjGSXzP+wAgyDTJ5g6wpye45gL1damxc2QztiqfV2DZKS+e98/AzSU1So5CEOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3NC6gcizGbpDucoRDw4rA/Uyl6tdPoFqLEPrnNppF0Wmz2ke6
	o/cww3tbyRkUjfREsQgQXX2XRqD3x8Lny9IqcTDCoIRAm9tbvyq0j899DoU+QnyZi2gPpDM1faN
	QKD1mrmulpfn+4+KWQxmJEJIcPMbNyL8sVKh237gKVA==
X-Gm-Gg: AfdE7ck0Bg9/YgwZiFzW6t/opUfJwnxM8sz8eTSOtCWITBTUQCuOixkbGy8PfssTupr
	RELX1EtMsf9CSHGvqkX7zocZLuTNkaw1sPG7nBQlWnqONDftVDwlZOtplzNJtRmbgMSrkV+5FLN
	sFCQ/1KGgIlykITtr/4fg0rzmfes3rwxJJMnubY7F1BmNIYyEGptRu479LbGNWG8JjWiSn3sdaO
	qcgtF5ZolUIGgriCOPbe+YpCPTikOundX4WJnq8ct+o2GF7vcJF8OiVhTCiiJp8kH6BaNvDNfkV
	sI0OixUZyQ+L+cyY2dMWdYCoOG8G6zdSfjWo7fBv7R+cHT/OZ3nEGIES00SKdxsj4f7xvoY7mdD
	rY4BJ8MzdOCdG
X-Received: by 2002:a17:90b:2e0b:b0:38d:90c1:2400 with SMTP id
 98e67ed59e1d1-38dc74c8082mr3173886a91.2.1783809666103; Sat, 11 Jul 2026
 15:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711210919.33619-1-alessiomaroni0@gmail.com>
In-Reply-To: <20260711210919.33619-1-alessiomaroni0@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 Jul 2026 00:40:52 +0200
X-Gm-Features: AUfX_mxJ4jqV0ael4wDgVzSuAeIvK8Xp6nArELLibGiltXM5omlKzbHmnD1DU7Q
Message-ID: <CANiq72m9iJ+usYJWnDm3unEAM3GmuwgB_7PchjeksGstfqwvKw@mail.gmail.com>
Subject: Re: [PATCH] rust: error: use pr_warn_once! in from_errno
To: alessioMaroni0 <alessiomaroni0@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, boqun@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 11:09=E2=80=AFPM alessioMaroni0
<alessiomaroni0@gmail.com> wrote:
>
> Replace crate::pr_warn! with crate::pr_warn_once! in Error::from_errno
> to prevent logging noise if an invalid errno is repeatedly passed.
> This resolves a pending TODO in the file.
>
> Signed-off-by: alessioMaroni0 <alessiomaroni0@gmail.com>

Thanks for the patch!

There were already others:

  https://lore.kernel.org/rust-for-linux/20241109-pr_once_macros-v3-3-6beb2=
4e0cac8@tuta.io/
  https://lore.kernel.org/rust-for-linux/20260226120848.82891-2-adarshdas95=
0@gmail.com/

Also, is the Signed-off-by name a "known identity"?

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

Cheers,
Miguel

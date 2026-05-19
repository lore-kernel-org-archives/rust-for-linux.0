Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F51E342CB3
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 05:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169335; cv=pass; b=sv/0c8bLX145AHrJh1WqagDlLG27yH1HbjJHSi3brBw8qR6+2GZI9xd8omG2Ps5ZzoSzq+WcQI06+9XHijs+dhgvGKid4rD4cxppEg+89XjRm/mMcjtO2kLRZIGTA0q26S/de1ogO+oBcB2R1tAP67r8+wBqcbXmU3gCLSNZJF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169335; c=relaxed/simple;
	bh=7Kwa+phWNhaeGtbgKRkRbh/woGw987ySfKGt7EPnGls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryUXV6aUmkC+BcRgTyObSkSp/dotPzFeDAyaM5pnlOm2WpLNbnlnME7BHeH99oSy29u5Ytiz4FjPsto5eybfiF5q3OMKLTYbO3lIT7Ynbiax3nTl1NxxLTkIeOmVFMLUrlYVMuYhaOW9mbboy1mbifayPkpuyaxfy/wYKNKEVAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMtTGwYD; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMtTGwYD"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f16c892babso154377eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 22:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779169333; cv=none;
        d=google.com; s=arc-20240605;
        b=YvJUPEEXLva1WfTHLYg//YhEx92qRsEaa4xMg3fMmN5gnzy1zVvxCSmcjtQi12Cbjf
         GF59Q3xc1hGwFlrtmC4a8U8Z8OynkXkm9PhIKfCDM/AKbUe2zyLJ7qXGUPCxtWwpqQP8
         JButcPgQO5p6CxPPUuKpHKCvZRxzQP6qgBmqnzIKhALDtuSJKMDJ2Wbgrt5N7mESBq0Q
         gXnFT51CopnUSk2zQIgGkuH+cb0kGyGkBtJRw0Qqcyy0lfybXMnSn5cGOl1d6LrmiKPU
         wkVPXQ26SWkKKg2Vmtj85qGM0tbDsDP0iwI4A4Km+Kl31nIFYXeCb7fjuEHStv4Ms0HR
         PLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xr5/OLKseu1vPe9rEtlUkbVGvSBOOeEqnJw/pcla+9Q=;
        fh=pASofycXAzbWp3d10CeAyDMWDaMr6P3ny/dALpAlm5g=;
        b=Du+Ys+egRtIjKVhWVuJUUrtxJoLmOTl4yJU23y/hsrDLglgGoe59EV78YodKE3FELt
         xdqOEyaKUNmusjokGdIoqdLJaxREfUXJsYPr7C/rzSzuFZqcpBS8WrmMApJzWIsStkL/
         NPASMBJA+cO3e1oguFjl0KVUrYaAIPxDtASJiaFOP6XWyKYrAYonKp1ftvpDJFL1Ww1/
         v18FU4HZCrE9LcmCtp3eJ4fviOIydHorjEAIOBr2LaSqZCFY/2mygqFLvO0fkqwvhpBL
         kXu3uoKlMj0Qlgt9F69aUORqjI7nNNqRraVYbEw6k1oS4+w168TwoLC38qZUk1VRLOjD
         l+oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169333; x=1779774133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xr5/OLKseu1vPe9rEtlUkbVGvSBOOeEqnJw/pcla+9Q=;
        b=jMtTGwYDVks4f3U4KG5Fv7MCF+hFxzBn2KSePc+wd+k6dj2a5D60ZKkRy27TEN5KDh
         7W8JId0FKjz68cpS1V7KbIJry3lRRPLFDjy3j5ChOsrj9E8ntnKSlqY5exnkr944Ixf4
         3wvbusKcPGEdYGnOlv8Y8b/hPxT+qd5pTae0pB/feYmTsCBT93D2m42WDI3VO45gUCbf
         zJF9cdf0Qz32ReuhCb+j60tSfGK1AO6Vdxpd+RA8vsyXWuIhcCpWAR2QdV29OLpZ4NtI
         onkLMyObgWxwzR5ZzDniqDKaX11u4Ak0MPqHQ95ZaqBSVRYg2xPRzFFrx1HOF2Gh+tU9
         3D8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169333; x=1779774133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xr5/OLKseu1vPe9rEtlUkbVGvSBOOeEqnJw/pcla+9Q=;
        b=KQtpqtEOZ1/1u3DU+zid/YxhlZT63YxiSl+CzWXuYb7qdBGB6kNPcV1vCDuicFY5/2
         P3ESxQjWEXH2VQKkkxZgPvXrOV27Y30ai9B4c4UmZCIH8SaVNaRyQIjjfsPCXkkszn1h
         76D9s8ggt4Z2IN7a1m+WZFuL8EWhSEhxbvJoBs8UotnBi2zeKJNqoPSbznfxMI2lxn0a
         szjylRbVq/lTaIshFhjJiPrkmPJ8FpUhQAFaHaykKwa0gfa3C8po057ioD96QN8nfj9M
         CEbMua7NbcvwxbAUnY5LwogsaXMOKI/y9XsreF9GZnb/ykOTEQzNVHy3pkW2kWGsw0z+
         c9/g==
X-Forwarded-Encrypted: i=1; AFNElJ8I+XmeNj59aIHTgP3zNYGflkbWRfQszSDSRQEUw4jImM1Z14Dr0C0T3L/XCSTqF8PrRTAMfJzLiSDvTF3lOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSr0oSpyg6UnXTkBv1+JtE6a11q4jmEVF1M/sj9fK7odOwLmGB
	1G5KDfVvx2ZAuIxxYQS4KgCSWDLmNWVn2e2llMTFdDoj5FbYd5lRro2CCfFkJTmrylllxnQk2nM
	0kqlJxsfAGzZlNgibWD7h/+0MG9QnIRQ=
X-Gm-Gg: Acq92OHIfaJ6u7G+2haIoA+D6lKgGn2f+66AH4XkBieStyIvuRNItWqv4hMpg4LE8WR
	YJNQkc0prWWSXGl5JAN9ntAag8ww7VWBdULM6aDOhbKorLKwfCy44pDDd38rYOS7B4sWa32Iho7
	6f+vO5Y4/hnC1QOHYti3WoTFZB8vsuLmKmfFkhxKjJ9uZGkOmAgV8piGYqV9PmjyTbr0drN38RZ
	uy1Hq+hsSwzzuiG/rCCr1ynfuDtGmVNeT0tnAsCqQ/CzyfzTxtJTKgDxo+JUKcuoWfJGT89UqjS
	HdM74nRcSS/l3ucjDIfG1DWYmPk7vRAY0aWq9uIMzwbL0abEU0CVxEvvzoC+UUQoImLIdbDEGAW
	QHotOMKPFd/AHT4r8zQklnew=
X-Received: by 2002:a05:7301:6785:b0:2f3:3835:2010 with SMTP id
 5a478bee46e88-3039870650cmr4097949eec.6.1779169333392; Mon, 18 May 2026
 22:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518230125.476165-1-ritvikfoss@gmail.com> <20260518230125.476165-3-ritvikfoss@gmail.com>
In-Reply-To: <20260518230125.476165-3-ritvikfoss@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 May 2026 07:41:59 +0200
X-Gm-Features: AVHnY4I9-Tn-QaCOzMk9ms220AU6lMizTQIm-PT_nXGGuy8-mxmE9u6vAAJqzk0
Message-ID: <CANiq72=mhWr4GqknqwSzSbo1w1whNZtKHeVL1Pc3d+3A1kJ1sg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: cpu: use `unsafe_precondition_assert!`
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: tglx@kernel.org, peterz@infradead.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:57=E2=80=AFAM Ritvik Gupta <ritvikfoss@gmail.com=
> wrote:
>
> Replace `debug_assert!` invocations with
> `unsafe_precondition_assert!` in `from_i32_unchecked`
> and `from_u32_unchecked` unsafe functions.

The commit message doesn't mention why the messages were added -- I
asked for it because I am not sure if it is worth providing a message
for each assertion, especially since the original code decided to
avoid it, i.e. the change to the new macro is good on its own,
regardless of the messages.

> -use crate::{bindings, device::Device, error::Result, prelude::ENODEV};
> +use crate::{bindings, device::Device, error::Result, prelude::*};

By the way, we could remove `error::Result` from the list since we
have the entire prelude now, and also take the chance to use the new
style:

  https://docs.kernel.org/rust/coding-guidelines.html#imports

But maybe wait to see if the maintainers have other feedback before v3.

Thanks!

Cheers,
Miguel

Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428094749F3
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117488; cv=pass; b=Yv4emtM/mcAOiBNtpXpjrHnLelJ9WUStIynbBkOxxIXqbYZxX+9vsLqxU2hfheFd6Qr7DhJVifm7PexZ8xCnF2Yoj/R1psjhnt4L+G/jR+QoMSLt0pCX/+92njQw4nw/K9cDhee94H7aXBHa9k4yJsONAhsG770bUU7x7nzZHiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117488; c=relaxed/simple;
	bh=9KWE94eyKZE6Uq7REjx7UQY4itiU8OPl5Y8mYYpah08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FB06WwrfLdC0d2xhBrVkZHm0/2NCy88+txIL1kdbywXJ4aaLRqF0Hx92qOuBJnIZYUrAuw/fABdlS2GsraFOXp+xnOpcM9YyW0JXNpjwU6HsLJ9zH1AcjSUTXACioY2gnDlyhIw99lK1NBICBvkPr3lT6gDnYPCocL54Qz+F2v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A36flCUj; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A36flCUj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4955de8797cso25005985e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 08:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786117485; cv=none;
        d=google.com; s=arc-20260327;
        b=Tg49Bspy1UwqOmvCIp8o0gNHZIxx1b6oERXrcotho0hPBj7QRU++InKpWjDqx3SUen
         TJ35YkzyS/ErU+ZOUui8/wh0XalBAtX6Vjpdwqs0yGNp8MlbQS4EbLCBcodyyu4XMLyN
         DfCT2VU7hsgSEqcdatdluVc2su+YEYjZ3WdxFtcrs2Emn+R7MOk2HWRubA2P/2Lrfr3G
         OLiRynIyXia0NkjKHv2ImKZzeJIq0pRFYZeYudyjapfSqda860edZYK4Yb0cbpwSWbfv
         6gVi6g/r9MBu2y7ucGAR8d76JkTFKPPxVU11C0MhPHHmXTiVUDbh8X0XlnNIxyW2FExr
         0xPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T9SiBspLLD9GbBOMRUyttB5deqAt5EaqpjlEenU3waw=;
        fh=/IMhYdv7bqKDBUBWtMFZIeesaeZUaRxKpLfPrg/Et6E=;
        b=iquIDP+D8tk5yEXKYxqlo7YOXzXc1+aiiP6u7S9LAPoTGnM+EwIcu5GuVRxOi8YzO7
         LSqsn+fq0OZhjL6OW16ryrXiAycyZNxrwFIMuY3j7opMWY2Lug3Om+VtFCDSCqfWStPt
         D+JHu/Br4VkmYnVPlxH0cEARSJsoJG8wZrc0PlinV12SeOPx1Mva/fW5l8x0nBSSQ8MB
         9qMwGOw42VL49F0PlMtSqZOQVo7oOux9FW6thlCNTZhsKmxryX9wYZO5uv7XzJGUyJNy
         SuraeZXHAIdgqMm6KCj7bTg+SxAj+dFuHVL8qUdaxonfJSnC5UjrEbSrtB1+Hy2DOdeP
         BNGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786117485; x=1786722285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T9SiBspLLD9GbBOMRUyttB5deqAt5EaqpjlEenU3waw=;
        b=A36flCUjHjarfGztZqSdG77GoyhP1LsZr46StdMJgeSzmt1tvDxjE+SrEEoNVtIjT8
         pTu+e5UyCgXt3uQxcczyn5T7CUru2d2G0MFIo9xZLBpdnX863YUC/1Dm88ImubG+ETBE
         TbcU27dORul084NFI8lb8DrJH8oBgn4Fkmx2XCgL8mf9upkmWtz1eUg7zmH+DaN8NrJv
         5/inxwkGgL1GZNHCSX8APOYb9N670/kA1XgCdhspdulDqLRNvOW0FFkzj9Z2g+CAplbL
         0m4E3ZbZsrQSikY9KuOFCqQQ2sxNECZ9pVX+ww2xTBuT7T9VvsSc3cWgtkLqZ2poHhiw
         HEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117485; x=1786722285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9SiBspLLD9GbBOMRUyttB5deqAt5EaqpjlEenU3waw=;
        b=VvuIVQXP+3OcuosBMTZPaia1nv7+fkws+Btb54/lLpbKdi3AOMsWm4dHGVAowbK+3C
         YOhHtRUun3zPmm9NxUtooMTpRRzaetX9CfcX7AHsXL5MB2lJgA3GVWioUdz19czeE7VM
         Yob6f9xspYfLxwmIGZpjlEuou8V2XZSrP1Ovc5cP0h40AsiUFWqA5EvV0TO21o/NfZIk
         AEE9BhUpThMEXT+EZ9UQyXyFNRBqr8U4B41NdLkXgXptwguoZURLRcGXHWRiv1lg3UfR
         Bpeo2dn5Yv6HbV0ocXo1cw8ZoMt3tsKQaLDvn/ugAsR2OZmgVZllfKRGmeiXnmto8X1c
         zzxg==
X-Forwarded-Encrypted: i=1; AHgh+RrpFHatzql+ceTd3VcnzSOe0rqqxP7Tg0D5VaSCS4MjEFR840NMwmAoJxUqDX+Hjhi3PHQbwAi72tVUxYSKcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvSR8Aoc5Hs6KHkRcaHAgSU1Dsew6EpnThVGyzH9rX2lTcBp/a
	TUxhrASfaHZNeTEZExWWrNRSVZwsC24K6jNYe8eOAuIDMNv1hszKW3K0mtPUqPMbPAR7U3E/vQB
	gYJVg6elQkrcOAqPBwXc3Maino9am7Cp3zP1CKWdG
X-Gm-Gg: AR+sD12o9XzSOKSJL0sM9SaQBXiqnClZIz8nV2zsb33u6wautinmTYNInfy5HPmjHgJ
	heY9/swmRHhBIwOTVQ4Al9PEU2ZZWBhM7I3lEbtXYs4Fto5Or3tNvnbatg560+LOjptzg9FmzSd
	mfP28yKrgZ+gEztvz5bmTW0M8Iy8QjkYbL0lvMhDv6seNP6bikhDvGjDBc4UYm0rWPJQdnikvxD
	qQ+dNXoBbMZxVDoQfw6YqnqJ04iMAGF/BW02GBjbNjk6qrVjsvPUnzqRQOmLGpw3kfXRHGYNUe0
	I6QT1cdxfHJ7l9XVgPCaJLVwyfPBtKnTxJ+DKhICSWCNGj7+bQmzKuDfMxLHEcoaPWjivXjz5a4
	=
X-Received: by 2002:a05:600c:4e86:b0:496:c2fd:1731 with SMTP id
 5b1f17b1804b1-4995e07f47dmr50944775e9.1.1786117484628; Fri, 07 Aug 2026
 08:44:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-miscdevice-data-v1-1-43c4233e0b03@google.com> <DKISHUP2OL6U.1NEMCW4S0Z9FR@garyguo.net>
In-Reply-To: <DKISHUP2OL6U.1NEMCW4S0Z9FR@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 7 Aug 2026 17:44:31 +0200
X-Gm-Features: AUfX_mwLKjOlh7GmsrhJ9fcqVMUVjCk3NPIzjqVi0EAU-g1e12uE5cmAg5KU5L4
Message-ID: <CAH5fLggVkEYB0_SXcSGVBgs2hDejSU8P_y-5BvbyNhEvBPY1eQ@mail.gmail.com>
Subject: Re: [PATCH] rust: miscdevice: add registration data to MiscDevice
To: Gary Guo <gary@garyguo.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri Aug 7, 2026 at 3:22 PM BST, Alice Ryhl wrote:
> >  impl<T: MiscDevice> MiscDeviceRegistration<T> {
> >      /// Register a misc device.
> > -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Err=
or> {
> > +    pub fn register(
> > +        opts: MiscDeviceOptions,
> > +        data: impl PinInit<T::RegistrationData, Error>,
>
> We can just skip the `RegistrationData` and use `T`?

`T` is the type of the data stored per-fd. We do not separate types
for those two concepts.

Alice

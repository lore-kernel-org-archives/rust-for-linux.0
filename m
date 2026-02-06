Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624483451D4
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384966; cv=pass; b=IvOJVWVmOJjt8LFcsNpNA407kpnJr2GQuAnkkjymRrqZiZ6U1/tAP/WLLQ27i65yD1/XvoTPJ1srqo83LmtKIcY6R4CzzSEUuOkiZ16Siun+fgmfVTKS2qktbTlpjKHir6d+9Dk+Vlf06nvViIKCSEF9wldxP25UuAch9rsD07o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384966; c=relaxed/simple;
	bh=B4wo7bz46IWb5STejM/RV7+exK3z33y53ajLExf832s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPRk/PUu2rcRKZBTXbcazv372ostvitIsyq8rfuBgz38yxKLf9NxbhAEi63xXoKhEm8HwGUjG4sDZEfHtReliMMw+RV0bN6xJ6G2/OVrCdNyJ30qyrCwJsV7Hzfc31AvgcRJ3rOr4wAUd60LPM8Qn3ZJsVIOJy7wm0VxzLx9I70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BzEXbDT/; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BzEXbDT/"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-436234ef0f0so1125477f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 05:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770384965; cv=none;
        d=google.com; s=arc-20240605;
        b=lkQp+Mn3rYD3O4opAPsbRcsh7ymGiECGg2TLEhrE9yC75vItTK+IhWSUZQ0rUFb/1N
         z5CYDNBgnPp5/ZZtRJ8LoyjUKHMyQSiGywAtuTN3FboczQmhKrGiOG79x9yelJcfpxlm
         8/vcuNZ3ZtRj2y/0lOS7JfvQezWleCUxYHCWGfLoGIa9RoGzau5jEhHs6O0AtqU6LjzI
         AJSMU25GHhkQaj0Y6uWW21S9Zh6bICF/OMegR3DfV5ebxb94rXWVHveqH8fhwgPjRU+Q
         8Ukxu8puJOpWxb8cfhounwYffsbaSudZVUe1/nxV1HkuY6acZ2ZwaG3dTH+QDNUuhlB+
         G+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lu4swG8oa8yIWuIllYhwtyx7jJ4M+hbyB3/+/m/7kB4=;
        fh=68DxOWLhRe5+XzNNelg/ExhrrHLWdcLb+eu5mhl7i/o=;
        b=PR+ldAWhBWhUGEEnbr4bvxYl91Rp2DVe+c4QGZ6dHzAJTjU/rjgLJJaXqjQ1e1G65n
         TEvdajm0sz3/XnucW3PSAT7Fi3+bfDLbOIVqNycTG2P41U9gLiHZvOJzNAVAfeU4sS6z
         NQzuousEdqNnCkG3qkRd13/JEmJY8E5MIprSlK+ibfZ9F+U+5RSFCc52nqv4vZ7JFdNv
         491GZHzK5DYiT2PT5EzE2a6qpgEovWg7YxjecI5qxIc7+85QX8D11KU1KCNoarmgeGU1
         oP30x1oQNQQsyLNwzCS0sfGVRCcRExlsO+Ytz1iqTNpYVlKlThe5uOVvIlfZycoBvMKN
         sd9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770384965; x=1770989765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu4swG8oa8yIWuIllYhwtyx7jJ4M+hbyB3/+/m/7kB4=;
        b=BzEXbDT/V0g6wKwt1sz9wykxOGiO3EcCIwgNsk8OQvGWEJs3/zfUzKnLVEiwB7TX6C
         g7yyppFCoT3vxNwek8I0SYiBN+Rcbb8h8BFUfhtiXDTI8rCRi7E/d8XvHHpzxTDxvaOX
         LlAp+Ce26zD95RXupf1/49utdwrWJ1vhzJpC9JGII2fo8Z2txw8eSptV5HGMYjB71Po+
         l0uzXWDc9YtsWFGNYOaIQiOK/x8qsc/eIzt2gdZXbRKeyMRzNAnZBNz0Y1B52NV0F5NF
         xG6sMWdm8lLj8SyFxEs7bKp5wmNjoE7afkHiE22Gc8Sq9Bwd+f93BhaMJzbASCgG8yLC
         He4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384965; x=1770989765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu4swG8oa8yIWuIllYhwtyx7jJ4M+hbyB3/+/m/7kB4=;
        b=ji9a+JJQQP1NXmW6MwKeeGoo197uWkJabJZ0c7hj9w2YZhENVm2tDrEbgEhWeQ7szv
         1i65XPVhENlPKvdvh97kSlu9LiuaO/KPFcEwdy5KrggLlfIQvvK5lQUWQtDI2+6vwC8Z
         Hp9Ui5B+DEGKxvceDLp6f18VSOA/bGcuit+LMhjNsxxwB/fo0bAfQfgD7e7izKhqzotJ
         T8T4ie65sr80y4lCtBIgxWRQ7jm1hfNHoA2Jgej8VwyqYROWYw+MonkB9H7bBxwiogOk
         hcUsGm00UxHQTwXOJ4+QQynIkC2tFs1lvRQ8+mP7JWL7ErpiVWi7rRcveCgSJhIs/kW7
         efTw==
X-Forwarded-Encrypted: i=1; AJvYcCWi6AdlE6bChAYkV5CcnIT0jH1JQpTz7pnXtBVr+sh8YYtJiXiPCWAmOVPc0lReBDvyb4w+zd+HESTJzF+rWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYP/QXFIyxCO8oXyiWx2LgDzZESFc3Pc4vVSSF9rC5HAiWs59M
	wRpkCi4y6nHPqsu6jGtz8pryCd87YmYRUybJGtNXll3H60dsV/isCUJhJFDsuVwcSSzT0DNx1u+
	++SEz1CQt4yavGbseFwXxMF2xOsNyPGaCzu2vWM9Z
X-Gm-Gg: AZuq6aKjA7nS1P569gZ0NIfALLDXtXlZ2gPvovvXW58P4hk/csVmV+zM9z/nvOammtx
	FgxIllIbM0cJel0UJK00N0Pv6eEfJs/AweZa0WiJRrvngl6IPxc4ghA9MWLpS7X7qkOwPWOXnWy
	KFFBDLKKVQESVdOYNQrNp9l3rVtG7Tl8pxFPNq9+hWeAuATzEGWwE1vLe31f+fimO5Tizj5SLeT
	b50+t3wb49E6HFL6+63T9rh8lWMnikTT//R9T97q6d34zSWH2i632kGlvDFrD1p/IsJkTBzoOPi
	kDVVmB+wCJk5zRmRawQ0Q6Bl5ueewEtQqSJ8
X-Received: by 2002:a5d:5f83:0:b0:435:a3c5:a526 with SMTP id
 ffacd0b85a97d-43629658283mr4332188f8f.14.1770384964416; Fri, 06 Feb 2026
 05:36:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205224706.91996-2-dakr@kernel.org> <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org> <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org> <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh> <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <CAH5fLgifC=K1wssW-nWR3wvL9OHEQ9x2hPd2+ENj_mqtgEhyxA@mail.gmail.com>
 <2026020618-congress-tuition-8893@gregkh> <DG7X1LYSZ1IC.2Q4CYXM97A62A@kernel.org>
In-Reply-To: <DG7X1LYSZ1IC.2Q4CYXM97A62A@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Feb 2026 14:35:53 +0100
X-Gm-Features: AZwV_Qif7hDzpSahBrdxC13G57b51wYhzQZmYj3nD2Tj3TDS2mn-KjrevwXcrOI
Message-ID: <CAH5fLggPi1zhQdUjt3WqDVUEWy1KVPK=iiQfbNSig697J7HS=g@mail.gmail.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 2:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Fri Feb 6, 2026 at 2:25 PM CET, Greg KH wrote:
> > On Fri, Feb 06, 2026 at 02:20:06PM +0100, Alice Ryhl wrote:
> >> On Fri, Feb 6, 2026 at 2:16=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> >> >
> >> > On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
> >> > > That's fine, because the rust driver core code should also be buil=
t into
> >> > > the kernel, not as a module, right?
> >> >
> >> > Yes, but the Rust compiler may still choose to put some of the core =
code into
> >> > the module.
> >> >
> >> > Especially with generic types and functions the Rust compiler may mo=
ve some the
> >> > generated code for a certain type instance into the module that inst=
anciates the
> >> > type.
> >> >
> >> > For instance, even though rust/kernel/devres.rs is *always* built-in=
, we get the
> >> > following error when devres_node_init() is not exported when the use=
rs of this
> >> > built-in code are built as module.
> >> >
> >> >         ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.k=
o] undefined!
> >> >         ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.=
ko] undefined!
> >> >         ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/no=
va_core.ko] undefined!
> >> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko=
] undefined!
> >> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver=
_pci.ko] undefined!
> >> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver=
_auxiliary.ko] undefined!
> >> >         make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] =
Error 1
> >> >
> >> > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not gre=
at at all.
> >> > Hence, we could do something like in [1] instead. I don't know if th=
ere are
> >> > other options that may be better though.
> >> >
> >> > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org=
/
> >>
> >> You can use #[inline(never)] to prevent this.
> >
> > Ah, good!
>
> I tried this before, but it doesn't work. It might prevent inlining, but =
it does
> not prevent the compiler to move the function into the module binary.
>
> For instance, even with #[inline(never)] on Devres::new() I see this:
>
>         $ objdump -t drivers/pwm/pwm_th1520.o | grep " F " | grep Devres =
| grep new
>
>         0000000000000000 g     F .text  00000000000001d0 _RINvMNtCsgzhNYV=
B7wSz_6kernel6devresINtB3_6DevresINtNtNtB5_2io3mem5IoMemKjb0_EE3newNtNtB5_5=
error5ErrorINtNtCs4gKlGRWyJ5S_4core6result6ResultBK_B1i_EECsjBm7MKWXKwW_10p=
wm_th1520

Because it's generic, see my sibling reply.

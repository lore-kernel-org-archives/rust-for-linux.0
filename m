Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E0234750F
	for <rust-for-linux@vger.kernel.org>; Fri, 15 May 2026 05:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778824216; cv=pass; b=WPKnCE8wIJ3HtcEHa4fiiuPQc9nQVOkNIrvxAwVlNI0IAMels5ZOVA+j57Va7lZ3UoIaAJXhDn2x86RuE8NEpIu5AM1lVRQKPM0o3cJboKKPfqPMpRG6JKgAHyS6LJ2BQeCjpalRMW/X2sws8JgcKXMB0toMo3hA5XV5FQzrKMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778824216; c=relaxed/simple;
	bh=nzhCIyjq9dCkSwtjw+Q759vI6aIMENQjE3TsKI87kZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpaOqZfDytTLWQzuE3QwV0qA2DgpNJgLH3cwELXv7RN9rtOjcdrc5lcA0DFJhh8/MKzlS0nYoo/V5QJUHqB44QSqUCbp/QknhG26Q+/dhs914u+zPZOduMWiJtYVMEjzb3aP9Nb+YZyOFvn1BpgKQQ+XlI9SuIh8fQs7PRiYbq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFe3Worf; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFe3Worf"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67bb5ad91bfso16495419a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 14 May 2026 22:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778824213; cv=none;
        d=google.com; s=arc-20240605;
        b=OsiORZzH4y/SiRiW5ODrj3aR7asuLP+COZNlX66qvVUfR1Lt2l5CBHtWu7Ie6WyMyL
         8DBc0o+QfV6O1aVuNB+8uAzPXrKOntYJ9ybl1TiE3hyJ0L44cet1n6w7udUMmZqILbw3
         /duWBJaWC0xo0dP0ptZznLsHEKs5kUeo94MXYapZ1SFmafX0TFxOEI56xWz/mQTyp8Iz
         F6Y4UrsiMSFZIqourigsowSM9fk7A3fg64lwP3o9ddGUORIJcBtD51+KStPiwkrmpj3l
         aHnmb0swMFUn7HRpx2iaylWn5mnBXv6zsO8mfBGeIn0AWKtLn8Uh3KvJuGUqNLZw9QUg
         rgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w273JBfFAtK7fZhrin4tOyF9swchXPtxmQn41Rpjp3U=;
        fh=qWRiv3OMfUzwo9jbPaK8H2DjUS6YonnMvey2gUQ650Q=;
        b=NJiWT/Fecyx+Are2uqMl4pRJRhu4Wa461pTOP/fAKxBd9S8NxWjFmaiExfzCX8qbXs
         DPLY0pdTINfgz/XcRaxi4MzkX42FZOg3916V96NFEIkqoL1Uk/KAj6I+k590pwuz562j
         EKw+9/xPL4uyTU7ZPi0pQg5jYPg5PAXedlHWLBc1/q/193jjlY0pnZHiP+Cr7zDLNFWy
         JsLpcugxHmY6NKd4IS6JgC1Lssj+A/VhBzGftcGB+xxoHZh76e+V0roKLPeMY7qgen6z
         8iOztpT5WKA+wJGM8rgbKn5kPkv1hQmC49pv8NCiXFnfHNlXNQgNWS9kFJ3uDLRV4GfY
         Qllw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778824213; x=1779429013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w273JBfFAtK7fZhrin4tOyF9swchXPtxmQn41Rpjp3U=;
        b=JFe3Worf1ZVFhemrBt9Q7tj3FHueD+JT96nrPq8B9R1UhAKiEssAKtgQ23kMHx0OXc
         wYZlujkYW1G1yTqF0bHeeiec+TbMhy2Gl1C5MyeYBjmh6OorsWsBXYiTBdxYsKKrPAQf
         ZnfYKW1pwclNKGLH/AoNBPpqcOpSjSA3hU2h4/j2ujp7TiEo9hqfppElLTE4OPefADW0
         bo7exsvtXChAU39fNDKU0k8wlMKervmDafPcqyjbIGjTYKsURpDtk33Cx7pcsH3MWBW/
         YB4r97t8seQRIRso7Jdqbpok/g71Dd9zPNzM0TD0p/XYeqSZXEA7QErO7qN0caN0m36J
         m2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778824213; x=1779429013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w273JBfFAtK7fZhrin4tOyF9swchXPtxmQn41Rpjp3U=;
        b=Cze8gjHzXT6WTQMkm2nJ8bOWzkVSVY/NludZEdbsMuMdcENItsoN1qN+wCTtZzyh98
         aJwOmg+QoHmg61Hj8qX7yjgdrMDASkpkbxCzfV1gmtkiuxg1aglGLpYWLLXtb0xhql8F
         BqBB4rIU6PfixOjR7IJ4IA7bmGd7v6YvzH/m7YDT1F7HphLhFqMnFPVsTBHMyJoMDfiu
         h+3BX1HkixDpGnTitdWKNi8JN4eX//ss2mll2vDYm/CYChHcHXQZsTGrtCw8gV9zXxa8
         Id8xt9Ef7MgIaqQ5G+OLTlu8+l6GrAJiPCcaB0NaT4TBv/OvKFEWfmP5dSL389ehYDRz
         7L/A==
X-Forwarded-Encrypted: i=1; AFNElJ/en2ZIqW52/iEGBWwkwKaeLqRUwLUcq1x5WfI0EJTTvlh8DUkAqbbux5JPMb9vIh0toJn101T6PdDB4DzR0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx12f4CW98JU7MvUIoF7uhoUoz3t3/eVTWspqqV3y6OO6BvGDPZ
	qfKU+aRE2X3Zrg/4wAT/O3Wn+9co9yFQY1zez6WFup1/ZofxnOK1VvY0EucTOmkTI+jkqDzaurc
	i4Hv9ej71QLC2K+aaCtZxkmO5dr4YTgw=
X-Gm-Gg: Acq92OFTJE+xDKfBCyYW0WtJ5rF6niUiLaZYQ5bTzjoahrl9ytRTZ4kBsPO+6O+4rid
	c+9uUp4Tsu121pQKJ6DAfEZPuoKEpvpBXMFTyGsc2eygPtssIWvcqzubWHca2iGTbX2jxUzH3US
	LCoQmD65XI6HjhsBKUBx15z4wj9IbpLtV28dvwsXR0EBRP8dpX9Cdzds3w9mlP4g7Rynjodvgo/
	I9vR0IOrzK4VfZ4GOePMql9tc0wjy3S3DEZ5Es1c5MMvMd61gkuIgEDRLjqPsV7E8xa3HxL6huv
	PyosvOEi5kjdgPYzCmjDtIz8sEPV47LgDOHNpg==
X-Received: by 2002:a17:907:d06:b0:bc4:d93b:2078 with SMTP id
 a640c23a62f3a-bd5177b1eb7mr127852466b.12.1778824212515; Thu, 14 May 2026
 22:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508031710.514574-1-alistair.francis@wdc.com>
 <20260508031710.514574-2-alistair.francis@wdc.com> <73b1ecdf-8754-4c17-88af-671246a6787d@de.bosch.com>
In-Reply-To: <73b1ecdf-8754-4c17-88af-671246a6787d@de.bosch.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 May 2026 15:49:45 +1000
X-Gm-Features: AVHnY4K0YlVX7ccrCIg2Am5gWOTSrQqEJ5vMNkhmej-0Kw8vU5JM9pQx9xSl9Ws
Message-ID: <CAKmqyKO+Pzj_z_r_tmVCuTt4gacrF9M74WknciGCbHGyBn5L=A@mail.gmail.com>
Subject: Re: [PATCH 01/18] rust: add untrusted data abstraction
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: alistair@alistair23.me, linux-kernel@vger.kernel.org, lukas@wunner.de, 
	Jonathan.Cameron@huawei.com, bhelgaas@google.com, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	linux-cxl@vger.kernel.org, djbw@kernel.org, linux-pci@vger.kernel.org, 
	alex.gaynor@gmail.com, wilfred.mallawa@wdc.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, aliceryhl@google.com, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, tmgross@umich.edu, 
	ojeda@kernel.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 3:18=E2=80=AFPM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Hi Alistair,
>
> On 08.05.2026 05:16, alistair23@gmail.com wrote:
> > From: Benno Lossin <benno.lossin@proton.me>
> >
> > When reading data from userspace, hardware or other external untrusted
> > sources, the data must be validated before it is used for logic within
> > the kernel. This abstraction provides a generic newtype wrapper
> > `Untrusted`; it prevents direct access to the inner type. The only way
> > to use the underlying data is to call `.validate()` on such a value.
> >
> > Doing so utilizes the new `Validate` trait that is responsible for all
> > of the validation logic. This trait gives access to the inner value of
> > `Untrusted` by means of another newtype wrapper `Unvalidated`. In
> > contrast to `Untrusted`, `Unvalidated` allows direct access and
> > additionally provides several helper functions for slices.
> >
> > Having these two different newtype wrappers is an idea from Simona
> > Vetter. It has several benefits: it fully prevents safe access to the
> > underlying value of `Untrusted` without going through the `Validate`
> > API. Additionally, it allows one to grep for validation logic by simply
> > looking for `Unvalidated<`.
> >
> > Any API that reads data from an untrusted source should return
> > `Untrusted<T>` where `T` is the type of the underlying untrusted data.
> > This generic allows other abstractions to return their custom type
> > wrapped by `Untrusted`, signaling to the caller that the data must be
> > validated before use. This allows those abstractions to be used both in
> > a trusted and untrusted manner, increasing their generality.
> > Additionally, using the arbitrary self types feature, APIs can be
> > designed to explicitly read untrusted data:
> >
> >      impl MyCustomDataSource {
> >          pub fn read(self: &Untrusted<Self>) -> &Untrusted<[u8]>;
> >      }
> >
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> > Message-ID: <20240925205244.873020-2-benno.lossin@proton.me>
>
>
> Today, randomly, I was about to ask Benno if there are any plans to
> continue with his great untrusted work. Just to find that you are
> carrying this forward. Many thanks!
>
> While trying to figure out some history of this patch, it looks to me
> that the version you are using is Benno's v2:
>
> https://lore.kernel.org/rust-for-linux/20240925205244.873020-2-benno.loss=
in@proton.me/
>
> ?
>
> While the latest version from Benno I found is a v4:
>
> https://lore.kernel.org/rust-for-linux/20250814124424.516191-3-lossin@ker=
nel.org/
>
> Is there any reason not to use that?

Nope, there isn't, I just didn't know it existed. I have updated to
using the v4 submission

>
> While at this, do you have any plan to add the `Validate` trait as well?
>
> https://lore.kernel.org/rust-for-linux/20250814124424.516191-4-lossin@ker=
nel.org/

I am using the `Validate` trait, so yes :) I have pulled in patched 1,
2 and 3 from the v4 series.

>
> Thanks
>
> Dirk
>
> P.S.: Carrying this patch forward, please check if it needs an update
> regarding new "rules". E.g. it looks to me that there should be an
> update regarding the vertical style for imports?
>
> https://docs.kernel.org/rust/coding-guidelines.html#imports

Thanks, I have fixed that up.

Alistair

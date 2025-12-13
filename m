Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C4B381C4
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645152; cv=pass; b=h4cs7I8GcfBByH20HIJogg9ERMZ148HZxpWFwPLcBZLFFatq8M2N0NPswA5E7pwp0HBRBH1+vaa/tEvOg9/Ezy+m/hU+xvVGuIi5yleNbPNSlvfOykcJKRLV/5BjYO6rvhN3tR8Aku7DfEI6yic1UAOoETHNnHN6B6Pf8YKLMxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645152; c=relaxed/simple;
	bh=Wik5AJqMyrBYqQI361ozzVUOzKPdA7BnqNVYW4WBSIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcORbrJDBNGHhZMqpFPnY8W2ohJ2iYRcZx8NeiwGXo3mHk+1TLIFHNErWRpkFZPKKvHVr4OSW86omdhldMF4NIt1U95qqwL8qRiRAjcnGZ77OzyqFvnR/zIYijs5KWxgb72h9DaIEM474Kfc7LDyzmYKzLBTSLPvqEqJaHJ+WG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v1xLMs+K; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v1xLMs+K"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64969e4c588so30775a12.1
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 08:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765645148; cv=none;
        d=google.com; s=arc-20240605;
        b=NbZZtkB7dheu6zKSGLhKjHQZFR0AfN2Zj4ExK1eI6DH0HlwEkDDq25UmF6dT3CIlUe
         jVjorQa3mKFhI+FxAtEN015ori3EldECHaQYGYBbVHqjB9+E0YZN0610TY/wHkObgGxP
         v4bilImDKvdHmcuMfw7XBAWzysJ7x2RpHYEGlo00Z7Z/AVzY6Xp8bDgMgcgwtbNXEV1J
         Dc7SHcEupcMfygtX4P8h8ScyQHAYgYghBb7/31+VJMSRPhOIbMaCJh/vKqXfK+X24jkx
         UyHJlcY7jJuet/EUckSIhZYZQX6JM4+c4CYIGxp7kj/nr1yVkQIbcwmi+67Ton8//LjO
         DyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lE/Aili0PwSsQ3zV/5G+nQdlmxAyZnZZKuDMPBsWbYU=;
        fh=tPjFXIzsRBZ4f05jMlhMyTN3MA5D3Ae5JA84I4XMUWY=;
        b=SQYkSstywZOOdUGX4lxJjfdJW5r/PclrCn9qOy3b1tejowHisVXMmVWaR7Yv1vIC6t
         wmJoHj7j5w+obhwYmcN5uGlyOut2xt0sGD0XFlN35jMSuFzsPNQOcRfybbnGbxpuKX8Y
         32CHhyTPnywCgMuUtj+k6yKp1TYx7YTNyVj4uzHsFwd+13hgT4z7klTAfInXO41cYMnA
         aWbvWMDkbPKfHnbSsBitoKcojq43Nb0IRVc31Lu7Rg8orprldqNjNsKvBoGJRelukRkY
         AsbIy5cUDvWGHDx9M+BPNT104BQu+rgUCiLk532AF5FLrYAmNq+Hr4Kj+G2XQYHUKIGL
         ArzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765645148; x=1766249948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lE/Aili0PwSsQ3zV/5G+nQdlmxAyZnZZKuDMPBsWbYU=;
        b=v1xLMs+K7FRqLLx3I2nUCPp1IZ0atLwB8TmwUZ+77FYREhG+2Lr3X2w3pLoQCrh1fI
         2KdSRk07Xg2Q+pzm3+LG9t9ymrNo7YV0350lkI0Bo7EiKJl+rMRZW8IH+rwK/S4bmHd2
         d6uoDLNJYkZGr05uPBHGxFReNzi2o4Fa1RQB+l9X2FqHZGkl0zyqJlrVzpIwlmOKGZCP
         9dIH6zNY/9I9g2i5JTPN8rLvPVAAEYuxihBB82FoBRNhDRif/FauY4ja22ULziocuVNY
         5lL/40gYhRVmlLvDJXT7f4az7K5WRgYHjJTfU3fnGyPfTTRlx0gOQB38w0WZaLise9gj
         O/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765645148; x=1766249948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lE/Aili0PwSsQ3zV/5G+nQdlmxAyZnZZKuDMPBsWbYU=;
        b=OsteszPG2FEfFyyfEFXqgpM2XO8V8fN6YesEOEAh/qAGNgcmPUU1jPTmro2bx599Dm
         K9IehXeeijX/7RLXyfDdPU0p1jKXtx6T30ntOqBwsQ81+2XyEOyBo+A61e3ky8smZMSm
         Qdb5WCIjvQWrBoB32gr+NxmQtdD981KNzxb/jjCuOYIykC4dAKRyOjDLcYuONls5ja+M
         +rC6gE7fwkj3LtQFV0PLyqVQVo+JacEY28kBPpOALHF4PbTT5ByLXlEfgoG3QTo4v7ra
         bO8IYI7rOqNVrF+vEju/MKJ/onF36a9rmF6s0BgLEEWnZUNLb7ybFQ2dYxsUFvEAkfWM
         P1gw==
X-Forwarded-Encrypted: i=1; AJvYcCVSBaZfAtsc+iXj6qHEFBVSI5r5Y8+7Vtc9MPIeZqiVcz7zTWVfMiWympbY6qIx8vNo72U+lFySC3EyVTUqJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlhiTEWfwM9Cb66EdpFscSoeWyY1CXWkwRN9tPodqwZQ1DVUAe
	wpWUyn8xP7Th2hyyUO5DNf1ae6UgWYPr+LvY+BNMtNSBDr8Fr3ICeXuxl1Yr+R9GFhRtz38EJN0
	DeQpRq6zL+GXAIMsDgZCFAzinpyKwA3W3KSw/25hC
X-Gm-Gg: AY/fxX5Dker/mQOPcrJM3A13c6usqDlU9I1zofMDAEFJfhUKFp2HEcF8MVX5WWV44r+
	TKaiawMRx28yqO9kmn6P9cMeMcuokwYsRHk2M344PK8Bh6EaUPku4j0qInacVjEN5C3Yq9GS6f9
	Orm/Vlk6h6LZIubd+ei2supiPy5hqJH4ngxz0dfBuITFMQ3ON+IR8ObA4Wfw3PVnf+zjOvI3k05
	+ko0SxnDVLe/8R58HY7HmCP3E82RGcM1Fn5bdV8Pzc2UKvtGWsFCS3yGj0z9qsTXQ0UILSrwSFz
	DOp/HdwlfLDz1xiWrw68UkcpvA==
X-Google-Smtp-Source: AGHT+IEzkkLkR24gomKrRtx+/LfNZ2wWhj1UvIsb/DZm1/yY6YBAvcdp1cpOHDSScKZmfyU5UpEYyhRfvfVSZNehp+8=
X-Received: by 2002:a05:6402:2203:b0:643:6984:ceec with SMTP id
 4fb4d7f45d1cf-649b08ec242mr26252a12.15.1765645148106; Sat, 13 Dec 2025
 08:59:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com> <4qgnlilx2vyi6yf73d47z2o342lotq7vsvycigsv5fb3rcwsjv@t4ank62skqny>
In-Reply-To: <4qgnlilx2vyi6yf73d47z2o342lotq7vsvycigsv5fb3rcwsjv@t4ank62skqny>
From: Matthew Maurer <mmaurer@google.com>
Date: Sat, 13 Dec 2025 08:58:56 -0800
X-Gm-Features: AQt7F2o7PlfIfl0uLBLpOXRMWGy_qeeTYqk_xIgOULOLM9i5084wX8Dd2vyRV5g
Message-ID: <CAGSQo03uOmC2G-MnkY-8_R8Bo_s7Q97xEh-re4WPqSuWkotOuA@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 7:55=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Dec 13, 2025 at 12:36:00AM +0000, Matthew Maurer wrote:
> > Re-implements qcom-socinfo driver in Rust, using `Scoped`-based DebugFS
> > bindings.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> > This patch converts the QC socinfo driver to Rust, intended to be the
> > first Rust driver in Android that is owned by a vendor rather than the
> > platform.
> >
> > This driver is currently quirk-compatible in DebugFS-exported values. I=
f
> > the maintainers do not believe that maintaining the exact formats is a
> > benefit, we could simplify the code further by dropping some of the
> > custom formatting functions used to match the output.
> >
> > I sent an earlier draft of this privately a while back that was much
> > rougher, but didn't get much feedback.
> >
> > Now that we've got all the interfaces we need for this driver reasonabl=
y
> > available (DebugFS was the one that took a bit here), I wanted to bring
> > it up again, this time as an RFC. With the new features, the only place
> > it needs `unsafe` is to define an abstraction over `qcom_get_smem`.
> >
> > I have tested this on a SM8650-HDK by diffing the contents of the
> > exported DebugFS and examining the files under /sys/bus/soc/devices/soc=
0
> >
> > While I believe I have everything correctly exported via DebugFS, I hav=
e
> > not checked equivalence across a large swath of devices, only the one.
> > ---
>
> > +
> > +pub(crate) fn qcom_smem_get(host: i32, item: u32) -> Result<&'static [=
u8]> {
> > +    let mut size =3D 0;
> > +    // SAFETY: qcom_smem_get only requires that the size pointer be a =
writable size_t,
> > +    // host and item are error checked in the qcom_smem module.
> > +    let err_ptr =3D unsafe { kernel::bindings::qcom_smem_get(host as u=
32, item, &mut size) };
> > +    let ptr =3D from_err_ptr(err_ptr)?;
> > +    // SAFETY: If qcom_smem_get does not return an error, the returned=
 pointer points to a readable
> > +    // byte buffer with its size written into size. Because these buff=
ers are derived from the
> > +    // static ranges in the DT, this buffer remains accessible even if=
 the qcom_smem module is
> > +    // unloaded, so 'static is appropriate. The underlying buffer cann=
ot mutate, so upgrading it
> > +    // to a reference is allowed.
>
> This is definitely not true. The smem data is ioremap'ped during
> qcom_smem_probe() and will be unmapped if qcom_smem is unloaded.
> Accessing such a pointer after unloading smem would result in the
> exception. Current socinfo ignores that and keeps on accessing the data
> at runtime (which also allows it to read DSP versions which are updated
> at runtime), but the comment needs to be corrected.

Thanks for the info. In v2 I'll look into seeing if I can make those
slices hold a reference on the smem module while they're alive.

>
> > +    Ok(unsafe { core::slice::from_raw_parts(ptr as *const u8, size) })
> > +}
> > +
>
> > +
> > +pub(crate) static SOC_IDS: &[SocId] =3D &[
> > +    id_entry!(MSM8260),
> > +    id_entry!(MSM8660),
>
> As we are performing a linear search over the array, would it be sensible
> to sort it?

I directly copied the ordering used in the C code. We can't easily see
that it's sorted at a source level, because the key is the soc ID,
which comes from the device tree headers. For the first four elements
at least, it *is* in sorted order already, we're just not currently
relying on it. I could potentially add a debug assert to check that
things are in sorted order and switch to assuming that if you'd like.

>
> > +    id_entry!(APQ8060),
> > +    id_entry!(MSM8960),
>
> > +
> > +pub(crate) const PMIC_MODELS: [Option<&str>; 92] =3D {
> > +    let mut models =3D [None; 92];
>
> I don't like the magic 92 appearing twice here just because the last
> element of the array has number 91. Is there a sensible but idiomatic
> way to express that (note in C we just use flex array without the size
> and don't specify the size at all, so we don't have the duplication).

The usual way to do this in Rust is to use a slice (`&[Option<&str>]`)
rather than an array (which looks like `[T; N]`, as I did above). The
reason I didn't do it here was to avoid explicitly listing any punched
holes (i.e. with slice, I'd have to write something like
`&[Some("Foo"), None, Some("Bar")]`). Rust doesn't directly have a
partial array initialization syntax because it requires that
everything be fully initialized, which is why I was doing it through
mutation. If we're going to leave everything default `None`, and
express which elements should be `Some`, we need a bound on how many
elements "everything" should be.

Some options:
1. Make holes explicit
```
pub(crate) const PMIC_MODELS: &[Option<&'str>] =3D &[
  Some("foo"),
  Some("bar"),
  None,
  Some("baz"),
  // ...
};
```
This is the one I'd suggest if we want to get rid of the 92. It has
the downside of some extra explicit `None` entries, but the array
isn't *that* sparse.

2. Factor out 92 into a constant.
3. Define the constant in terms of index/value pairs instead. I could
use `const`-time code to produce the array we want:
```
const PMIC_ENTRIES: &[(usize, &str)] =3D &[(1, "foo"), (9, "bar"), (42, "ba=
z")];

const PMIC_MODELS_LEN: usize =3D {
    let mut max =3D 0;
    let mut i =3D 0;
    while i < PMIC_ENTRIES.len() {
        if PMIC_ENTRIES[i].0 > max {
            max =3D PMIC_ENTRIES[i].0;
        }
        i +=3D 1;
    }
    max + 1
};

pub const PMIC_MODELS: [Option<&'static str>; PMIC_MODELS_LEN] =3D {
    let mut models =3D [None; PMIC_MODELS_LEN];
    let mut i =3D 0;
    while i < PMIC_ENTRIES.len() {
        let (idx, val) =3D PMIC_ENTRIES[i];
        models[idx] =3D Some(val);
        i +=3D 1;
    }
    models
};
```
(The slightly icky looking loops are because not all features are
available in const mode.)
This seems a bit overkill for what's going on.
>
> > +    models[0] =3D Some("Unknown PMIC model");
> > +    models[1] =3D Some("PM8941");
> > +    models[2] =3D Some("PM8841");
> > +    models[3] =3D Some("PM8019");
> > +    models[4] =3D Some("PM8226");
> > +    models[5] =3D Some("PM8110");
> > +    models[6] =3D Some("PMA8084");
> > +    models[7] =3D Some("PMI8962");
> > +    models[8] =3D Some("PMD9635");
> > +    models[9] =3D Some("PM8994");
> > +    models[10] =3D Some("PMI8994");
> > +    models[11] =3D Some("PM8916");
> > +    models[12] =3D Some("PM8004");
> > +    models[13] =3D Some("PM8909/PM8058");
> > +    models[14] =3D Some("PM8028");
> > +    models[15] =3D Some("PM8901");
> > +    models[16] =3D Some("PM8950/PM8027");
> > +    models[17] =3D Some("PMI8950/ISL9519");
> > +    models[18] =3D Some("PMK8001/PM8921");
> > +    models[19] =3D Some("PMI8996/PM8018");
> > +    models[20] =3D Some("PM8998/PM8015");
> > +    models[21] =3D Some("PMI8998/PM8014");
> > +    models[22] =3D Some("PM8821");
> > +    models[23] =3D Some("PM8038");
> > +    models[24] =3D Some("PM8005/PM8922");
> > +    models[25] =3D Some("PM8917/PM8937");
> > +    models[26] =3D Some("PM660L");
> > +    models[27] =3D Some("PM660");
> > +    models[30] =3D Some("PM8150");
> > +    models[31] =3D Some("PM8150L");
> > +    models[32] =3D Some("PM8150B");
> > +    models[33] =3D Some("PMK8002");
> > +    models[36] =3D Some("PM8009");
> > +    models[37] =3D Some("PMI632");
> > +    models[38] =3D Some("PM8150C");
> > +    models[40] =3D Some("PM6150");
> > +    models[41] =3D Some("SMB2351");
> > +    models[44] =3D Some("PM8008");
> > +    models[45] =3D Some("PM6125");
> > +    models[46] =3D Some("PM7250B");
> > +    models[47] =3D Some("PMK8350");
> > +    models[48] =3D Some("PM8350");
> > +    models[49] =3D Some("PM8350C");
> > +    models[50] =3D Some("PM8350B");
> > +    models[51] =3D Some("PMR735A");
> > +    models[52] =3D Some("PMR735B");
> > +    models[54] =3D Some("PM6350");
> > +    models[55] =3D Some("PM4125");
> > +    models[58] =3D Some("PM8450");
> > +    models[65] =3D Some("PM8010");
> > +    models[69] =3D Some("PM8550VS");
> > +    models[70] =3D Some("PM8550VE");
> > +    models[71] =3D Some("PM8550B");
> > +    models[72] =3D Some("PMR735D");
> > +    models[73] =3D Some("PM8550");
> > +    models[74] =3D Some("PMK8550");
> > +    models[78] =3D Some("PMM8650AU");
> > +    models[79] =3D Some("PMM8650AU_PSAIL");
> > +    models[80] =3D Some("PM7550");
> > +    models[82] =3D Some("PMC8380");
> > +    models[83] =3D Some("SMB2360");
> > +    models[91] =3D Some("PMIV0108");
> > +    models
> > +};
> > +
> > diff --git a/drivers/soc/qcom/socinfo/socinfo.rs b/drivers/soc/qcom/soc=
info/socinfo.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..bff1bf8fd672e3c46135207=
5aa85ef8fdedff953
> > --- /dev/null
> > +++ b/drivers/soc/qcom/socinfo/socinfo.rs
> > @@ -0,0 +1,362 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2025 Google LLC.
> > +
> > +//! Re-implementation of Qualcomm's Socinfo driver in Rust
>
> I think this comment can be dropped. If it gets merged, there is no old
> Socinfo driver.

Agreed. We do need a crate level doc comment, but it can just say
"Qualcomm SocInfo Driver" or something.

>
> > +use core::fmt;
> > +use core::fmt::Formatter;
> > +use kernel::debugfs::{Scope, ScopedDir};
> > +use kernel::device::Core;
> > +use kernel::module_platform_driver;
> > +use kernel::platform::{self, Device};
> > +use kernel::prelude::{fmt, pin_data, Error, PinInit, Result};
> > +use kernel::soc;
> > +use kernel::str::{CStr, CStrExt, CString};
> > +use kernel::transmute::FromBytes;
> > +use kernel::{c_str, pr_warn, try_pin_init};
> > +use pin_init::pin_init_scope;
> > +
>
> > +        let versions =3D self.versions.unwrap_or(&[]);
> > +        let versions2 =3D self.versions2.unwrap_or(&[]);
> > +        for (version, image_name) in versions
> > +            .iter()
> > +            .take(32)
> > +            .chain(versions2.iter())
> > +            .zip(IMAGE_NAMES.iter())
> > +        {
> > +            version.build_debugfs(dir, image_name);
> > +        }
>
> I like this idiomatic code, we even get what original driver misses:
> size checks for those memory regions.
>
> > +    }
> > +}
> > +
>
> --
> With best wishes
> Dmitry

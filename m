Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5763FFAA2
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 16:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814093; cv=none; b=R+jOzd7gZAEnjErejqmOYIwBILjin1w9RU3pdN+05ZNttGj7mmvdx1ZvNIcTTtQvC+xpmwHHyklgGauO/nw/bzths8tEEaYECLLKobQeJorQCMfX4i8WnU/VZGdYaHXpn6TG0IvZ0Nhr6ajeN0ZorZfp10fDVzbFdiOhTIBrrY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814093; c=relaxed/simple;
	bh=IobJrEWjvUZagOmpcWPBSKQOrm3yQw/AFRcK1T9wrVI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hr+7UJQwz4cikmF10tlSEbsA+zG/GlklV7CHnmq/TSkK/5+hql5OOikRhvBcjE5kDkV3fwzHzvM9ds4Hzz9RG2SZZ+zVDgRTRRjUA+bXb+cDK54/kmiLi4WRupdjy7290V+VEW9QEa4bIDkjYl3YckLuEKncPLQI6kHTpwyjGNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSa3skmT; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSa3skmT"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so7123538241.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779814091; x=1780418891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjVEx+4Vqp7VsiYAFEexS8FnsOEdXYunMPVuSQNgxXk=;
        b=hSa3skmTi1yvbWtIoIwCliQdZ4cKRLMaGswdn9sGr2uX76W+plcWSXvjuYKzh1PUYX
         pnz49cOBC7TTmPu+Eu2NtFBWufjHsOfmUou6//mvMFTuk8eATtuFDKYDivBIGpGNKTTg
         q/FtoSuy2CUjxttbiqEu01ufIGiNZzhUO1cKtrkQANzd/pZqHrdAdbxXwrhAU+WmBz2N
         nOpIXsVrw6cIzb0wq2ptlYyEKvsX0YAeQMGX+JwVlWa8tIUXIyPhgPsL81giqSumwpV/
         iDloULE3j9a6bYVjtqhW9KSjeGaLklvnv8fcUAVeq0xM7P6vyJL5YzNAdPKxj3myiq1q
         otVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779814091; x=1780418891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjVEx+4Vqp7VsiYAFEexS8FnsOEdXYunMPVuSQNgxXk=;
        b=RMs0nxxhyPDEbHiJ5gaByunte+yTQ/+ej0T62dr66O6dEuOVmwqsd4K51iLTJpRVOq
         vNYiqe/mw3qC13ULMY9BDONbPd1bHSPs682mrrecXt8tZCaRnCriqbd7m94YMiGEOvtf
         L4q1ogv7xEo/WgqDqYCClN394x8Ods+5jlyGbTx8aWvB7Qogr0eXHUuFDEf+roabuhgE
         2txmtWx3NiQJCyo337Htrqd6F98m7mCGr9PWHtKqVYaGlg8fn7+th5Z5ZyMSXFhy/LRx
         Wh2MeIKDfXb9UIvlgOpY/C9EyMSk+Gh6SDuJcRhgFZgbQrCal6An9H4JBASKiXiAd2Ys
         rBjg==
X-Forwarded-Encrypted: i=1; AFNElJ/MKUgvu6io/IeaMUtsYQVFx1SPB9bGijF6BCFuR8gzKkAMfoA7fVnV3lxzMWReipZZzOSGtWT6LuuL05lGAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf87IiHtJgF8F/1w24LcnUk/zMpFQ4n3h29FIBJ3d++PgMtjED
	/rns1YBjwvq5/+SAOvnVPNQbMVFzn5kX3HFUQIGbNdFvdvL9ksOcNYU=
X-Gm-Gg: Acq92OG8DkgsPWf16Fe+TsBWSxk4J1QDaVa13smNBSI+h3LSpBQbJeu6lxeDPYI/+Mm
	p6E/BBKdblPI50Zmrsp3fzCWnbgWx92hvVHLpx1UfqKx/iuSNqaC6tmS+uj0HWx/YjvxhDGKyJo
	lI3PEnAZ1gu+7vocuEeWcr+kxhogZmniU8KH4ueBOJHN7CrNoXNha6Ne1exKEwIoLao5jii1elQ
	eVvkj57IEEnYri8o5l68MI4GJDzkBsDmPanfVRrROaOMEfLvLlgl40rK1bgHEJ/1S01JwYeue2g
	/K8RQTIVFcx0ZCm66V51J6wDBek3AATHRLASibqjPO75r2rTPOGDgx7VWCrpqDO0fwrCGXk44ar
	YO22w+S/njc4fupdTOdnBm4Yo4xb30jB0cZbun4n5z0gCTXnwy4t23kXB1WN8R4whkxIiIwHLAB
	ylB+ty8i7FiRltLj8SkZ7e4u/HcS5cgccz18fsnx5rDfhLRpiAg9vxpp1Jew==
X-Received: by 2002:a05:6102:2b90:b0:610:db51:6f3d with SMTP id ada2fe7eead31-67c73e722cemr11249747137.12.1779814091079;
        Tue, 26 May 2026 09:48:11 -0700 (PDT)
Received: from itachi ([2803:9800:98c9:6775:5e33:99a7:eb9b:de1e])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961737bbf42sm14069548241.2.2026.05.26.09.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:48:10 -0700 (PDT)
Date: Tue, 26 May 2026 13:48:00 -0300
From: =?UTF-8?B?Tmljb2zDoXM=?= Antinori <nico.antinori.7@gmail.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: Igor Korotin <igor.korotin@linux.dev>, Alice Ryhl
 <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, Benno
 Lossin <lossin@kernel.org>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, Gary
 Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] i2c: rust: fix I2cAdapter refcounts double increment
Message-ID: <20260526134800.096e42db@itachi>
In-Reply-To: <20260525025614.16352-1-work@onurozkan.dev>
References: <20260524181151.24988-1-nico.antinori.7@gmail.com>
	<20260525025614.16352-1-work@onurozkan.dev>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Onur

On Mon, 25 May 2026 05:56:12 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> Hi Nicol=C3=A1s
>=20
> On Sun, 24 May 2026 15:11:50 -0300
> Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com> wrote:
>=20
> > When `I2cAdapter::get` executes, it first calls
> > `bindings::i2c_get_adapter()` which increments the device and module
> > reference counts. It then takes a reference to the raw pointer and
> > converts it to an `ARef` via `.into()`.
> >=20
> > The implementation of `From<&T> for ARef<T>` where `T:
> > AlwaysRefCounted` unconditionally calls `T::inc_ref()`. This leads
> > to a second call to `bindings::i2c_get_adapter()` inside
> > `I2cAdapter::inc_ref()`.
> >=20
> > Since the returned `ARef` will only release a single reference when
> > dropped via `dec_ref()`, this leaks one device and module reference
> > count on every call.
> >=20
> > This fix was suggested by sashiko.dev.
>=20
> Including the link tag would be great.

I will include the missing Link tag in a v2. Apologies for the
oversight.

Separately, Sashiko reported a critical issue in reply to this patch:
https://sashiko.dev/#/patchset/20260524181151.24988-1-nico.antinori.7@gmail=
.com?part=3D1

Since the report indicates this is a pre-existing issue, I believe it=20
is better to address it in a separate patch. I will send a v2 for this=20
change shortly.

Thank you

>=20
> >=20
> > Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> > ---
> >  rust/kernel/i2c.rs | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> > index 7b908f0c5a58..ca6476cf4399 100644
> > --- a/rust/kernel/i2c.rs
> > +++ b/rust/kernel/i2c.rs
> > @@ -405,7 +405,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
> > =20
> >          // SAFETY: `adapter` is non-null and points to a live
> > `i2c_adapter`. // `I2cAdapter` is #[repr(transparent)], so this
> > cast is valid.
> > -        Ok(unsafe {
> > (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal>>()).into() })
> > +        Ok(unsafe {
> > +            ARef::from_raw(NonNull::new_unchecked(
> > +
> > adapter.as_ptr().cast::<I2cAdapter<device::Normal>>(),
> > +            ))
> > +        })
> >      }
> >  }
> > =20
> > --=20
> > 2.53.0
> >=20


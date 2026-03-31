Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E572C0303
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 03:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774927812; cv=pass; b=FH9CqCVMQG4/8PmgiyxxA9N4r1978UC4yBlELH/oEB0ZJcwi8f/mhrZ3gGV2su/kaVbM+b7RYEmVZbLuDDls7HQxYLCX6GkKcwT3aNOoLHDWPMul3JCqwrPyIY/S/hmaNjJ08E7kpvXGUrMDxRulytVjqC+uwSF5OfXvvAPfaCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774927812; c=relaxed/simple;
	bh=Vqz0wbjll/hAJPEOie6RM4KJSz7Fs7lEo3U/R+kG3UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3NPJbt50a9Btmxs3doBI/AZHDpORlxFMOR1nVngYDwDi03Rne1dztImcW1od1PM6gsjUG4eIp9vuY3NQ1LFh3R4BCVLxj1tB03L38dYvsr9NF2w43slFD7pEOWqkTjYjCzLsDPwvVgnl7UWoTEeNIfrxrUuWGkDjSO+r0Oz46g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qL3DKFk+; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qL3DKFk+"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b936331786dso565275266b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 20:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774927807; cv=none;
        d=google.com; s=arc-20240605;
        b=S7r4ls598Nif4rrAyYvoYKlSj1fSugyPHZF/757lhEGc/BT56E3UrNYgQPnu0i7J5K
         jm8K3w01saHa9QZ/tsCC9aaKKabh9eI0Wt0UiPP2iaqBvbvLMxG9Mh3meYqAuZyee6RL
         QXcrKISp3GLwCZKmQ7znLVWhi9MjxuHWzRFYHncs33zCM2UATYiR3KZ+1q8rYlm1u8Kh
         vmk9Q4QUtSXwjkrb9emPyKoZV9M7IYl0Luv/yLvIuBNqfd0QlcAyYuMMccHzSptj3U10
         Ei9WTBzyPfimLzXNleNA1eJ/F82dzTA56ext0zhnBhSWnH4moYr8zmQqlZvz2hbKCa9t
         1WfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fbhm8CzZ4y2XM5LEjJUdYiChU7X46Cm6Ehudfb4QOfU=;
        fh=adQC+2K6C6wGycm/O6HflptauvOBwtV1J0+aBDP2i5g=;
        b=TxqVd2Cjb1dA96kphUjkuPnu7RaPwsDCBocni8TgvV+mC1tVgEZw2g6DKrC2/3AiB1
         +1P+wB8fR+7Ll49ykrZv+Ev8a8lNwInUFzgsnIBtX5sEPSrHo3jy/sWPJyfsVcjdvNSv
         d1WbahGiF59i19u0gvnJESSYFbXLhvRGYQwo21IG6ke8wgFXWsv8CPTqLBiKWHrpsPxP
         3p7xxGH+zhEMyCRRita1Zu1O37C4xFjNjnSsn1a4NzkkpPr944KZDjoKrXmzQx33mi65
         4AcOSk+oeJ7StADQeUqpPKKItGnEfY3vQdrCtW38wU4uq22PRBdXZHC/X36DCK0Rkszz
         mf3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774927807; x=1775532607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fbhm8CzZ4y2XM5LEjJUdYiChU7X46Cm6Ehudfb4QOfU=;
        b=qL3DKFk+AhxNLVrweVLdebsnnRL9yHRQeoFEHbsvv1taablyE0qarKkxBnvyyTohil
         FPUvBCQhQGD038uilYe2wdk8ltY0bLN24EHzpAD7lt2E+BGM4BSnyr1OV0oZxmIM9hzu
         ieIwmT0HCSSt4efkdPce+/r3JoIcPr7Ge4Vx2oIuj1sYidoJPOcZa1Py1B0vbQNgqJCV
         36b+0pp7T7bZcBYWPRxeylvpvThyzgfyEp/gQNCBILusQyVwBzumnwSXCojJLHCw1BEk
         fYP53d3nwguQ72eQZe/dYgX/7ByXbfVfFIxT/USqvJWU6hFt63Ny3gjiefeIQ72VmlGT
         GGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774927807; x=1775532607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fbhm8CzZ4y2XM5LEjJUdYiChU7X46Cm6Ehudfb4QOfU=;
        b=jQkYjXF8Zy/PGjMRwhb/s6Ljt1NyIaW9dflZNhLQF4Snp+tK8M3cv2VvDBx/6UKHOs
         Q1OnDoA8Bx0QVhcvE1gALS1bPCr//6M5+DLl2vi3d/ksBtZcXkUCRZ4efMOWe8rNXoTd
         rBOJ9fQjLzfjPZTMKGXhNb4kgYP6OuNq/Y9mzbnUZ7QznzqVP/GRIVMypPROdN75CWeu
         F4RgInzI5HTw/lFrc9q82B54EOg+JhAUuwOCcYHYfIeX5Oj85+K6+Tgf600fKxASb8fl
         8eW/1j/dDZ+K4sy9gZwOX6zS1oRGv/nsBi9FGREJ2NxnT4fYVmsUCMSFWiZbyIfY9qDm
         mwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX40jx86ECNNi3fTIeJ7PqXTBFmT9PixwlCv7HBZBwOY7MFV914fM3S/lHmxlbsaItKr0oSM29CWrdVcYJCnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK8th2waenr6JtlJoLQQm1dBQ2lQuggPlnfmQZTXVXzDn6E+3Y
	fm2deUWDLX1OzzyNXmS5yq18yXh8haeu9I6fXA8d6DD//USW6JDPR9ELN0zYQilDlVuahJlMmru
	QlDcgnpBH0zlQsswTnf1kVPcqIdCe3f0=
X-Gm-Gg: ATEYQzz7s8R7j8tHJfAVyvOCV79ZOjUFg7xwED5jAVjpMEn2ghnwugc7SCCsgeKryU0
	fHm4t0VW87ul8H6OlOLl2o2foLZJC7BNn2Hp3lZa0p3vdNFtzEfyaS3eOeWSPfmigSSJ8iztChO
	fwfPu+dmGuEK8SKg5BoHOLLnGAYyocHC9bCEwzZsW9hDkdPt9L9SIc+RtE0W8pLS+CB0Bv27fk5
	jKUTeRcwScmhC3hvxuE5uFzsTQrBucrZl7NUpCUmDxeTWE4NGOXOTL+0k7XAHox/F0Dmkw9ufn5
	c8oQZO6XLal51fL891lL+1Zh6N/4KquOZ4GoFg==
X-Received: by 2002:a17:906:208f:b0:b98:132e:ca97 with SMTP id
 a640c23a62f3a-b9b5094c6femr664652066b.47.1774927806887; Mon, 30 Mar 2026
 20:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <20260211032935.2705841-23-alistair.francis@wdc.com> <20260303150040.00007458@huawei.com>
In-Reply-To: <20260303150040.00007458@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Mar 2026 13:29:40 +1000
X-Gm-Features: AQROBzBc83sivh6UcNOP_l8RUTr7K-DmfbPtqXOhOGreZW7lZXTka_jt4qB4WZ8
Message-ID: <CAKmqyKM6CBucDEo0aKZVWrKtozbT_ddk0PaZFtHyEMMMx558JA@mail.gmail.com>
Subject: Re: [RFC v3 22/27] lib: rspdm: Support SPDM certificate validation
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: bhelgaas@google.com, lukas@wunner.de, rust-for-linux@vger.kernel.org, 
	akpm@linux-foundation.org, linux-pci@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alex.gaynor@gmail.com, benno.lossin@proton.me, boqun.feng@gmail.com, 
	a.hindborg@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, wilfred.mallawa@wdc.com, 
	aliceryhl@google.com, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 1:00=E2=80=AFAM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Wed, 11 Feb 2026 13:29:29 +1000
> alistair23@gmail.com wrote:
>
> > From: Alistair Francis <alistair@alistair23.me>
> >
> > Support validating the SPDM certificate chain.
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
>
> Only minor thing inline + observation on the code that I think we want to=
 remove
> for now wrt to checking the root cert.
>
> > diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
> > index 1e5656144611..728b920beace 100644
> > --- a/lib/rspdm/state.rs
> > +++ b/lib/rspdm/state.rs
>
> > @@ -743,4 +746,92 @@ pub(crate) fn get_certificate(&mut self, slot: u8)=
 -> Result<(), Error> {
> >
> >          Ok(())
> >      }
> > +
> > +    pub(crate) fn validate_cert_chain(&mut self, slot: u8) -> Result<(=
), Error> {
> > +        let cert_chain_buf =3D &self.certs[slot as usize];
> > +        let cert_chain_len =3D cert_chain_buf.len();
> > +        let header_len =3D 4 + self.hash_len;
> > +
> > +        let mut offset =3D header_len;
> > +        let mut prev_cert: Option<*mut bindings::x509_certificate> =3D=
 None;
> > +
> > +        while offset < cert_chain_len {
> > +            let cert_len =3D unsafe {
> > +                bindings::x509_get_certificate_length(
> > +                    &cert_chain_buf[offset..] as *const _ as *const u8=
,
> > +                    cert_chain_len - offset,
> > +                )
> > +            };
> > +
> > +            if cert_len < 0 {
> > +                pr_err!("Invalid certificate length\n");
> > +                to_result(cert_len as i32)?;
> > +            }
> > +
> > +            let _is_leaf_cert =3D if offset + cert_len as usize =3D=3D=
 cert_chain_len {
> > +                true
> > +            } else {
> > +                false
> > +            };
> Same as the following?
>                let _is_leaf_cert =3D offset + cert_len as usize =3D=3D ce=
rt_chain_len;

Yep, same thing. My way is the Rust-y way to do it

Although _is_leaf_cert is unused, so I'll just remove it

>
>
> > +
> > +            let cert_ptr =3D unsafe {
> > +                from_err_ptr(bindings::x509_cert_parse(
> > +                    &cert_chain_buf[offset..] as *const _ as *const c_=
void,
> > +                    cert_len as usize,
> > +                ))?
> > +            };
> > +            let cert =3D unsafe { *cert_ptr };
> > +
> > +            if cert.unsupported_sig || cert.blacklisted {
> > +                to_result(-(bindings::EKEYREJECTED as i32))?;
> > +            }
> > +
> > +            if let Some(prev) =3D prev_cert {
> > +                // Check against previous certificate
> > +                let rc =3D unsafe { bindings::public_key_verify_signat=
ure((*prev).pub_, cert.sig) };
> > +
> > +                if rc < 0 {
> > +                    pr_err!("Signature validation error\n");
> > +                    to_result(rc)?;
> > +                }
> > +            } else {
> > +                // Check aginst root keyring
> So this is the check that Dan and Jason are proposing we drop (for now).
>
> Works for me as easy to bring back later and lets us move forward
> in the meantime. As long as userspace gets nothing to indicate
> that we have in any way checked this root cert we are making no false cla=
ims.

Will do!

Alistair

>
> > +                let key =3D unsafe {
> > +                    from_err_ptr(bindings::find_asymmetric_key(
> > +                        self.keyring,
> > +                        (*cert.sig).auth_ids[0],
> > +                        (*cert.sig).auth_ids[1],
> > +                        (*cert.sig).auth_ids[2],
> > +                        false,
> > +                    ))?
> > +                };
> > +
> > +                let rc =3D unsafe { bindings::verify_signature(key, ce=
rt.sig) };
> > +                unsafe { bindings::key_put(key) };
> > +
> > +                if rc < 0 {
> > +                    pr_err!("Root signature validation error\n");
> > +                    to_result(rc)?;
> > +                }
> > +            }
> > +
> > +            if let Some(prev) =3D prev_cert {
> > +                unsafe { bindings::x509_free_certificate(prev) };
> > +            }
> > +
> > +            prev_cert =3D Some(cert_ptr);
> > +            offset +=3D cert_len as usize;
> > +        }
> > +
> > +        if let Some(prev) =3D prev_cert {
> > +            if let Some(validate) =3D self.validate {
> > +                let rc =3D unsafe { validate(self.dev, slot, prev) };
> > +                to_result(rc)?;
> > +            }
> > +
> > +            self.leaf_key =3D unsafe { Some((*prev).pub_) };
> > +        }
> > +
> > +        Ok(())
> > +    }
> >  }
>
>

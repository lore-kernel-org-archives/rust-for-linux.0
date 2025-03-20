Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D08B1E503D
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742460060; cv=none; b=VwrZ+HyRBXnwhznIxHHwxEAnwEpmRF+rGxain2jC1+/aXXYYMUXsNvgDTg+iVM4gdqNxpeXlBiWitpRYZjjeSll3tFf6ZM3VZGQfUoMlk3NDaRiZugv+imBKV8msaSIbVSA3freEDJ+Iwx2uEmWxSL+Hgfa5GDxV6BRLOruNciQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742460060; c=relaxed/simple;
	bh=+JphUaWBHj8e5Dy/goJmtvqb5JUUBJCl4r3rVDM3IPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHusMJ13MYXSs0OUEVom44bBb+zbjOz+OGCT5bpCAmna26L/ZHoXJXdI9ju4nmAqsZpXmgU6G76w6Pn1MNM199F0fvfleT1vxBoSAQt50UPbuD1ARdj0j7QemPZtXjYm5DMoTiYpzp2mmtdluucmCAKOQga3EsTFsSeF4Cpgyrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hU/AGhG4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hU/AGhG4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe574976so2469555e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 01:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742460057; x=1743064857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joq+AsBCw/cRk0tuewc3GK3q7weyXB1E25fHZd+BIYo=;
        b=hU/AGhG4T8sfg+24Pousp30rYI0FbaMiskQArGxpHf+g1TudUs/L8024Un1VEGseHw
         bJqrycXf7yb+lPA/TDFGLkn/E1SD5oK+yn4vzh717+bHJNi78VrXbFbqZLK3rtetlKaP
         UPsbFgruL6ZNQMIAx1yV4A98ckzuU56F2aUNVlO1asxz9jPqCwAQzLn54T94eGjh3sJf
         vV8m3TpHwfQsP9m2150Sv8zrD7ezOxV1/gwBnHp0L9sLG0RysSXKbpsaAfX5xrPlm6iP
         SHEqtIl9ZEzMUH2cXqmoaDXKViEEAODiYT28czcC9Hrl0vKMx1nB1leA3FKQ9FaD0TQ/
         rJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742460057; x=1743064857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joq+AsBCw/cRk0tuewc3GK3q7weyXB1E25fHZd+BIYo=;
        b=CvLdMKiUUK8LQ5/rcKHwLA9NfadBtu9F6PfRss+DQuqtBCV+iPvYZKCl25yVUizxKC
         whGZmBQ0++ENsE6TH4TIrpYP3yV9zyaEnLVAd536JZbr2zBji+FIsm9QxJkP/9YD7HFz
         SSf7u6qY2xhZ/rkvHS6UqfkeFNV/tnGJUYEqHbBWEjusJMATrk34zZC2RJGnO8qQ4xsP
         3m/VMGZtHjrd35cGMnJ5JyANb9uf/jwL6H82ylOAEnvi+NXKiDnCFmvRNoPbCgH9HA20
         NMtAMRp5IhhXBFPVyDB/FH1XE/oHvoTDSmLT3ksIH8l1lz02mrSHJmN79u11B1N74q6M
         qhsA==
X-Forwarded-Encrypted: i=1; AJvYcCVnFzgfb4+94H6h/cZ+uAL3uTWlaAQJR3b3qLpmgENDdcuI4CQ+6ASPkxfxPzEsO4kNi/PPZwT6BRWzN1l9mA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4XqRDiAFakpOHzk3dgXwn9cP7EiQHdXik3Z1YCbg0ug/hY+Z
	MsEST5BfcZJJjYaL/FSZHZNFHX0kuIIwZ/Anad+aajBhpGaOGGV+Jfd1eWqYH7bwQ/JtOZTpCLr
	hqxtsuZ4i7WVxyeF35rSd2bzSGOqLfe1hb8pA
X-Gm-Gg: ASbGncvyRhcy3PiA+UiYZh3VsKT+IkxIFBA7kJA3XZubnwOlj3hWIUlfFGwSCXiJIA1
	sna59BmAlzhlPg7yIVAGKVCpfmeiYSsXC0CUfXqxNo+YBPPm50OLoeblt82A+OqPj95/QDaF+Oj
	1WmXub2NRuSKgnvTiPrL07IafCgQw=
X-Google-Smtp-Source: AGHT+IGYRoX+7Vs588yGWmq8/C3g+/34z1UTJnjq4uAIISiLs6lNMbMTr8uEmsIxn9Cs0JCzmBgJuVwG12+9/NJjvT0=
X-Received: by 2002:a05:600c:3b20:b0:43c:fd1b:d6d6 with SMTP id
 5b1f17b1804b1-43d43842e8bmr48239855e9.31.1742460056723; Thu, 20 Mar 2025
 01:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319203112.131959-1-dakr@kernel.org> <20250319203112.131959-2-dakr@kernel.org>
 <Z9vTDUnr-G4vmUqS@google.com>
In-Reply-To: <Z9vTDUnr-G4vmUqS@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 20 Mar 2025 09:40:45 +0100
X-Gm-Features: AQ5f1JoNNdmHyOEpMkchf2aXocskZ-uhSkAZrFXKySPwesw-HUObFmlhnFttP6w
Message-ID: <CAH5fLggvFanUvysDkZiLqFz4Ay7XSP5LF3CvxBU3xgWE3PSZXQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: device: implement Device::parent()
To: Danilo Krummrich <dakr@kernel.org>
Cc: bhelgaas@google.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 9:34=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Wed, Mar 19, 2025 at 09:30:25PM +0100, Danilo Krummrich wrote:
> > Device::parent() returns a reference to the device' parent device, if
> > any.
> >
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> >  rust/kernel/device.rs | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> > index 21b343a1dc4d..76b341441f3f 100644
> > --- a/rust/kernel/device.rs
> > +++ b/rust/kernel/device.rs
> > @@ -65,6 +65,19 @@ pub(crate) fn as_raw(&self) -> *mut bindings::device=
 {
> >          self.0.get()
> >      }
> >
> > +    /// Returns a reference to the parent device, if any.
> > +    pub fn parent<'a>(&self) -> Option<&'a Self> {
> > +        // SAFETY: By the type invariant `self.as_raw()` is always val=
id.
> > +        let parent =3D unsafe { *self.as_raw() }.parent;
>
> This means:
> 1. Copy the entire `struct device` onto the stack.
> 2. Read the `parent` field of the copy.
>
> Please write this instead to only read the `parent` field:
> let parent =3D unsafe { *self.as_raw().parent };

Sorry I meant (*self.as_raw()).parent

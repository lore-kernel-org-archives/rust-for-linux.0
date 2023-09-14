Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB83250FC
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 05:48:02 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93799118
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 22:48:01 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bce552508fso7908321fa.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 22:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694670480; x=1695275280; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fD2rLkr0gZZvOnzVQk+3yz9qXjQoadNLNaCqZ86bJ8A=;
        b=Jwy5kOWKgi4yhK4Z+sHbefklDt7enpRs8URy50Kz2HxgWx05y96x+id/pC8P4C+I25
         DHclAo5ZiHQht3+3YtBsahzb+QPxMu3gvOGmqm2BGL+z16UUuCpTGWFZ0lPeDG5RTd8p
         mmdDSI0eXlKD98tky16DFUZGX7jfqP3tTLGNIArxM+kXwkVTtKjZVUCIKS/zRAdNRdSZ
         wtlLe5hST7lRIC4z4igg2hfzGL3hj17CxoRVWioZ/+aTd7a15YjfoiPeNkcXjUIB2IaG
         cTjcpmZQLw7PepcfgEV2cipvdXH3j+TWaV4aj+UaaYn7iizaqWbsQ00/L3CbAT/5+OkX
         2AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694670480; x=1695275280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fD2rLkr0gZZvOnzVQk+3yz9qXjQoadNLNaCqZ86bJ8A=;
        b=uCUCqxBgayB6l925Zwb4qiVryVnG4Gq/Jf1PLmhGHhY92+jj97jDxoB1q/znRL2PtJ
         mw7vP6OJIFoGyPtn6U7gJWKvgT3VzKjyE4jK740UelnrTx0HEJhHGZHvZojdcwKOeh1q
         49NQbBxnrxEuanaLSg0AZCTw9TZJUa1yC0z/kLHa2fvySFim/uV+3q1drlNmdL9WxOic
         Fpt+KPFVxZ6geWk06/0Jyc1M2GdVPq5Tar+PrE4JM0HkU4CauRdmlUD+pb0iaekR7zF7
         N8ZMIKlNM0ZFi48lbvv9Z9d55R35wyXoaBtjZ5jRybmEQXgPA1g2nvJJCwrBEfrNVAXl
         nNRQ==
X-Gm-Message-State: AOJu0YyqfMeL6oRw94r+46zrwb6lXA/yhvCgO+I4SBsNmuz6m4eBAXnf
	MSiSHZQZ9jQgKXTEnDFoneBonzmaL6v+ObBAAcK0ctit6Lq6Gn+/Aik=
X-Google-Smtp-Source: AGHT+IEpnERIaAyxsYyGwa2DNManV+FR5KLK3JNPo1+DIQ19CfucJVlzBusPpLKRYjJlxMja0N3W2HBQNRjjdblO2BU=
X-Received: by 2002:a05:6512:31c3:b0:4fe:2efa:b847 with SMTP id
 j3-20020a05651231c300b004fe2efab847mr4709402lfe.23.1694670479672; Wed, 13 Sep
 2023 22:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com> <20230913133609.1668758-2-fujita.tomonori@gmail.com>
In-Reply-To: <20230913133609.1668758-2-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 14 Sep 2023 01:47:48 -0400
Message-ID: <CALNs47vAj=dLtAUiG0WGKJoZZuWRCXF8Wh8zPO+O1NUJ68Z0Sw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"

> +/// Corresponds to the kernel's `enum phy_state`.
> +#[derive(PartialEq)]
> +pub enum DeviceState {
> +    /// PHY device and driver are not ready for anything.
> +    Down,
> +    /// PHY is ready to send and receive packets.
> +    Ready,
> +    /// PHY is up, but no polling or interrupts are done.
> +    Halted,
> +    /// PHY is up, but is in an error state.
> +    Error,
> +    /// PHY and attached device are ready to do work.
> +    Up,
> +    /// PHY is currently running.
> +    Running,
> +    /// PHY is up, but not currently plugged in.
> +    NoLink,
> +    /// PHY is performing a cable test.
> +    CableTest,
> +    /// Unknown, not defined in the kernel.
> +    Unknown,
> +}

These can embed the C bindings, but it does look clunky

    pub enum DeviceState {
        Down = bindings::phy_state::PHY_DOWN as isize
        Ready = bindings::phy_state::PHY_READY as isize,
    }

Adding `From`/`Into` `phy_state` may ease use in the future.

> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
> +        unsafe { &mut *(ptr as *mut Self) }
> +    }

`.cast()` is somewhat preferred to `as *` since it prevents
accidentally changing mutability (not a problem here of course)

+    /// Executes software reset the PHY via BMCR_RESET bit.
+    pub fn soft_reset(&mut self) -> Result {
+        let phydev = Opaque::get(&self.0);
+        // SAFETY: This object is initialized by the `from_raw` constructor,
+        // so an FFI call with a valid pointer.
+        let ret = unsafe { bindings::genphy_soft_reset(phydev) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(())
+        }
+    }

`error::to_result(ret)` could replace the last 5 lines

> +    pub fn resolve_aneg_linkmode(&mut self) {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        unsafe {
> +            bindings::phy_resolve_aneg_linkmode(phydev);
> +        }
> +    }

Does the block fit on one line with the semicolon outside?

> +
> +    fn driver(&self) -> bindings::phy_driver {
> +        bindings::phy_driver {
> +            name: self.name.as_char_ptr() as *mut i8,
> +            flags: <T>::FLAGS,
> +            soft_reset: if <T>::HAS_SOFT_RESET {
> +                Some(Self::soft_reset_callback)
> +            } else {
> +                None
> +            },
> +            get_features: if <T>::HAS_GET_FEATURES {
> +                Some(Self::get_features_callback)
> +            } else {
> +                None
> +            },
> [ ... ]

`bool` has a `-> Option` function that can make the above more compact

    soft_reset: <T>::HAS_SOFT_RESET.then_some(Self::soft_reset_callback)

> +impl<const N: usize> Drop for Registration<{ N }> {
> +    fn drop(&mut self) {
> +        for i in 0..N {
> +            if let Some(mut drv) = self.drivers[i].take() {
> +                unsafe {
> +                    // SAFETY: Just an FFI call.
> +                    bindings::phy_driver_unregister(drv.as_mut());
> +                }
> +            } else {

Safety comments have to go outside the `{ }` to get picked up by the
clippy lint that we may enable. I think the block could collapse too
with the semicolon on the outside

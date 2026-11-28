Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795840491;
	b=2O1dWmBiPYZNBobq/iBRB1F30lKvLsZMxkmzZiYKM6ySJNJRXe8fHYBK59l0PMoJ+oWq
	 Tv0gtmOP2HojPWGZTszTYC+n54stLfytf+r01FDilmI66BCmzXk09iEgH4gXriSBajC4O
	 ZhDzFksdRFzpLoXJT9IRzFijkVGzdQO1c8pukLqnUA4+YlaNofgzz9E9gYFBYEj435qpk
	 cAwpU8q6zJdBe98a6U3kQlQfOBUAIoh1k0d3ZovGwusuCkFlBjrxqNGCC3yTKz6Bd19l2
	 dtCEHUamTehUKqW2zJZ84C4qQLl020vjOrepkJDpR34+q10mMxftNnYZieLO9EvJQvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795840491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ft3cUGMZwuJbnCtx/nSJpqRqOJFMOjO+enjfoT4AQ1w=;
	b=h5vX3LhGYxmtT/OvILw2noRjby1Or3pUXiz+p8qBFa4NUfE0ToiombmJ9Q00C64ixu42
	 bD+ps//2Z6KY4Q0lOi8o44Jx3GTM6pv9ZJPgRpjqkh1mDoI+CT7fxRnwzsz5xHbcZNrrD
	 zO4Oi7nWcetDtaxinOGHdNyLsdwkeR3oV2VOaMi5NeFMPc4VkcjE+4lMkHppV0wbewqKp
	 rdXFR8jcJ8F6sF9TO63bwHTZYznyR/olYp6moRILPZBhCoJfgI3M3L9HZuCwgg6rnRF81
	 EMazw9MtMlZOSmtiaLGpUdi1Ty2JSld30EnG06bDPdYUizlq1nh2Vf33dY67ng7/3dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yBlDy5ox;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E6B606A31C
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Nov 2026 04:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yBlDy5ox
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4d3dc583029so5000fac.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Nov 2026 20:34:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795840490; cv=none;
        d=google.com; s=arc-20260327;
        b=dKZxQBju6Fe1RvYlxCrhE1sdOabEa+BLZtpmKObogK8N/3eHRe3NVWf7GJx4x3KQEu
         l4a2u6bOiOOHtsg8pMMJkhXoEqlZOxL57zZcaEkazrZW19bqzRPSMWGVg+wpKwSR6/v+
         A8kRv+v9JUQy6IUmfMBdIFmw7vD8+3BTjPLDLPNxcCLqLY62VMCud9UWQFH0YrZCNsll
         TDVFLgNcaq0C4wprSxKpC9l47GEN8kk3mSasNR/umLIq2XqldofHmLX9g962skPxEwFH
         bjokRr/eSnyxVFJcnrKGSZZisTkNfVaL8+hyJOnLzLldBwXZPKQI5jwIyVyu+iAqVvHV
         neqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ft3cUGMZwuJbnCtx/nSJpqRqOJFMOjO+enjfoT4AQ1w=;
        fh=DmMuI2e5LFPDG2czc2qp8MthMIi9QZxMlrCemUY91MY=;
        b=juF6za5nPf16Dsg4ela+qIh1g6i0lP9hLwW5RvmZImKEjn5QH4de20fck6PsLpzkus
         qwTCux1CtpnF7DDyQKrCFSwLbfF+k+LVret4wq77uCIR0gYeJZJrdLFxxT4nbnAu9LPU
         WVB6WHTl9ORT1PHK7h5Pt3rowr3mR2FxfPLpmmeclaPEUE7REOZgskkX2DonkvDE/a5s
         zDDlEh8/i9tfpURUrk8pH+ERTqt7XBEXU7DNUEaZ6hVKewuZ5mhfWnTSfDI/iay8/U1d
         AyQWH8x8VH9fxD+skT8xpFd7clWoDM25zm2LOAELNxJAoVZYIIIbroZj7i2VtCiDZOZi
         tKIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795840490; x=1796445290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ft3cUGMZwuJbnCtx/nSJpqRqOJFMOjO+enjfoT4AQ1w=;
        b=yBlDy5oxOhAUHry053sMlyAdv00U90rbHk36Bz+1T0NNwtlGh+TkZxTo3VwvUNhOsz
         7JFQSZWLd/Vol7U3Llt8kBlhkze7fYCb8FLYdAGTtfhjQZ6Pc3+AWNMTZj+8bD4POi5E
         yaGB7YL6AHO1vyG9dMLloSOnSX+BW0p+mDmbXeG8sGOvNMJoZrtvla9G3crknJyLh9PI
         VWqXpc/7+wf0Y4DCQmvI24qNLzswJ6BpntvRw/EignLknmZnjaZ16M0dnFEDyvPAx3GR
         1g2f50VdrU0UlcR+eDU4fp0Hz34xpqlrHVQn/mwnLnXNolGzNsJj1F+ht4FyH3+03+wP
         k6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795840490; x=1796445290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ft3cUGMZwuJbnCtx/nSJpqRqOJFMOjO+enjfoT4AQ1w=;
        b=XmPzLuXG2QUuoDQTRo3fEthSXbL4mC1unTbj+sHOlV6KIz3B9o04vNjitxyxXVe0QU
         1AniNdqIPhBLUjARcksqm0DJuOqBoSuZLzD0hTnkExbNNhzl30eEOM9Qqk686cpr0ZLD
         pmSSjAVsuVvr2l2X8TCQCbf39RmtNiQeco9uEbCMcRTnIVe+vlvm1X2g7a28aeMBjGYs
         tr2uqc0zEvhHL/qRdBetiTKVoO3s/PIKCH9/NEXST2siOFmUEYd/gLsQdKQUzFe/OFZL
         Axz9xrUxV3hKExzILtloZY9wWFlbJYbjc6xXzO4fsqnFDW/PJYGjrCVioxgkFA2M4kd2
         Exgg==
X-Forwarded-Encrypted: i=1; AL+hErHYUqJ8H6x4/uwKfE7muUAzyZUvMxsMxkewY2OfBeQFnBIiri0/5mTLo5Tb5x4n6mHLZMPeG9eoURIEyTOA1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OidfU5Mg4wI3Rf8lqFZyBAml4txzfa2j/fzERgTNcwfzol2Pa
	dom2eHrkHaR97QZe7ppA09JeAca1ogJHTmzEYxwxKo42Xeni92U5CHbFHSZskVL5u8KfHWceU7n
	WYvyvO/Qjxu5xluZCKx7f8cnHMSUYR/0=
X-Gm-Gg: AZFdTZd1oDH0QUZ2nIaYAQRqVdUUGx1kD2hGm8BXDm3diZzOM+G+JMAN9z26z4LKfzg
	IZzfSFg2EJwRjflZoZ1cI8iQskKHVmJ0Uxg4RCYB2aNrsABOavPcyfYsHNEfBK/wk+LepELfaOt
	tXiyXdNJ6eRd4eSCHc45DxwRbNZLh4l1MJbGUsIJ1DWWFOuuensnBQ08nJWKMLKKHbQBK710Qhb
	ZZxJNn3I0HQp0/9XSUeNSTNkyhabfiqnriTX6Tjgsfc2BHSPSG5+DYkMmrMo+D+wW42aQmLgiFB
	N9uzmUTwGvY+70PX3W7vwH9sXsGS071LwXU83gWszCWRwd0tBVefrTHscc3lBwnsq5UTEFpWhXF
	cKwIgYiitbhSO9Q4Cx/mD5HKOtmWkUoAvDU3t5HnZ9/iOqCy2GPRBTmo2xru0d7imf8i91p3Szi
	p3W12z7dorrO0IZSivNmczRvCz1hYTEQceb2iH6nHKAEFOaBPfqb8g3f++
X-Received: by 2002:a05:6870:b154:b0:4a6:f676:ecef with SMTP id
 586e51a60fabf-4bc85902a3cmr23268703fac.55.1795840490274; Fri, 27 Nov 2026
 20:34:50 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-exp-phy-rs-maybelocked-v4-1-16f9a10bb579@gmail.com> <179579171493.3135.13012003515691317246@kernel.org>
In-Reply-To: <179579171493.3135.13012003515691317246@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sat, 28 Nov 2026 13:34:39 +0900
X-Gm-Features: Aa3M54oVMmGH-ZjaDn3eIIdiuG-rT6kTcFR9f6TCVy1lL0hu446KZxkRFm9B_ts
Message-ID: <CAGAB667-6_gX7_q13GvgmAZQGHNTqxxJ5_nWFLrpvA42ZfAzBg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] rust: net: phy: take &self in methods
 that do not need phy_device->lock
To: netdev-bot+sashiko@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 28=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 12:01,=
 <netdev-bot+sashiko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> rust: net: phy: take &self in methods that do not need phy_device->lock
>
> This commit splits Device::from_raw() into a shared from_raw() and a new
> from_raw_mut(). It redefines &mut Device to mean exclusive access to the
> phy_device state that phy_device->lock protects. The getters for that sta=
te
> now take &mut self, and phy_id(), read(), write() and genphy_suspend() no=
w
> take &self. The callback SAFETY comments are updated to say when PHYLIB
> calls the callbacks without the lock.
>
> > diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> > index c4e7b1d6c6f4a..bb2cc6b3c94c8 100644
> > --- a/rust/kernel/net/phy.rs
> > +++ b/rust/kernel/net/phy.rs
> > @@ -57,50 +57,71 @@ pub enum DuplexMode {
>
> [ ... ]
>
> > +/// PHYLIB calls the callbacks that get a `&mut Device` with `phy_devi=
ce->lock` held, except:
> > +///
> > +/// - [`Driver::probe`] and [`Driver::get_features`], which `phy_probe=
()` calls without the lock
> > +///   before the device is attached.
> > +/// - [`Driver::soft_reset`], which `phy_init_hw()` calls without the =
lock while the state machine
> > +///   is not running, or from a MAC driver that then ensures exclusive=
 access. `phy_mii_ioctl()`,
> > +///   which PHYLIB documents as "use at own risk", is outside this gua=
rantee.
> > +/// - [`Driver::read_status`], when a MAC driver calls `phy_read_statu=
s()` directly. The MAC
> > +///   driver is then responsible for exclusive access.
> > +///
> >  /// # Invariants
> >  ///
> > -/// - Referencing a `phy_device` using this struct asserts that you ar=
e in
> > -///   a context where all methods defined on this struct are safe to c=
all.
> > -/// - This struct always has a valid `self.0.mdio.dev`.
> > +/// - `self.0` is a valid `phy_device`, and `self.0.mdio.dev` is a val=
id `struct device`.
> > +/// - For the lifetime of a `&mut Device`, no other thread accesses th=
e state of the `phy_device`
> > +///   that `phy_device->lock` protects.
>
> [ ... ]
>
> > +    /// Creates a new mutable [`Device`] reference from a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// For the duration of `'a`,
> > +    /// - the pointer must point at a valid `phy_device`.
> > +    /// - `(*ptr).mdio.dev` must be valid.
> > +    /// - the caller must have the exclusive access that [`Device`] de=
scribes.
> > +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::phy_device) -> &'a =
mut Self {
>
> [ ... ]
>
> > @@ -309,10 +331,10 @@ impl<T: Driver> Adapter<T> {
> >      /// `phydev` must be passed by the corresponding callback in `phy_=
driver`.
> >      unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::ph=
y_device) -> c_int {
> >          from_result(|| {
> > -            // SAFETY: This callback is called only in contexts
> > -            // where we hold `phy_device->lock`, so the accessors on
> > -            // `Device` are okay to call.
> > -            let dev =3D unsafe { Device::from_raw(phydev) };
> > +            // SAFETY: `phy_init_hw()` calls this with `phy_device->lo=
ck` held, or without it while
> > +            // the state machine is not running or a MAC driver ensure=
s exclusive access. The
> > +            // `phy_mii_ioctl()` path is outside this guarantee, see `=
Device`.
> > +            let dev =3D unsafe { Device::from_raw_mut(phydev) };
>
> [Severity: Medium]
> Is it sound to call Device::from_raw_mut() in soft_reset_callback() when
> the SAFETY comment says the phy_mii_ioctl() path does not give the
> exclusive access that from_raw_mut() now requires?
>
> The new invariant on Device says that for the lifetime of a &mut Device,
> no other thread accesses the phy_device state that phy_device->lock
> protects. However, phy_mii_ioctl() reaches this callback without
> phydev->lock, and the PHY state machine may be running at that point:

As discussed on v3 [1], this is documented as an exception, see the
Device docs above. Passing &Device to soft_reset would drop
genphy_soft_reset(), which ax88796b_rust needs, and FUJITA agreed on
keeping &mut Device there [2].

[1] https://lore.kernel.org/all/bfd7a44f-2bba-4aee-9758-1dd88f94566f@lunn.c=
h/
[2] https://lore.kernel.org/all/20261126.081155.1605990248496749195.tomo@fl=
apping.org/

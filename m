Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DD8268C42
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139037; cv=pass; b=VU+thayTCdf6yMkXSs/MBkjj0wtAlbzXQ9aFSx+/IPQqRCPqIjE7sgu8mKHT968v76RH8atkTeU7Nbqv2+RJvE3aXyfX9X+maPToKjTq4YOxeYYbd9XebIMi7UF5/P7FPNF+TcsmZdm4Iojwqk3zr+4kuXDlGDvOSxhAc39YeJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139037; c=relaxed/simple;
	bh=UfW9ZbxSawettNRPZsiTFt/maBVXyJ58Op3z17lDyS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3wVVOJ02A5R9sGQJayVeCfYwY+vPjFHzwNb3s/Ec+vt/r6QjXHBZro8fz2Nju3Lb/jGonazonsxSQA0y7qxytju56dE6ikJzh+WL4rDB2SpeVa8ywUWLd6fUoIdC4q1FbotU0E4SxzJuknwut2SdqHzdxsOi8qM9mvOVLYSTTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2zP9ygPz; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2zP9ygPz"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64baa44df99so11569a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 09:17:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139034; cv=none;
        d=google.com; s=arc-20240605;
        b=LbcdF+bHarhOzLgNUdFLHqp+SQ/iAPXBjbuyS3KNy2rHBXO2NGhhkQXewis34KfRom
         UM8Miw0Q+dWUO2qvM3yJnx/wI14ExfDHCCasLoNgFvwVQwTSi45yPNiRgdVquw5r7udp
         T4fP2/k2o1uTwRzjbwIOKLtZiNOwXWSKqV6seGiF6P+0tJMKuexyS5Fy1MsywqCIbclc
         m2VB+i53fkxqjWe+6FZk/k3ZMcMxYEWg2lqKKRNandZD2Cr0ODgA3srIzZbWyhqTuCIr
         g3MlyU61UrmE9/kHquQ9OFd8f6tRbFd4mnLbgIgrtARDFxR7B0xhSYeLGeidcpMsYioR
         rhHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XHfoxmbIC6zkgG4vIkE5TIaeovg1Amtxgwva3GX0OJ0=;
        fh=9TdBQT3kEc2Ai3KfpoUbVMDsdwbQnRkn37Zcm8hvbhs=;
        b=d8Z4tcIOHtfQXYRx9MohCnPvm1DN/KagqF/+Z61FjnVMzGQousXbpXq81ziL8aNrWX
         Q1EoO7CoN8e+nd0b0QLwExon/IMnF8x3l2jJxU3U1R8dXAC2IyBldha1ZzwUhrAR6A8g
         87XMKPx9ShKI7NdITs8LXVNAMcwH8PUtdHhMvtoM+SQhM//IurG64s4yHd8sXCXssG1G
         EtmQ8iYnKq3KcZWcAxP87aTcUItiskJymhcZcgiEk0bj6FVpNNjxLAuqFyRPRTNAeJbU
         LcSMWUQOPuO5WwH2T+fE+wSEenuiVl+Dl8KiKl3x45908pIyBst7fSnx5wp+G8v+dNuc
         di3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770139034; x=1770743834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHfoxmbIC6zkgG4vIkE5TIaeovg1Amtxgwva3GX0OJ0=;
        b=2zP9ygPzccVKuiAOI6xTBQpsDESi9xsN6QT2mfVqjkIg6XHDobTajpmX3KeMiMhJ26
         5xBHIFz8pBVqZCGxkUzrnncQAYGu/f1MbkIKoTa1APp4gAU6sU7namwRuXPiyLX4ehRa
         vW2mHaj8UMF+hMlnqhG5kHjaSzSLmRA8gL8J2G3Hhmy2Knxjzs5xCmcNsFkokts/f2cA
         mnlk3z70DsT+fUtx2DgX8KZvlpflrwtr/c+m2uE/VuDowMQetQNsTSvKHrk/HQ1WlCls
         AOCLeMG5DQp33lBySEkNwroGTO0PT8Rjs9RT28d0QQ2B469pJPHEzmUT/XrIv+FoQsD6
         /+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770139034; x=1770743834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XHfoxmbIC6zkgG4vIkE5TIaeovg1Amtxgwva3GX0OJ0=;
        b=cuX+DXPzlm95KrEdPqNqlmom0Cq0Bl4UYd6cxARwQ4727VP+OnM+vIF4SbnVOEAGBm
         saq0i8b1Z1mREmHmYuE4EqMEoggjiK7kfVz/3Vc3Ch8uFBiftSlpYAOcVCcfqcdewVv2
         6DTK1tpF5NW4U70w6XBlzaqtwxjpyfCot9FetZXDcYhcAM/Vw4B+HoGqLz2TKO5A30rG
         wgmipNJMK3vE8A5azW7+hit8AcGIXrNbpCItqoIimy11ncDO42bxPOEGtrqIHNun9Ha+
         jXO9Fhyp78W4PdmXrPs3ls1JkoPEnGL0wDTAwfR9uRnPYztv5e6OLoe2yiGVdFV9q0le
         h9bA==
X-Forwarded-Encrypted: i=1; AJvYcCWeVTLNguVHko/ysty/s4aAgcuiXGSO7vUVIygWj7Q6DFNSiskAVvVz7U0XCvJbOU4HLK7eMHSle8O+Hfddtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmst1Bgg3HQJ1O1avQ0qy55RZj57JT9CxyfP8qkaGdZdWJtBpD
	7qsAb/KQ74ZjC4Fnp1B+thkrWbJYIHUqBMy2GOfShNQHjkD8AiDJjwpght1ea4aMduqeei3lJ4C
	v8IcE6fQL75VsOtHcWcUHyvc1zLQ+0n4YC1IzB0Gh
X-Gm-Gg: AZuq6aIKgB0WxiFqLUTygoNIVk4YwdAKYi05sp3cwxFfMFOCs/yXCrfpQERpnlVnO9k
	jSjiB2mLWuf06NrQPzKzgGUy5xf7kDyuYO9ziWAXThxAey3ENa2z8EAe7tj63vaLp0DSZm+BU+g
	Fd7WzJ3li+EDz51qsiwiw1G92i5FT9Y5jwgUz+9JYp5g8pkPr4eiIT78tO9DZNdqFuO6WfRfOwf
	2IHlEt7zl7yA5lUtnUOn3ctTe84NQcyHZqoGBllVftcDqnUko4muhXgAjhKCa1lF4x4SRBTdoIE
	agr+bnxuWFSj5bHj4rhnbSi7AamzcVyf2CBA
X-Received: by 2002:aa7:c1d8:0:b0:64b:53a1:7b09 with SMTP id
 4fb4d7f45d1cf-6594a34b6damr3702a12.14.1770139033838; Tue, 03 Feb 2026
 09:17:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
 <20260203-qcom-socinfo-v2-3-d6719db85637@google.com> <2026020338-gratitude-overplay-98b0@gregkh>
 <DG5GWC5MR1ZC.3VFVRL0G0NMUW@kernel.org> <2026020342-dime-sharply-3fd4@gregkh> <DG5H9N9QKZUW.3KLJW09OBNRD0@kernel.org>
In-Reply-To: <DG5H9N9QKZUW.3KLJW09OBNRD0@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 3 Feb 2026 09:17:02 -0800
X-Gm-Features: AZwV_QjJ5I2wN6j4AaSDIxHXnmaEEy8I5VLzgVrY-Rhll20Eq-wK6CGJrbI2UCY
Message-ID: <CAGSQo00M_6-6S3Yr4sLdGkNH_KAgP1FoC3zbdwdFuEOxic5vqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] rust: device: Support testing devices for equality
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Trilok Soni <tsoni@quicinc.com>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 8:46=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Tue Feb 3, 2026 at 5:40 PM CET, Greg Kroah-Hartman wrote:
> > On Tue, Feb 03, 2026 at 05:29:16PM +0100, Danilo Krummrich wrote:
> >> On Tue Feb 3, 2026 at 5:17 PM CET, Greg Kroah-Hartman wrote:
> >> > And I don't see what patch in this series uses this, am I missing it=
?
> >>
> >>      impl Smem {
> >>          pub(crate) fn access<'a>(&'a self, dev: &'a Device<Bound>) ->=
 Option<&'a Mmio> {
> >>              if *dev !=3D *self.dev {
> >>                  return None;
> >>              }
> >>
> >>              // SAFETY: By our invariant, this was a subrange of what =
was returned by smem_aux_get, for
> >>              // self.dev, and by our above check, that auxdev is still=
 available.
> >>              Some(unsafe { Mmio::from_raw(&self.raw) })
> >>          }
> >>      }
> >>
> >> It's used to ensure that the Smem provided by the auxiliary parent can=
 only be
> >> accessed as long as the auxiliary parent device is bound.
> >
> > But how can a parent device ever bevome "unbound"?
>
> It can't, that's why auxiliary::Device::parent() returns a &Device<Bound>=
, i.e.
> as long as the child is bound the parent is guaranteed to be bound as wel=
l.
>
> The point in this implementation is that we need to prove to the resource
> container (Smem) that we are allowed to access the resource, since it is =
only
> valid to access for the duration the parent is bound.
>
> In the end this is equivalent to Devres::access(), which bypasses the Rev=
ocable
> if we can prove that we are in a &Device<Bound> scope.
>
> Having that said, the code should probably just use Devres instead. :)

Not using Devres was intentional because:
1. Implementing `subrange` would require more unsafe / invariant logic
with Devres. I would need to either wrap `MmioRaw` in a wrapper that
maintained that it would always be inside a Devres that owned it, or
wrap the Devres<MmioRaw> in a wrapper that encoded that invariant.
Then, I would need to propagate the `dev` from the source `Devres` to
the derived `Devres`.
2. Devres is PinInit, so I can't put it in a vector.
3. I don't need the destructor feature of Devres that necessitates the
extra complexity, because this is morally a checked borrow, not an
owned value.

I considered adding a more lightweight `Devref` to the kernel crate
which only supports types which do not implement `Drop` and access
through `access`, and so does not need to be `PinInit`. However, since
that would still require the manual dev propagation wrapper, it seemed
like it might be overkill.

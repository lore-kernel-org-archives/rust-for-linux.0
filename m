Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C772DA75C
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780302656; cv=pass; b=lRuPUfH0Gh1i4jMEZXmhPA5k8GzWAqWlkdFPpGsdtF5u3wiiWpAkl/2MmB+WB1axOtbXL4dLSdscDhg0CrOtZV8Yy/wkb6HWrr0ugI/A0m5Wih7GNuyBWmw4/I5ZcHSpYeCjQhA4op2Uk3VLaH+lC206rmHqzlCgrz2LHXhJsQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780302656; c=relaxed/simple;
	bh=dqkqR4BnOVQZ1yByVkkIKp5wLe1EcgY0DOuGCt7r8gU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrtYw1QsRd8FeCOBLYE5xKmqPN94IbP7/ha6zjCJBtuyJ0oa5q4H4IwIromL1CzLvchHMPKpsllUrpvS2yn9b/h0PnmCJRkmu/lVJX7nku7RM6VQGbt2ECL154cyNjesPzvCeMR/eYj0HJiRebXSLTwh52vORyKnvY1REsxdC/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbJ1IA3o; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbJ1IA3o"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa63daf2a5so1393810e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 01:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780302653; cv=none;
        d=google.com; s=arc-20240605;
        b=EP2Q3ZWyJdOLBb7a/sAns/FdMmgQBCxynC93pnegoRp3qvDOP6NC/2h/KDmPMwpygl
         IOWn2mrkoHCXl9l0/sFsJLO9Q1kkidsFdTWR16xjS1lJlenm0wQ8LznZ6iUrilVZy7v8
         mgtushF0ktnRmdtY+V6NUyTGrOy1TJ81dHk4sY0Lu+0b//t6IIets0fNqV2NTEkUs+Dd
         m12jm/ICs47K+Sh3Znlql5Dg/2vNHILewfKETeU2NpOGucRM8dMbeSOuwA3LbhuNYmCv
         1FqXgoWnMYUHeJtDJGzO/i+s2u8W1C6qmbJxFBVYMDKBg/QiJLlmf1JYU0JDLJ8BAC3u
         vUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YypMuV9q9YXVfPhMTCupjt06XXyEV6MtVbgxq/LZL/4=;
        fh=171vD5Eho6M+kbiZV8qxTPom047yx/7KjtU0AsS5TbI=;
        b=Kz/jYe5VffWriePEvdjACNArD+SoA5gYXVlmn/BZQJzENRQGQidcixVwnXq2G2buNy
         wxvjHelm1xn4hT6BZCAHvleRnctk1+wVMUP0FetglDx8+stFeIsFqfqClAsn/7HyI2D9
         wP+/feM/1nvZHzU8nyhQe+SWOU0x4SeseUXn0xZmjZNbnXET7tdyeppv89+Wcxwlm+gW
         vRDii/cXZrS6ST0/A9DkcVtM2K56exldnJqFF9o8OUGvfq243vvqAPJ/4MchKw7BL3sW
         fTf4sy0cUzYvvX11Emr+2I8zAwhBg491C6+N6p4tTXbgK3Em99QqSP05w1zb7TYxMmPn
         EBsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780302653; x=1780907453; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YypMuV9q9YXVfPhMTCupjt06XXyEV6MtVbgxq/LZL/4=;
        b=XbJ1IA3o9rZKqeJ/peV7u3sd4AJmq/DWhaPQ067PlO7lu0hq3GakpVKmLieyjaJGNO
         QgLFYA9Ay5m3kthbb2xgmqeVRnsXzwzrg/8yOE0u9NLr1+1aX5NIpQYw1lvuk2vBfmfy
         4eJQcyEvOVlqfvjxncw6uPMEYsIMQi1WuAH6cocK5lf7yGPFGAy5GH7pLaoj8hxfHnGw
         AJdH3BsmqR/Ud92B1LwDSqX5Q9crZrJBi7qmjApRu/mfifRRJBbbC1Nk8b/Z23bsrfpV
         x/p3fudziGgQilYE9KzO1KL4twQCyyv6//W3DfsiaDZ3HpPboHlkX9SjryD1Q8gYjyvc
         gXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302653; x=1780907453;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YypMuV9q9YXVfPhMTCupjt06XXyEV6MtVbgxq/LZL/4=;
        b=Rkh0bjqvmxHV5VQxKoibpcBOXTTmUTcwF8MLWGKzKayKewfjt5kfXetlB4lxREYQ8A
         T0yfyirnUG9ZfduYhGQ39AE8ZPsaYJl/OO7Uuv99tmtlBakWCRG61L5fENc4d23itknQ
         SYFIOZxLlQzM8UBZSXX5eZZ4BYOPINwScZ/JhWvnIcRligX96oqoE99+ItciCDWcQ4Bu
         RURL04jjslPVF1sSupcCA+ogqJ6s8zCBSqNQfPih9vYH6L/sslsC1mn91ztxbLjY4/Ir
         ByT6fDvKpB6CKG28JgN+of4VNybMKLehsCntc1g1N6NUyY/TbIga/nNqNxjaLPeGxcVr
         TMpg==
X-Forwarded-Encrypted: i=1; AFNElJ8y4vmRWdgYQehzYAplwQO3YIlrGb2RDd2tcgiks0PwI4+2OAU8uw4LD/y1VC0dBbH1Yr8naY7FHpumAKndrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9o9sXrJ86f4wzzJyoDF3DJrOZBNxppq6baxFVrjTEiMEvTa/X
	caYKLS/AgWiFYSECvzKQkJdFckjU1Z0S4wCwiq0DlKhbQ6dzdvyGIpMa6ZQ77KmM4GkaV83xd9a
	WlXh4CmMYSgYriIwRBpPcFQCksTPhQQw=
X-Gm-Gg: Acq92OHtbLulW0nUsLwAjChIfqg6sbaLq6AJGrYuevFAJycM7YQaQknaiKxcqBoyx+V
	990N9rtaYztOPqyVOWxI/+1r/qADk8dr3LXBvF2qfwHORvq8xbv67ZxaoeSg15ieoWwSrTP9QBR
	q4NN/87ym/PsipgKCjMdvlGIrGnU11P2pPoZt1QzoweB/Q+J7kC7t7WHwH0G1rll/wyG+B3w4a+
	KLqJ/0osSrgKPFZRyE/cFGkiewob/7p602MCSSf46A3L4W0QKe2dog5oLz6L1qVFab0q3jfLmer
	/RGo1Iifp9BkFWtyDqYWtzmXbpkMkXN5bsvVeWPpzs/YzqowOLtVsT/kTS5efec=
X-Received: by 2002:a05:6512:24ce:b0:5aa:6d83:800a with SMTP id
 2adb3069b0e04-5aa6d8381bdmr522214e87.16.1780302652412; Mon, 01 Jun 2026
 01:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524132824.54918-1-muchamadcoirulanwar@gmail.com>
 <20260524132824.54918-3-muchamadcoirulanwar@gmail.com> <20260528170927.65168836@jic23-huawei>
In-Reply-To: <20260528170927.65168836@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Mon, 1 Jun 2026 15:30:40 +0700
X-Gm-Features: AVHnY4JErnspeaoP2OZI2ukHg5O69BCq1jevCR3XrllajWyDd-8YbOzEVDhD6E0
Message-ID: <CAO26r3QasDuUo2_7qrJfPtQer-UP6K6jzg9=RhDRT8OXN5BK-w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/4] rust: add minimal IIO subsystem abstractions
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Brandon Saint-John <branstj@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 17:09:00 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> You'll need a lot more stuff before it makes any sense to be messing
> with claims on the state.  They only come in once drivers are dealing
> with buffers etc. I'd leave them until then.

> As above with the level of bindings you are doing so far, neither of these
> should ever be called.  They are not for use by drivers simply wanting
> to serialize things but about controlling the ability of the IIO core to
> change the fundamental data flow from simple polling to streaming data to
> user space accessible kfifos.

Understood. I was conflating "serialize concurrent sysfs reads" with
"prevent mode transitions", which are two different things. The driver's
Mutex handles the former; DirectModeGuard is for the latter and has no
business being here until buffer support exists.

Dropping DirectModeGuard entirely from v4: struct, C helpers, and the
trampoline call. Will bring it back when adding buffer/trigger support,
where it belongs in the individual driver rather than the generic
trampoline.

> Sort of. It ensures the state doesn't change.  Given buffer/trigger
> operations only occur when in a buffer state it sort of prevents their
> operations. That's not including stuff like setting up buffers though -
> just the data streaming.
>
> Anyhow, kick it in the long grass (drop for now) given you don't support
> buffer state. Good to see what this probably looks like though.

Noted. Good to have the shape sketched out at least.

> We only need to do this if the particular device the driver is supporting
> needs for the specific operation to ensure that no accesses occur to
> the device. We should not do this for reading stuff back that is cached in the
> driver for instance.  In many cases devices have interfaces where absolutely
> anything is safe in buffer modes.
>
> This is unfortunately going to be hard to do other than in specific drivers
> that knows those rules. + doesn't belong here at all yet as a rust driver
> can't get into a state where this fails and should never be relying on this
> for its own synchronization (e.g. between concurrent calls of read_raw()).

Right. The trampoline shouldn't be making policy decisions about when to
claim direct mode, that's driver-specific knowledge. Removing from the
generic abstraction.

> why .get() for this one.

I used .get() because NonZeroI32 is a wrapper type, meaning we have to
explicitly extract the
inner i32. Since the other variants use a plain i32, they don't need
it. I'll add a quick comment in
v4 to clarify this.

> The data accessed in c by iio_priv() is zeroed, not uninitialized but
> I'm not sure that's what you are referring to.

You're right, `iio_device_alloc` uses `kzalloc`, so `priv_` is zeroed.
The SAFETY comment was wrong. Fixing in v4 to say "zeroed memory" and
note that PinInit overwrites it with the initialized state.

> Can channels be static const?  It is in most IIO drivers written in C.

Yes. Moving it to a module-level static in v4. That removes the KBox
allocation and the lifetime question around `indio_dev->channels`
outliving `priv_`.

Thanks,
Coirul

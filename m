Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16046EBE
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Jan 2024 01:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706231055; cv=none; b=ufKwjJQUKmeav3mnfwCRbJvwiJ0NwNdy25NMzeB/EBDf/B0UBnIJwSQlxEYCNoF53+bYKxqUFh4ob7mrWobYKpOfpcEOFbX1kZc2Z8rGXVgL7adj4faYALODmsA2V9zgahnNg0CUBJ1Z0hvmUMMqUTyXMt7R0azrJ4hr2Zn8S8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706231055; c=relaxed/simple;
	bh=IMhLnx9xbW48kwVMOCYB/mfHRVdRLA2M1LkvQ2JdkU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+/BVZ9mKZ7nOF1Os5nZxly+iO0hVXCLksFJEkSY3oixB1B5uQbHSmnXh9Sn7wKMeG1QDKkU2V7malhNNTCWvgYfUep3dg2bK+mMC34aq98wB1+w8mHbVpJ3jQQOo58yTtSkCZk+7FEkH92q4ZSjNofPPFqy8BUfiuikhgqGwto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=nAO/x5w3; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="nAO/x5w3"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6dc8b280155so190684a34.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 17:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706231050; x=1706835850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PL64YswD7CFiTUaHpI0NdxPc3Rjg3ZkzZFm8JxzGTk=;
        b=nAO/x5w39TLkT+3EBoNqTq8WN5rGvV/fuF0Y4n7Kx88IvuSzMl1b9SNaNr9XoFR/Yf
         OCoXYLA/StHvl+vRzZMmoa7Wu9rqfoUJQfpa/Ap7vcaUXyA2g4OSnif6OEI30ocgWeAE
         3a3j0YVNEIXHkin2kSZJXeWaZX322q6+CMTtcwKcmB/Vk3I5667tZMXwg4KtadlulEHV
         E9AH/gmKlaS9IKLzQ5O3Sh6MRjh75ULPtnAYgYS7gZgEjpF7MQ9UXrtDCQXS+g55OJj0
         D6hTnJtuB8xeCC8kRw9UgOrHcViHzfknmft60sMeqZGw7D9LuUrKz9hvmwRA6+qyZ2Jn
         ohuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706231050; x=1706835850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PL64YswD7CFiTUaHpI0NdxPc3Rjg3ZkzZFm8JxzGTk=;
        b=PRuAJpIL0Vt3VQnrGOdAjZdyIDJiFGkHXjgCCwdcs9qHxuegU9EP/48iIdqds5WhO5
         0cAbPAVHaj/HuVvdWfO38nviJs5F+CF5Vuc02njcdW8H73udNJ7gyYM13eyX8ys0eyTs
         8hvIs5FmrY9Wadc6DP1rOW6a2IbBUBl0Cf4Cfh9PuvwHZGJpVzqBar9J9MsSjjDQp1Vd
         44fwyD9ZP9N/SupnJSVAbUK0DaON9pXrt6luhMMPxNATAgMFCmr7+TrvYh2bD6m/e1ln
         znmMNybpvJq7C95RgSQqgNeqchcXgpRl3Nb1qVK0BCqjzkhvlHEUJQrg4PXuwAUZIiqC
         0Ndw==
X-Gm-Message-State: AOJu0YzdVLK35and5L9O6ZAB5CzkHXsqROBAITmdCkE+XTofcg1CQDf9
	TUkEVQOhRvlnRqhb4yNWUIymScHOTqLvfuHhQCi/YtypYZX2r+9/ZzcvZunMLh96vNlzAabbzph
	f1UgxUOtrA/k1DbPXBXF1Iu01a6ljKlQw2cWZ9g==
X-Google-Smtp-Source: AGHT+IHDekCPRm2mSK6qL8gb1p+BYNr4/QRFxWvi7ZWDLrj473whl/qU/+4rlNuzJAVEmy4Lh1125xijVk9aix9Qr9k=
X-Received: by 2002:a9d:799a:0:b0:6dd:dffa:ef68 with SMTP id
 h26-20020a9d799a000000b006dddffaef68mr612112otm.71.1706231050156; Thu, 25 Jan
 2024 17:04:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125014502.3527275-1-fujita.tomonori@gmail.com>
 <20240125014502.3527275-2-fujita.tomonori@gmail.com> <4573a237-dd18-4ea0-8de4-8b465eb856c7@lunn.ch>
In-Reply-To: <4573a237-dd18-4ea0-8de4-8b465eb856c7@lunn.ch>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 25 Jan 2024 19:03:58 -0600
Message-ID: <CALNs47svLHD3=LFrhi=zf4hdr--e6hGjTzT5X_U9yd8q5r7G7g@mail.gmail.com>
Subject: Re: [PATCH net-next] rust: phy: use VTABLE_DEFAULT_ERROR
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 11:42=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
> > @@ -580,12 +580,12 @@ pub trait Driver {
> >
> >      /// Issues a PHY software reset.
> >      fn soft_reset(_dev: &mut Device) -> Result {
> > -        Err(code::ENOTSUPP)
> > +        kernel::build_error(VTABLE_DEFAULT_ERROR)
> >      }
>
> Dumb question, which i should probably duckduckgo myself.
>
> Why is it called VTABLE_DEFAULT_ERROR and not
> VTABLE_NOT_SUPPORTED_ERROR?
>
> Looking through the C code my guess would be -EINVAL would be the
> default, or maybe 0.
>
> The semantics of ENOTSUPP can also vary. Its often not an actual
> error, it just a means to indicate its not supported, and the caller
> might decide to do something different as a result. One typical use in
> the network stack is offloading functionality to hardware.
> e.g. blinking the LEDs on the RJ45 connected. The driver could be
> asked to blink to show activity of a received packet. Some hardware
> can only indicate activity for both receive and transmit, so the
> driver would return -EOPNOTSUPP. Software blinking would then be used
> instead of hardware blinking.
>
>          Andrew

`build_error` is a bit special and is implemented as follows:

1. If called in a `const fn`, it will fail the build
2. If the build_error symbol is in a final binary, tooling should
detect this and raise some kind of error (config
RUST_BUILD_ASSERT_ALLOW, not exactly positive how this is implemented)
3. If called at runtime, something is very unexpected so we panic

To make a trait function optional in rust, you need to provide a
default (since all functions in a trait must always be callable). But
if the C side can handle a null function pointer, it's better to just
set that instead of reimplementing the default from Rust.

So it's up to the abstraction to set these fields to NULL/None if not
implemented, e.g. from create_phy_driver in phy.rs:

        soft_reset: if T::HAS_SOFT_RESET {
            Some(Adapter::<T>::soft_reset_callback)
        } else {
            None
        },

If an abstraction does this wrong and tries to assign a default
function when it would be better to get a null pointer, then we get
the build error. So this is something that would pop up if the
abstraction is done wrong, not just if somebody writes a bad phy
driver.

VTABLE_DEFAULT_ERROR isn't a kernel errno, it's a string printed to be
printed by build_error or the tooling.

- Trevor

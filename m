Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD20309EFF
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 00:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362688; cv=pass; b=Bf8GzXDGHGfBeXqgRv6NWOrycxjZys/Hls8tQE/uw1fCRbDSwS44etO2oUK74dEueMEhf+P+3Me4/w28IcEasaYK+j6CzSEM88HbbP1abp0u739En4JmuGig1EErrrNyaFC22YIRKTtWX9Il/TzA0/6j+k2jiKfEYoffkqCI/iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362688; c=relaxed/simple;
	bh=vEE4ep3471N407vnkg/dcy+srHoLtul6c5WBfTWv6RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIW3SNDsMFdHa5GBzgLvO9TI3+aF5bc1qxWkGYNJOowoYOg9uGUNcTSO49aM3BesNm8ugVbV6d25EmZjxEyGoSdZoIfE4ri043eV2E6F8QClmIwZjKqNRdJr6wsjwd/D+4lScnd5cF9kApjiiI4sUWTc3U371c7g/1+mPKOqmXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EL4whyQg; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EL4whyQg"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a4234f91dso14321511fa.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 17:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773362682; cv=none;
        d=google.com; s=arc-20240605;
        b=EAa41SW8eL4HV/8z3iY2PqjB55zd85fOdlBs6epQtLy+p6aSKjult6sbmaq+sYQp5h
         ZUuH9usS7ibacrs//O+3JSCQrXAFJOtVrmu4XdKhk9k17yUD7fbcsQmG0YAkUsxHNDYj
         20sJJ/ZkyZXTDgQ8LCUgxJqCgfpvwZP22AwvCulvKTWMEXy1CFaLmkEAUtdLNwmkW7CD
         IyTJ+7p33TKSHjs4YiYAmChMinbsvpv5Yy1/CBtCrnLN/Ah10qFSJV9a35Oraw+HlTXI
         kVOkFsY1LuMF4R+yxK+QfrkKqNUxr7DvCJzaUj6NMFQ5rsyhWFgqIxfiJkPgMiuAYOr+
         83jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vEE4ep3471N407vnkg/dcy+srHoLtul6c5WBfTWv6RE=;
        fh=fGTtIktf7+gfu1Dgpa9oO6XwFpILcSHmBkuFlHXSfnM=;
        b=PXMszh9fvTkcN7ed0jLExjynM44kzEGWfe2WKJIYEL+pqy3uQrctIC4z+qcbliA+7W
         1tumRpgDV4/6o3F8s2JIcXCYDsP7qdIU3S/j0ifo4k2Mr1PjX1i77+tilG2jhNJSaGo4
         t/G+K1Ql3Pc6Ca90sSNq05BTfoQgQbLV2HNAlD9YzMhFsGuc4LGTZCyG4j0bijWiGTMM
         //r8Mdp+ESzv+y9vVB462UtRq8O1//dKZuxxm6xhG3mfS3yfOWytfOnwUpp9USsMzSUu
         Dgu+UHs2hA2m9woaqReQCjxNGg+DsvTROTdd2xcSznI63yDM/Ani4rMCSZPtBrfseLpn
         md/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773362682; x=1773967482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vEE4ep3471N407vnkg/dcy+srHoLtul6c5WBfTWv6RE=;
        b=EL4whyQgfIx79t8s+q3Z/G7NOlkIkec9mqzp+SHDkWZFDJ/KSTde25MORvdBTbCgjB
         IjUxtXAj9UuOBeJc4GAY5gGaAfIlm8DidGISJazKd0yIUOAAiBIw1QGNhZmItdessXED
         z86w3WJkr7/UKYnHIM10adyjnom1oaPj6UkUDzFa/9HCbJsbVDQCuKyplk2Wu7ZyZyAf
         qFKJEGn+uTBKhsRvPoNS7LMuTvDTA695qkpRViLGJOH6GOLQTzrk5eAs1xI3uUKOrp59
         UjG9VdVPBHatf5WpVZHKegwTFuA4VjBszPn2iRwQXuMim7hKGQeovM3H9YIuYjxntOiT
         hpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773362682; x=1773967482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEE4ep3471N407vnkg/dcy+srHoLtul6c5WBfTWv6RE=;
        b=HFPGqhnzaibX6+Ets6cgySUc7JeH/4nDp1m9U9pqEf3hJjXBbQSdVr0KrueZnmveR+
         FUwct152O5a7SF8sO/mGMjXQs6s74e7X3Z/PiIBn+J4sKfSONPmRXFwEe/vQEEIfjz9O
         tbpHGeBVOVBsxIZO566PI3AbJkXTd0bB6tslC/rW3nqFhwH0ApmM1KT6exWV/UGyU+af
         r/V7UJqrbQRvB8fnB2OqPvMUYnWj+fAvidhpjrdALCJ749yHj5JJYdyeuPPV70h0O8PH
         yKkfgFMsN0yf9QR1AY6GfDmDV3qUvpQbT8hFpMkRlSievUavmvP2Z2tmHYBVGjtyBx21
         syJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH0ZtMpv4YmeAjM5uJJ7SvRtlqX6ckM29ksJh+AcR5wQTQ1YrF+I6EphWgjU4eyShwSrXyoCA1b6NzBbllKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNVz428PzS4UGgWWoHVQyAXITFv6swyvQWQkfyESDms3vZz5b+
	BmPyB9B4wabBDOh1G7yoqU0GbVbpZmzNDT5V8grsD/PlKMtlfLrfv/AxHnGh8tniUoLXRk020yG
	V5+z9X/IxAI9qqqAwA5VDevuCppn14iQ=
X-Gm-Gg: ATEYQzwy8okRo4PAbqqoJKKCrKo3uY+Un2xsCrHB5TAE4QCq6/+x8MFulDwJGCbiSNK
	P/QnRBNuGKc49ij7ga84hQxlgP+v/qbHrwM0d+y3k6hMiNEQi4//avIH7Rh0L10HsbLErWykQ2i
	haICwrIIF7zLURquq5RvsZx714/VdNs2gj/0iDNuE2XzveHzRTawJrT36YOj2I5sGOXnDiMwlpA
	Tz4Wn48jeOX0wu2saH3ZASf/tKfeGw/yU4ZBvY/THIA19oC6H343IDiiPQXSUZaoDsp15hymtB6
	u2F3GllWYg==
X-Received: by 2002:a2e:b165:0:b0:38a:523a:7fdc with SMTP id
 38308e7fff4ca-38a89815630mr2973321fa.34.1773362681777; Thu, 12 Mar 2026
 17:44:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310151935.33197-1-muchamadcoirulanwar@gmail.com>
 <917edd8c-cda0-4d35-8300-47205a975a81@lunn.ch> <CAO26r3S_zF4CWt1Ms3rwWqR-Rm4FCu4YRCTKVYbtJdmJEnVwQg@mail.gmail.com>
 <64ea50d9-4c7f-4c91-a686-718f0700580d@lunn.ch>
In-Reply-To: <64ea50d9-4c7f-4c91-a686-718f0700580d@lunn.ch>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Fri, 13 Mar 2026 07:44:29 +0700
X-Gm-Features: AaiRm52aNzX4g59LYjJhJCLj610l2cWD5rtEGSfp77I63CPBYNzCO18hevaT9_E
Message-ID: <CAO26r3RjhPdU1-y909xuPRw0xp6PS5O2LRZcEr7-EMB=R-siGg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: phy: rust: add experimental Davicom PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, ojeda@kernel.org, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, Mar 11, 2026 at 20:36 Andrew Lunn <andrew@lunn.ch> wrote:
> That is not really how Linux works. The Maintainers don't go out
> searching for hardware which should be supported. Developers come to
> us with patches.
>
> One place you might look is Openwrt. They often have drivers for
> hardware which never make it upstream to Mainline. Take such a driver,
> buy the hardware, and port it to Rust. But please make sure it is
> really a new device, not just a variant of an existing family of
> devices which already has a driver.

Thank you for the excellent pointer regarding OpenWrt. I wasn't fully
aware of how many out-of-tree drivers are maintained there out of
necessity.

I will spend the next week researching the OpenWrt source tree for
unsupported PHY chips. My goal is to find a device that strictly meets
three criteria: it is a genuinely new chip (not a variant), the
hardware is physically purchasable, and the register datasheet is
publicly available without an NDA.

If hardware availability or closed documentation proves to be a hard
blocker after this timeboxed research, I will likely pivot to other
subsystems (such as IIO or hwmon) where hardware documentation is
generally more open, to continue my Rust driver contributions.

I will drop this Davicom RFC for now. Thank you again for your time,
review, and for pointing me in the right direction. It has been
incredibly helpful.

Best regards,

Muchamad Coirul Anwar

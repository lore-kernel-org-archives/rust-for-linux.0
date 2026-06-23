Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95288390CAC
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 19:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782244447; cv=pass; b=RdYJegBWfK4Kqs6BrcJZXLAaxfk7hIRnnkHufwUQ6LVdcMkfrC4K6sQgv7SE3ebuhDcyYEsPGjidIfUFSIykYNHRxrkhdnVCr4qhCxIBvw5QchlxAv7btyds/QbRTQKKUKas99wUozohKOXsgUfaqTV3Wu50rjPTWEOx+CZuXgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782244447; c=relaxed/simple;
	bh=vkoOOLMqWr3mMrDUvceACI753Rfppcfv3x+ex9finTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVCnWn4FYS0QxpBytDycjb+HuflKKsCIOBotPejSZtImcTzmc1QXBytDrfKk8gwPwZV4vCHdQsGgwaw7P9spaMLdRZvm/qQkPyFDoxQW2HG1Z643OFo4l1EiUdw+GimpYeBqV1LGVlLbdo+xl6ROhwkdSl2aIikgmYHd4A0q4ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSjOSac4; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSjOSac4"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30c5a19e3a6so19918eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 12:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782244446; cv=none;
        d=google.com; s=arc-20240605;
        b=kz8+0MD8OUvC7vOijtpuMZayhXhC67VYiu4kAqm61kJCAvPqzYtZdtqVLOELMwbSvY
         Y4XssWEOeeJBoCWzTwNBgm6GEEQQvaQKq3ShcNK/7gmqKshPgdFarCWNWOuZkIBEv6uE
         +NOblt9bO+y+lj5r876pS1k9IfGSrwWVDN1nkoK/s35+WJSdQH8thB/36YLUtwgJ1svX
         oLI4rLf4UdcqO6EdEtQcQjwmYOFKpNRTzqv7v7Nri0uhHwaOXCP77BALNFdLxSUaMU91
         8IHYuJVRMnvo9EHx+L5mBn7lhH/mgAmma94A0IgT7swCzPXG9//w9B/dMTHOwwdU0Y8J
         4WqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vkoOOLMqWr3mMrDUvceACI753Rfppcfv3x+ex9finTA=;
        fh=dOgb+E+85TL71PHDnhPm/p3Cmw0ujc+/kkJIp3hDdJA=;
        b=gZ8T67Yb7TvUD4a39cXADoF11reINiq6edx5sz91+/LbPDTZhN03qSesJzAVTmjBMy
         x4wUrVH71Z8y0ZXVoEVXgRPHYLtFzLxZfPxnpSI93VjQNCLXEYL0bNOXvHVffqGvHm8O
         SdIW99fEHbItTfnLI6iDyBxyhDPe1Cq60Gcg0xUrjFC3zYf6JnpB0UoYL6y5aem3ys81
         //X9DU+evxvVAYYZJMmzkSbcJ/aE1aCkVWBtNua6nvYeO6Tk500D+iiudS1pg3JPG4ke
         5GETmRL/3MdPbwZpM5H8yTYOLujxTg6GdPdSV8d/IX7im5wBegXctDJkA9gyWF4dAJZA
         RqAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244446; x=1782849246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkoOOLMqWr3mMrDUvceACI753Rfppcfv3x+ex9finTA=;
        b=mSjOSac4eWhZtLM8zw89CbTFPbVauZgfJ/obw7JNDpH+TvpJB636Tz5dKQVGalGUpe
         iiEugW0qHtToxiH1rf8XNeM9ptUVruK/A4+80nBahu6r/8k053QkZSap+F4+9uhHY6j4
         Rti8yEESv7zD+ZH1eClOxaMKhJlpckxd6p9c2VcNHl1Xfar4PUD82fSvqh5rCSJvv2zy
         LwWws9Ojj1lS4fb6oMPBOgqlbeZV2GEj94cccnXm6o9mqV5p3bamPcDZL2pYgyjg5I3S
         AKuy/ekz3pPWvOr1acmyGrrCmQHY5VtNWNUY/CyxeV3QHGbu8dxTRUfe5WC02pcBCNEE
         IQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244446; x=1782849246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vkoOOLMqWr3mMrDUvceACI753Rfppcfv3x+ex9finTA=;
        b=p06xey9dCJXv3MxbapP8stfYoIaEFpzms1O39VFPTg4ADCm3awMLWZpXBUz+rKLyBk
         Q4jrhmXIkoNObhdqap4o+8EzwcfkeMEWLm1yp4vO/nZM8iZPBweESkvBrL0qnuB5+Sbl
         20SQ+9d+LNZY9OFA+PUw7h5IRGywIgtE0INcYqV3rVJODdO4C+qmPC2O9eAvLhGI+925
         IrniqbUJ2YWXo3U+GnXq6y882hyNgXoH2g7qVwskrxTLmF88OrIg68KJfKdqkxaPeRUk
         92FhWU/Do8d+qauXlRlnMT/8/ZRPipFfpxEsdPNdsMhKm10Mhc2cwRuK6+TuwQe7lFAB
         bxIg==
X-Forwarded-Encrypted: i=1; AHgh+Rq15Om6wjBl0ZY1rC2ox/rG1qioNG6RzZ4XWrllRYFhg+5L6//vh1nd1oyIcFOFeI87D/2CexkVKKriZ0z0Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBT6J/ak19jbMWTow4ENotl6Zgff0ZKZvi+vXmZcLbdie2FJaj
	kJYRz1BHMGUPNqCZCq1ZUNq6BriVinWMAA1qX822rH/4ehLZc3rJmlPQ7HedsTjBxJCp/p8SJnB
	AESxGVXteeQPI5ux29ODthJpNnOy6gVc=
X-Gm-Gg: AfdE7ckyG3NXPPttJl5aDTzcRyAzOFfSUwgSeQk1udIFIFXqLFfqNUeHX0/hpJctxou
	Id5RrQfs4EU9OJgK4cO/SNeuqWgtW7vaHgSWef1lQwQAovaqlAHhBPxEHoqkJ6v8x/ZiADhPfgz
	kf2o9eKN3oUKE73SGl/x6vpcKiB/6tDdisNHeszQMJDXeiaRlHhiawPF83feA/jtUd3OI+SUQDU
	0avEK76WQ7HxQQLGGWe8E8gULMWJfbwG+C1KheS99hp/HEDZuWW66zWiuh4eOp2bUjXsvOK45LL
	K480YQHlGYcX9dxJcXZv/6Oj9Of6q3HusEaORy26mG3aAkR/M+1xFnkQwqv3mQxK/Ypx9fH6k6p
	18OqrhLJDRGsd
X-Received: by 2002:a05:7300:acae:b0:30b:c021:5045 with SMTP id
 5a478bee46e88-30c5232edd4mr1750867eec.5.1782244445605; Tue, 23 Jun 2026
 12:54:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com> <DJGJURFV9NCB.25MLPQBQTL9WR@garyguo.net>
In-Reply-To: <DJGJURFV9NCB.25MLPQBQTL9WR@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Jun 2026 21:53:53 +0200
X-Gm-Features: AVVi8CeU736m2Ib2d6WypojDKRhY9xz2hDwmkvDBhGrOCaCh-yvUbm8byC75My0
Message-ID: <CANiq72k8CApLuZsNqX6+A62=YfHn1uo5CDupZ2s1tViYhhMv6g@mail.gmail.com>
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 5:55=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I really want this to be just a variant of pr_, not a entire new family o=
f
> macros.

I think both approaches are fine. Personally I would like a `pr!`
macro, but I am not convinced the advantages are big enough to drop
the similitude/familiarity with C.

It may be the kind of proposal that is best discussed in Kangrejos,
LPC or similar in order to convince enough people and move it
forward... :)

Cheers,
Miguel

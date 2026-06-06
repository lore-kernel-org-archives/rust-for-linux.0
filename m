Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED10B316199
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 12:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780750740; cv=pass; b=WuX/9EvnvqyqMEIbh0XyCRDArjln47aOIbxwaKg9ooB8oqKpunqwxYjG3Fld7ARoVj1nguVabAaiGlMqcXk+Z1oRLSFx7BnIaqRhg2mSRG2IvuSXHUX4iACgUTN6448Qgza02zRFrdFjRYrgQ6AV+MJdacI6YO++UpDp92jRfE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780750740; c=relaxed/simple;
	bh=3BXWtzVi4LQGwgSBHq5PRD0CwABzHiOZUxs129faFuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZRWrXIhYrVPFk8tdOIii7uIXMmvDDj+t1bMmkxhJWf2HX1Hq1BoB6hrr5glq8WLr5i4fyn3Rt7EjMnlwWWGIeQRRnIIOJTkwqyIm7OTieJmIkQGmNdQFOIwGgJvtOuCnnR1WahUH2Z4cRBeccYEy+jgW1CJ6/l+U4b/oKw4QF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qz8wEvpc; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qz8wEvpc"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304f9bc869aso351091eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jun 2026 05:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780750738; cv=none;
        d=google.com; s=arc-20240605;
        b=T8DC0gT3DBefV73lEJH42vyiWJNlDV8Uf5NpN8JLB8iawi+oCNWDSBLDo4SFRTg8hj
         84qFzcliQhT8tDL3CNedJWwrXiEyrIYALOwPCqaeuvwvWBv14Mvfeb/EXetQ4qMqWvFS
         e19S2iubeqt2W5SXXazlH8ZwMiZg+ubvC7HgdsfdxXyl8/5EDROJBLMssSSH0b224w5v
         e5l8d42wPswvIJJj60OmLvWzZHU0HWzt2sVuZW7Sr4/6Xc6qkVaE62IqevcWQzA8tFW+
         1G+OQsLOYJTU1UjwiFbxLKPPXGYUVplFY/BNlIAmd+r4o6PeWmKz/B2t9FweH5hNzuSQ
         37/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a4n+BOgWnXRxyDrcHuqgnk7I5ws77s2DC2XfzX6E8FI=;
        fh=iPwQ5Ynb3C0WI7axHV+AvPEAd/xPHAxpvGXXYu+NtJQ=;
        b=LBYWXSDX5j1CiPubLbefwXMoTwkpNZCl4SmUjFMbAo407vbVMdeAZgHHG5Pw1Ff+qM
         wE8dlBahkIoHCa46rOlmFM4Cn+WkXNgtD63WAcopFNvWwolPCIKFAJvGyRybhXmfeNKS
         v/ryV1N7H6He2qTXmpFynBwZPgvb3M9yi9G4XxH8eq36cJ5yDjrBXtMx1taAj1a1I8CC
         d3proamQZ03z+QWVK8JlzD5Owrl4u/k7WynzWvKpaHcLzt8HJaDM77BKfRYFfdntcgtL
         jZwVuilrxFtg/c2J3pqu91Tyc+JmkYVw+Ctco4DdbzW2HC03rCvTP0DDcx/ltFjrB5s1
         cJ9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780750738; x=1781355538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4n+BOgWnXRxyDrcHuqgnk7I5ws77s2DC2XfzX6E8FI=;
        b=Qz8wEvpclvSgPwLOd0DMXkVe05UBroN7JgOeexO33x4W7XGw5k8SdslLwlJm1N0DK5
         QtaSuACeKqPzvsOkGha2Fc5LnGWqBfUXmXpgY+5loJ4tMBqYe4h8aFEC/O0aLvh0CasD
         qIfhSClTR6h6aa5O9uKWRpxoEvanQQUklSktivrRrrTFoR/3L4NJkHeNeyA4Fsd0eoUX
         9tuYwWIs0spGUBVFwbL82cgYJPJ3TWmwEMzRTEgIGDXjkUEchfbs7TXrlCaNfg8nCsnY
         oZt4JKmSNH/DB1ILKrgIhqzPZd3w5nsff23Cg5gIirX9eVWg6bSYkvT/gQOF0p64p2ku
         8xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780750738; x=1781355538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a4n+BOgWnXRxyDrcHuqgnk7I5ws77s2DC2XfzX6E8FI=;
        b=e03xACWW1YjKCqO3ZvfKR2Vn6Z4bF759hjopUSPBBwRUs29FVeiUyKDlGyrr+/qDqX
         ACPXRMXiMeK01tMLCAJlpK5579kPp/K7Su+Akb9Usba8fU37IW6m9HcxNQVvECMB2UVR
         1ZO1EWvMCD2Al19JCFidxlk1Bis/VUzoqRKP9clHH0pStcU7AKz8VKXgDHN+d16C6v/e
         e5hQcW+r15NNZ8pbJhqdGyF7LGo0BaTdWjWl9oFUntWuO56WZkomcWj+eaw9S8B3titq
         qRYnFcJ4hLY5nHL7Yopj8kRn5VCAGewFqOAeg71Uoy0R3NlFTQsg53YhKSefNZWAi4mY
         0jvw==
X-Forwarded-Encrypted: i=1; AFNElJ+V36l82farOnbz1R1pewfz9/rI02MUC4wvP3dVQVrEGMjLSqDkISk3gRM3lFSpdmp2cLLoLao0CjYHS4I7Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMXoSYCIJUdXbQnJUf7y+dT/J0KpeioAs0DExQOgNbUvBL026/
	bdNF2HhWSIhJjSy0+C15Rhe0e3vpZlzJV9YVSpEiLkqJ1RSR/gGzwdln1rEobDbmMfE4pBSKAH6
	8yQxhO6LbvO+fjY/qSsLdJ4q4p5HjBDY=
X-Gm-Gg: Acq92OHbGIAv/QiigOdgQFxlxFartRU69CRetptc79J5ZFHqfittlV/Yl7UyzM8C2XB
	ElYkKBiHQqacpqsHUzJBpCuyfy1GD/fIr1ayy5LFoVBHQBT62g86vEu1ZDk/IHTT0Hj1npwW6vY
	t1CFEm6q2CoPk8AoZ+/GFha3vF0l8GTNLJeZoClYmEm5/ceb5GysaXMX72E3PMeFDPKton7PWHP
	QYdXOKbvh9KJ2mmc/kf8bE8WfHzBxiW7WCGNXqpUDN8gnVgkgVjd2EM1BVGW6nIkfdip7LVv1DV
	r/3JSWKLV427oqxKydvT7ssLbIi+nV23CG5N8+Xl/tznga7KRxs44mSJCdZGTmO4/UWcmMvlcrm
	bxZ2DPIAr82ZFTJexhu2BfzQ/To7DkOkjiA==
X-Received: by 2002:a05:7300:c8a:b0:307:2877:b2b6 with SMTP id
 5a478bee46e88-3077b585b75mr1731054eec.3.1780750738054; Sat, 06 Jun 2026
 05:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-rust-fault-inject-v2-1-aaf978883cc2@kernel.org>
In-Reply-To: <20260605-rust-fault-inject-v2-1-aaf978883cc2@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 6 Jun 2026 14:58:44 +0200
X-Gm-Features: AVVi8Cds-mtSL03OuH9_LDzNmpDmFJlCmuaaixkwHKY84f0Wx8jFyTmY46FzIV4
Message-ID: <CANiq72k9Yc=tQgSEUXgcaJaw+Jub0ZX8g8XWsT8dA4kxifxGEA@mail.gmail.com>
Subject: Re: [PATCH v2] fault-inject: rust: add a Rust API for fault-injection
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Akinobu Mita <akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

Some quick comments scanning your patch diagonally since I was here
for something else.

On Fri, Jun 5, 2026 at 3:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
>  #include <linux/ethtool.h>
>  #include <linux/fdtable.h>
> +#include <linux/fault-inject.h>
>  #include <linux/file.h>

Please keep them sorted :)

> +// SAFETY: FaultConfig can be used from any task.

`FaultConfig`

> +        // SAFETY: By type invariant, self is always valid.

`self`

> +    /// Returns `true` if the operation should fail.

[`true`]

> +            // INVARIANT: `self.inner` is initialized in ffi_init.

I was going to say `ffi_init`, but there is no such call here. Isn't
it getting initialized by the C side? I guess this got copy-pasted
from somewhere else?

Cheers,
Miguel

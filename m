Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FA33A1C9
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 02:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772591692; cv=pass; b=tbRGCed6Zq+uB68IuzD1dJi1N9zasPFjRW8Bez6eTpGiFwEGsnlxkdlOrHX11x+nDAoVMArmrWG5PmRqTDrEPTZg9GO1VZVIoWHWB8YJVMzKY2E+CjLY1EQxJ6s6FchyeBEbvZ/j5+V77HmIEee1S++mnLOFPShcVPcQT693/YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772591692; c=relaxed/simple;
	bh=2XMl2CMJB5mdDn8gFRtihyqGf2DVsjqEtSyf6fRD1HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PfqIQaTCMDw1RhR//yL/eucPLJe+le2f+evYUfZSUfWNJNWazL+WXjGi2cyWXNc+IMl7ncvUfe9+t/58+4VLgSUBTTZq4MKEve12ARKtLadsKxyAnsSEpfD7jVi1Pa4BPv0sG3Huii3EnqZ2mUlx4UuWlD7D5vjX6zUC5tCc/eg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyYrgDTa; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyYrgDTa"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2be22d699c9so91266eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 18:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772591690; cv=none;
        d=google.com; s=arc-20240605;
        b=PiYR+JK8q5C1JMssN8ISLGj4hI4xDEu7+nwkSHRP8ntmqNBOzWGSudWOHILjuXdyD6
         GJwAGxTdBhc/Xb1drVmOA7PwLZ3nbL2cc9k0AvcHhPQhnKBJYe96pEKnaOPb55NtRsL/
         9C5rpTIPK6SQIb0nODkSeuLwmPHySpF7qBiuZmh4mz7lJ3oXMvQnyonwfpMWh9evQHd7
         euJ8xy9mx+Qmc6xt33p5iftn5ilGeTuhesVKXBFdLufQ42o/DQt77CMCZRhjDmbda7gL
         lJgm0LnWeNH7Yij1qm9b86L0c9oxHqnycrUzlOI12BtQJIw1XsKqjDB6B+L8lPCcJ2Yp
         tffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JkX2+jmYSnw4PjcXqCvYgS+1FwE6mJFHLzb0KkOcleo=;
        fh=/ote0GQKoWjOa5IH7c78CGEhVUi/xXYD5oaHNFfsm+0=;
        b=UwepSgODQ4ZjZiwlheNyf95DNZcd3eRjPPHrHDzTdHo1LWMiV4I8k0187dVQfsrOkH
         GN3eavJn9vg0W3DXTAV596DyyfboN3eEfwGMiKfFaNAyyaswSgKMTPLcLtsVE+PgYB1Z
         pUPsVb1OTKXbUulEmND9xTbJplv8xhZJ68Qd3q8aaP3tUZ2ORfIndzPga+4aUwOW4rFq
         4m372D8aDv1ZX+hp8xeJq0K5KGPAw36zvkdmBom5ulLm0T8+UlO9G453iI2OZXGq220c
         5Mqy++BTW3Dyn3q2LRBsSnbE46tSRAdCMNkHbW45qESpGaQdT44N63Gk9nMfeXagIlpn
         Vh/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772591690; x=1773196490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkX2+jmYSnw4PjcXqCvYgS+1FwE6mJFHLzb0KkOcleo=;
        b=KyYrgDTaxrrTcH3bP2eNmVNzTYRKS1CXGHj/FyPYvDexJG/SCM+l26/6Yb4mmMGMhB
         pgBqkV3+ham8gIHmd6HFjA8zpbZzPNiLLY+x07OLuTMKFhVrM9/nLFOh6ECVH1D/RRTk
         qx+2BeTtyLocbj3eZBMkoiaruZz0eCIzGECOfZwx1jerqrjiOsauVWAY6LFpWiquQYsH
         zZCzixF9inaE6ZZWSznr7P1AV/QqoeGLAy16KK76CqlYKG10CFiXG1pa33CE6uqVrYd+
         3NXcLkDB2BclMLJSpe7qNxfX4PERHCa4iHyfH5bDEp+Mijkch+lma7s3VjtKDemlH07p
         PTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772591690; x=1773196490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JkX2+jmYSnw4PjcXqCvYgS+1FwE6mJFHLzb0KkOcleo=;
        b=pJTBUwj1vpmbM9yDSUW73f7sMxcG2OjfnA9JuPtS6TIj5O4v/r7CPhD1TJ2Tyzclam
         nQPZ3Smu9vAeI3wzNI7LWyddbfJ0X3xQl5eoSF10nF5ZC+75tuZawgywrlsO1oJfJjTG
         21Bk6u0CwiknXLFGF6LEux45eaOouO9suBJPM+KrsKT52WgSDQpnA7X4HejdHe7arIno
         vW+C5NPoyrDbcoHvIro0fWZxxS904iz38hSXBv0/+u1vgAEgi0kXV3MFbbMNLg8slJ4X
         uVKTAaWDstxfzqH5N+HR8HZRGve3IlXJZy4FnzTOUEkAAAfkBCKS8fXLAgk6YIyFQcnh
         yneg==
X-Forwarded-Encrypted: i=1; AJvYcCWkrIPYdEiCuTm2BDajhqKEzAN/pVjLrU8WKSTDHfZMg45ux/S6iFiM5fpVBmtRThP0oLNp6REqncwRzqyLNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyh6C/IonQjKY5MNo5Jb81y9gV/z4r2SJjoOafTiiSLAdwK9Hc
	J+J7OVoU2PT0RNDfeJ+lo6X4Pc4oQzjuRXL4qUqzWR0nq8wrFSrmfaHjBvZMkjGS6BGshj7I/Nl
	XlB/sPJNrp1MEsrxLiVclujWKQ8PoSbv1K+JQ4Z0=
X-Gm-Gg: ATEYQzzpptHvGv6K2ONkPYSYIhEJUimO1N3SrrfUYJ9xTAEfhwuQcHDwZhXQvjMs2c0
	tlTGwqDJE7Y5R2usWtQbvvQ6nlvxK534lmtZmAX84KGuANDiek/rbcumrwqUHa57vfgnhccRm44
	aHYXRG17riAIeADjPP4prmZL7C6zncpIk9Fa+LtwHTUqv2M4UBm8gM/RCxOP8pXLZZSIEj98gQn
	KuojZWnyt+X2Cm9Vsz+B+ZEaLzDMVzGz3fHe4nMt8ksY7fTn954Z5Rl9hKZ8+oYlEwal6ft/Q3B
	juRdPSJrZjnkZUEaL1jOmVqE5IIifWuV6z8YDCpCw1LPiE6tFVlI4d9AW9RHrqcD0X5ZXDaI/EX
	CQ1t4wVJn4oo+3NAkMUz5DQcC
X-Received: by 2002:a05:7300:ec08:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2be31224556mr94371eec.6.1772591689749; Tue, 03 Mar 2026
 18:34:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
In-Reply-To: <20260224-unused_var_err-v2-1-337f9359d98e@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Mar 2026 03:34:36 +0100
X-Gm-Features: AaiRm53AK__LxyEQZWlm_NkgVJ-LEO_6aeM5Yb2_RK6_R0B-Cz9fKt-Sydu0gx0
Message-ID: <CANiq72kROq3B=EPfihKM=bvtyqYrbDV-mkFgROdPNjbC6zaBpQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kunit: fix warning when !CONFIG_PRINTK
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 11:38=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> If `CONFIG_PRINTK` is not set, then the following warnings are issued
> during build:
>
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:16:12
>     |
>   16 | pub fn err(args: fmt::Arguments<'_>) {
>     |            ^^^^ help: if this is intentional, prefix it with an und=
erscore: `_args`
>     |
>     =3D note: `#[warn(unused_variables)]` (part of `#[warn(unused)]`) on =
by default
>
>   warning: unused variable: `args`
>     --> ../rust/kernel/kunit.rs:32:13
>     |
>   32 | pub fn info(args: fmt::Arguments<'_>) {
>     |             ^^^^ help: if this is intentional, prefix it with an un=
derscore: `_args`
>
> Fix this by adding a no-op assignment using `args` when `CONFIG_PRINTK`
> is not set.
>
> Fixes: a66d733da801 ("rust: support running Rust documentation tests as K=
Unit ones")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-fixes` -- thanks everyone!

Also Cc: stable@vger.kernel.org

Cheers,
Miguel

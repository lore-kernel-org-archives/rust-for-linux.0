Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF63F2119
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039863; cv=pass; b=rU5HZ1Qg61f3AULEsHdk8sWbgz+BCM6iu+LQo/qLMSKr7Cg9hCK/Kji4xNE94yH64ClGWkzWgFzpg3H8NW1Vicht7vfUE2zY2/SJu2TCrdKPVPYRGxQIPF8D8MJ22mAAcBVln9eZH15ElU3czGzhFtBNVAfBn1jSPv379IWSMCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039863; c=relaxed/simple;
	bh=NB7IgTsm5fAY1HRxukcTkg282cMT+NcIa7BPVwXaI4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGnqeafJ17rLqldTmlF8C3hPD+oqKArVOsY9ZmOriG646pyQmOZcSVvdjWTzENMNAFB1tuI/Bdv2SOf+YE0RK0CoVylW9COM0SIYFb8wtbrLrO672imF5H+L8k1/YtIGTSmwl4L1mXHd1IqRqhIfLXk59fa4AUpVLKi/8B5kggo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PV4MJZUe; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PV4MJZUe"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a2c508002eso4583e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 03:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775039859; cv=none;
        d=google.com; s=arc-20240605;
        b=PD3Z81dwNV9SWpyj8i/0fJzLvxh/RoJo3SegjzZdUMR5Is79K5I66dNWVM4F9sZ+Ct
         inesmxBGsglqE4mwQ7su46KrLMACtLy5kddJ8XotEDANQu+sHp3WFVrXg0HfrJepVpS6
         cPsgD4dI3jhpkbi49dtgaKx5mBJbfgJ4Q/snRHBTIcnZyt3MeU06tZ/+KLsTAB/mSBgY
         ZYETUvt73PlaONXYLkJ+IjsbvHepe06tRmerZcJOWvvA4HImfyivM2RNS0xWrvc2fGEF
         v0IxutHYicj+A0sKpXYqrJa1TKwmh3Nimgt3zO2CLA+5B6cXti5MTbI6qpHUHz1RTGJn
         TvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VOv6sQrE1pMcWIiRRePCMC/GRfEX8gOaFbZKQ7PwRiA=;
        fh=zg8kHqOEy72fOMPU6HKfhGddSnvWclmO78cN4f0RMks=;
        b=W1f/n36gJ85R9JrejFFwuyCHGoJFcio1EUawru3VI4pWEcOZst57v3SGrAxymC9mlT
         qukZmivRXMO8UtqdO9w0q3x98hboy0SZczErLuSMG37Xyguu5LXsn6gBC0S3zQGKWofI
         eUaqnZ4KFaQCK7cZ+nZso5dTNgUaUq8kRCBuTmM8CJL5aeuxuvQ6hhDW1ZMVUmKzEIwb
         h6OtRwep6Fy861gTB3NhTsA/MgLK8teL3T9PpHgfXCQfNw6jmi71CWsIXzBrRLZBHEtH
         ccxKeat3vDO5qsgtZmmhflcNkclAPxHRcEr46H7JYWIDtAPspUukaVrxDR5nPL5HLFfD
         mcfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775039859; x=1775644659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOv6sQrE1pMcWIiRRePCMC/GRfEX8gOaFbZKQ7PwRiA=;
        b=PV4MJZUe6fk484cZO4W/xaPmqcNtTaWfVnuaPvOycgHWLcjwfiVSFv2g01d5SgmkGY
         cG8c7ck+6drc11/+l9jE2IUVKfo9LeNaHp7M7pReSwj4N6o9tm0VSVtcVRBbr9Fk+k75
         T5aHs7N7Bf0bnfCIlOBMMv266XqCQHj1z/ZZbTxTLppyAZj8w8V9JStkAZKeRmEL7AyJ
         Gm0UxLN/3rwmZvRnRonxAcNCcixLoXmE9raVWYd1jPMeKAAFNXppSaKHfIt0krHlGs6i
         Ag4MpoICZkTddJ9vJ3DQRg/6G5mB7MZ1KS02KblwcHxj7v/Q1i8nMlgZx7fmjD/zRBzx
         X+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039859; x=1775644659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VOv6sQrE1pMcWIiRRePCMC/GRfEX8gOaFbZKQ7PwRiA=;
        b=bQC9+NdaK3QnspTEyxSL7XsQ5yK11lSstrYsePtgyLqe44ILVieBoeeA76dZ49cjCn
         bjYJKjltvbJ5Y1cx2RraEZe7rHHupr3WshnztrbDgMyoSvB3Io/HyZJoZTkE6XpRzK3Q
         IpV/shYyRraNLFKGnL64oe/AptEYiYdCFPArz4lHhnursep7qiOI+7ZGVPXWW36I5wSQ
         9oBbw45bnz+vS2mcqvSTd0VKUqYSudfC9GtyMJ2sWYaziQTfgyNOimwB9VgXjJKGqS0D
         Ktc5spfdpB5/UrqUUT5JVn63bpLurX+TJuG9MaAVIDa4jI9+MiKmpk0gX+ktp8MnOmSV
         c5aw==
X-Forwarded-Encrypted: i=1; AJvYcCVSfIZjWKN9wJSFf4FToM+YEVwG1PF0k5i/FkrT1T1QNbxchu+wFGvXF7ARdXz1eIyGWtLS6vK9sR6rzY17sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69d96lx1461FuQHXL3lseafMtboc3ay2fpdc17TTv6ITCSvy/
	xKcQd6a2ybDLOyp7xIToqLSFQfsAa6A+UkFdb9bsSb1CsIOODPRuW09YZWgvjQjHZsXwodNOdWw
	gggw97sK2Uscvm+byqxOXD+HJcSrATwE=
X-Gm-Gg: ATEYQzymUc9/Bt4wKSN9kDXmKdkiolqFlegF/k/fQSjKSXQgrlA8taVb3WK0jZYsV7t
	6lmYbT6Snap2FCm9iif7IRqYptWzdpbTdWtv44sPlMgksQlp2VSx8EsnHUFbnXWDey4eKyX/tM4
	EpZQgKrIdtiSyAq+JUUchASsUQMkmJQfM0qwlrcUMJNPQcoXxv4SEBConr88OYSiBExn5uPMe4C
	89F7pO25isdDEkoTXtlL9gvFsoRk/Fmk8t+I1VmlAb7QxppcuYirfiRyQHfu8gzVemNG/6hhBSg
	bNgqmdEeiefJRfW84kbu470N5rrMEyAHCnYnQv0MjNzV7xSnuhQB5/07XpsrPkRbrmUmY8Teya0
	ksxG1hx3pRHQPBtOPJVEAoOg=
X-Received: by 2002:a05:6512:1093:b0:5a1:2ec0:7442 with SMTP id
 2adb3069b0e04-5a2c1ca6ad7mr571822e87.0.1775039858363; Wed, 01 Apr 2026
 03:37:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <20260211032935.2705841-23-alistair.francis@wdc.com> <20260303150040.00007458@huawei.com>
 <CAKmqyKM6CBucDEo0aKZVWrKtozbT_ddk0PaZFtHyEMMMx558JA@mail.gmail.com>
 <CANiq72nOt1E8=GYdh2T5BWNvG7J8sZRF+60taghoxKm8fkadHg@mail.gmail.com> <CAKmqyKPa5fDmo1A6OzF0ROn7iTrBrhV1Q2L=1Wkb=o27f5fDSQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPa5fDmo1A6OzF0ROn7iTrBrhV1Q2L=1Wkb=o27f5fDSQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 12:37:23 +0200
X-Gm-Features: AQROBzCtb7kxhE58oOSjFtnvKeq8ygzpCG4EYIkaMQYWrhFl3CKqeEv1E8oqMJc
Message-ID: <CANiq72nV3ArhtQoQYbX-cRKM5JjnqVtzP79c43q+eJjbANgONA@mail.gmail.com>
Subject: Re: [RFC v3 22/27] lib: rspdm: Support SPDM certificate validation
To: Alistair Francis <alistair23@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>, bhelgaas@google.com, lukas@wunner.de, 
	rust-for-linux@vger.kernel.org, akpm@linux-foundation.org, 
	linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, ojeda@kernel.org, 
	wilfred.mallawa@wdc.com, aliceryhl@google.com, 
	Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 3:48=E2=80=AFAM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> I think it's Rust-ier as it uses the fact that
>  * if statements can be used as expressions, which is a cool feature of R=
ust

Sure, but a feature being nice doesn't mean it is idiomatic to apply
it in every context.

More generally, regarding cool features (whether in C or C++ or Rust
etc.), I would say one should strive to keep code as simple as
possible, i.e. we use fancy features when they buy us something, not
just because we can. The kernel applies this principle too.

>  * Rust is explicit about comparisons being bools (no `if (value)` for ex=
ample)

Yes, but I am not sure how this is related.

> So I find the if statement expression returning explicit bools very
> Rust-y and easier to read

If you mean that that seeing `true` and `false` may be clearer because
it is more explicit, then that sounds OK (whether someone agrees or
not), but it is a different argument than being idiomatic.

In any case, I replied initially because the code should be
Clippy-clean, and currently we have that lint enabled -- does it not
trigger in your particular case? i.e. even if you have removed the
code, it would be nice to know why it didn't trigger, or if you were
not testing with `CLIPPY=3D1`.

Anyway, if you think it is idiomatic Rust, then I would suggest
discussing it with the Clippy folks, because they have it as a warning
by default.

Thanks!

Cheers,
Miguel

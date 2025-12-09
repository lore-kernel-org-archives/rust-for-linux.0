Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E688A3019C8
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 06:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765261769; cv=none; b=YmbKRhof0USMct6mCWYk0dZyjHBDqQgyet2cSQ7c3m2WXcQvSGJ6OeZWkVDlfk1yhjZdajlAZ7mWQ7isJGJu4S4rV/Vbui/Sm5Pjej85VTQ+U0MAx7O+v/edIE5KLBwzCa5Ilyfr1s4EHwOLtf6l3a8POyh7CVgUf1k96PvfnM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765261769; c=relaxed/simple;
	bh=4wu4HghV9eutcXZg9QykpHAVBOCpOEqzmk05aTWPYjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fe8eogSaszbTXuS5ym1dCGa5/VNPrZn64TKK8DORXh7qSxFFMu2zdGbZPjJ+yAyivVA8J9Z9BlbxN7Z0yZacp6O66+h2ZL9wP/m60uTsOSBzRF2xS4ECXPzHbSZ2PJxScniWeqIlJhVR3/ZnuZ8HM0jQaAAQMe1pVCJonTn/svg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2xC+ia2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2xC+ia2"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bceaaed0514so398284a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Dec 2025 22:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765261767; x=1765866567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/okAXkk7BGFghBjc5ApOsP8AJT8qAM3/hNVNZVYhOY=;
        b=P2xC+ia2QdKG4/JMXldylEDcpdI3/9YQiXVJVmqb3n4WuwICF0A2HkLASzkuJO9dzL
         8Dz1s1kFHk37A8C3U5VtGoht3RK2hgtHQX3CcYpv7eJOA7r/AQhizjzpdEVldhMA3tMm
         9hxC6BXBsw3ZrTvlEHO0EeL+n6quZPMCo8iYF+oRuT9q/bWW10d26VQ7p8riClwqbAiy
         zPpt6nvOdmRVYTijHkcswAlNeGJIm7WlESlrFQgWAwfAvhlYTxNVk+T8Nngl4iiqbZNK
         TO2oWraRZB1Dfm2k9o21/kZ+ec4waz2B2onlqlfNsJz89vtooXY0VC0BmQx2LL0MI0Lt
         ZQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765261767; x=1765866567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F/okAXkk7BGFghBjc5ApOsP8AJT8qAM3/hNVNZVYhOY=;
        b=rHNE9lPcPvRZCPQj3nnc/J781zNuiVpi7k5+RcPL9nM4FM2lwtBHL1s+PCpMrTVtdc
         npuLMuz2qErBDd4s0JwKL3IGIp0SHXqO2LfGteTrPQUd/FEQQvfXbP5Wsl5eWKp7+wzO
         GOb7iuKzNt+a5Dojr4EtJUSPwVBDuXQCjpdLS+kGDx9dIGsV4nFJ3XRfNoHjeufxDkAT
         h3BczkHWht9IOvMJO75niaxmcUz7wxoM+0bb78K1lzbGr+Dmk4a85uoXkCJI52s0pD9k
         ED6n8Bv3IPYFm4+e5R9V4KgHaTZhD8qiuPxs1/4mUPAfk2orIamseFLP15gW9fZv3XPZ
         RY2A==
X-Gm-Message-State: AOJu0Yy1uAGe8xFG+68vPqLlcOxMCqyIZrGlgYL+A5Y5y5urygpASXck
	fQ4fOmr7VZuH34aodHmYhkb9ya+pheC+OWmbqir7rx8CPFb2ht3N1qnXztkyc6nJfMB0csONP5r
	wqAypLTkXN4cnMXKunwM9ZuoJSCieKDw=
X-Gm-Gg: ASbGncvRD/VrXrr3g7Q3vQeYC8Gwod7b2GVEglcDbQU8T/rYk+eYhoTTqzNbp3BYDKx
	Ojr8MaOUFD+0Pz64ONW7GQhk5SluCon1txB9njXSkK4qMxluYDwt2wSsKebBB31i6EsmP33zy1b
	PYvV/2EonG9egvJAETN6tCB6DJiWkkP0cMvKWFseZ3iPzTstQPUopL5uuujPn1ZsQPSI7MSQ5j2
	HX5sbwDigfqxFx9/KRtuurEpy0UgRPXd+PcJA9oiNgISll8YgdsfB/zoHiIoqUpc+59W96Zva74
	Tdm2NSDzfVjM2Z2AZr/cKCmmt6dZMjAgKISi+UVXDhANOZ+cnP8ORBi/l0z0c2IiEf1joIqEvK8
	5o5X8QcX7rkC/bQ==
X-Google-Smtp-Source: AGHT+IGRuNySzZFg7LnxO0DUBwmTDE2SGnhd2Hq7klfkMjK1ebsVPO1rSgGRAy0b6w6lmNPUlHQbLRmAlrxzvF6MMX8=
X-Received: by 2002:a05:7300:b919:b0:2a4:3592:cf89 with SMTP id
 5a478bee46e88-2abc6f5253fmr3734203eec.0.1765261766948; Mon, 08 Dec 2025
 22:29:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209014312.575940-1-fujita.tomonori@gmail.com> <20251209.151817.744108529426448097.fujita.tomonori@gmail.com>
In-Reply-To: <20251209.151817.744108529426448097.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Dec 2025 07:29:14 +0100
X-Gm-Features: AQt7F2r_TvGDcpVIBygy_ezYL0Tnw2PmcofnZL97AP3BScTrwyy9ndPCst7m11o
Message-ID: <CANiq72m=XqGpkJt2-KrbaHMAJ2bMLEk0k-EyDX5iX+XmeE+cUg@mail.gmail.com>
Subject: Re: [PATCH v1] rust: helpers: Fix pci_free_irq_vectors() build with
 CONFIG_PCI disabled
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, dakr@kernel.org, ojeda@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, bhelgaas@google.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	kwilczynski@kernel.org, lossin@kernel.org, tmgross@umich.edu, 
	linux-pci@vger.kernel.org, Guillaume Gomez <guillaume1.gomez@gmail.com>, 
	Alona Enraght-Moony <contact@alona.page>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2025 at 7:18=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> +#[cfg_attr(CONFIG_PCI =3D "y", doc =3D "[`pci::Device`](kernel::pci::Dev=
ice).")]
> +#[cfg_attr(not(CONFIG_PCI =3D "y"), doc =3D "`pci::Device`.")]

Yeah... these become fairly messy and we may have quite some of these :(

Hmm... This is tangentially related to the "references map" proposal I
have due to the custom intra-doc links syntax we discussed with
upstream `rustdoc`: we could perhaps have a syntax for "tentative
intra-doc links", i.e. ones where it is not an error if they do not
resolve (sadly that makes them harder to know if they are correct),
e.g.

    [~`pci::Device`]

Or, ideally, a short-hand to specify the condition. That would not
have that disadvantage, e.g.

    [`pci::Device`~CONFIG_PCI]

Or, even better, both: the former for complex cases, and the latter
for those that only depend on a single `cfg`.

Cc'ing Guillaume and Alona so that they are aware / in the loop.

Cheers,
Miguel

Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778AB23ED5E
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 01:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763947486; cv=none; b=qciiKmD9LO529Nc+z8fTqi3RHT1pd8imOKtTmO2Kh6zP+KZawNqkbSflWZQr/TgUtnIFJ/7myNhVwAB2mcqlAV14wVO65D+pqXT1eXJKJ8Egk/bH93Y1LFbGQhiWRerFI78izOihPh+rQfHz0LznAlUElz1r2Qe9umpGxcFEMxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763947486; c=relaxed/simple;
	bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFBtJIqxMupB9kZsylw7yVySnYAP1Mj7oxBNSA895XYptUaey0vV3UwUHkSjvdc84Inr+U2m+SX+iJgdvpJIIdDWw6vz00oGPqg1CewKK7GqDYYmEN0SfbZadgROo8BriiNDyOkTMPxHG7Iv3IVSRNc7jBGwHBZo2k5ZhMCNC74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nm7BDSRZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nm7BDSRZ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bac5b906bcso412125b3a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 17:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763947484; x=1764552284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
        b=Nm7BDSRZdRmYLOHm2fsf27q0XdaiVxNvLCYyMaUHcr5vm/oHvUj8SaAmt+Te1OHsMX
         UDlm0MskGrTf94kJD59rJomz0IotbvAKECv8L84Du6fjioXyKfXC3qbHTBXiLrFKsp9u
         vECIwhg2EhjxVMb17cYGUuKnpY7BnYaluLd/ebCyX12eBhGLYjmR6XfAoyiHi0smiy3f
         /MbhesJV2o5NkUzVX8uBK0vbIcuPZbUndIM+sytRBHpKxSPLE9FCjs68LGCZyRZSED82
         AzQuZI/lhXcUj1IjBBZHKg8Z/dJ47ND1qHwVEqgFrKRuNKLBwRN5p7vfZ9GzSnoO+9gg
         PFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763947484; x=1764552284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OneiY8I0gUlFfju2yeygYk51QQ079MS3LKtwX0yTN7U=;
        b=eOitkpCKGFL6cOMKnC0c9E8aruWZFmX6a3T48uYQLIScs7+StfDfXdfIEnkPKstROJ
         HQ4kuoUrdZBaY6ysgxDONnjIvSCEvWXmkz0tcbpwj4lOjzSCZuh0y3Fj4+mfyZdtvJR0
         oQ1Oc7qLgtckLOTN4yYxcRAqaYyXjIv9o2WRbayWnSZNPcjSPjsdlHKgyJC1cXg9YjqA
         cdZ1kPgZqkflyQO6ksq78L5ZuYkyzMK7TSoa64MagPT/2ciQTJInHsCTlmWgFSnfvGXO
         5pRrjUSHqNiscNza6y8oHf3n18E+Z0Uzl0EQ3rrUJoDuE1tW1hzEdg3fDKaQVC1ylMuU
         bMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOPDcYQdQOYhTgdtCPFnjC2pX//MTy2ozm1rCFomIWzKl73yS7MAlZJ11W8tUwKM0ITAesqY1E9qPpct79Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaIqaQygCGscMhSyDDf343GsWSVsknWgvYf4pIixCrdbT5OQXo
	HqLRjl1XRuDhZcPA+hOmdahqNW2CuqWtS7Z6XqEdSFJGlNpoU28+4lmIqv5T7SUTl7YHYA/Z1/N
	r+VL4oe3Zf2fuXbCRSMSYEUQKm/edKmo=
X-Gm-Gg: ASbGncsANP0+5rDxF1WgqIoyQjlrZUm6i9cG3GSPf6eAMtvXq+bTlnWHTM4XRCzNUTL
	MjW4VcPIW6c6zV7jemR+i1uT1hQTPwzjwoOPTfkuFmoBf9q5ejmBBofE1WKMLilucJnKZPFM1pe
	Gg+qA7SIS8z7Ae1AIT0F/cqHugoWoBDOEK9MXoT8LToy8Jrpr/jLpwAZX7zgzE3VXIu6k7JuSNy
	9IdVFHFBVS38pqvCa3QcefIMbGlNsK6hueIE5CH75pG7OzNhyoHsoRDMekvKneuxASCP4BXNhTV
	b9Lq0oDYAsIQxYOQnvV743xLI2nECwZneOELo4bwc8GZd8DejEDs00vd7J0fE+3mvbNboc8hOHI
	ySXcRLcKRcIs06w==
X-Google-Smtp-Source: AGHT+IE/FDIBNqUZA/G/+nKiTfBaSa9copxgf7FlXf8Svbk+fth/f6d611m28X3uKTN8JNKPOU1LrwubVCZnNZk0CiM=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr5377066eec.2.1763947483691; Sun, 23 Nov 2025
 17:24:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-2-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:24:31 +0100
X-Gm-Features: AWmQ_blKJN1cEm5aJqBoq0agAeCfqxj6IncPPqpzjooJxt-eYO2MrWfk7cdiYl0
Message-ID: <CANiq72mJqN09FvfjDeo+WBN=Pht74iidRxoU_JcMfXV6oMmKEg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] rust: generate a fatal error if BINDGEN_TARGET is undefined
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Generate a friendly fatal error if the target triplet is undefined for
> bindgen, rather than having the compiler generate obscure error messages
> during the build stage.

I normally suggest putting in the log the errors in case someone
searches for them and for future reference etc.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel

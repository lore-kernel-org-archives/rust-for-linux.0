Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE26192D97
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546228; cv=pass; b=dPLdEsaedGXbkpQuWMAJlRIMeeOAtjQXRATSkm6zdQw7XaYEaPGhE7eKupzrwqDea32TfNueekgDQL1gxNEfmM549vPJ3PsfGdLkjwELHbr93Jhv4VzkGxddVyB0UIumq1dp6m4120dyAL4iMND4YrHvDLev7r6iA3bBNS3JFdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546228; c=relaxed/simple;
	bh=OpxH2sJ/fBqNWjY82rtfpbqgi+6tguV8c1lJED4a7JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhR2crtZmu+Kf8yOHbHB7giR92yGDvJhQZkDxnQ2dOsRsxXkI4KMfOlthXfljy9wrTLUq8hMK2QkxrTebJASwY1IxqxraFL44nQWffclY2prdXW1kS8hCbQhIDxjbaGePXY20hV8uXwYEFF5wewpu7mnyDNHxOsjH8bjQgfl434=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovcmo0sw; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovcmo0sw"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-127148c2112so102809c88.3
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 10:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774546225; cv=none;
        d=google.com; s=arc-20240605;
        b=RxY7yXu6MvobepOHto1Gk62GNWZFhykOI3vXpwBveHH+45DHTEKR8Rehljgg04Pw62
         GZqYmXW8TT31f5pwNPQlB+H4ayLseXtAODv4RC/lNCAayhkLGmGpJuYEdxklOUBL+Un/
         rXXUvyFh+3AX/GtRJynZtuy8jQR1Gh7De/DQpOZTUeJAjabF1dZP6D4O7tRuR4izjtb8
         z3MPC5Kc98BRm/FLf6qS2wfPVc/ejICzitaOfY7T+QLfWrY2cU4g0/p7i86SaDkgPs2B
         DKx2FjKgMMxadJMeAiYj++w2HBPhkW6n/zPZPMHms/1ASX8F57JleU36dXODBUdzQx0x
         xdwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        fh=uRRUPZT4SiFEGpt/KgxWGvfii6yl3ovQPuqIvpv/Wuc=;
        b=KHKgrWEVc0xHStURdEtfh/dhsqLZKTDW6k58Vk+Yr6zk7p56wglhKhzTpPn2FT/8cU
         xLaoYVo5FM4ofrArDL0+DR2/8QiDgiE7lr/MFuH4eCJcNkqxtUMYRYyodq7N8iXKyErX
         +GMlPn1A+k3KK4RVqXkxIXNIOGqp8zqVJlnX3QAnhEwA/3ctOJ3jQEzbR4gXH0TlUM9d
         LmVK++tYUG8VVSAy1rn4iTo7PJTSFM2Jaqqfj0zBVwrzCSdiQLC8K6zFyMG2M1Xfl2zA
         PQTTBlAg2ZljMZuJW9kyqUnN2l26TLI4MEMD0100SZfhH01JIM1byLQ4lTR52NB7Wk1b
         rv1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774546225; x=1775151025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        b=ovcmo0swYn2ww/v3EbGztb/HEA/UUck+jbS/EhUiG466KgsHi3Km1RdxMTkhlBaTZS
         /BuPekdnW/23Qx44eCEMnvTg/Rvhao3MvVyWlAtMx4TphlsN1XJv6yp6s4UlTzJypJO6
         bPPVgbWLMUziPOV+DheBhgOmTks/JuUtC//apKgmIF2uHPW2Z9nvVvPiNcZTsfvG9pAe
         FITJfz2/YnhwdySHCGOhFCyhdG/jUTh9LO3V7CRpQLHUOTk1BjR0uGFr664fUqbQs/el
         /CuqjROJwcLjVk6IjsZVYOxSJSbvTk3NIi6bkOVhwrOBP/2PMi7mhO/L1CO0WsGRckDA
         eU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546225; x=1775151025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        b=n0eInG5A3fUsLMEcfF+B5Hhypaf6fh+heQEyu3APpp3XnDHB/lRoUl1TiVoE+eoOVV
         QE6dRt43/1N9uMTjg143/KExCsgXOVVpve0J7V0OSgq6pL/ZlacFIqpmRz/hnmrP9pI/
         ivsAHFI4QiiZG3fluBxEjEVw8GRT0rMjLbA0zB7QCwtoyWehU0fKkELbrCZ+a5eJqy7B
         jnOwOon1MiyL3VkHS92VznNK4AOK78ZTL8QbWOBQ2UxVqRbPQTtn0gFPDHTVal0tRkPt
         zH3oLwTJJNCRWrJv0POf48NQhstl0CVG+WfI++jmKR1LvIJGhHC1IHdYIEwGTnz3Sd3e
         TL8g==
X-Forwarded-Encrypted: i=1; AJvYcCXDC538nUCl6cyFo7FnFlCKdfzhhu9Yy8bAaXfU5mt2mfxqZZfq64pkXwG8AZNck3Y6umWBDctPQSe8uS0HIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLPemGefJh6l+14NV3W4T26GxrUfj6whehgbfig9m79GNNh/4
	orXsqBEieppg+l32IY0LbkeDE2hC7kxmr4iC+otogF9JC0iw+yxrLRzVHff61kdR+ZEDEmU4CTH
	VcA77LcqnT/XOMtND/XIJNSv7PFQzeA4=
X-Gm-Gg: ATEYQzwQt6BzI9A4uOKedubvuW3x+TCmXtPG6JH6x6TI1lT2EBTTABE84G0FgvKBpAP
	saGpX6TelM/Czu16iSzWk2U4cqNug1IH2OucBlR/qdOaljVbQmYiXyejOcCywktZ0ebNSNBhLoy
	ensc2ioTUTpm7dTlEy/Q9a7cPwj0PWx7dTWebLs/sN1B59ItK6B9yubByUO0PW/RhwMKTkKN7/5
	pQXI/T4BKZwtBJyjKA3whtmYNlpgLPwvOBY5seuYDH7gFS9n8lZk0TeqL1vjv0xM00dTRVJksoQ
	VynRt4Dsr96U/oA8i1oP1yCS+RmzF3v+DxVhHnAF7ZdUsoAA563y0sgHpdPqxUblGoz1Y55IQom
	ENkZPKPCeZZhpWUr1BYIAUK4=
X-Received: by 2002:a05:7300:d50c:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c164162eaemr1927580eec.4.1774546224910; Thu, 26 Mar 2026
 10:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
In-Reply-To: <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:30:12 +0100
X-Gm-Features: AQROBzD8mk75r53XPOqmRDfmWXx9t0jf0bYbL_Ww497XzqV4mLKwGQ6QIr12vEg
Message-ID: <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 4:18=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> I'm not sure if this is still true, but I believe it used to be the case
> that the -linux-gnueabi target has one behaviour for enums (fixed size)
> whereas -none-eabi, the size of the type depends on the range of values
> included in the enum.
>
> Certianly, when Arm Ltd were proposing EABI, EABI had the latter
> behaviour, and I think there were cases where Linux used "enum" in
> its UAPI.

Short enums? I see `c-enum-min-bits` in the armv7a-none-eabi built-in
`rustc` target, and indeed:

    #![no_std]

    #[repr(C)]
    enum T {
        A,
        B,
    }

    pub static S: usize =3D core::mem::size_of::<T>();

is 1 for that one, and 4 for the other.

Thanks!

Cheers,
Miguel

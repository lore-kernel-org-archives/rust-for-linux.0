Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82698156230
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760636931; cv=none; b=XRQKiIx8Z48KBDMqGQD4wlMtTNaDbuVqRK3dzWaB35lfZ4sOPgZwaQ+4Sfw/eGV/PmmB2awSCon3043Hgnlo8BrmYCi9L3ZvL4HY8DjHJ+e16z7HK6kGlntgeSeCXSttCakFdTeo2LriHcfzrE+NAQ82O/1kTc6ZaQQayVy+9gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760636931; c=relaxed/simple;
	bh=BVGyvUQiZTxyD1hJbxw1DvOoISAi98yFgXmltP+nnLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lytcmCFPiPyv11uqf4iDMV2TXrVU0DxdgA0cYKc+N78+oLP0hbv1kyoBwHiXa/htxbt2uh7NTN9xjIZe0FyJz/RzVS+x7eRxWe1tow/PQqklAPUlHddYSEacuQ/ydUQFbeX5HrpnNceLqJ6ou4jU6KikOr/LCKgGDBOeUpwaLQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlkuRKMr; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlkuRKMr"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8599c274188so151751185a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 10:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760636928; x=1761241728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fbAxek/XudSJdm/bilTDa/VZekS8oo3F9bSouHLDLDo=;
        b=GlkuRKMrJkyHEam/SoTfhtpxaR3sOO5H+08ZdWSymizxYSwCHjjt0MZ7mFWlZbxCkG
         AzquChvPj3T30Hwm89/VWFun2IbpueadgD6cldl61TTISZ0hlwWBjaea25Lp8JeVk7rV
         pu0qgLKoic90731/EyJ6JxGWC7Dh6F1k1lezBRXZutCVi4g/i1hBCqy3fveQOkZujm50
         7i9XSGyP1DGqqN5tSRIj6N8ZEKrfxiHP6Dp6HkqywAbQ31DqSGOTn9uhI3Qj+D6mTNaZ
         HW6ZVoEthZT2JY8aJJLoc9FIo3NWSu1ChWy0Bb1Na7BhI3Vyz2g66ny1SkehfVq5pPZU
         Appw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760636928; x=1761241728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbAxek/XudSJdm/bilTDa/VZekS8oo3F9bSouHLDLDo=;
        b=QGuwu86fIC3DfIkaIPUSKnPmRk5OWFQUVFWzuKTAK+vJtySfNyj5L5U0r2CQTfMI6P
         +HVYoMVQtYnF56hgrkp4tjSwmsYLDcW+x2DuWRh2Suul9v2f1gsYIOK+gNRDEuvL6Ebj
         XKzZzdLkGuz6D/C7iL91NTcGJaU+2xy5xAMA0PhvAm6sFFqsDCw1gcFU/TTNQ5F/axxV
         gF2V0uYctAbP8rlQXDQscLl3qeup7MtMF4z0is+ChH7g9lorMkA5l8l73knGyvp+snjl
         3vnabqkAf250S/CJ9nEFl0ImtHnaErVuyYLXJ8IfIQX7DNpLiLJ/tgUGurJzmmnPTfh/
         FT1g==
X-Forwarded-Encrypted: i=1; AJvYcCVL6M9ZWF2yVY5ClMXUXcGU/Iz+DjVJ8c4ADHYRg9ZargBJTL7mOSQTjKA4yidhzL5oVmgiKI0iVQWI1rO5KA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu6FMhtnYayybsK83XLwzy15rIXOj7l2xAFSZ31PLxKqRGCQpa
	r5wckrzv0u0y0xJFM2YblA195trmkwZLRwfvtPk9QnRwv+sOsU7nu8HU
X-Gm-Gg: ASbGncufshqjbn5+5a0ugIrcHsPDe4DBBb+qBOJzYbVLdBG5N+St7v6L7m5yec/pfZD
	yqvbeEaUyZwKwfEqUQleGKtLl0BlykH080wxfn3DNwwsT5vUp08h+L5vi24mgRuCbpML8b9OIon
	PWOSqZOQ80eMThpm2+SH5qQPzeJArXNyRvKVZE5PfmZJ4lFn53DZYXgET0ERg7M0D970B9/PPMK
	gO5d7z01Z0Q8yPdZtm4bSIb1oO7AigmLz1Dy44Ct01J9F1H+JlhPWLGm6RXAYyVX5aKwMgjd7R+
	2cdQs3S75R/CNWgCnYqenw1h1uIffLQw8sj61VlRnoQ0xAp4UTVzRuls6KCcs3OLtN+DVQ6nonx
	HB3gJJJA6SCHmRJfuAKZEz0zKLy8u2gTW3h9bvkKyFe3m+CBQURqrsakuBBQaCqWJCR80nCYc
X-Google-Smtp-Source: AGHT+IH3+Fae4k22gY3NVjEqt4enc7pxuqkgdu3bjhkqSWDqAE7JM060ERq759Poo6uBtl8GK/pyKA==
X-Received: by 2002:a05:620a:25cf:b0:883:9b33:f6b6 with SMTP id af79cd13be357-890709ee994mr113167585a.84.1760636928217;
        Thu, 16 Oct 2025 10:48:48 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f38bf32cdsm239783585a.57.2025.10.16.10.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 10:48:47 -0700 (PDT)
Date: Thu, 16 Oct 2025 13:48:45 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org, dakr@kernel.org,
	acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	nouveau@lists.freedesktop.org, Edwin Peer <epeer@nvidia.com>
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move
 bitfield-specific code from register! into new macro
Message-ID: <aPEv_UO4vViOcOvN@yury>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016151323.1201196-3-joelagnelf@nvidia.com>

On Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes wrote:
> Move the bitfield-specific code from the register macro into a new macro
> called bitfield. This will be used to define structs with bitfields,
> similar to C language.

Can you please fix line length issues before v8?

$ awk '{print length}' drivers/gpu/nova-core/bitfield.rs | sort -rn | uniq -c
      1 118
      1 116
      1 113
      1 109
      1 105
      1 103
      ...
 
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Edwin Peer <epeer@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitfield.rs    | 319 +++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs   |   3 +
>  drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
>  3 files changed, 332 insertions(+), 249 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/bitfield.rs
 
...

> +///
> +/// bitfield! {
> +///     struct ControlReg {
> +///         3:0 mode as u8 ?=> Mode;
> +///         7:7 state as bool => State;
> +///     }
> +/// }

This notation is really unwelcome this days. It may be OK for a random
macro in some local driver, but doesn't really work for a global basic
data type:

https://lore.kernel.org/all/CAHk-=whoOUsqPKb7OQwhQf9H_3=5sXGPJrDbfQfwLB3Bi13tcQ@mail.gmail.com/

I've already shared this link with you, and shared my concern.

I realize that rust/bitfield derives the GENMASK(hi, lo) notation here,
and GENMASK() derives verilog or hardware specs popular notations. But
software people prefer lo:hi. I'm probably OK if you choose C-style
start:nbits, if you prefer. But let's stop this hi:lo early, please.

Let me quote Linus from the link above:

  It does "high, low", which is often very unintuitive, and in fact the
  very commit that introduced this thing from hell had to convert the
  sane "low,high" cases to the other way around.
  
  See commit 10ef6b0dffe4 ("bitops: Introduce a more generic BITMASK
  macro"), and notice how ALMOST ALL use cases were switched around to
  the illogical "high,low" format by that introductory phase.
  
  And yes, I understand why that person did it: many datasheets show
  bits in a register graphically, and then you see that "high .. low"
  thing in a rectangle that describes the register, and that ordering
  them makes 100% sense IN THAT CONTEXT.
  
  But it damn well does not make sense in most other contexts.

  In fact, even in the context of generating mask #defines, it actually
  reads oddly, because you end up having things like

    /* Status register (SR) */
    #define I2C_SR_OP               GENMASK(1, 0)   /* Operation */
    #define I2C_SR_STATUS           GENMASK(3, 2)   /* controller status */
    #define I2C_SR_CAUSE            GENMASK(6, 4)   /* Abort cause */
    #define I2C_SR_TYPE             GENMASK(8, 7)   /* Receive type */
    #define I2C_SR_LENGTH           GENMASK(19, 9)  /* Transfer length */

  ...

Now compare it to what we've got in nova right now:

  register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
      3:0     minor_revision as u8, "Minor revision of the chip";
      7:4     major_revision as u8, "Major revision of the chip";
      8:8     architecture_1 as u8, "MSB of the architecture";
      23:20   implementation as u8, "Implementation version of the architecture";
      28:24   architecture_0 as u8, "Lower bits of the architecture";
  });

There's so far 36 thousands of GENMASK()s in the kernel, and only 67
register!()s. It's a separate topic what to do with the GENMASK()
codebase. But now that you do this massive refactoring for the
register!() macro, let's convert those 67 users to the lo:hi notation.

As a side note, for GENMASKs, I tried this trick:

        #define GENMASK(a, b) UNSAFE_GENMASK(MIN(a, b), MAX(a, b))

It works, but bloats defconfig kernel for another 1K. I don't think it
would add to readability on both C and rust sides.

Thanks,
Yury

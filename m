Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752B835AC1A
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Apr 2026 07:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113958; cv=pass; b=hzzb07y4B/FMdwj5dnphcXX7HzWhc8E/U5LsgtmtrXwYTkXzYdyjJTbk2TAeBjZ4Eh0fEbxY/GUMUtJ4l8huILYxBznZIMMP0tlGJyMuXiD8ymxT3CLa/iHbS6zrxsdXEaWRL3dvzUgKhZrVKxi13/uYL45ysVKW/V+/C0PU/xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113958; c=relaxed/simple;
	bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMRfSnOdn2OKRxI5OtGVxAN+PXnL3Jj8PzjKvPrbRmn3F87/6MTY5rcMKN91RWCrg429xNwugLqRnnr3i/Gcdxc+qqyf93d1D9QxSfltLaVTYplNuyn0QaoiQTvUAgqz3Iym0K4PW6uTjX6UnXV4/VpSNSSdFCfJ2sMDKLdMd8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rctgc0sm; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rctgc0sm"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bd5658b901so21707eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 00:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113957; cv=none;
        d=google.com; s=arc-20240605;
        b=cgmNu3TzKzH5a5kM1AaF8tAO/3EQGYDN93m/WuHfldvWwEXQj6GhUQaMdG3+pToOfB
         Aa5pz7lW6T3P4IHhEfiCTV1FHhDwEM1yZGuy7YVSr9fc43fBl3eNwvL0rsoKgIz0dJxE
         By8q7uqdeknUulciMVQkpnODz2qFh9E300W8/rM/AqJqwBRsX21PfZcmW1gRwtlwiflr
         wWX18hiM3wOrXkPEwgBPovIpzBJ7y3Bizherchd3ggfPbcyZ892jzy9CEx5DSiD9t0mv
         9xQdVvI2gd6kM42vBHw8KgRLremr8aiMswaqrpfvWlRC50OCpsJt4dSnPhuYcW3sq5xb
         coQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        fh=KDPjXZsMYuEjgU15YikftioH6jnsq/v5H/fN4MpOA7E=;
        b=XxV+jKZ9Jn6lG7rz3934kqqWubmBiHpjkceHKcGwnGPWe5cCaPbdz4zGqIulHa+W6l
         zFwBPtRyt0UPQsVTfebp1yV8fQ/pMRjXOQjh4cpub+neEwz5crz75oynYJ6QH1R9FZw0
         31uR54AuyA+0DPaO4Wzhygl7ISVGB+0NXQJ89T0HFWHzaQUA64PPuJpZu2Prl+NDQ2sy
         IUS71PEXpW165qh+nnEg4p/5ZIKAglEm3PH7kQkRoNxxe6t4TO4pvEkFMXZepf1sE1TP
         0lHxODKqp14y/DJu4f/Qq9PcWyEyfFXWrFTHakTRZ3FiMxkwzs+P4pLnAISTh3GtAwEF
         qvAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775113957; x=1775718757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=Rctgc0smJaz1L/DzT0w31Pkz2ioXDTbLbdLHju8I+MYH+TZcUE3kHlF1I3EWm1SyCh
         eQiNL6PiFdoKan04df3xcrWzktvgLtMghA82LhAy1WM8mvZxgLz1GSwI8XqGOCnMQ7YT
         2D1lyJ0uq3ZCMkSjEpGiGkD4H86zNRjQKPGPw6RpZfq6HwjQJWO20WsfP29oaR3kWllo
         UTeti7cU9wsmV9EetTySmlcHgqjE7xKikJY34Of/cFLLlkcsUWK4X7Vkycacqi4xDHHa
         3JLgo68Gh6qywE0saN37PiY4ogF+/E6JrqwZSKSReopxi6fjf65hPIDqvZnM7SCkNmQJ
         AROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113957; x=1775718757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=HJ0YxqKa9GWcapqlx84lSmnupU+nG+Y/bX+sFLpmAky18hnC+7x8/aGXut6A53PUoG
         1eGwUvXZAQRePK7CT0gn2/qGMMXPku/o+7IOf+snz4U04eTFbMthxnyxoedqxBAnfzo7
         cau0HZMWYH6oiak11Nr7lRzPFBLoGYQmaOEN1uOTBM/LQxUSZFwcl8PbRLJA7CwZR7fk
         HV8TzgkG+VmoQQikvj9JISJkCcwocbieYyZWUmOQiVnuNOr0C66Me0YfjWaZuBCr3+cK
         jFGtiH3AW1hynaWwz8JiSMoBMC6kYqp63Lborp11Y2PKzk0d6myaDcAhqYDeHPg9FvQy
         ZuVg==
X-Forwarded-Encrypted: i=1; AJvYcCXsHnRrmb0Zw0L/rxR+fp0amUYg/bqnzEv6+v31ydyGieqxq4IKw538s+Rrs3PxhQMTEnTFulr+uq0IyJmt4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWHZK1HJ1susiMAD1GHDuPBb4foEzWcWLW3Kr1mndOZU+Kf9T7
	Ma1+JMMO+1AZtgstrC0jem5XKktKUUSzlY7lCQ3f5xaZqn4ijEtqEYiqeLMXTcdshcRMLHQ1dzI
	E2Ov3btSJJvB/9Na1HHaxpil+ArwEENY=
X-Gm-Gg: ATEYQzy9ZIvXfbj4hZdbOj6YZwHC4prOw7/mcCCGVo7MNzqjESvtsXZK4xhwzOj/Q3A
	/1Nq+tkCKOghRxyYgyoJ6IlSD5gNcH3uZbjfaxi2lGxosniKX89FlrvGASDfmtM4cMBYERG496o
	t8S3ukGT1yBOK3JTrpl+WsBuC76oub2uCM8felcSSF4O0Bv6mSAlQYmvLKTDz7PdfBP3HMth6jQ
	/2fq8p4o/qa/lHOQt1cNgVvSY8EnnEUGm0nqKHJB1EGl7l9IGBcmHrHNBzEUbG4+SbHN8w/UaB5
	QSwgm3YGHSCbU4r8v2Ozfblm9GbvCBPdSnezoxBYnrx6z4CvExfhWHILjFwVdO18f8yMIVi2GDK
	oAWquITmMJOQ1UdEp0C/rFNg=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr1634311eec.4.1775113956496; Thu, 02 Apr 2026
 00:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-16-ojeda@kernel.org>
 <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
In-Reply-To: <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Apr 2026 09:12:22 +0200
X-Gm-Features: AQROBzDaEWueCbjTzytnJo43NDIAkvyWYngeEqQLnAsLh-4PZJOJIJpad43tD2c
Message-ID: <CANiq72n4sCU=2m4Uee8Wpsv3mjkw_BuT8Sg54Gu0U68j7qAM5A@mail.gmail.com>
Subject: Re: [PATCH 15/33] rust: rust_is_available: remove warning for
 0.66.[01] buggy versions
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 4:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The scripts/rust_is_available.sh change looks correct to me, although I c=
ouldn't
> get scripts/rust_is_available_test.py to run on NixOS.
>
> Looks like it filtered out PATH but uses /usr/bin/env to find python bina=
ry? For
> obvious reasons that will only work if python is located /usr/bin/python.

Yeah, the script has some assumptions on it (e.g. it also assumes
`dash` behavior vs. `bash` in a couple tests which I should relax
too). Happy to change that.

Thanks for testing it :)

Cheers,
Miguel

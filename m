Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC546360
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Oct 2023 00:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="IC7f6XIh"
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B456A9
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Oct 2023 17:24:51 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a7fb84f6ceso42602027b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Oct 2023 17:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1698711890; x=1699316690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZyY4h9nyPS5deoSFzKu3srKHn2nQp1lqv2qMRKBafU=;
        b=IC7f6XIhuQxhzw9ovP6cx5GhPNiVgE5gNpbUU7Hdg57DW6u0nPh/oC+ggNkGgEoXxC
         GiM9aQw6N0lcX/PZSYtkxsOy9FU7KVzPuVszLal9O/MDCpAWZ/HO4okNBnbhZ8A4n3FT
         sH5XdlvbZ0LSNAg+tOJWd0tLUq0E+USKUz6CAydmu+kuqRDMOio8Ctcx8DJpHJusMqqz
         jxxjitdguF/e4/D1xKJyGB3edfirU26841dOjtNbGsyT5mth/gFn2bFAuIf6x0Hs0NtW
         QFXMxJ1fIoOkkWXcvwEIXCmWDMkiZGpERKmCXN18O9WWsOElh2p50x9Oe3PQ4dwWJRv5
         kLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698711890; x=1699316690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZyY4h9nyPS5deoSFzKu3srKHn2nQp1lqv2qMRKBafU=;
        b=Pn4S+5OOkPobFVBEDyCa5UNGTrwEUiZRYEYlu+Fys8jlM8uecuyHC0kqH7nVPfEloJ
         eAs4srKbOFU1U6UH2QpKj2p1ELaQWTjTUfvM5WWXpaRKbo7X6wnv8M3tme9BNpmsN9ar
         Lix7ixfvpm7yqN9JZg0yGC1dhzI24yzKFrJTV24Hx5NFGOg8XReYEbd7iuIyXPQ17mK4
         nfvoKJq7mdH0+e7O24r5CWbRFOyXIfIfbFtZX20MB4Z6UTJ9aEulREtZKOLEkTWtS2WI
         7BWisH1xjGSUFEI65MnQQFAZZtxPBJXFMe8anu+oI5dBKeW/Oxwo5wJLzeLb2P4ocOiT
         tySw==
X-Gm-Message-State: AOJu0Yw68gmRLpw/0DI5TAFXm8UhIIG6LBJ9z2Yv2cKlhSgc5TzVurze
	xRj+YwLzBIS9WJ83En9FuSA1lR1mx6ESbcCzCGtaKw==
X-Google-Smtp-Source: AGHT+IF39wsSRIslmfqaY/jvQl9/P/3a7uBW9zWUq8MPAkfRbRZNd+eKM1IuCUk/bAtSUCAV1lHWN4+hyqg8YHP4GiM=
X-Received: by 2002:a81:ac4c:0:b0:5a8:2744:1565 with SMTP id
 z12-20020a81ac4c000000b005a827441565mr8679890ywj.4.1698711890564; Mon, 30 Oct
 2023 17:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com> <ZTT/h5wKL7STeOhC@arm.com> <ZTUCdS0Vrev1iQOv@gmail.com>
In-Reply-To: <ZTUCdS0Vrev1iQOv@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 30 Oct 2023 20:24:39 -0400
Message-ID: <CALNs47vb+-_wD0uKQJYVMswHdivOr-1v6ajQ3hQw4wNs4Da0rg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
To: Ingo Molnar <mingo@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Jamie Cunliffe <Jamie.Cunliffe@arm.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 22, 2023 at 7:14=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Catalin Marinas <catalin.marinas@arm.com> wrote:
> >
> > Adding the x86 maintainers - no functional change for x86, any objectio=
n
> > to this patch going in via the arm64 tree (part of the two-patch series
> > enabling Rust for arm64)?
> >
> > Thanks.
> >
> > (keeping the rest of the patch below for your reference)
>
> If Masahiro Yamada (kbuild maintainer, Cc:-ed) is fine with it,
> then it will be OK to me too.
>
> Thanks,
>
>         Ingo
>

I don't think this has been picked up yet. Is it only waiting on
Masahiro 's ack or is a new version expected?


- Trevor

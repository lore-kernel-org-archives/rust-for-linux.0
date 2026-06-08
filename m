Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E4838F630
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902321; cv=pass; b=CXU61Us3ACyJwajY+tNPkpCbnfvyZ2m6eLhRKrGIZWnCWVaVJT9KuVbJ3KcsJcQoaJ7OTyyR1g2SHVX9dJ8XQG8FZ+pjMXNtG+2FT7Zs73hblBg1Qs0RmV7PtNf9hQitwq9CDAwYEkuysL75zp4mf1PgxifiAXfuJoylU5PfWGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902321; c=relaxed/simple;
	bh=J6Z2RHY/NCDFoPrX7lhs4FTKKwpaOxpIvJqta3A6z60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCCx4F8zhG36UlXirQ6n1bMDYXUp4YI5JcupistjhpkMy9BEJpibNa014OzH2rtXAkaTF3XHaEZ1BpQIewuc42cd9y0HcrPmwt8DU1Z+trSlZ2owQRLR3fjZfaekMPjpJasuwMFgBx2aDHI0wTyGPBYx2IJetzGRu2j6jQIJnoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gW64x+L9; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gW64x+L9"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304dc707bfbso208559eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 00:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902319; cv=none;
        d=google.com; s=arc-20240605;
        b=XrMvYxcwVZVKmLKtOl2JKz/deV6MhpfudetYuaGHOlEJucecdL8jleFndcXfcanw+M
         67hJxFvobWjdtJ6jPt3we7lwggfDPR3jKOt0Td/Eg9liaQgKBpgW2m1xA3bCDm16gvuA
         kuzITQ33FWgLGdwjgCUQoX/VTjZeeEuBZDszs5FML9GERjTu97Tus0qh+cIEh+2R56QB
         QqJKlPM4aahjU7bp4IBYan3IzxLtRY9kvDxafHNcIs/tbRpGQPQu4RTA4MRITPtJlxKv
         A+q/SKq1vl3t6bhqqFMpjRWCl3cMlqYmeL/6hxLFZ9mvHvzOSsQMCwV0ptBJI1qVCMU/
         i0dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qXnP6T+INpylmBsxtscmRoES5uiMtsm/3pgjyt6Nko4=;
        fh=O6qMHKIy61KR7HBRKZnL+UeKQTS2Gxf3fBVqH7qIbqo=;
        b=fp2qlT91fSmRiHwyg9A1R3Y2jV876YLJp9PNvVcOWrCeO6n5nl2Pyi9F1tcEAxj/6h
         YftYHSXSu5xtKXkas0kBX86Lju+TQ4TNuPyZddtdSxAkQg/BNNxupMOV1Nlel0Tmqciv
         a8coflPFkNfYL6+LhiWhfgkRrBXh3PlcUCGTUIsSRFltOup0FagowYYfMJ7HcP92aCM1
         WncutXVV1y6muwEhWR+8eWKcPO4Jjl1m5wB4+OR+gsn/aKCbOjaUBgQv03fATbBeS1Wh
         qzohitEbdx8XkgRJXofFiFxboi/InM9svWyOJeMBXtj247/yz+m2RRueZ9aNCmxlbP3g
         s8HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902319; x=1781507119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXnP6T+INpylmBsxtscmRoES5uiMtsm/3pgjyt6Nko4=;
        b=gW64x+L92hygzkwVcHbOrih7mWyvRCP0fm9Q0guozA5Q6zxSZMmCnJYf4D7I1il/kC
         5Yf3Z4Gr9jopiuU/8IQsjlRp4Vsmn7dVGgwT5iEM1f94Zhlu6U51UWGov68DtwfXWbGi
         YcoV5pVAgDAdja4O+skFC+6g2ribkfBWF4wN9WmP98DzXzV6WC44w434DBgTOWhHJXgU
         SFpeLBErQdZSFjlqYsrQgDbXjozyVmrSqkOgkVe30hPpXrloEdxXleZMwyrs/blRNtTJ
         LfSazKDX1iDE87Fx6zm/6r9Wz/H2lyF3N7T8K292sGC/g79kPizEaVTGaYPvL1+tD5uF
         Ax5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902319; x=1781507119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qXnP6T+INpylmBsxtscmRoES5uiMtsm/3pgjyt6Nko4=;
        b=cYAeiQFx2vtskK9m28Q7zUGxdT/JQPRfJe8FA6BGt9s9fijObWPFyOF85ETFBqC8qs
         IDx05ZiS6Zz0ZlQHqNpT40FCiA1/XD65X+zqX5SK4f6DwIHZt7wc3Kf+VKr85roErgUy
         AuezzHIK1M35Ls8BIMlKwxNopHg87hpFFrnDbCxTE9xC8y7ld3KKExaLcEnl7HiZVYpf
         ltaK6VcXkmY2nJOcaXHr8RrHjPfMKuDVfn9JXb2t1OvRm84KftMMUcaMFuGq0IcvD3XZ
         gS1GFCeXZT6r+gwErot/oM62Pr1pAQ2vFWaXd6aDLjZ8VGPxqsqcoc26HEhuGdlqiY2F
         IkwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qDL8i6HxCmY7K2OqAdL7BWKCQ71jOSxdK/NPKbKbyU1/Gco0hiLx2eoV49d8OPTMAXmPfD1HH1XQ7VL1tBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJPaYwVp03HmH4Cf9pyDrMpSPY2XGWronPYTnPRcd5eu+Iahx
	BJM4VfIdBD9y8zjFyxCnuWuvDKnCXhsOCXoPSySAkhMdL4FH/dNbCA6vAoDf3XC5KRsrwYhVdnE
	edrmjBozliwDMBvez2HNeYoxxwZK4AFs=
X-Gm-Gg: Acq92OHL5iASZXWKUre2O5WxMz/dDN8OO/h6K9SkP5vT9q1ucVMREwV6B9D33SLs8ye
	1m8UcQ1ic/4GWjH47XQ/Fl9QwLvQqC6nESUcFTustoM/S/IGkDVYUtGuK+XOaHrZoU7+xhD6zZp
	HbLokC9kEvpXZdrOQw/CNZdxsdUo2UlKioKWXKyNHP+UhQAm8QPaK8nF3stkZdpKQYSmkPPDkbF
	//nLur1PHlHhaFzzyZ7BrykIHPGR2MUrZgSwYb4KNcyR1esUT8HqqMSHZjC4kQnUWz2bdq/b4RA
	uNJrJ2wTSsDMh7Zr09UPmw7LW8w/nnyW+g/0YndkfLt8o5MJQ2GNq1G8qJtp5wd6kPaNCDPgDJl
	BESHvptO7h46Bw7szjyq6/Kzhbh1JAgtF2A==
X-Received: by 2002:a05:7300:134a:b0:304:4f23:4823 with SMTP id
 5a478bee46e88-3077b326a5dmr3445647eec.7.1780902319255; Mon, 08 Jun 2026
 00:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417031531.315281-1-ynorov@nvidia.com>
In-Reply-To: <20260417031531.315281-1-ynorov@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:05:06 +0200
X-Gm-Features: AVVi8CdioJIDDz_cRAY1RuWSS0KDIb_lefz9KIF5grkUbE8JNDNatMTjZg__w7E
Message-ID: <CANiq72kAmcLa6AJy_-Z7HOQHuQeDtd3aUNZUJ9q98FWF88knVA@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: add Kconfig.test
To: Yury Norov <ynorov@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Tamir Duberstein <tamird@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 5:15=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> There are 6 individual Rust KUnit tests. All the tests are compiled
> unconditionally now, which adds ~200 kB to the kernel image on my
> x86_64 buld. As Rust matures, this bloating will inevitably grow.
>
> Add Kconfig.test, which provides a RUST_KUNIT_TESTS menu, and all
> individual tests under it.

Applied to `rust-next` -- thanks everyone!

    [ Fixed capitalization. Used singular for "API" for consistency.
      Reworded to clarify these are suites and that there exists
      the doctests one (which is the biggest at the moment by
      far). - Miguel ]

    [ Fixed the paragraph by moving the new sentence above. Added gate
      in the other example as well. Applied proper formatting. Reworded
      slightly. - Miguel ]

Cheers,
Miguel

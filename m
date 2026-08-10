Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C8A199EAD
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 05:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786338115; cv=pass; b=SGhNKjauykuW97Afp/BdUXWksy6vFOOCCC55G/n2gfWxo0V1Ei09aTjK4zY+Y7CLDqef03LmdpuOD20Vcv0/svscQsEb4zyFwK4ApZSdd0k5Dm0fFzKZn8FdckCXujfbqsBTM96p7PSI/rpMHmgVnQtUPpVJuELLX5SfzCZkKvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786338115; c=relaxed/simple;
	bh=GT5rs19C5FDSEBTK6xGK787uoKBVWq6uHI5lLJ+nDgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNrIEvyf0WY/i4ObRUbpKgmTg2g5SJlLRTkz7tcFsmLvNbvZKNvZQ9hdMGXoubeG+2tq6GZac8sRFBbiJiwtUoCBekzOfXXndmOKDqAKAbCqNYDmU3rY3vIL1ZeLdQKhzciinP6D7OuPM/npm2FCDKhcS5m6vfc9IFTfJknKbaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOqqlI6H; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOqqlI6H"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf420670bbso1738065ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 22:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786338113; cv=none;
        d=google.com; s=arc-20260327;
        b=nAUI0BsrXw7y4OZ9+hecwjTZYtNAqMf/eT7lDVqFcbUZCp/S9+iQYFNy1ZtFK4G+2D
         dKyMI2WmyQLpoKrLCWhTBfwZMkdBo8+DqsztKyf7uFUQFrpT7Xl2vTPcfqHyPuy46oYd
         dm26uaJa2H/4MLbHfLT5XKTsBsCRQ81RBSW7FbtYsfj0+g+WM5waN4FR8KlV6/3HXYjX
         pXPiBzE1j4h3m6IDOs/hMTme02CHgYX9yDLrzWWjaq3yVskFHVvzvumAoCdsX20yVLbt
         +NWSMPXo0hJENgQ2LmN5BDbaXJ0LejOYs3mAlYMcxS1kuSTuS6yEFGPCPsGZA6U7TrGF
         6qNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YHMte4tPUAhhAJgf8b8p369MKxkixJh1MDeedaqhFrQ=;
        fh=mb3FVEjVEP9cO5zRFUAMo2iYkmoZeahodoOyDYjziLA=;
        b=gsho6bkH+0a5b9ETFFg/TfpGz2wTpEpPxIsGCR5PSSMdkbuT/7MJcXTJJIDjR/fQiW
         xBJQbGGu/JvdnN4IjHgsuaTJ/qForaeM19leJLakvT47ApszffeGcbl9mYR6DS7OdEXp
         MyBd7GZFbgGGxKh8kprEJra8ozyjlJbwEF7o/Pb25P61ytihqCBgLWd1oihpsHnfH87A
         VsXpRTeDf6J0FknR6VhXR4WzkIoSTVccM1saUgRn9O+PwBwyecgsQXdPW/ofVEtSPVaD
         9buiQuyzGnPpwH7XLBCt/wSIHxTdiyf4eQcywkDXc7BOI9JwwZqlSMXoGFkYKosbVVNd
         CJWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786338113; x=1786942913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YHMte4tPUAhhAJgf8b8p369MKxkixJh1MDeedaqhFrQ=;
        b=eOqqlI6HwogRoSoZ2m6EJ2oU6eo2lkHWJO7CGDX1pVSTbFz0RMWplt/T1ggfuSXUSl
         CQapqMZ4D3LJEqrs3Ru/63ThybteAM7o3+SwGbmWj6I3P0xqoCeviWHxCZehJjrVmXoN
         ZJnFYJolrvzPvpcqdR0gDRAtQD8A85XPfQ0g4EPxsbp5r+QhKXCdMhh9w8X9SCJ7+r82
         r6wHJWIA3O8/oP+BgFqRI/UzufPvhlBoD2JrnBXvyiM1RCsjKPuRaejTTQUW7k7L/ira
         txzSaNehfcDE1yu2XirOHo5JV6lEQrCWXDn0oYabCFnjF8qqFjGyNfUk1aREmvxTTXTi
         8lMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786338113; x=1786942913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHMte4tPUAhhAJgf8b8p369MKxkixJh1MDeedaqhFrQ=;
        b=IuPt9Dar76Ise6LShkXKOBkrvmPl+Pu5VyoWELbXUxfUviKSZSUlsl2DC6ZDXLinAA
         PsOUApPIy5CgEVr7HJS5R3R8ukgATN20Pc2QszkXXWq2YvYWKejcV4EnoR5XJSE7dLDv
         ulz+2SHuSD1OFI77nuEISgku7LEWE3BW1VW4CktD20gJNNDL/4TEa2EXynupdIb9BMLc
         vXyBHasxrxfKVJSW4t23Nyj4SKTF8Qx1+j2y9qrqH/6Ser9qGgqwEL/DgKfAHOevmBqz
         +VdwebycAsN3+Qygy4XXHNXWHXUEwnxZGRz0BUaN/9pESTxjh8FDuL7Ykpqg/GhhLrUG
         iDHw==
X-Forwarded-Encrypted: i=1; AHgh+Rqg19KSAom6axz4xqORPyUrMZo0a2D4KdP6CScLef9fo4PZKRV5ZJSljILnnXvp+iV48dFwgo/KxZEP7GQZQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrxl0B7uR4HhSR7YYCPzalxrd1sEOMsna+wsONxRJp3EItGg9u
	wP+l9/HFWQu4wAGiKTD2S7MIoi2bTInqFEd5kPIwsIim/75bfln/wvbBWKR1RbOaLup0YmZFZDE
	fhsh6/54Pelctp8iSJ8Lqcok2qY13/ck=
X-Gm-Gg: AR+sD1389yDUkl8XldDuOurPLXQvqhpIZYuEzIrRqMDRwlu87ae3FNSYaSdL9Do4PYr
	oGXOP2sWGCaelmUBfsf13DJUbGIVSH+wg2GE7KAKH/WklP4Ie7KPv9bzS3cfHB8rwozxD7mTPMX
	1nTxFLGZxkIG3NM+gU8+avHvnbPmHDfYXNq7UolJ0EDjANHperhA5bFSGDgB7SZX61C5HtfFrEx
	pj1IJ/YXts5N7qfNBJDza6h/8DoRxOdT+WEiubwROdbblv1rbAjvcPufKs/w+CltVR5KAtWf3dh
	MHfhF25a7SZh1W7pWg7GkpdIFbTG7hyhL8ri+uXV0iY2kc96Cwfom6Ch3JdJ0atZTDYke6HaVIF
	ecWLWh8R6N6mDSrAWd9ecMDSsv+w+5zsns1lIWfudSX78z43bISBMdpxUgCF+
X-Received: by 2002:a17:902:ec8a:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d0ca1658f2mr342427625ad.0.1786338113327; Sun, 09 Aug 2026
 22:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807175012.142083-1-ojeda@kernel.org>
In-Reply-To: <20260807175012.142083-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 07:01:40 +0200
X-Gm-Features: AUfX_mx95vj8FrH6tA0wYWf9BbfO_ViRrS-g5sCoUfSntZz2yMEEU3c1YjejFQQ
Message-ID: <CANiq72nztGczTOMEwy_Q+apt10T5_zuJ8v+CgWcwCgip3DjR_Q@mail.gmail.com>
Subject: Re: [PATCH] rust: bitfield: always inline test conversions
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Antoni Boucher <bouanto@zoho.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 7:50=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> From: Antoni Boucher <bouanto@zoho.com>
>
> When using the Rust GCC backend (i.e. `rustc_codegen_gcc`), GCC does not
> inline enough these `Bounded::from_expr` calls:
>
>     /usr/bin/x86_64-linux-gnu-ld.bfd: rust/kernel.o: in function `<kernel=
::num::bounded::Bounded<u16, 2> as core::convert::From<kernel::bitfield::te=
sts::Priority>>::from':
>     fake.c:(.text.unlikely+0x7be): undefined reference to `rust_build_err=
or'
>
>     /usr/bin/x86_64-linux-gnu-ld.bfd: rust/kernel.o: in function `<kernel=
::num::bounded::Bounded<u64, 4> as core::convert::From<kernel::bitfield::te=
sts::MemoryType>>::from':
>     fake.c:(.text.unlikely+0x90d): undefined reference to `rust_build_err=
or'
>
> Thus, similar to commit bc197e24a3ac ("rust: num: bounded: Always inline
> fits_within and from_expr"), mark them as `#[inline(always)]`.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Antoni Boucher <bouanto@zoho.com>
> [ Reworded to add the error and to follow our usual style and sent on
>   behalf of Antoni, who found this during his work to support Rust for
>   Linux with the GCC backend, i.e. with `rustc_codegen_gcc`.- Miguel ]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel

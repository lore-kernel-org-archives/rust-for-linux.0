Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEDB3A9D9A
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909329; cv=pass; b=QEnTJV8XwUNmmaTE71Qo6AJuHDByoIMJXcx8AWmLuLv83KtxrEzAhWLo3qYt5bShkcJIveLVA6qpvy6S4TL7KvCIxUeVAtZgbo1S8aQxzUPZeUIFUWmXwUldmYVMY+aF/c3Z65c1S9Wcz9GVeRv8oddMd0neHoOYZj5xeL7PLNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909329; c=relaxed/simple;
	bh=oyfIXHvJ98lzCLYtqxqH99qZ6fquibK3EW4aQQeQ5Jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKCYFBO+mUsDnl4v3bZPDkx/oMtV32SYefnWN6/odrPcWUa/8nw0aWmh47csys+dWeI2B0hViAMENyZWAoOWf4RYfWusN1E9jX0kqjgnuV7dcYQJ158KNvGE7FgHmn+m6s83cDscu+L8EULOP8uWs/h06o6M+WLPFRy9Ev9FchE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWbfxIHz; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWbfxIHz"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137e836ccc8so289081c88.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 02:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780909327; cv=none;
        d=google.com; s=arc-20240605;
        b=TVs2RFTAKgOuKFAuLrvwTQBWXEcKIOCzOg8TwtpkXSoWcuLsOAc8Fl7YBJfAR0r2i/
         taUm91CTDpHxioiXKl4jCg4Pms5ei6Q5cF2w9Lq75F9zo1Nst0sn3ypPvyLFHV98WcKK
         8VGypVlf0HLlx9Fuv/mA8e+6UHRjkDoIUNWWZ9vWUNrbulSuhyUqKtM07IQVeC1TSbR9
         IlmdIoWAWnrLCE7Btt0qHttkXhuxVNUl7GoqCiBaJuz87s1odN4KEL9ax3r4hoWlR8a9
         cdijvE8H2iQb59dvQ3ZxglvGgq1eVilMPdfyWT8pg2G6rsWbm7HsTbKmHb8bBJU+7WMI
         h3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVTLCGuGAwHf1qybjMwSpsrAUNAQiNhcBDJ4hB06mso=;
        fh=OKAKs6nsZXiBAM54G/6cNYSpBLFUp2wuAvPr+wiWkls=;
        b=FD2PIsm+S+Gokl63Ud4EjaPsdOIhtrNuApE+GUMHPV7k4ggkZjs74D4HIx/qlm5ER3
         AqI07jbp2NThM1ex4VWgoQtfJpxtBzi8OiojoobmZzqO4ISUjkcnQ1uFPsZl8042hTUs
         u67fjfELKRgY1PyX94Anfx5Szc0DbyiUBEeWluaxNE7lMZIxe5evEIb4zTFXrKbFL53Y
         H8He2YRdoxfOePHKcsZaxxowMND+PzvG7Ey4J8ydMLSw/HCmKdq9FPUAORSWOQoclLxy
         DDcdmtl2wtJJefUrQWZbGfYrfMU1+gepcpJddI9hP3fzuctoVGVzVKdaXXUpKQRh+4EK
         cWiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780909327; x=1781514127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVTLCGuGAwHf1qybjMwSpsrAUNAQiNhcBDJ4hB06mso=;
        b=eWbfxIHzRuAnRWmmYrrRk2QRCQB7/nSaTXbp11D8r2xCLcXy+4kA6lMO6YASHvd+wx
         ey3lY3WFvEIwV4WjorvFz54f0PqW6yOhYI9edwBiMXnazSqxya235agwjVJs6EtlzYlG
         EFFOn2lBrugrgHoVZS65eOBcFNubqorSsAvk+95TJ+1YIDJs9YsqWbe/Wgmki8opywdB
         5zYrQWuk4BrY+9hwLsSZ4HfdoQyu/Efz7Bx8mDiRj3zUBCNxzCxklrlB+tWGjUXtUsMD
         M6YfVvIIG4oNGkb+1mbrsOV3WJm0DiPL6TcgPN59b3PGOaYy6h1wAlyKD5G3yjg7mx1+
         amvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909327; x=1781514127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cVTLCGuGAwHf1qybjMwSpsrAUNAQiNhcBDJ4hB06mso=;
        b=WHLKTIh0/Pt+A8VQO3FWRdQhEaY/JHUwwV7ykzkQYCyf4F+fzm/sdXiiK5wfec4CAz
         m+re/nKsnYpaAcwCYnuY+/zRIYsf7kQISIdPy1B7I4T2nuhDn1uAwiZy3ZO/kxDAIpJB
         5RBM2PDpn/zIIxZqkPpR3827nRlhTM261lWqUpBpua9PsxGMwojYkASyVYj2xwOL7sAu
         nOWkhrXXEmK9v2uoeadWkilvW0f7Z13w8L3+xh31S6L3pOy4DVRPceUdkmjgwreVjoc6
         qYJBnSe8S54Vwn1U27iodG0szJsPghDwH20PgYtz7GB5PZ885US5FLcYKDI93+UqZZ3J
         L8PA==
X-Forwarded-Encrypted: i=1; AFNElJ8iTbPkie2PgABgxeSFZS2J4FjgKtZgjzj0TNbZ4UmejNLUz6K/YqXBe0clOIo4SUr/4zFU5/wF2XnrX24RMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydocmuUDIR3/Blh2+TB1kBZV46EcyY/fbHrhQKQqvOxSuhRb6h
	Ezk7aY4v8aODVru+h7Io7fpkoIqw0am5hUe362Gz+XGfSBwP1TOEGLcT6esvN/Dg9FXohuAySD0
	d4qQQxZWkbOMKvIVRelt1saEYBAKoxzE=
X-Gm-Gg: Acq92OEtUzsKWtPdG+bjq2sUrtnQ6f8y9aU+hzMdx8UKfowT4qWGUIdfSfj7dotP7AJ
	zv1Ce7bWsH8Lf2AJaqB+Pok6xNNKK7jtk9Y3Y39YVaqajcI1ni8OWcPAUx4pG8bkCvUbScQEsln
	copHVz9sBIX7hvmelr2rToaiJrvg2vzncX61Z6LSONjR8cN4/SfYuEiD/zazlVxlOGbqqDWPxWC
	iGRPVnbfbO29ySAqb31J3/3U33vvgt/dXX9bPXXAQkFrqZUyvzEnILNv1kP3C+9d4Xo+jLfhRiR
	Yjjhh1v0RBuai27xJNH3EuQdwhC5Wo7Wgmft7QOP8cMOHZ4VZ8NZT4niabxcmJ0tRcy+TdSf3nb
	oK7X7eGoxrxn7BFm0/PGzqaLqwOAk0enyogSTesLZAGN/
X-Received: by 2002:a05:7300:760b:b0:2e6:b55a:76c9 with SMTP id
 5a478bee46e88-3077abaf9a4mr3325386eec.0.1780909326702; Mon, 08 Jun 2026
 02:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-unique-arc-as-ptr-v2-1-425476d2abdb@kernel.org>
In-Reply-To: <20260605-unique-arc-as-ptr-v2-1-425476d2abdb@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 11:01:52 +0200
X-Gm-Features: AVVi8Cfzt5ToYKOyETquAwmhBrhd0q1Dz3nOUVndwb6sF4EjtuWE5wCbaWAidN4
Message-ID: <CANiq72n8tPaJK3VBMusxt2YWMY0aHXmyEDQJ46XF3Dg8ySD_HA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: sync: add `UniqueArc::as_ptr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 3:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Add a method to `UniqueArc` for getting a raw pointer. The implementation
> defers to the `Arc` implementation of the same method.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Relaxed bound moving it to new `T: ?Sized` impl block. Reworded since
      it is not a method anymore. Added intra-doc link. - Miguel ]

I used [`UniqueArc`]  since that is what we normally do, even if the
other `as_ptr()` doesn't at the moment.

I opened a "good first issue" with that and another bit I noticed:

  https://github.com/Rust-for-Linux/linux/issues/1240

Cheers,
Miguel

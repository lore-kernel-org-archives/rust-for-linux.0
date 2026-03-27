Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EC53CE4A8
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598547; cv=pass; b=t0/IatrxkunXIdneWINYndpmFA//qkRtS145x+3qWs5woUvoug4mj24/eKK9SSPUHwoap4S7ztfFmAaQEX0BPS5wlrh5uSEigGXHEP7ftFIi581jIAbx7fO0DAkSPp9QGB+k+aAdZdcDaQNMwzGW+vaL3ypzaw2oWBBcfSZJXkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598547; c=relaxed/simple;
	bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0VAJmCeIzw/kFR7PQ/zurXA/9h8C3P/kpc0BWWv8ZFIBxch0DAnVJv9HiB2LzrUXZPHUQVKTgx5ql1+l2LyIn8XLJXj2qg9KGh2sc3PtFJvvJgEyAmshiPxCSyfwT3WZf7uysVUHak7PySgsgXdZZfsaHyUHUmckUPvV5m9w5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip7e6S7z; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip7e6S7z"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12711867ca1so128401c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 01:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774598537; cv=none;
        d=google.com; s=arc-20240605;
        b=XW4MKCXm1vmWEkwDWWTPJSFEk0bXH7zLk2DCM6/T/gIZFJnY6MXmqbax0FMPv6l4hI
         mc9aGGwZy8dh/iOgdIZHt+RI+8fBT6DhlJSa+MXygy/LV/qjdw2ZtYFBRxw1jdDxsnAa
         v6zilxSOWToYXWugRqChldKv65/JVJI30rtjoEifrIJemYXGxPHJ0WiUuMXjmNnep1eT
         hR3FvqxW9SpYf5ISKYw16GYyNTxUTAgzeDfd4mvViUEfwoaHD1VxUxWKU4/u57222Xc5
         lcoUJZbfTbA9YcehhVDtj+Wjhy5HuwZb75nVdPxvQxTSYMdn3SgUGzCr3V7kKKZaAZ6Q
         2InQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        fh=jZqVHGxKlOLt8DRjgbAMMTjWXSfkhe5LQXFCKuAVk9A=;
        b=Fep1YtYPbZ3WC8qp7uPQtpXhdaq4rAAM9lJse7qmYlkfRdyoTemtp/rY7bfw5741rG
         7IEcdANj3fKuE0obLTiBJEgx3SLDI2GX/IdwdBHGlQi5UrChIHYZS5JyytrPlLian5L/
         eCPj7JdV1n1L/ZKoMyuyE+ozhKsMpNqy+Cso8KAJdY1alQJV2xeE7FGiapK1ErsUmx9v
         5QxC50iquVk8TGwNLbmX51/dKv4Gv8Zp2bNdUEm7wqb+nTnEuFaQ+GNIlME1OqXvBJta
         ZLystA7jBArAMqvM312V9pUsawCPmrewJPKBptRqKZul7IjTqSaDt1tPKlmBnFyGafFe
         AoDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774598537; x=1775203337; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        b=ip7e6S7zpCeJ7eeGSTa2rHzbKJDRAwZw27gAeAwCIvkQ0inrTfHGIn53JgaGi0hdtb
         JEYzuo4bPKJrVimZzcGq4ydDVDxGVMo/kwOJfWU0Fq4kNMPtikpZ9mCnTtWlp4WvtV/O
         DNNnF+5MXn2BOskGD6CpQZqzA+3hR/70uuz5UOnq0vkixKU1opgybYJ1Nf0Zlin8Ezb5
         hldMxEzpNKusZZJfwrPFiH2/Q1oy7o5h9dVrzDEt7Q0d7XHgswEMI3ayB1lyceWbdYOW
         tHR3YU788xHCVEIWJlCloNhIk9aKs0KuK9H54kQFIedRENXOQq6V2K9z1tcDdXvPWyq6
         EQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598537; x=1775203337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        b=S/VN21KQoj5b95Rn82uwVP+Ylc0CF/6cFjzbFtf/T9X4P+CK+EHatk51vbtsQvO2jw
         pFW1BWrSWtvphczGSCLDykNljuxrna6mSOfmQZfe6vkp9P1SGVSVJUPui6cGF5WHRD3l
         +aXeOb82VBAzrIJ2IluQ0UWCEgeSXkoabHP2zY2yuzS64qvebe4IG00NjmtGSaXbOinc
         jr1vp6aWemaHvfx/auLimG/sTUFp8dIrCL/eS/jagefAd/k8RqWWFd3vRBf7Vs9R451j
         x7kdeOi50BwhZ7H1u/Hv6wxVkMc0N1fjYfgt/0g4WYAde3q3zvaV2R7B1yUdm5xDKCVx
         DihA==
X-Forwarded-Encrypted: i=1; AJvYcCUOMrBR5ANk/L8Y6q25ECz9+ECk9CE3fwaOqcOuxSsvkoo6MP4VYlm0C0/L/LjkGGnqh3+5WeX58wZD+VKstg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+xZbLs7x6Y0fcDXmsJtu0xBGgAzXcpWxb9bXYwEiFEIpw/T+S
	GHlsHano3lMZvdXMlJFyrj2XKgJKCXrhHI0VjleBIYYB4FIoeX5xSRiNgUsnAFtStJijnYlrNos
	Nq4ky0QAYbA3YJs8sHCOxCT3NVkH/WXs=
X-Gm-Gg: ATEYQzyKkUoNdFXcnH3yMGHBHYz0ic4IRicd3yWqUdUS6XjvDHcdOMEmvUsi+NirVKO
	iV7Bseo3EYXyzE3Em0Iugy5BhfO7F5s6PQ328aii1sCScOOCBloglqqAVyIrX42IsY/G8mnUMDE
	KtdVbstWsRYNSCHS8DOPRZ0qYstmkR2zd/f+mJq1ber5biag3JVaV0rYCavCrDBCu8kA873cImV
	5dGbJpLLEmrpLNtCrHuDDQ6q2Tawx2MvFZj28RleCoAKxzg+9KgZrjPhVBY2JDyb7/MrKtxMrgE
	GciD2zhtCaFM4XG8PtPzy5pecA0o3b9oavmNi+emtKZeQvqyBDRX2IXzJ++NZqrdtM8353bV9Li
	quy7nPEDXLSUS/vyPe45RnF4=
X-Received: by 2002:a05:7022:618a:b0:12a:6cde:fd0c with SMTP id
 a92af1059eb24-12ab2906c98mr371178c88.7.1774598537022; Fri, 27 Mar 2026
 01:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260322194616.89847-1-ojeda@kernel.org>
 <7ad8bdf9-5eff-4443-ad15-c05355d793d1@app.fastmail.com>
In-Reply-To: <7ad8bdf9-5eff-4443-ad15-c05355d793d1@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 09:02:04 +0100
X-Gm-Features: AQROBzCrGdIlIe2CkDWKMkYFmP8XiqVc047zlhYRt_gjOqAGZtEWFJuOGnDO47I
Message-ID: <CANiq72nz6zB0jGahw4Eh-i-Rew1kQ0g_qcZ68Whw==MyjhYaJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	driver-core@lists.linux.dev, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Alice Ryhl <aliceryhl@google.com>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, 
	Johannes Berg <johannes@sipsolutions.net>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, Russell King <linux@armlinux.org.uk>, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 10:13=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> I have an older patch to drop CONFIG_NO_DMA entirely, which
> may be better here, since we know that nobody cares about the
> empty stubs.

In case it helps / for future reference: the patch I sent to Marek is
already in mainline: commit 2cdaff22ed26 ("dma-mapping: add missing
`inline` for `dma_free_attrs`").

Cheers,
Miguel

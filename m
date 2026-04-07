Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD639890C
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Apr 2026 11:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561013; cv=pass; b=D/VRZMz3pwTkOpgMP0+f5Ve5X8IaoCivWXxqg2sFh2rHlqgECaCz8YXPZ3XaL1LoNkDIVDdvke1JIYayxrbaWvM2/nOvVyCjCKtXDH+f1Z1Kv1d39x9LoxGvtzK2j0RALLoQ3jeAtX3sDh0AHlSuJ+k545B6T4wgia3Cn7PUL70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561013; c=relaxed/simple;
	bh=vyEKYOgGsMgyGj/dx3XhejXkuQr05EiiRV583URqoEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PhqebXW6e95zNup/PJigfXOIibDI00hlku668gXRM9KXsm7hEMXJjmz7r7iWTYnZPkSpnBUQ1iaIL5MADe/SmWcZ8/ZYchlLATbz9eo1i4e09aIMlY1wjvj+bM4Yo8fxZcTKCitMirRFlGSWcnionwoZahdLWIkgOu6s93wMAYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZWYgSK3; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZWYgSK3"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-127337e3870so307727c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Apr 2026 04:23:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775561012; cv=none;
        d=google.com; s=arc-20240605;
        b=P5HFHwINe5AsoKhSCDd7SAN0LaDhUDJeNsufRc2r7Km9mbXC+pXY8K1t7YfRCFGieG
         gtY0Un7h+yuCj2Edf3eVcqn+FviuHE3DOxL50h20fQH3+y/Xguf/ozLZhFLEBfvonHrS
         tto9tLKiZJ5r9sOqfuSASi7Py3C/kIubNUuuhx5WHCerihyHRjcMGdbDzbPasmuAKn66
         kcrUwbQXkVjzxcbXlfr58YjvTgfnZVMdCTe+fLNFedhBIM2f078BOi9D/ZshDX/o/T0R
         tz3yhONTLzt/RCStEw3JbiDKHMJHQMnHLpC8iDHxq5dFMZzHnfYuumdkPccsQUn64sy6
         dtCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=70PflmpbGuo9aNiBw1MqAYQa2PxwLCzxhNEmzh6szWA=;
        fh=lftO+FJ96/SCaKljO60ARVYzVsbz8iDTLqy4hvyIrlw=;
        b=YRFyeUCGL/UwnWGHvK/EbAji6DMLfoTmW/OVTDp4updn8DxJWGeecuWcS4qOaInMUq
         uTz8JL5zk4RMU8sp1xjEAeiJOY75Sy7hVnE2QbANkpbMtefxD25XByd/4z2E01zuzxFe
         kqrshAMr5Ki6ETIsyTPxPUR/Ft8o/5Js4OODGwXyhg3LAXmIL9rKJPy27q0pXXlP+211
         ekNMrI3Fy1RvygMfmqe0A43MvuAHtFPBAtakQxhRTXVld1+3XKLx+7VJhb6bgO0xuvx3
         aWZeaRx860V+22E+jNCtMr4nkmK2GahYWiGemUk4oa9Ti9K2JUgTOZYCriAO6i3on1qD
         J8vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775561012; x=1776165812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70PflmpbGuo9aNiBw1MqAYQa2PxwLCzxhNEmzh6szWA=;
        b=dZWYgSK3uviLb+tY7EJcU/JaGjqwJjqamLubyvyilVYF7rXTgtSqPVJoMIuzYjIwmV
         6bcBRW5ITGluDqoYJp3Mh10lMwDnnkL7qQNaQKH9u6a91P2KbbKWggDTb1mUcx4ubSYt
         UXLtO+DwH1kb/QUqLvXNiBNBpG4ekhpDaRW6CGbi/HF3gUDCXl+OxFIap3IgWjJ9Bim4
         7BzSr9jjNc8qMIuzWHY1kMWXMYhadS/Vl2MrvEJ2sMWvzD3DW5iiiWEiTiwamSPrW0ah
         dCUkqUqvhiwhY+s9jeMO0fInz3A2fwt7Zzq2qh/9xhje/+vcyzplkcYrPl7DtPMh+fNP
         SHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561012; x=1776165812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=70PflmpbGuo9aNiBw1MqAYQa2PxwLCzxhNEmzh6szWA=;
        b=ckCEqzBSGoDyoTZgzoVpiuZg0AcAozMlxqfIfRAK1tGUHGnFoZ4+Tt8E9imZTZBcN5
         7IY+O4JsHVsf0SJo/30JAzXC4gCL0vMjMe/hI08MSUo+Vs9Ekc1wEolyJIuWuQ9topEB
         FFq6rMf0Ci+HT8N85VYG4pCMMm6ulflnI08SAYC8iu7joUptJw4gJS8ZB0Danvbh79qc
         rhyGdHkwa3l+3MKrtARB6V4LQeGHLh96QPXaFkZqN5KngfUkGuJKVsNEyjYJ4BNXDWQt
         PcEqeug76vN6eU6c4KdzjH40/bSGb4UAzMHZMLqI4a2GNR0D+6dTcUVl46KK6J4ldBTc
         DLOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrHfEGB/PqizpQYFeTe//eelLHKOigV/FUQoer8u4oBNSXuemagW4H6VOZE8IOPAXIT/HFNXpzsOfA4+vSiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHRd1laCBMQJevnO9dGxAFVuck9hVREMcxZUbkRNMhblK+iTbO
	aJToFb6DpycTl9zuXSyPPIagzPxGMcwytT28njWuEbcob1AdY5f/bg89bznKoG+f2uBJiRwdW0a
	APxa8kFabl5Ib6iQ9udT0++23cZ2RkkQ=
X-Gm-Gg: AeBDies3NDe+6MR1lKclS5QDfmQa1sb1G2vCgEPwGEUoRwQ1LP58hgMvNiOuAnxBaL2
	linEQZ7AVCyQihXedqbqaZD08IeKLccKkLTB3s91OdlEsfvBFzJFXFSLB55rKxkHHnAkCtW6hNd
	j0dbdPzVbbc+MMAHKPH3oa2tYsUwvjw3W3diXGHC7jTKYogWGpExkvQQfT9kjOoLgTVB8soanL9
	RHqQg69otZE6GOqhGl/vmPCysvLZVTeetPkxVLX+HaEq7jkuwwBeLnpRmIrvsL4Ynw0wB5ZjK8r
	txkkIPK7Bonokw9S7pk1AemmBn+qONSfnFwn61elggpbu/vbXf5oZzVCwZIdXhjjkUPJpXmlobv
	Rf2BXsPEK/RtE/+DBJbf6cR4=
X-Received: by 2002:a05:7022:4396:b0:127:3480:7ca5 with SMTP id
 a92af1059eb24-12bfb6e272emr3996015c88.2.1775561011432; Tue, 07 Apr 2026
 04:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-cfi-lru-status-v2-1-89c6448a63a4@google.com>
In-Reply-To: <20260223-cfi-lru-status-v2-1-89c6448a63a4@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 13:23:19 +0200
X-Gm-Features: AQROBzCNWAk5rL_k_3isuayyo7DDXdp-BQQdPuzSVdiltV9LhBzU8M4R6bjpKb0
Message-ID: <CANiq72nQ9x-XPh8eM992CYr0=M=9y-4YqMnB2Yjc1XqKt3+viA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: declare cfi_encoding for lru_status
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Ramon de C Valle <rcvalle@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 10:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This patch requires bumping the minimum bindgen version to v0.71 or
> greater. I did not include that here.

For context: I took this one into the minimum version update series,
which is already applied:

  https://lore.kernel.org/rust-for-linux/20260405235309.418950-1-ojeda@kern=
el.org/

Cheers,
Miguel

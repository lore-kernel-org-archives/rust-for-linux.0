Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE12525C71C
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Jun 2025 21:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749417990; cv=none; b=f/uwM8nawSgI+qBwzXqdgXHuWLL1oD2KMvusLw+PEjAUG2zLXhZSICIBB6ztzN8JI9zFDDA79W67SWQPogS9fv/4zqRTg7wsh1+xHo1a1SIZyKx9b4GCB9of6KArPrzZVakP0pWKFvvSyfP7Aok2qWdT0BxyXIo362jyXlkOc2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749417990; c=relaxed/simple;
	bh=HbNKnFwcxu/a8WqZsQbpYKZWGP7DyOMNZVkpNSBo4Fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6H/CJONeSf8WycncrZMktjARjl/lPD/N+xGLNzFC015w2g/T1vhvLLdOVOO2vBl1ZRb59/wr4MDW5obRT0Wcvs/wlwVKE0Y4RifX5Il49WIWMDWHOQsoU9x5Bfg2kuKm/lD3CISxWlfB1HAn+SPLiZKMe3r7mKK1W1KMOuPKkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSBewLSA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSBewLSA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234c26f8a25so6054015ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Jun 2025 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749417988; x=1750022788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbNKnFwcxu/a8WqZsQbpYKZWGP7DyOMNZVkpNSBo4Fo=;
        b=kSBewLSAuJ+4YbSVAdlUat7N77ktwgNKUMBYETe0rzkTGdTryCD4yQ3zZQCpd4yrLK
         gh/amXDI41yE/wXw1Sco9F50aO/183A76mAUsANHuWbn1lYfjkOP005OEi2AgZ1CbCM4
         dSTR0KO0AcfqsTlbXZGxsxQM059ShchsG225F+BoxGG+EBHH5qQB8sCPFsIYfxliugYM
         vSseCxJ5LFbLVIrBEJe0T/XUdMaUFD3vUQbxF5jyZJr0EeKTkEr4HALtoraJfLAiLb9F
         hf8xWB0vb33WyWs8ORV0t2grYC71CFfcdZtvGhaWv12BlOMmtkutzxFc6KJcodhqzEXI
         T4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749417988; x=1750022788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbNKnFwcxu/a8WqZsQbpYKZWGP7DyOMNZVkpNSBo4Fo=;
        b=h4SyU9KOMrqklELYas9sBM5f5X7Kz1sbP8islR5igaTYLKjaUQvTeCQ8W2amyT8jeK
         DtIlt08jsxupmQ7uVPocijXT7kRg6hgiSS9ggO+juW4gXnGmuS/o17D++bH/ZrBFFmN9
         7sjqMNMCBoLUzfpP6NmrHWL3CZhcLh9GikWjFMVD2MLNuiND1pTwnZzyNQ7eELt3Of2j
         VN7TUgxuDj0A5rsHt9Q1CGC0zN4JC4p55BgWTsxGkHXtqOTMCo3jlF8IZIvRcnzt9EJf
         do3bWm4Dxt8ahh8Zz4PTSC58WwlY6/JpIXBr4Yt2dq0R8I2Pcp5kKd3EAv1PyZ53LynT
         U1iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE5W9Hqwk/E6cg/Y6gKORCdNAi6XXicXwu1xrgCyY2lobLDy4QlbhwSqmcmVMG+ja/HDGbpTNAnENztHZKfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8G5Ofsa6qrlDlBDjMS7H5AIUPGmOmI8d6v3uTaEN5oGAd7Ef
	P2RfT0M+KtiloE/Aa5u0Q8LRxkb1EzcI1gJH9zuh+pmobx8uXlRkj66XVNRk9+pSgD/U3svoub5
	77PAV8729xSYZ27uZM1T/ARIY+f+gR6s=
X-Gm-Gg: ASbGncuhS/SXSJgDea0TMYz1K7SJp6H+AGSwmYXamBN1osOPQdgj5ol2efwHEiQpVv1
	bPgqZrfX3fzGdhsKQ78Dlx2VvyMCoOl+li50Q7C90gowYP+XYKyUS7ewkVxyBIhYj5Wfb4uy+5O
	4mcZyeFzwa+4YWliKa4aNBPxsEJDqPfNmn
X-Google-Smtp-Source: AGHT+IGsxwt0awORS45wuDoC/NjjgkjyfoW4CAQh9UWhXgXD2rBHWFavDzm8lkNaww0AwqCPYQDVFRRdDNQdN9eXJU0=
X-Received: by 2002:a17:90a:d006:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-3134ded1839mr5741112a91.0.1749417988105; Sun, 08 Jun 2025
 14:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606020505.3186533-1-fujita.tomonori@gmail.com> <CANiq72mJwEm5aMCsrKAhD2e9p+ZyrL3d+4zOswM53k1pbDyyfQ@mail.gmail.com>
In-Reply-To: <CANiq72mJwEm5aMCsrKAhD2e9p+ZyrL3d+4zOswM53k1pbDyyfQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Jun 2025 23:26:14 +0200
X-Gm-Features: AX0GCFt8xjiyPo_ljIunjJAjWxhkS9NS8Zb_iEyNriJjdan7exn-IDVcdJa9oYY
Message-ID: <CANiq72n7SgO26P5kFuA1AnnzmUW7q2_7FtH+nUxjoxjjcMeD5w@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Fix compile error in impl_has_hr_timer macro
To: a.hindborg@kernel.org
Cc: alex.gaynor@gmail.com, ojeda@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, tamird@gmail.com, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 5:34=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks Tomo, I will take it as a fix then.

Andreas: anything against this? (Acked-by?)

Thanks!

Cheers,
Miguel

Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D781F3BA4
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 22:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757455463; cv=none; b=RCq4Vrr5WWuihtX+O2zBZLilm524tDrsYkthe2lbxpN1hW9odULb5N5LZKAi71wdj1Ur58WReUdbofSuyB+krGhFv2yVSffPgm5cpwCpsxakqqlDdSX5xipCHZ2eg3Ax6D5bSP4TPWABAdXunZEZrhVaEMqL3NUrarO3GAGmsn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757455463; c=relaxed/simple;
	bh=vJE7SAtMU597GHTC8LkC90WpJdQrYFWukdI48tYxJKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l56Asqf5Uvu0U/QHmvEiROs6APBqi0NVf1k1ucWvMl0mOtRV/oQ7KWMXFtnvtB0pFafCkfHxDxXdvwYIynEs73iM4UZj3mHEmuQVK/ZUS1xnkfpo+M5Uex0yz3dF6Q/j/6bNDOrDJUpk5tm0yfu9qahdp06HQWsRAVNiNJU0TGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZ2Hstc7; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZ2Hstc7"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5632630dd04so614085e87.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 15:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757455460; x=1758060260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJE7SAtMU597GHTC8LkC90WpJdQrYFWukdI48tYxJKQ=;
        b=dZ2Hstc7zFsxKirwsahBNJrBqdtCUAK9fJirHm/3fOOwd0qOEd2XwKN0QBoWU44Z44
         Oeh7BQv3bl/hwzidSpHpiF1SzFxq41gNGgmkWZBgMp535o5wgaY/X2edOExE0nT5uYkU
         IWiSFbCX5lA+5Q9U3DW5aQLH8d/9u8FHuNIJV/bR7Dstp2K74ZHx0WDBdd4Oz2NVN0qP
         6Ml/YjEg/3pMj0GHMzrLhDeFEcc6qmuk+3s0wj5eUNpc8A8aazPzTYx1ntOYgdOyygwp
         TK4ZYlJMYS1wfw2ARThHca5RfNm4a9gXfsB5cvO9TDbtAMVY3U0KKDnrayUx/niwo+ld
         NTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757455460; x=1758060260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJE7SAtMU597GHTC8LkC90WpJdQrYFWukdI48tYxJKQ=;
        b=bykqeCH5mmoLOghgoNivVx+6wNmgWh/g/I+MYSAvRawXo3EEfz86pAI/LrsBZ8f9Ig
         FJC0pElWpXnxQg7ubqIbjdXLVcqqkv90CcDFOWHNdNChigOcdL7SbZsBLukr97/HOm89
         /WLnn2i6CamsTeuraGlPFxU3Bxy7VkW3SdRIXEy8elkZsHKKIAmjsEHEZWhoGECR5uvP
         B2Y2+mJXWxIIEbkTj7gmLq1SHyqp7gx3EusFojNBoJoHHd/d4SAZXCYt3PLPCb50nCnP
         8mDxiXO+3mogC8UmRWcssLzC+gSo8bUwO8aXwVDvqsH71PXWG2Khu1RwHWuC0gIRO9hi
         jB3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnndm8Y/Tw4XdzCw1VWLZFe1Ky2pE3bjvP/pOreKnu16q9LTku6MrT6EJheqQPrENYiAeTve8wsEkI9AikwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Gi+xcKtuhbSdk+49SsckyIoZnJq2TxfetIMN8gSWZCPYZFu4
	/iwbTrp2HLQxDXlQhhzvQFhR55g5GpGz+SBpmC7gLm019P61awpQLkDCtv/aSMzn+A07cp+C37I
	UP0qGzQWudX+8urdiNhGpCXGAGnv1w3E=
X-Gm-Gg: ASbGncvKggi0xfIMuW7+qQgfS3Il9KUD9OKfJgVTFT63/F4Ov2MHwRJ/EtCKM89ILYE
	fqancZ4fOwJHk84sU/dn2HRHyD3v0D82Zt8ZKSK4Jwk8dtrHH4CvS+Jd3GB0KO5eXiMzXC8itCi
	05hOmTeESveZTRW3o90OMOUj88ShYHm26mdwCD5OKwt8SJgiSqdXhTfBkyWiQfn4caFyYuFR66p
	XikkXSSl51tVebzv+VfdgJlfaxqbchSRRQDmmxzfawsBD3xmeT0cyfukj+iHgtCFxITzTOaHAIs
	LQ7j8l92x0gLDb1datHImcXcQJBbV0YExzbF
X-Google-Smtp-Source: AGHT+IGaa3tKhTEeaj82Fyo2xoHmCsDsP1VnOtUkctEIYGUN0qmz9E5woHXIzyMUU0VsfLfEZBQ0b8TrzmrdoI/zncM=
X-Received: by 2002:a05:6512:3ca4:b0:55f:4a0d:3f50 with SMTP id
 2adb3069b0e04-56262a40f6amr2161481e87.7.1757455460118; Tue, 09 Sep 2025
 15:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
In-Reply-To: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Sep 2025 00:04:04 +0200
X-Gm-Features: AS18NWBzPuHqngmTpgXNZpIRD-OdqL2Y5OEaYpGUN_Vn-7watZfMYtmQRtqbWzI
Message-ID: <CANiq72mYzgx0dB+yO4BFBRCNEKBcONx56Jp=h7HKVXzkbRn_Sg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] rust: add `Alignment` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 3:26=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> prerequisite-message-id: <20250808-falcondma_256b-v1-1-15f911d89ffd@nvidi=
a.com>
> prerequisite-patch-id: 2439f5f9b560ee4867716f0018b5326dcd72cda3

I guess you had this in your branch but is not actually needed, right?

Cheers,
Miguel

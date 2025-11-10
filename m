Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D49316CD33
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776262; cv=none; b=VDOoJ5ZeTPW1oAkcEgJbn+A1IGgoTbGmRs9Qmd1HM8NtOmyGQTyM3rVa7D4NlE3XCApD+taWT+9zEm2NX1QFs2dtaEHJaBbjftoeBXmLDWvD4/bKx/KA9jSS7piomnip1BHwrqA8pF2LCVh86Zu9KGJwQSC1HTH5s6/iANSJQ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776262; c=relaxed/simple;
	bh=eEgXHGzlAYOJl5c6fOfboUSe/VxaQBrlFhhrVppwDjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAb7kyJKCrcc0rLi00jg8YinAlrphSFmgS75esq7rhoD8KTfedximjc4hNvmR2JT1ZdhCe5E2vJirxWe7X42Z0c7cyIoW8pAAhN7UHkJOElGfC8ieoQzDh7PT6umcZtdxriDKKNUUlyNK84ErT5pnYxMpjgb5y+rDBpZrlB9q2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRo1jBDN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRo1jBDN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2952d120da1so2094765ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 04:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762776261; x=1763381061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEgXHGzlAYOJl5c6fOfboUSe/VxaQBrlFhhrVppwDjc=;
        b=fRo1jBDNOiODeONp2SpTugjWLgOK/efWMsHQLlQHcC39kP7+sh9HhPLPj8/JizonyG
         7b+QCsSt3zqOWPgd+pwpn+79kM+Tr8XpShLgFpvK9sMrxUKcafSB+bvJWIr0APKJPJg7
         FfGmp6mGdLDLVVDc/3CMatGQRzDhuP14hfaMDLh5eXTBTTKJpB2tfGfVMO8UGhsboMd8
         0wN66lqOn9Lx8RL+khOb2Xs2xWJs92R3N/wyljDcWri9FjTgglb3XYeu1hzEG0LGrpMO
         WNintcuhk3OKBHp6Bk8NmnCMaSr7/2x9d0tZpj+cQfVkCU+sDg1w2CE8Gmq4SmTzGKUa
         fZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776261; x=1763381061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eEgXHGzlAYOJl5c6fOfboUSe/VxaQBrlFhhrVppwDjc=;
        b=Y1RzRnv0md1dUnwAU4rDkFyvP+ME1mz/xIFOe1qMYSBQCb64bI9WsH+bAEXi188ujQ
         CnIHtflCIRujzTsNmqHDMZB/FotdeW9Hml7rcbCi/igEP7VpvP7LelI/TPjN4whoGvDa
         DvbtSEDRvr8mc/GkKiebzHuY2sLjxdCPCt8lFtopCmPYF06dAEynMg9Fafjudmu2DQUw
         0go0Ta4rK2m5X99/yvFWW5A8Q5pqV+L3hmoNQxAL46/STBhHV2Ese0e/8klUaYlqRdmf
         K5jB+/RoWKD5OrYssEcTWTVpfD9GCDgut9DSZpVwVvv5qmznQNJCNSiJ4HLH+QWLmAEw
         l3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMunSR8EwpkaviWm41Enj32TpK8mcwSBd2UqIbtWrlZXda5nYTomv9Dyu1rhDO8omGIjcjzW2snWA9j86vbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqj5tbclt54qUyPAw4ZB12EOx+MRRje4oqy4ksmdLsJOl6+GJQ
	bfVuA4JAKgj/Sww/7pTGmvZM2LzCS/DmS8cr085mUaDZsdIpM65qcvk4lvbEsNZFn1HL0v6QMR3
	4uTB1N5eR1mjsjtpjOoY1ioPLZpt0ZMs=
X-Gm-Gg: ASbGnct7kKBpKpXzm7JYq6kyh7VGFzT/jGtdMLRbwvisMOnLrYpJs12Fpj911R95Mh9
	MP1RohoV7J9f3YQZtbDLIqu0FlJGyQR4eTZj7pqCSMJWjNnHiFtqAzAx+9qlArVY8p14cOxNN+g
	dMgaaCgEwiqZM/IJ6646HsOw5tcz4ShTJOgwvc/Dz23j3VlUZjCBywGvmxVwHxDtidCbQcFFSTI
	cybvzyhBiEAH1Jf8WnrbmOJDhJQyEhtANMShOKELDw+hZgMX/Y5EcMFzM/zR8RssqXi9UnqvE+D
	Kfwwt+Zr+Mri52L/J9RyqDFO2KEcXYPtoAVOYwP5g4tsM+Nbe/bgLBrNm04i63AJ38gZK54zGR6
	CX83UYYEgmOZP6Q==
X-Google-Smtp-Source: AGHT+IExnxjKRMhBvCvd9Nw1Vzpg0dilgRX0ilaQeygPAtmrJ/VO92XIw2N3ZJ7sb6hS/zOwLVLxlgfmv0VAGSAIzy8=
X-Received: by 2002:a17:903:230f:b0:295:70b1:edd6 with SMTP id
 d9443c01a7336-297e5643e76mr52737955ad.3.1762776260815; Mon, 10 Nov 2025
 04:04:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110113528.1658238-1-ojeda@kernel.org> <aRHSLChi5HYXW4-9@google.com>
In-Reply-To: <aRHSLChi5HYXW4-9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 13:04:08 +0100
X-Gm-Features: AWmQ_bklNKkIpzDaIt0BmvJnv6iHBReLEFoejSD6lCAMShx-lppQSbZzdpW8AeA
Message-ID: <CANiq72n29SUnmm3Dos_NvWbxW-vuX2Y2j7AAYROpa6ruQWguSw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: allow `unreachable_pub` for doctests
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 12:53=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Maybe we should also allow disallowed_names in doc tests?

Not sure -- I thought it may point people to try to come up with
better names in examples. On the other hand, for abstract facilities,
it is true that there may not be good names anyway.

Cheers,
Miguel

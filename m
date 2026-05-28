Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D66379C43
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959877; cv=pass; b=UX2IH+9DvcmWwlKuCdzqolpk/cI2Se7UZUUzp4QAvKJXVvgsesk6yubKXD9CoTYw9ytrhvoVEfehPH+auuNhdcsEBDOvdX/wzM7JcTB3VggkwNFyIzGpSQKWQ2jOCtb60IDSAtbmKbWT0U6Vd3kaetO3u0IWCLQSwvKr9UswiC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959877; c=relaxed/simple;
	bh=WhO5G6gzlFr32SqW7CFgcwHNDWkrtQdw0YHY+Igb4l8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tfk6Yz1kEXgQyYiYgsFrmxcqnORvRHI2Tkt5iv13Gm1v+0mxN2Zxf8jJORd/w5aaS2+k8q4ebbIes50Drk+JIDw/n3TBX9ic1Zl4GZVeo7dp0Lcx7tTfGVZW+GsbY3mmnkGOGi1tN2jwBMuOzZimjXxFg6OLoIfKO+P97PMg7pY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4lu7th0; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4lu7th0"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a86cb123e0so1224039e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 02:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779959874; cv=none;
        d=google.com; s=arc-20240605;
        b=JjIQE9chEoW3VzgmdvLDAYhy96tze0BcKJj8/40g9BpO/T1qP3+qf/YN6lIhS8qxgB
         TPA4H8yq3pqEW6EyzibKItQzmJVRAkcFyqB5mWpfyCk8aeLv1JchBgqYP4eE5uVhvniy
         wW3fx4dqkU8pat0qhdNoOoZmaqWYvunHHx874DXaOD6hqdNYrbxkEX8gbWwV1tBbpSZf
         A9SkVcwAHbeKisItRxBgNbeTsdknNrt2Kzwux7PeDuA/XdU1nU9+3XDnQCcVToCp9Pnc
         /0jupdgK6OO2eVqWOLzMGrWWWW0jLAC/kvZebi6X3RwEm+oFnIATBOfQS7Kmgovd2cdl
         tZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xAoLVzm1+sBvhfJvAzz19IzARWt64sZWYa23INP9RTI=;
        fh=NRlMFLFTXdywqTXbJk642d50bygDWeAq0iIYV/ySWI0=;
        b=M/Niu/Dk2bEfnYws5aeOfLiH7oQH+lLCVtGaUu9vJB+nCu8+gZvR8aoxEDeVZZuLnI
         CYp0/d8wB3btKr7TojoJq7lx8vmLMhF4NyJmGKhLAwRMZMQ2JXjLi6qFVYvp+Vxlduia
         vpzjHoiKrQhtM/IXFn3uXMeT+XAxBTMFqm4Ns8o+xBdxSOkZ+uW/J7xVBiTk9bMu4x52
         gIo+oC2veqZUfSTLcy6R0VaYy68H49sAlmgFW8vYGY7NfM6h5Tg37qR6RjGDmdi50PJ/
         +1Rxn222QwVK2AQXN8ptHUsUK1JR7QYTpNzqj+gcFPyiksaJlPJOioIzaL4VE06693Fw
         gLDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779959874; x=1780564674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAoLVzm1+sBvhfJvAzz19IzARWt64sZWYa23INP9RTI=;
        b=e4lu7th0ipxaiAlMCWifMQP1BONf0aabT05qqTqyBZ2yqwio9OEhPPwKE01LMLehOK
         Yp7yysyReuryinPG6rVTmuz12f+LboSccrYqhr1vGm1RBsTyafSakReNAyiFpXtRB68C
         3/i4Phw7ihBGL+4OJoiyhvWK4JJGYMdWrhxb8rjHmBX26UmVzAU4GlJ8pEsbrV/s7n+x
         EgKjFj7Z2+WUYlFFXtpkMDlrXaEKo2PgzTWIprc4YQNLje5SjWj13Chf2m72P3keCDli
         ttVseNCFc+aNa8kphSkQOZwWSsJ6tefc5nhKGwMPD5tzn45ah7k8x7M8ezFsAX9irw+6
         J4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959874; x=1780564674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xAoLVzm1+sBvhfJvAzz19IzARWt64sZWYa23INP9RTI=;
        b=mChT0Ug3nz/9StcRlscBc7bsIWmZ/g5xyPFeTnJEWtZbPxUxq6yPeOZkkw9Tc0NVPF
         MIvabk6XuIhu5Ei3Zjr+Cs1s9IJdHypxDIeQlfFVmfM6ojH7DOdKv7h04UQdKOjO4Ldm
         hQRSWcdLpwvWhw2J42EcJeM+w2y58N8SsCBqJKsAl2NeLOhtUSc9jkbG8k5Sf5u+HKcd
         jw8dWJ2cWZWFjUIoo4AqRHJdGz8Aw3+vnzGstEE9zgTc3hfDdwM9FRMpYF6lP55gvsJs
         A+C8ullWugB+TQin0f9GeWxpL5Zw5iUfYhP+njKOCR1OiZtwL6JO0lW80b1+sSkc+zAl
         NykQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1bvuxsSTQCImTyngY0wrLe5GLGNp8GjUnu0TO1+BVMr/bWeLnVGzoXGi/mCfpb8tT6X8ax62eyojzl2JT/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3e0J9dpXh+3JSKIDxuWXgjAZUjwMJZe4bTEzGQUw+XOoq4jKA
	tjumWL3CInYkrxrf7LoiqHF64wh0lmy626FXaspO4BwRoi+jn7KMMEJvEb+w1vun3qYphOAUu7q
	8YxMLe8KuKVfpPKBiGcLEsb0hvmkC/YI=
X-Gm-Gg: Acq92OH2qAPmy5fRYwbxR03SfUdCHoVhKkfBcXQ9pYM5BV+IQGdeWHroap1J4/U854l
	xExY5KrjUmEzl9XACZpGZkFReUneMbPcVgcJxCORxuPmFtTUsybTIv0hH8ZYxuix4gyHp6U81od
	EEJvwe16jbz09fdVfvqFhjf5mLUyKYWBPB8AdM0pIJpxb5tT7cs94BVpXcTaD9BpdpoGZkdbub3
	Zs1Z2VgvVB6qS7BhuKEzcZFRaDcNsPwtD0m8bccpx0sXNFm1VFNj2whhme4awWEv5d5NfCge5mv
	0aJLCmdXKBzrkVWNCkpAeQv2KHKEYlAElOwBlvplLZZlsWGV1AWHw6lW0sJEF9qobr6kHz73HO0
	A04K+mWkJLE5FUPR8llonsiJIgURTYrMt7Q==
X-Received: by 2002:a05:6512:15a1:b0:5a8:fbe0:bc61 with SMTP id
 2adb3069b0e04-5aa4f9e549dmr325248e87.0.1779959873933; Thu, 28 May 2026
 02:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408200949.99059-1-delcastillodelarosadaniel@gmail.com>
In-Reply-To: <20260408200949.99059-1-delcastillodelarosadaniel@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 11:17:39 +0200
X-Gm-Features: AVHnY4K2XtbXALyCe794zU4odICsARb6RZcP1b3jqcYjLY0kSZVzOs85YU87PAU
Message-ID: <CANiq72nOHYHhUuyYiUhwmZQoYYP=YdWZjHFsGi6d15DbKzXjeg@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: Replace match + panic in const context with
 const expect
To: CastilloDel <delcastillodelarosadaniel@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 10:10=E2=80=AFPM CastilloDel
<delcastillodelarosadaniel@gmail.com> wrote:
>
> This patch replaces an instance of match + panic with const expect,
> which is now usable in const contexts after the MSRV was was updated to
> 1.85.0 (it was available since Rust 1.83.0).
>
> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://github.com/Rust-for-Linux/linux/issues/1229

Applied to `rust-next` -- thanks!

    [ Adjusted Git author's name with the Signed-off-by value. Reworded
      slightly and removed duplicated word. - Miguel ]

Please shout if the author adjustment is not correct (and please check
your Git settings so that Git uses the right one when creating the
commit for the future).

By the way, `scripts/checkpatch.pl` can help you catch nits like that :)

Cheers,
Miguel

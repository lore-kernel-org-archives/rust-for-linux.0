Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983121A2555
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jul 2024 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720086252; cv=none; b=DIZksAO1zroeS+KzOzqDPbGin36cpBXSWxWqcwRBYRObUebMcaZwDFNMQ1sNTANFhUhaOaV8uBSE8lsBw6WpxCRWZ//RsBBpaMAMnbRR6/MpntTCrbS+/t5SH8IR4HXpc95usSOX6YSdj0ZVElZOPFU9O7Ykt/8lAX2IId4Inis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720086252; c=relaxed/simple;
	bh=dk+wFAAxzFlxFRhvYGEMtW6ex0h+UMnZSX0of1HiOzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMJcE7l30qZ2lTLRpbpx7Nwrspzk5a+BDTnjCbSgpsKbDLnEc+evQHWiPZhLPabvUyPpKfWMwS+cHZC3hMomCknquUzavYGtxpiKiHAl1UoW6bVVapLgoDMGXCpxuFoxfUc7OCOnDjOuSW0OSsOwN/uDvHlVisdMNOlKm229j6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0pFUhzUt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0pFUhzUt"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-36798e62aeeso289977f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720086249; x=1720691049; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvzTuVt39up2RUUfOe0HZx5iigIXte9+AUW4YcuUCq0=;
        b=0pFUhzUtvDOi+nh4ULm6flveyENHY2PdxLtr7UCc03uw32wJfrbLl7QEX6Y1WgB+6o
         5l/u3erj1HraOA6j+l1aF/ReWiAMrR99KjgBZPOepH5Df4XsaL2hqC9JF28ti2dOxhfW
         ussj2Jx5SLU8ZtOyheRgt0hsnS9qdk1/y4iXjBIe+ZyG3rhD07TKjLiNcHtHQDBO5KrA
         nWF9wuHx6IFR+rYiQgvEDeWpCChjAEThmdqA8bJa1y6iJSHBHL0ORGdPnFIpYMBAfLLN
         ckyl1lcWix+2pLVT6M7Hh+OTN4cfjrjxnqBN4L4Rgsri8WXdgah64XU67XL9onAyORin
         RX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720086249; x=1720691049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvzTuVt39up2RUUfOe0HZx5iigIXte9+AUW4YcuUCq0=;
        b=pb0HeD0yyYGiJuX4Rz9rSssbU4pUYje7e2de/LG42NA6EpE5YBk/izrQWMMvQ4bt8t
         l8qJCgOBdiA81fXpa/6IpudSmmZYfA6w6icgYOoU1h+Z2hu/6bzqTHBf+auKSj75k0he
         mk+rfT1PGRvV2J+S0BbZJl77r/9IErJ3oyak74NlEcGn8WEA+zulYDMK96GhyeVQz81l
         6ieR6zKYh25Inojf8rqVn0y8LYAapVqlEDkzmffgNFkGYMmh3Nq7ElqTZQ0sHBf+xb/R
         J0c0ePBVIgx+xGqtjEvsWyJHra8SW1pUqZGENajngybzVgeisQCcvyw3jkLaogN1C0nd
         Yf8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9DXzhvfckNgBzJ6yqN0Gbsij9mN4xdPqJ53XygX6QMOAuMGT/ffyOPaaTwa5NiDsx8AsvrcMaKlCz7y15WO7xElKBZP/W9DT8B6b6kVM=
X-Gm-Message-State: AOJu0Yxxp0KsmrcOITz+2HimTuGNiDHy6mTAygEDaG9QOJvKCAWEPguf
	ay/+GFn5fV8JiacKpCgZBm4+QZJHXfY9ToVHDIvvcZ2G5PFvthRieTbw+eiSgW2C/G3uORepcDz
	AvIrhtZ/itvZNPDO4VPXdsHbvF5GYbCKVEN6V
X-Google-Smtp-Source: AGHT+IGb9eo4t/vxZACIZaVuEGp2lzXcsQoCskAiDIEz+dcrviPMlT3S5JshhkT4009iDwhrxI1dmRfpXX6zg3NKHgs=
X-Received: by 2002:adf:e50f:0:b0:367:9224:9620 with SMTP id
 ffacd0b85a97d-3679dd3114dmr877061f8f.3.1720086248822; Thu, 04 Jul 2024
 02:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701112448.28638-1-ethan.twardy@gmail.com> <20240701112448.28638-5-ethan.twardy@gmail.com>
In-Reply-To: <20240701112448.28638-5-ethan.twardy@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jul 2024 11:43:56 +0200
Message-ID: <CAH5fLgi5HdoPzJHZUrS7r3wdQ6GheJDbzGRGKZpk9oC=U6SdHA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rust: macros: Enable the rest of the tests
To: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Aswin Unnikrishnan <aswinunni01@gmail.com>, "open list:RUST" <rust-for-linux@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 1:28=E2=80=AFPM Ethan D. Twardy <ethan.twardy@gmail.=
com> wrote:
>
> Now that the rusttest target for the macros crate is compiled with the
> kernel crate as a dependency, the rest of the rustdoc tests can be
> enabled.
>
> Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>

I would drop the newline before `fn main()` here:

> @@ -221,6 +248,8 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream =
{
>  ///         unsafe { bindings::destroy_info(self.raw_info) };
>  ///     }
>  /// }
> +///
> +/// # fn main() {}
>  /// ```

Otherwise LGTM.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

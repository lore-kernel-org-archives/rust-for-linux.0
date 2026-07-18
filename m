Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FD1F0E29
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784409425; cv=pass; b=Xc5RLr+tSAhTIr6RlxZAz4Jd+4gvjDB8rConKp0Yi6iMPN7X4HVSv+XMfWTeZFFp2hWmhBfnGhoc8lPeNc6TkDBaFQRrF/+QLcuXCuHN0z6x+kYz3pBxuyy/tWjuis+YdS/5uZMGinNvN+5tm1Vw7ezRY4hrJ+SJxGYNibNJl5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784409425; c=relaxed/simple;
	bh=b+3x11ZcqtE9a/DE9C4Zw2ioxu64CvrijxbkRIHuMcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdOwQj4qWlMHvOq/qlfsIeOg6vCFz4OXxv2tEs/D2sojz17A/BT4hA/iwpXUAEEXfFW0+LTriHgsUoJH96/yF0EAPDXgtrGaS1uQgfE6W3wDqjzjhyJCOPmh1YI3l5ZiA8pMvlevqC3l/vU2RRcgcLZKn3Sfyk/76lkI3hN/uNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOuNYRTw; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOuNYRTw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caf228a910so70333315ad.2
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Jul 2026 14:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784409423; cv=none;
        d=google.com; s=arc-20260327;
        b=dVPGWGuNjzmRh10fgGu91w3mux7VxJXH2mI5njK4N/WnUoZPmv+W5sbm8ugW8W2Nd2
         uIbPAN93q9tTMF3cNj6L6/8zE1ZNNK35u0lRQU9iLs0tl0ZrPU+xsADVqqBnTs9m0a0F
         tOFquwwCjqQsbNnZx7Yh6Q0xSbAycweQMybKPYDSzmtNxmwTOmgIorubUFUvHfW0jOqQ
         t8jMt2LKP0ffSf1RVpiHgbyp+TsA7fXOXdNf8kifbRndo+KcVXhVzSNjO54ZBlI9Rzvf
         s6LPif40tZbaqHpVyEYgNGBRX0lUmwU4ZHlNvG0y2v8vuReCFTfD//xutlgc/b6CAL8x
         7gDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b+3x11ZcqtE9a/DE9C4Zw2ioxu64CvrijxbkRIHuMcA=;
        fh=qNB2HxDHgjE87OKvAouJhrE1f4YzQDoFohyhds868Q0=;
        b=sqGzV1EOPF2Jn/nLfOVFJIDVmyoWX1UBLizonhtN7KvTNn5p+KBHERnQf1uk67ZEbW
         +F2a1gskcG9CRcd2gqVazhcHQqW+gR5u6/IdLDdrbwV9Aj+Du99Ta5iNadRYCXmKrVI7
         HtSChuIthLT5eCHtPPoqz3jbJwKkrXFGWcS4/XFEnC/UACCFJq+soFR86VggpokmvDpw
         mpwGIb0rmEqcgXCgexH3Tyy1E//IZtOPHD4UaKo5VcNXlJcHszAThCGacW395kccTvMw
         /uc5GLQ62qvB7QLzS4ejGff3K3eTQRsjjkWs2vn+qKX7rx6JXqP/IRgolNvlfrIzPxY8
         Td3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784409423; x=1785014223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b+3x11ZcqtE9a/DE9C4Zw2ioxu64CvrijxbkRIHuMcA=;
        b=gOuNYRTwvAOHWkN2p61zSdY+JEf3KVvN+ysdikYtKqfmroszHDKeMGbViv6F/+lkXx
         0rC3cFa0ELwHIk9CXH7plPfxUNGVuJVFyXzFpQ/V4HUIuknrGeXHBbpnx8ZrL4gAwtke
         fD4UCll/aIvNDxtxwIe54uFtDZYC3BQLxQyiF/ISntE39EQ1JbqUtJcM57WtleJZFRnq
         ATfB07pjJmGFMeIxpZ2GNI+VG0zkY6qWBbF6yofHIjgfnhk+RFYHQBwRtMWqWVDNYEiC
         j6kHD0i9rbLoJ79cWVjxSNomPSSvczhL1AX82MnaIO1v+SpzqgwZM6KANbBh6l3mxqq+
         9qQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784409423; x=1785014223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+3x11ZcqtE9a/DE9C4Zw2ioxu64CvrijxbkRIHuMcA=;
        b=M7t8sy1Dy2PUVylPRE6fctD7T7JnW5/mdzg6CNMaEuAVmwkoQbnypV9Am93xu3T0kJ
         94DZrBU4zfN/+Gc2kleySVdC/nMle6RDEKwE5A0IWB0aggIyxlYnE5IpZ3e7TAtspk0l
         KRRONnLkEsKAUvTOgkju7mFENnK2b2ZNlA47byFsrcqFxaT4rGzMDWs5o5Z7OG1pMgwr
         yTBev2kWsXd6EpdDu1l9no4P3TB+IJBOKqtUSCxFJlWstAKFcknJ6SoYgbO2w5hCOL1Q
         kgM//sBR/J+f0qaVo+7VIjBys5dXKzPOTnfFL4EkXdOfuhGFpMnRgi5RP7Oaqq3AlTnw
         S7Pw==
X-Forwarded-Encrypted: i=1; AHgh+RpA2tv6k9RkoaIlM3xSRhXgkbi2CgDFJZSKLTkeDRg13XoKR3Trtxq3db86MGQsShXWyJVZwyopD1MCf0TtjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy537zUjazBLgV1pBJ5yr6PKOwtrH3ocn170XDMMYe17hTCxCRT
	7PcJOBjzpdjVpDEBSGOQ+1dScszKGJHjBaMPNJJ4St5n4r7xwdNcaNmFDVkUFXU8MjdS2sn2tFK
	hWicPNWYp1fDydNTDga4yER95EXZSzek=
X-Gm-Gg: AfdE7cmj+BcDOkpgstmF5IgHaDBMrABOwURl/1t1NI6i4RFW5wqJNJ2vQvDfubQbcRu
	8c7GF0yM/OWr36ytt7ApcaYnR07dwwMkImFgyVD0G6/gIh32h68SfBna1D1u9IpA798L5ABIyhR
	1vYpQ/Jw+ZKKGRk4+srsINNar1UcZQBfuEJ6u/FQUW4WUlZ4eg3/6aK/Yzv5W5K63jDGxpS0ejY
	CUqRlou9Kqjk1dWPXSOOzbjDJIzt2+i9AfL6rPMwt68GnBE9SyhF/UDxkVl9sialIXkfApU6OVK
	s781kiB5uRtMY35MqFl5QedyaYGjCPnofYb7qJmTQAyv8bOQ
X-Received: by 2002:a05:6a20:2583:b0:3b4:605c:2163 with SMTP id
 adf61e73a8af0-3c3ad78de40mr9171821637.4.1784409423135; Sat, 18 Jul 2026
 14:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711-id-pool-move-bitmap-v1-1-cd5b7efc2c12@google.com>
In-Reply-To: <20260711-id-pool-move-bitmap-v1-1-cd5b7efc2c12@google.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Sat, 18 Jul 2026 23:16:51 +0200
X-Gm-Features: AUfX_mzD2A7tzRvT0wfJ4sImRRe5a5kmfvx8TKWr-iujwCqAP7VLhO6-tyToFZA
Message-ID: <CABwQupMNO5mdq+nSg-gpMcgatnG0P=XYJN-bH96Jjzs-_b-6BQ@mail.gmail.com>
Subject: Re: [PATCH] rust: bitmap: encourage using xarray/maple_tree instead
 of id_pool
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Liam R . Howlett" <liam@infradead.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Matthew Wilcox <willy@infradead.org>, Tamir Duberstein <tamird@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Lorenzo Stoakes <ljs@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 3:13=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The id_pool.rs file was added for use in the Binder driver, which is
> using a bitmap rather than the normal IDR implementation due its
> specialized needs and performance/spinlock requirements. However, its
> current name as kernel::id_pool encourages using it over other IDR
> solutions.
>
> To discourage choosing this pool when you don't need it, move it to
> kernel::bitmap and add a comment recommending the xarray or maple tree
> for generic IDR use-cases.
>
> Please see the below links for the discussion that prompted moving this
> file.
>
> Link: https://lore.kernel.org/rust-for-linux/2026070334-dollar-hexagram-e=
49c@gregkh/
> Link: https://lore.kernel.org/rust-for-linux/84bc8bd2-e292-4b84-9580-a1b5=
df4c5bdc@nvidia.com/
> Link: https://lore.kernel.org/rust-for-linux/20260711063602.426311-1-ynor=
ov@nvidia.com/
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Burak Emir <burak.emir@gmail.com>

Looks good. I built, ran the tests and checked the rustdoc.

cheers,
Burak

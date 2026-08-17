Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581B7442FD6
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786996303; cv=pass; b=jloLiw76lByATNKOMHWO+T6Rf7D1eD+tt5R68b4tBlfAcqUGK2DbtayrMQL7JB560gmHih9/poOtGIaEbPtB0GFdH/AUw2AHqyVVNYDmo8rdXwcm/vdbZe9BMjKf5kiK6Rx3v0wgqSkORMVHt60vf61MoajzPYMat5gQ4W9kQIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786996303; c=relaxed/simple;
	bh=2ABSJoD74NOKhQ+UOLggD7tv8RbunARXUT6aVeIs+z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieJmCLfCHz4Jw1OLRlqNTK3FQaccjKs/0YBht3QFHCYiYE1GpW6vB2u/4KmPor8MmpunCNR4Dv7w0mG9/0bCoDALZBQKcaPR9MkWh+Zk9bu2OCAtvUcWb1oS3V3ncwCXJUQaM43B/W11nfuDV5nRfBhPfQzJGpbMnnQ1/USuwvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwtGcgaB; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwtGcgaB"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so49752735ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 12:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786996300; cv=none;
        d=google.com; s=arc-20260327;
        b=fWS55V/YXqI6ZFUQi+HuMorgosLaj2SBqjT6ik8mIc/WsWwkuZWRpyU+qBQLlu/ztU
         OLGrvfV9AXmhcS4eRcgesX1oC8F8WJ+Cn84S8At9XMSAgDauQ9UKgQe9JhhAbGoLtIYp
         7KhVv5JLTgef50ZmYTkJFuU+Vze5QHwaW9e/Ey+YmzoEJGNXK41D/9gDc41KZF4MH5z0
         Hufsc1ynFhZL1TnM5SJ0R8RdqVCA+UsrsxsSrqVINaB+gu9L7gODTtysLvvuG1KdTP7f
         vJi7GVWyT4d1BLLko4RNtglYHNIyNmmGZQkyHN+yQTxMpFbQNfAU+CY/1BDmvlNbGYBV
         Ag5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ABSJoD74NOKhQ+UOLggD7tv8RbunARXUT6aVeIs+z0=;
        fh=8BGdd4b91XrB34Zgf/W6Xq8j5HQfKNZUOFGpY9tRsPg=;
        b=ocmVHAbK4B5haJmGCj7+tC9EUU3P13WIJXp/KoxUzjWT9FLUDXT6t9OTW/p1hC6nJG
         0VBp89HIzET6tcg3s/c1ssr1SUZ3U723N9VLg3iSq0P8fPHiCYBYADNvAuGi2fCXYlpo
         GZ9o6baYn25snaqf9elm3/TDVN1+Obt2OGnAHQwErvt8p9aFrH7cl5VCH6d14rrhdlXy
         1M+LSjOZG3/Peit7I5ZkLCqGdnccnb9BLQ2ezcd7IjSp1kD5k/0oI83hStOhiNJ5ja4X
         u3CjFCniiB5uYcJd4MkKRTXOoJJPqknoo0yLgXnmmcXLrfDm13SNyshgJrIWwjIkCYnc
         h7mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786996300; x=1787601100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ABSJoD74NOKhQ+UOLggD7tv8RbunARXUT6aVeIs+z0=;
        b=dwtGcgaBPp6VH9iO4yTKNmCwCnap9x9/0kT3fFDZkgK+527ZLa3L1Y1PvLsfnmFu/h
         ASDPQ0xVsCNWOMq4dnAmpTvliIumAyH0bGnpxu6XYvI75O6Ew+0RB1pUkzhkocsZEmJr
         qLlmSsSTH4r8qqy7pJyNmvqf5w4V2JXKBd827vIdLV7vJ3SZafx3Q1JddpoTbhty9x56
         qp6JkNsVcn13P6a/uzyl8nMViQfOlJjQgDpkStCQlkzk9ptISZWTCnUTOx5ACXtrLs/K
         MibBh8MC2x/56xeZa9GdC9q7pkrNL2RjcAtv1KPZ9WbXLn+EL946+Ezx7tKW7kaX5yjG
         Etsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786996300; x=1787601100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ABSJoD74NOKhQ+UOLggD7tv8RbunARXUT6aVeIs+z0=;
        b=Ihm+mCmfwzPCk/Zp9TAzGYxuNE/A8OGNGmqGPOAGPXmY1HnhNVhodQjCpg1S4jPNKa
         /Hu8Zg4kptPgdH5BMc373MYgGltVpdeTcSNI8QsMdD24hqA68L5NqrBGBc2PgSCA4doM
         9AUUyomTKEmrbY0R6PXzgL4MWyvT/sJs+BGwBT91x96NKckVYWhwD8fWWCY1rwsFMRV0
         XVT+Jqtz5oqyOKV5MA3/12xYMdY4s5WKmbXxx8wMZLTDVgAk1gu0zodjPKJUeLKQ/GBD
         rOEdKkefpDoikN7aJZwwIRa3+BJKeldQldPJKO5AUi7ZLxnCyRGfWiHNG5N3PxvhsH0+
         6kfw==
X-Forwarded-Encrypted: i=1; AHgh+RoGVyWuYjLLTINKQmJiO/0+gaH6sALbMJagr+5nFhi/S4XuvedLiDm6lx8tTPAGUpaWOPvMhZ75bJLf5ybh8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeECErf9xFjm+IDRuhzPnWl9ofz5cUnw1ZNe78cclCnrA/kK5Z
	mCJImD0aNYU3o4+hkcoTKVXUI/IzuLvtO1xNbbB92cwV9CIjymW72GggbWAZBwAne/fVU/CTnLe
	k6CuVWKD/hdep1yy+0hTuqkXs6Lx9wv4=
X-Gm-Gg: AR+sD10QjGSCs6tmNUkAAKoyza9cgbHLGRwNUfOORasX+K0fg4Zi7NpXQdk6d28bct4
	2VGX0t8lTVcDnfiamaxVxfVvAkL+e8FlJyFIKgdtBtdqytS0bOqzRo+NNdblaXZ9WDHhlzcpG/s
	irhlYWXHDzyjZRg6lui2RRrHrVj/TLkdFxN0PuCaJJ+ihyA5rtpMLym48t/5GQfD3t+9MQc6hs6
	O+ApDwLLGUUXMPMYpUVJpk4rLslkJ1cLfZItUd8Zfn8ltuvKXsYpFNuWu+u4JEGT1+5Yp62to7t
	x/cNnYv3iBu/IS9J+X1kdbA6+3jKzN9Z5Zux9HBenThUS8BlxNXMvc2qwczf5iziie+JV6qlLCy
	WC7a1FOrZOl9HO722XFAtxh2Uz8Hgs2g=
X-Received: by 2002:a17:903:3905:b0:2cc:aa36:c046 with SMTP id
 d9443c01a7336-2d3b0c5dad4mr315279655ad.14.1786996300433; Mon, 17 Aug 2026
 12:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-2-a5872e64d8f4@nvidia.com>
In-Reply-To: <20260817-chid-v7-2-a5872e64d8f4@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 21:51:28 +0200
X-Gm-Features: AcwNN1V4RUrrEQgmScJR1GkvVYLA4gn02X6StFpnyno6RAn1uKgn5cwzljFUwlQ
Message-ID: <CABwQupP-qu9S--ob82ZPDuiNH3LMwqZpjZ2LENg3hsGFGvr1Jw@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] rust: bitmap: restrict bitmap length to at most i32::MAX
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Yury Norov <ynorov@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:04=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> It is currently possible to construct a non-`BitmapVec` backed
> `Bitmap` using `Bitmap::from_raw` that is larger than `i32::MAX`, and
> it is not part of the unsafe requirements. Restricting all bitmaps
> (even non-`BitmapVec` backed ones) to a maximum size of `i32::MAX`
> simplifies a few things and matches `BitmapVec::MAX_LEN`.
>
> Add that requirement to the unsafe requirements on `Bitmap::from_raw`
> and `Bitmap::from_raw_mut`, and to the invariants on `Bitmap`.
>
> This also fixes u32 casts truncating in `copy_and_extend`, which could
> otherwise lead to OOB writes.
>
> Fixes: 11eca92a2cae ("rust: add bitmap API.")
> Link: https://lore.kernel.org/DKG0U8RLO7LZ.2I1AIH0S38PAP@nvidia.com
> Reviewed-by: Yury Norov <ynorov@nvidia.com>

Reviewed-by: Burak Emir <burak.emir@gmail.com>

> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---

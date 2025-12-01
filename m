Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F899313534
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 17:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608790; cv=none; b=PRhTKm/59Jw8Axu6hwXrfkRDqWL2piBgo9doI69e4Xr9X/5feXuv/wUEUE9v/EOi0/YFlWBpeTrunWXC+wZDLZkkZ8zN1JU0UaMAT1Y+Rd9w17FXqpF/UoTmn3Fkts9plp9P2Qx2ug1AtDDXtXyqwSzzanATMatIXKOkjSNaTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608790; c=relaxed/simple;
	bh=ozQvqd83V2t/A9emsT31BgU9Z4IGRf7FefCZzYqNZYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIRKsQFlHK480u0OP8frqkeR8tbXMXN812tOxCBsK61zyys9odzWAG5xBJzrCyj4vO+Egpanczv/Gju7ggTsbqbedL65wzf3V08IGeIfhBu+AasvElijMzYGuGEHNhaJlNK0qRV1Pmid35zmLsne4uuZFUCaRN/uwwgOvTvLvEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Grp88XZz; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Grp88XZz"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bd2decde440so305932a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 09:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764608788; x=1765213588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ecQuYKhbBJ4z2eAsdCfzedjBlswcvxenNB5Laod03g=;
        b=Grp88XZzzUTj7rzMB46KNGQVwGn4780z6+RdYggwswcOohyh7ooGyCNOtXInbAgcD7
         SCe1mrwCrzlxeaPRErEDC6/3I7CdX3vsadtheMLLDKpxfSBy585YEfmvgANcguTx7nTv
         qzLwpy66UPnn0lYB4/yvjsjRH+XASHS1C5MnxrI6uS/8No7qSNzD+bb0Ohgsebrr5Aq6
         gObkXc0uY4CCRzOcmYNbBoxFyxqHY1xo4YdI3E7nI6VPQ0syh34va2kZYUEWJttTmifZ
         GgMmu5LRq+02YVxli2jBMxYRXr2AxvhwRCOm4zZGOyyc5xQGdDCgw6Oj+NHM8Yspi7gM
         YwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764608788; x=1765213588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8ecQuYKhbBJ4z2eAsdCfzedjBlswcvxenNB5Laod03g=;
        b=d6AzAzGm2DO5EelvjHYkJv2zkHa0BGRhfGvYP77AU3nsT71Hs336vW6HoQ9e0H7xDL
         xD12xdW8Bn5PG/MWK4GnXoVYlU4v+VtMyljMR7Ys8QIXmIbmDE2rg6ozZrt9B9Ukcs8v
         JHfDSLmmvLQSzPSEfJSNh49nQklTRIOL3pUTnRgnQVV2jDqjN9GTdgpthROZVb95BuYv
         pWEPdEYN+hI9+YyPCcTJ+vr7ab5/qQZo95QVPSUPrMiU+rhveZ/0REMU1scE0KCzriYR
         HP8x3LsidjNh8/rjjO4GFirlNZruQzpZFQ2c8EZ5raSyUo+sIJDW97GttN9FYiGqP6TG
         YbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMkesVkWpR5LY7wxN8/maW4qvaevPHe8DHqq09xvkpydg8bnZdCxjjJHtE65YyHHBbzYq5mLYDPrPKgWixHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT7iNxIAHdcqL7UMplRtNDOr3K4IdsbW7BCPdtGnvdNArcDR2M
	8+3BYYVl3RccnLwH19/uRHWjxWOZon1jzaeaq1TAQYpf6orwzv++xvOiyTnEI7bQ0+qUh5yb2F+
	z++C5ZtlKfZ1O45cs79WDXpPyrxnKFGE=
X-Gm-Gg: ASbGncv9UnmyH02yrcpS9fm7SbiIOzFp5j1+iQFgeEFTMrIeOv0ztmkyqhHZ0/sT1az
	iF1Q88TsFiBn3pSgsmGIxNpXkl3ypBkWC24DN4/EWwLsK8NGyzAzPRpmLitBFqv2rxmutlz0SVc
	rMQriGMO2BWXF27qSKDDLS2SebiXzpqNy2fbN2+k3QYOTiHgwDBR0I9lkAqsIExnG+WPH65AIqk
	DTSWOVGBhK354wAHkE2rYfOZbZ4OqhPRSlusAuGzwXJlikbufiZAO8oh8nr4nEPfH0oQRUMjuY4
	FzyhOpzcG8WRhwqX0XCVfzrmCI26y07JM7duZt/PPFpA88mhw4wvLYXPj0n29vU+v6Tvt58IYdb
	LC5MvQlb2FQd1nqgqUGyYvYJu
X-Google-Smtp-Source: AGHT+IEj2SWbX5nAIvEI1sGBisPE60Hm5UtPkukyIFw6dPm4SeGs7FLMB/CskCtYkMXQy0z+K6bvuLU7hhUuVzh8gV8=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr23005652eec.2.1764608788188; Mon, 01 Dec 2025
 09:06:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251130191535.77498-1-mhi@mailbox.org> <CANiq72mTnNOfCHv0f_ByXV1UTgF1T3LiHU4vCTFPN5fsEniVGA@mail.gmail.com>
 <h34vw3szyz4to52qzocor6qauz6gqqp47rvuqwam6m3kruwtzn@c6bralnkcjna>
In-Reply-To: <h34vw3szyz4to52qzocor6qauz6gqqp47rvuqwam6m3kruwtzn@c6bralnkcjna>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 18:06:15 +0100
X-Gm-Features: AWmQ_bnn297dFK-z1K1pFiVu8Qbkts7GGG4jh5MGGcJ-zVwQZhnkJ3VS53gRCoM
Message-ID: <CANiq72nCdaAJhkYpiw-mrzSSyWuo=shv7kQsmwvXE4VQs86DPA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: Add message to
 sysroot assertion
To: Maurice Hieronymus <mhi@mailbox.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 5:49=E2=80=AFPM Maurice Hieronymus <mhi@mailbox.org>=
 wrote:
>
> I=E2=80=99m still getting familiar with the mailing list workflow, so I h=
ave
> Ia question regarding this. You mentioned that keeping or removing the
> Icomment is fine. In cases like this, if I decide not to change the
> Ipatch, should I still send a reply, or would it be picked up as-is
> Ieventually? 'm just curious since I plan to contribute more in the near
> Ifuture.

Sometimes maintainers can fix things when they apply a patch, but in
general it always helps to send a new version to reduce their workload
and the risk of making a mistake last minute (and usually saying what
they modified in a [ ...]  comment etc.), so thanks for the v3 :)

(By the way, there is a "I" in each line after the first in your reply.)

Cheers,
Miguel

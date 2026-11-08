Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794167971;
	b=PtaxgHT3Xdik9Aqw8njzaUQzino7pspSLMXWhwE7E3LWAxDyKPT9RoZpwTskKioq1LvV
	 XBd6GJ6e1ClWFm0ZqY0kYHiQkK+o81HDQKM4IPutzzcL3dw40fc49yee/Jl8Y5mZ7KMbt
	 OttOw2/gTZbWRBUTLZF5fr24WleBtRsoBeBrhsDwG+e3QnlzgWHHXqfyNPMZexNbv3bI+
	 /YPtG3uXtFTyIpr0iLSHpescQo3xM0qk3beRjs+J86dL3sBiTrdXHusziUyWIgYymcnFE
	 Z6LLKTCl+0ZVL74Z1bSNEpB6w0oPkteRPTkx4Nr1D2Qyr5up0ExMK2aSnP4nw+vsq4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
	b=G3rF1jU3fdhfX6lRfcT2vMHvFdHKWLdL4LXMmkm0vhck1f9SCnOLk6JX468CTlmT4DQD
	 9sE66eJyhB7YhpKBQCHcabfrODSDxb8KsQ3ug7jgaej/w0sJjgZ+/K9ToKGVAVG2/uyKr
	 DnHUZbseIbSfKDuVJeBUML/yY7HROV7kg+e/s5kn+l4MAsdfLCL1n6Ih5if81ZqTBOWCq
	 QsbYaNBd9Xo7aS8myPCS95vYcKCRRcQ/haymNX6+Z44aVfUSQ0apED26S/BGii/qYPlP8
	 iX+nCRNX1XnuD+znDYR7CokBU/onElUVs9Vju5kF0j6Psb2ADkubxoo2U6Hjn3D4PGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MHU9Z+w9;
	arc=fail smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6297C606A320
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Nov 2026 19:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6297C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MHU9Z+w9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36dc4797082so26656eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Nov 2026 11:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794167970; cv=none;
        d=google.com; s=arc-20260327;
        b=gJLiUwq2/+AVLwmvV6WfwjfmZgZtnCQSgfnjhIhYx5QGht6s5u/GDghD8qrZ3NHdQ4
         tJIn5d3Cn0teSIK+bEmdmWNwYDaGS1LitvJ0bkS7S6TosLvGqymC1g3xk1TjPUzFk/o7
         5IYy+mddKCBIBu8M6/1m8kwPRtTson1QrK1GAjy/fy1v8J9plP/Pojz/zm0avVbEAc2v
         ScH7LpKngaSx5I6xBeAOjteI7ao+Qrx79ybURhjaOhvGG3jgch4temNvfAcudEeH7UbC
         ojexTxIQ7Ce5VOQLUgT0ygHoP5vtA7IX7ZKmS7EJVgH/PJNISHpa65ocLwDrHKBCFUMD
         VpEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
        fh=vakbibB1c9yj7ZL/EH5XXSiPKVioJNTlc2+KbX9bgbk=;
        b=YHSrZouzQfr2zb09urtAS+ATM2L+xKn4ypk4eEiM/yxEcB/uYtUWtUTL7iqODDE5Nj
         U3u3vzm76c9zGnUB1uyUjXJ4cKyiFfAJZ2XFNtmczUvV2+c5EGIo5QBedFytiG3pRH27
         PSM1cGjf7eBHECns2sr++SfKBTQhZeZha3QzON9zWcEVVly4qKg4TtzgMNDU6q+KgCn0
         04ACmnRKFkeEkn2vVijuMfFMj1JnjUdwz16JDML5ImugOlDo19LreC9LZww1Nz32SGOb
         00IB6dY/CbU0M/JkR+5JtyVfmjh5EYQ/OXo5XO9EkgJkGYUb+VdRIIBc0TyoAzf38k3c
         AGow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794167970; x=1794772770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
        b=MHU9Z+w9qtdjHnQktt3JQr8/UeWV072k1RPmYbRJRMs889bomwOl8dJxgVXlbfP/nc
         pCsfloYtrk1Kpfju5tKaC3PkKbAqtnSS7A1yjrADrdRkoG1x/h8wLQGMyNELJ6hQUvPz
         IuVjLBdZjlHkTadxck1FYnqucF3+wO8nLJzyPdvJJ//wP7b/K6Yr+3w5V8mhkSdne1GN
         1NIM6l7Kt+pq5n2UyPY8SWwIYK5CU78kzR93oSeptbvhyOhdqJ0/SM2fW6ObFqOZbTUl
         Qd+W3QFW9p9VrUCKviV32t9I0dI6Qpzu6Uvav1PowSd/RU0rI7lra/eoDnLYqXWHYivi
         wSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794167970; x=1794772770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJY+aGtrpeDr2G8/Ik5cLYYuRPZB321tnaAjDteWj00=;
        b=pOTlEXfeMp/eaVXLr8pPFID1BtE1CwO2yLrxueIuV/5zPUwEgvytl5nAJlf6gnmF4f
         4W5ovaHu+GCWYEDxQtkj5HnW9D6FYd63vQ/7Tfg9JX/naxIxEX4zA44UoCyjCt0/04c5
         KSTS781/cgevxyP6sXdFL9alQJqgs9s0jptUOW6qrYTNOHMTcBGffJNm/srpigIvIKjM
         Jgh10mZx0haS2MZaBM+8yjrz4viwA9XyLzBQsf5hpP2kK+ripOS13qFpdZMWC3IDohPB
         nwFXMHwmsUT5zMu+Z8ubBeGHOU346YbKyAmsY1cRkZ0cSq7JvxfYXkBcvB1FgrJmm5m7
         eawQ==
X-Forwarded-Encrypted: i=1; AL+hErETdccZK2ER9GEzzA2ZXMX7Hf5O1v47cWjBNni2yjZMi6ctCdClYV/ZTu70vvTbmkKpl9jdGPKjwy7EJKZbDw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8i67m1qZ/C0TLR3PqeskGIbN3EBjGSZNNB3FtX9Yrt3ySb70QN
	XCQnm/usoFuAZw612c73u8BNnN5Tjgx4hbkjA3N0zfNAzBLBAq9FcK/hfXt/bQIDdTF9rjQh2L2
	Mq9OEVMeXbaPNFpzqwYz2IZ2dsXx315U=
X-Gm-Gg: AYBFou3MA0qSiBrS/Ih+2Ju2VedU+FyU70rqpvqM4Sold9Sj7xM/M0UTvBeLKyLO2zt
	PSs9mKTF/fK5CyuqYmLnwBW0v3MId3o5eD34V3s3avRJOkk6vEyM3hTY6ZCQJPc0rgeRZhc5Oys
	fLw6taQmuSPkNKDZOWN3aZDtpDtC5l4OIJ9p6BBIzBu6GK6TsJWc/n9p1aAUoz3o3AK+pLT58AP
	Pr83foc1XWF2dxLlPIk+UmvliBfhIMNKGOwg0DTxR5V+4rVm3fmyF2CzoUBjY6xZ6SpLt1uWWWc
	8qrEk2olSAR4TL57FRwQCMyGPZx7ccLnAshhz8ScUPVuUfwzQm89yLmllqtJKFHKps9Itk7GUMD
	ODqqXv5ODUTiMwHvh5yr59WpFGZGSoxACZn0dW253Mp+FzsLIuVzh3S1O5VaFSdLhNWJdLl6f8W
	n3bXX3Q4mNJELuuZT6HhQIdgchg35OTntJU44gmbNs19JtdCb72DuDfaZfnVwruf2JpmLw/0+pb
	Io5h7rzQC7TwNdAOi0Wty0Pw742NcbnZmo4
X-Received: by 2002:a05:693c:62cc:b0:36e:66d8:1424 with SMTP id
 5a478bee46e88-3725024039amr6518267eec.0.1794167970321; Sun, 08 Nov 2026
 11:59:30 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com> <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Nov 2026 20:59:16 +0100
X-Gm-Features: AclHuK9jeLy5xXtIqSKPxHyksnUP7RPDUpLBrvvwrDuJgV1dxihT2q9FQbUKuo4
Message-ID: <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds
 panic case
To: nico.antinori.7@gmail.com
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:59=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Relay
<devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>
> -    #[test]
>      #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
> +    #[test]

Is this one done to match the other? If so, please mention it in the
commit message, and consider whether the last test in the file should
also be changed then.

(We could do it in a separate, previous commit, but that is nit :)

>          let mut b =3D BitmapVec::new(128, GFP_KERNEL)?;
> -
>          b.set_bit(2048);

Spurious change?

> +    #[should_panic]

It is great to have this, thanks! :)

Cheers,
Miguel

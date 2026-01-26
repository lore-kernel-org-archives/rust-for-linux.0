Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EEB3375DD
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435755; cv=pass; b=YgG7kuKV74Hw4FLs6NAaylTT6Va7xbUmJNcrybJ7qcuicjeOgao/HCeGLbwTlL5nuNlzblVigE6EJuKuAgB9uqFK4eV2gAzNmrE763TVysySAusf634iIGCzXJQJsH3n0k7vozq7TpIqT8/vbHsy1witwit7w+c3zozEipExqII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435755; c=relaxed/simple;
	bh=/ML06+eTPUGCyML55hxvUJgj5RoEzq9YI9KGsUzqBuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iaqaAMr1iyFeCIOQNhDDb1VpEGMLl6kgw+bxkG7/F9Qc/NvJ2mFSDEFJtPjKQFBHUpDuxR2lP0LqkT26wqxr3r5zP6e0HmllJAtxya6C92FMecL2Y0NJMHdKjERgELLUOLkMv9z60EBN5W49SdYqtodpnmTEDqKMntMJ6r4u7R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+918Wws; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+918Wws"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b7267ff06fso365170eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769435753; cv=none;
        d=google.com; s=arc-20240605;
        b=fFb+IjzNp84o1+SSdQP1cc2e8sryORGwvfvkfOGA4bm2KDS2hIgQoeF+wc00Kh7uM1
         VXBmMzSenJhubBtwpnIecaGV/WhGZV4BSpP8jYNFnoEhfGm5kdAF9kdW3A8uKBPn1E+5
         MLvEyFYpdmT/0AcNPL8oBU2akASnvMdR+ZcTLYgYKppYR5kLVyIBDdTcfIljKzfgGBMH
         5ebWoaKtaXovL9LcmfOtigPL//IsYJWMK2llfCTxKDgJpd+IXP1H3ing7EOI2ErubCPc
         o5Qgloeq05USnxoVR9wdcFpInhw3l4un8dnAhJCCpWtgAkwP2wNO07HkobsNDdQqxuQ2
         giog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uktoA5Ntv0XZg0C8SsIJHJuRvPwEcwFdRVoWE6EPErE=;
        fh=tXHJftBu5UigkNNlx26cJWxtJFqOYnxwGBVEJMW0Ob8=;
        b=AUgAJOM46OC73H5/DIaxqu13NpqEFsDbBI5S7Ofm47gI5UseqjDAYTzgF4sm0WGe6T
         9GHMqGBjLdRzr9bIZsaT/LUwnGqXFNKPWpSgnca+VLhUMr5S3yY56KmSjawbZPCTLVln
         Vj3k1WemhK8/ihmc3bZswJDFykCIxtzE2EMgUQtBsBZlU9HcMS06isxFJ3fjHgpIOoPA
         KE4MuQnlADw6+CbtjO8JkXrFVJQQCBuSCyDX2vhQAX2pbJ8XBBWF6iUSVjO69ABbcrrS
         7BwGaNSNvRA+8qHPZc1BGYjJdM6VaEMA3pFHsvZg0+JALkUVIgxza9MIPRqTRHW8rA/q
         wMwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769435753; x=1770040553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uktoA5Ntv0XZg0C8SsIJHJuRvPwEcwFdRVoWE6EPErE=;
        b=f+918WwsOTTtA/L+xki7F5OSdc8fu/D6kFa7/zn3hn/4SziBZdIGxHGeu2rFRwrep8
         mjmu5v6QZJvklmTZwNr8UDrT06w/r9X+e3Bklb748v6Rz9/qKQq+9d6Xv6RClmPy/e1u
         YVa5UIBdPSxxBTuenjakxCK32Uj5ss6VDilYkqzvrTGrQNKIupX3xfRSP22QpAC3ZQxA
         jKtnDaOIPaoI7eRmNUpjvXBEQQGjOHxvJabv3epcHv+M+a7K8LJuliTXQtb8LnyvM5wA
         0luEmMPxZKGzTIc8bhiQsqFHloOQV91OkR3nV1QFc0ex5B/AhzY5tjBCW8FBtyH0XAtR
         jDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435753; x=1770040553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uktoA5Ntv0XZg0C8SsIJHJuRvPwEcwFdRVoWE6EPErE=;
        b=UBa6vpuoD/sMFhvQNo9QnQb/7a1t2Or+4jifxsJmS2HrJFRweC4CYlUXGz5Pop/VXw
         PWTBNGw5tASlix5w+LppluKwc7sGpgbdhrgXUVcjyiqp78mKWQAx8/LAT0Y1T20h5WtC
         aXE50sc/sUn8g9rCwgGLVb48iMV3rWcVUI8C/2fXxo6frzPi7WSNt8SLZJBD0yRo9ZyR
         6KRcfE/UbdqtiAOBNLhU11/SZjJPI5UOVagLleoYQ3zM5UDOleAo/641171LNGaskaXe
         /9eEfSX6kbsvRb4XpwIRp8nHE8+Xsw//i46suz4LoJKsJj5pIZookchoP9rSuz5rq6+h
         t9hw==
X-Forwarded-Encrypted: i=1; AJvYcCUyNh5Yk2JRP50kSrP1a8TaY9yvWySeOXiHcbt+cp/m2Ph1ZYhCDrVUuzw4ZSA6B0Kh1XhF1dRPteKJ+Leacw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ECCJcEz9CDaas9++kLnXOQbEbr3cV/JHonvQfgNSMPvHHw5W
	bfba/ZGoNqnRTpw9+NvXdBmTO1RfVoVnq137cqytw0/EfsvcrbIOUbAS9smzu94NCkDpP5kWGRu
	NtX0O7nKcjcfE5yFG+RqrcMAJ5E4n/0k=
X-Gm-Gg: AZuq6aIJSnZXhZWibiHjeTZimB47/m5egK6b+QcyCLzFgtu6PfIjeVt8yCTjD+kk4G+
	sLdSRZ5zqgZtMBc63c0207X5bx2Jj2vvXq/pSI8K6zH1b/kTPCIcjq6xV68jYs62Xzybypt2um3
	yVcr/ynT3t3xkpmcjptZX+OvC2RjU+fZ9QJSkXKiii/UzlqdiLS13LyWxd3GkVlrxLyTPUphvHn
	59k31tVw7lKnRfx+t9K6SF5xDyM3gExjoEHlIt4X9q2KxMZFtpgY5DTyYIYu8XFroKhT6p2lGwd
	ZV5CVW9AMIaoERO5aj7i4Rlj9Tw5WQbMZ8OlumjQtv4yhjpnsJOzdGdvqCQaWWiMWoVqVPOI3Ha
	87R97DzLHz5c/
X-Received: by 2002:a05:7300:730f:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b7648132b1mr1092978eec.8.1769435753322; Mon, 26 Jan 2026
 05:55:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-register-v3-0-2328a59d7312@nvidia.com> <20260126-register-v3-3-2328a59d7312@nvidia.com>
In-Reply-To: <20260126-register-v3-3-2328a59d7312@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 14:55:38 +0100
X-Gm-Features: AZwV_Qg3gpG5LlVMbhVu56v-p61Z-TRYG6qEX4FPhbq5wZJmTpQSeOPw6amnyv4
Message-ID: <CANiq72kurw_1NqcSkq_4Vf8PcGTw4HzzyZACpUF0bFRvNhk5yg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] rust: num: add `as_bool` method to `Bounded<_, 1>`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 2:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +    /// Returns the value of this `Bounded` as a `bool`.

Assuming intra-doc links work here: [`Bounded`]  and [`bool`].

With the nit above:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel

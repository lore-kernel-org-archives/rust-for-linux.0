Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792493503;
	b=DyQ687RY1ffduB5epsb7/lNd5MAtnzAqrb2cbcnZMmJFokv7b3YUozspxRgW63fGMtde
	 gXyfiE04WAnH7eSZxQ4cMUP6NNM1O1yg288jUP3ZAWsKP2T2D/zsmiPLh98sgZoG273uV
	 qhwd5mw2pxMoc7B8ZtbIm88gjrfiLrDxwY7r/vuOhUlmVfA9RyY/5KiLpEvFTV9Bw85mc
	 mmjH8F3JxTk3j3MxqSyz7HH2poAXlt2M34POxe24c8LqHF07Ro94O3CMefjgyRQ1LU+pg
	 VJyO54uuTT1GFrZKX+kj5iG5H3/VCNPKQ7wjKsJvLQQyrpWc62gszrnB8As0IaFBmsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
	b=JNXyLe3ByIk2dC++dOkIxaq0bgRghHUsDF4sWzH5mzF9kBMXgIN2wvzOtDm+Nl3cYI11
	 EQ4dFtJf5nftxUG8/XsZQLR/JnKM0djSYL8B/8ZMmV6+0umP2iYlYVmyAtpoxr9cgt+6E
	 8SbYapamssezb6NLFDgFHB9VRmKDIa+exGllynZIACDMF2lOTcXLRnnvMUeZChB8f3RJh
	 jQlrx0Ks5oCHPp3p69oKf91p7CBAwuuHN5qRTzaa9uW+DUpK5YEkl8EqxHayUnDdPBZP9
	 PFj6js5Dax2dt8FxhJGvt72ekk4mjrojGRGy3ePW+9few1usi/EUPGc9wBFSFJSTyCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cwOSNTXj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5006860A380C
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 10:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5006860A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cwOSNTXj
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-360236b6c3cso274118eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 03:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792493502; cv=none;
        d=google.com; s=arc-20260327;
        b=Q498fOoPMyosNpGO0KvxSn+0HYVLTIAtzPLCxA8zioJHcWItMbEQ40FLzeYd519DLQ
         uVwkDJ+1CpQxttDXSI1qaEo8R+jJvTuYPz8M9pzvZxi+rROUXRT4oEJ27Scx2sNuFEdU
         Mt8ofoOfRZzCS00Zeo+SVrJ4YvJdesFAIe7wIxqX22W8zuQMxJNMCy5/vHylf9cxzBYj
         0lXBxdfFH8GbwA71MtGvOeYbOty+r2gqMeT3wo5UQcBGQXRf3OifUHbr4YdsqJDP5GF4
         aKAjDSPrnSZIyEjCJ5geGdNgShRVwVFzGiqD964D1tdSbxI/6Hz1Xw6jKOytLZDl4hUZ
         0RPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
        fh=viZzIX4sx+NSLF/JsbMhkTnbJeLnpIB3CYa3nrN/IHk=;
        b=dDrOvcRn6YH10Q4ztVHyF+YbrDoKc6k+sfk0jmq3NB9Ua+Gc6j8fZsojSXQaB8TxAf
         wZUmNEqs9ynT+Qbpm64EabAaxSJFMd4SaygS/c0JdbkZ8kUIK8Ps9rUys4dzGT5re9br
         wizhYAUQOMaiwpj0gokpypnKVodB9TMBWSHyI1JY65MG+nMViBqieReSl0raQtwWfHDi
         ZJhsdxmsZ3rPidX9xClb+qlsFe0RE/3g8GpK6UWrUqCPhsuNLqlDPsmDY5SVPhwk+SYC
         EnEABXvbYs/RfxJ/w0F7zy1nerDGJrm1gmRrBJ+y0VxiALAk0kDPBXIDDF9lUi/9lBdz
         3QzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493502; x=1793098302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
        b=cwOSNTXjS28SgehXt3TaTWamzKfACLP/MwnKijdBbVUuyzICifMs/yMoImH3I2gWNn
         USTyfyjGr8QkS3dzFKAsKCt1bjEtj0Sv8EKFoF4rb4Q9/v1rKvGyJm1XHvc3wX3YGsHa
         vnTSEQad7MiWIcW59CzHsYl0DJ/lSUAehe3b99zH9yNXAMYdxG1vP6x4caN8/hCItjqQ
         cdKoVMmMZ8CaVbZnXhrQLzrMqAGAEvmySJLtjCSqmEnAyWrpOdlPCmt3LojGgEKWOc5L
         JD0hoYbxGBPsVJL6xaNoZsv8bBX/kmfaZL4lx51zey9ZMey9V6wyRp4kyPb5h9xaMzTs
         ktAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493502; x=1793098302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnbFDlHQxg/JBRKuuoznzjwYIAYY7wedy+FrGSQfjps=;
        b=1ekz93cIH+uwYJHactxLAS0+7PhdMA/qBIF+GU2LRDfaZeRDYMILP6MtDcAA5f+g9m
         MutiVPhtpQJ06XNBTyh3p7YIkSE7luOOGEgbmZbKb8Ogzc1O6qknGkL92rxflHzrwuEl
         S9wyEaPGrqIpfASre9TUf6XcGTwcWqzMoKZcqKCdY6WGoYGUPvML/3Z9c3vR/pY+yqKK
         7YA0T0kfs2sawGcHnxApCxcWOCcv5oxDu8TfG2tKyos1At0Z1PCFTUHpWEbSvs6yP9V0
         aWHUUVJmJRZfYegkOGYPU9WVD0RFfKpCY84VhAwJJ98BJK9xJO9gMdxU1AzLEMWFsbHi
         skug==
X-Forwarded-Encrypted: i=1; AKwUvBw2nXff24OBIqcM0E6WPny33cmA0pbQ7p/MEEpEJAXj51FLVkrQU7wdcG0XNepdYc1hgscNYLBh4Rzdx6DEXA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKIJ9hdOX01pbGKu1zLhRAV9IVbRe1DR0iMISKlXuMNY6mtwbdJ
	Z/0idw4i/fheIg9VBZYmdQhn4NOCG2iweV/IZ25hoeq6R/AobWkhxG1c8K3k7Dd5fbDdicr8Ghv
	iS5GRQjMZvUdadYTrQAhcieEOrLKd8K0=
X-Gm-Gg: AYBFou2+VvbP6WwMi3xogUwx2+JIoRVUEQO1VB0Fh/ggh3iBNgytKAJpNdAwTZjvWqI
	JcbN2DVUNYMrsyn50S69N4K7IPJ3imYeJ1NiZv0YaDn6dRMU+ZoOoNuO91HN4SeWb/aT+jnEZkY
	J9wICZ3BGbqTFkmRUTxArqVNjZlcuIAouSzTnYVrL5KiByFkkHuL4O19UlNnXZsTCuQ19ZPiSTr
	SgizWvCsUxiea+dsvla8nalUYpJk2x51kA3RAFVDaCJPr5DBR0AdLzER9esXqXlA5p2SvAe2lGR
	WD/iomuziEvbAJfBfn4mans7hnd6kMy8HKS0j6V+/WdoL+ZNmyP7OvOHFTsKmsomdNgXSEVzoB1
	/WQzi+upCtuWkykj6XlYRpWcGo/ioYdF//UsvXO5zzRqzDrp4snhyCCymQlUSLue/ZoxJvQ/0fj
	edUy+BgtbPVDsOVqNkUZSYf7CsW/4m1UhqIvIf++TubuZowuxl0g1JS9gPe+PEig==
X-Received: by 2002:a05:7301:4248:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-361a0f7f3famr22708825eec.2.1792493502390; Tue, 20 Oct 2026
 03:51:42 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 12:51:26 +0200
X-Gm-Features: AclHuK8l4G5GVvkCAmIWz2nvAGdMY2Kiu_VckZsjZRukFRtMb29mqFIXRr3hCgw
Message-ID: <CANiq72niEdx6XFtUA_aA0mxtBOpuCnCU1G78rnwivxUBVXrpfQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: Fix CFI type mismatches
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 1:34=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> This series fixes a few CONFIG_CFI indirect call type mismatches that

I may pick these as fixes via `rust-fixes` if we get Acked-by's.

Thanks!

Cheers,
Miguel

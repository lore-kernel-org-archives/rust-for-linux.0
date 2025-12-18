Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0F2CCB9
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766069955; cv=none; b=ssyqtPv1lXaxhf4cVQZcesjvto06ii8sLezXd+oVHuijnMlqI7QC8o/c4kPPgTHcQjuIR8SP4OwlkLYLCsrLcfYOH81bSgc7WJDrGHGZdU9AOwN6XTWnGMgQyzdyMpH/O3Rbw0D1LgNPC6sLkGp4/mSqpk2EUzcpA9CYQlI0z6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766069955; c=relaxed/simple;
	bh=2VVCGOTHxK7IbAznOg+/IAlqsriTX8Qt+JSpqB8cfuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyhivwk1HIYbb9cQbciafpWVmAsz73OUTYKK+KiNENARNXLYZkKx5nXOqFfio9w00mbtDqwYE6B6HCG65cUQvrXg4+MPh2UCqi2rt9l+L6l4XEAb2QH+mXX5tqX9BkUC4pZQwhsCYUAyxxsj4w4o79Gh5kevrj8J7jmzJppLb28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hasezeDk; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hasezeDk"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3e12fd71984so521695fac.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 06:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766069952; x=1766674752; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JXkErr0b31WbG7kc/tkWD8xQte1PLRoDTkZ/MF2VWA4=;
        b=hasezeDk91P5Ds9B7S/JPk7ZuUwTJfTvx2DCW93KdfGdgTjEQSV/mEJn8wLpMN3qnR
         1Ii3LU+/yp6TFmiCFrpLt/HLFRicErIHfWZ0ruPW69lOz/xOoyM4AQOgfBp+soopEd0q
         Od07o1cUQMyGIMU4sh0e4PDBF8Cf5eXuAms/j9ELCESt3Cda6ne4/dVC2TX6zxqNXwe8
         2UPh2Qds+n+v5rjVAqhLdnALxSywSCRYJJQbs3I33G8zmtAIB4NIKCsSc6hHln55QtTT
         w4pjN1LEL++25s+1cuaADLjK5QXOdpLXRETYglMkNSBYjiVnw4418SMsBgkAr4e2Yk8t
         VNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766069952; x=1766674752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXkErr0b31WbG7kc/tkWD8xQte1PLRoDTkZ/MF2VWA4=;
        b=HhvHM//nEVwVtOKRSdMIvy9gVixP8zm0b/OunWm0i0gmmHerIM7HY+e81MQHXfx7ZT
         hHTa2Rst0f61rUTdVuRT2RwYe4HVM7M30HSGYvx77VVPtRK3SfwO8gnwCzaGU1dtlnoE
         XLuhqn7bjj8qyRN0bfXVLknoXUwlSycME2HPE0mimfQUqXD69myfH3edRGwiM1xiUN4p
         9qdHI3F56dX6QpE5ukBWANCgLFIU2QB8ea/dMEtVpFTp/FNAoNonPcv31+GI2q7Esc00
         2KZfB6pAi9V2khDlhnuYf6SF1CXxT4y4trmJVzCZ6PGXKn12r0JdPN422stk4EYghcfk
         TjOg==
X-Forwarded-Encrypted: i=1; AJvYcCXax4CR2cVBB9gwIPQ4+eF/ai7jVfb6ZyYRci4nq0JBPoqY6uN7DcozD2BNgf87tCMNM64WHxvrFdRpnMbNIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzYGeLJpBIkADMEysIcnDTxBsRZvkDTdze2HIX5OjzTjGoXqUt
	7M6RjajN1wXW1hY5Xb9UGyq+xWlQXN4BEFlP7DJvQlbTHYMkEqEyaeIo4wftVsScsP0=
X-Gm-Gg: AY/fxX7YZiV6jj7jikpOGDCDIv7XNjrRXE/68lFebOV5I2+hsKujWGbo1f4upJ9FGsF
	qo4LsQAPTPkVgseoBrLSvs1NShZGIa3pN2BR1WRN9YH0MI6uy+vOlQG0n/AnOScPrwO3EtJd92P
	j73L7IfaBamG4yGF4o6Sd1+3SrQvy+PJoTSwU5AaWyMHPJLLwopWiENahUk+GdYL7HJ7RzF9XD4
	+UIRnBN7SOQP/6s76Ta4USmif7r/g8LtOei5dZhPQST5zfSbjqNfG+VG09bMdPKRwikdtSMI+Gg
	Ch/8Ww8MPwb7Haou80b0iYxghD7LaBOn6FycQvcLn+tGhtA+QhkxEFbNy22BgQSL08b/ksym/GP
	wvShdZrGW6VPN/VZHos1+NuGEwOOHWmBg7pbhrsmJVuY6P03WJjmKsw3jqHWzFxVlsb7XrBGy78
	pdsj47riPqUEP6u3Gyy4yh2J4UzUbvRhNlFMucAJ4qsTLH7TclwSBhsszr0k5gzxMime55hcbsF
	UEXApv7rjSx2Wc=
X-Google-Smtp-Source: AGHT+IGAaUoHKxXYkTruAqpj0fxAXMNeFqjNhabz12P1AXpNVhbgtOrPoRtMXpJr7QFkttTjMpOq0Q==
X-Received: by 2002:a05:620a:4153:b0:8a6:ee41:1b48 with SMTP id af79cd13be357-8bb39dc4bf2mr2993162785a.26.1766064226541;
        Thu, 18 Dec 2025 05:23:46 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeba2b9c6sm163616585a.34.2025.12.18.05.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:23:46 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id B12FCF40078;
	Thu, 18 Dec 2025 08:23:45 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 18 Dec 2025 08:23:45 -0500
X-ME-Sender: <xms:YQBEabYK4DvDdI8YnGjiRb1bYuuUvgs1wX3ZZ6wpix4PzjXSBDBQDg>
    <xme:YQBEaQ6zOeH7AaQTjS2EI9qvf7h1rddVMerJmcjebh5DD9tWU_v7EXn6EZOG1MAOj
    Z-5cay0KG2t-_k4etEH61Dr_SgkagdFjA7fSPGdvM38BVN1ys0G>
X-ME-Received: <xmr:YQBEab_bQYqwq8jzsiZ-euevxLCogI_tqVQ8OzbQVkuhhVTMIYO4cvfPDJIR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfelfeehvdeg
    keenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojhgvug
    grrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopegrlhhitggvrhih
    hhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegs
    jhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlohhssh
    hinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughupdhrtg
    hpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:YQBEaUZ2Nk1ntBLaekdsydtrmu-OyX-Iov_CVSbrbsFnmaboawl5Fg>
    <xmx:YQBEac4i6QRQHhcceex4wKkC8X2ElGXPKD9GOyDKW-1BF3rSzT_VFA>
    <xmx:YQBEaRnZNuQsW-ZH5aGONSjOApSzRBUeB7UgPS3Wl8e-IYcXHFBzkA>
    <xmx:YQBEaUEz6gqWsrYO0G2icYTwh2u7xpQSSRo5lFXQ6pIUBtxQwjBaYw>
    <xmx:YQBEaSiAMN6X82Bivl5V-p5De8BfuLQJCGrOSAEi4b45Ewodw8WkII7I>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 08:23:44 -0500 (EST)
Date: Thu, 18 Dec 2025 22:23:43 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v2] rust: sync: implement Unpin for ARef
Message-ID: <aUQAX7KQ9WJfaUGt@tardis-2.local>
References: <20251218-unpin-for-aref-v2-1-30d77129cbc6@google.com>
 <CANiq72nijV5iqmFzWErKAuFMw7oPPP5heQoHR=YsUUYFuUU3Sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nijV5iqmFzWErKAuFMw7oPPP5heQoHR=YsUUYFuUU3Sg@mail.gmail.com>

On Thu, Dec 18, 2025 at 11:26:19AM +0100, Miguel Ojeda wrote:
> On Thu, Dec 18, 2025 at 9:25 AM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > +// Even if T is pinned, pointers to T can still move.
> 
> Boqun, if you pick this up, then please tweak this to:
> 
>     // Even if `T` is pinned, pointers to `T` can still move.
> 

Done:

	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ rust-sync

Thanks!

Regards,
Boqun

> Otherwise, if you want me to pick it up, please let me know -- thanks!
> 
> Cheers,
> Miguel

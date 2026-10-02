Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9029331200
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975050; cv=pass; b=Uil5Q3tlKP3A2NNHYOuw+D+RNi6cj8ehOFo0+9XAPjKU1HqFnZPEDusl9qiALe4hYruK4tYHiGJ3cOoGB/WZEznjuPcTUD9breJxdSdc1dsbhIbN5lH0U15TQKRYLLwvDf/9J/llRgYBqn7t6Z0ad67p1iGD0y/M2/WkBbimCHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975050; c=relaxed/simple;
	bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TT4ibyqNZNt1mq9LCrKlL/mxcantOP/xot2aA9TicbLsWijnlAUo465FFpyOcG4OOowfVflf5Zj8jRRWWUaMft0jD4gt6cFcAFKbPO0681THdwAdG/w+FnR1KHVULvdJ0t/KUqPt+JnRo7BzR4y84+slS/AZ2uxeIQpxtqOxP4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8MDju95; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8MDju95"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14b1b157591so612c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 14:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790975048; cv=none;
        d=google.com; s=arc-20260327;
        b=WBVagTCMhYlGFP/pCz0cWMMoXRG88rzc/TrNoxuGySNgdmXMxe9zlYdMDY3/CnntW7
         jxM9gm/QKXIsoXefqHOPA0rBji8hoiLIsgyy4iIIYnqmAP6DRVJQutpUiI4Br7IQmHz7
         KJNO2x1zrqAolh1wZ2AThX51G21f87buN6UNp9vRtvmvyEk1VYxvJIaHfoAnjoouQgOZ
         dUmvc0BfSe/LIDRqF4HO+40ETqokCXFLkd+12aGwua+W2p8DA5ZSookpuDWtHIR1Sv8t
         EiKsE2pWG+98HcfMqYNcn9/kA3vQVen/pstVz+iupMEMAXwx0JDQwzWZXEypJR6kxuLH
         zV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
        fh=dvG0SkuDgl0Rl4wG5vmPeZfrHVmUirTPoshdI0xfjnA=;
        b=I1eoEIoyhld1Ja7MwgY6JkcSSaGir4CIXepcmx8cV1OKlsiUmKvAJSWwlyS0RR/qV7
         HzN5RxWNeHqDlKY9uKVLUPYa1KwzvPPRMZsUukQFrfCuLNmzFrOvtSBgJ8fBkbmHR4bJ
         OPKzetQ2HtY0FAmfyPtlyEAy/Xu2as6aUCf3FV8ddZPz3rUVBIC3hI7hTRClABI4/+SF
         Yk7QAquts3PPVagHmXhZV1zLa78RGuEwTwI3ujZFH8GCEo48CTq1bOZqabEiBlkwp3Di
         YQzl8Zxt/AtzPM8LfY3d3H3YS/CgihWhZ8q9tnCXJmM6n6t5YeEpaemoWz0njPW4swEO
         gimQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790975048; x=1791579848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
        b=F8MDju95lMzm2RB0DBPjkvKX0/uV5iBYuLMom1OnZeaB+YmTWK5ac1o0tJYNZXnyDC
         DiFp+AL+4iLGL4W/vyUzeWgeJc85aGer5E2CcTITTiA1vRX9nPgg2UQbSW4bEgpKWcTk
         v+M7xSBrWWc2iURBGNv86TSlXgzBHZwpl6cWn57MiSVI5VNZGPR4AXZ5NBqDtzWuxqn8
         BW1gUdrcqVfvad4UbtFAblKhfQd18qvxH8le2tWrSM7K251WN2KXxoRH+55YCUMYvrkc
         UNIyBqREWKK19g5QN7xdXuRI1dDHwBtlXJ5u4+4igdLs/+8ojuZzsALRgE4bd1JTZZC/
         Xnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790975048; x=1791579848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0noNUFUEX+eBGmxLyPO+FbW91TOwqpdPnLQHoTufS0k=;
        b=YSPyt6AuhKf731ijFFIh4wHcpwJtLWMOze7yZDfj53JcsEuQdprvtnalDtBGzrovnT
         3VnXhWo8jpIgxmnXkUYaUY8j0TFYB/F9WxC5zacyn7gtWIYECVPU7aDCPNh27eEjGfrE
         HYSu/xz1KXio8sdpVrFxBR9I4SIzHoYvzxSECe4O2kghm1YZlrUDPesSSmA4uxQE5YNf
         QGJCWn/8qRYTrMi/MsdnFcjhKl5CpqbSOAobLg6ML4aEVW8nUZKgiy13sT5mBN32KXoM
         GZrpBq0VknK8ZEyklo0p1YoKb9ZmHSc4f+KPuXP/qQjAormzbW65g6lEn5AHBwvuzotA
         yopA==
X-Forwarded-Encrypted: i=1; AKwUvByzTvQMQw11z0308hXe+/WCfooFM+F7WVRh8ppukhkcoE0QbW6mkcytIsOPBn1l/ZQwo2l3v3r2pj1p3wHybw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLi5CcDBx6x6jWoFcqN8uWmlU01XiPpU34X719g9DwBe5QKZKNL
	gMcry4uRzsdO7MzQkLBMmmShTgCnenluN4q4e/Qk+8zSa/MLffezEDcbcS2ZbIXo2jdG499uA0P
	tRmEOqsrzj9/JuE87FPhNp7VdvcJum3c=
X-Gm-Gg: AYBFou2aFqGsbrSB9myYJ2XjXGj0bHxl5l5SklNw6avJbAu7L+DK7SLLjy3ixMYO9Sq
	6JpTFIjJmSAT7PZ/oGwL9A22zMOIjgC6BfnmtmFrQGzr3aZalFxorKh6Mgb30NRcWXi0lfW7NR8
	4ZcLfklFWnCf9eew6poteN7h71QodiYcwOCuqd1QArHEy3/77/klj+QaSa6KIRlw2aAj7T5Li7h
	xQz2PAnMQOckZPf6QiyK6ZhEIFyElKUpoHs2/bHZOBOilk8k5bgryn0YYtURvjauYizSelbEOQ/
	P5NQXLgkTCy09TMX+hXaivHrq9vIL93KE7EYRjfJK02B5jYTD4ly4y5fTGR+gplHD9s/73VyrzL
	JrEEVv+42Oqj36SH50/9+I3lsEFUUjOl/F4ktjlCJnR3Sxp9iHnwUvHeNBborDHcFMphDDmhmyd
	FPPu46oTkWGKQYqOMKu941xKwFYjUEC3fyzhlLxR0KaLK6Lqu8B+4=
X-Received: by 2002:a05:7300:4f1c:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34f1501d239mr5973962eec.1.1790975047903; Fri, 02 Oct 2026
 14:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828122444.475-1-nils.lehnen@proton.me> <CANiq72kzouWAJbbhpKQXYit=VnF-9z=iLspk6mgSQU6m4-Us5g@mail.gmail.com>
In-Reply-To: <CANiq72kzouWAJbbhpKQXYit=VnF-9z=iLspk6mgSQU6m4-Us5g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 23:03:54 +0200
X-Gm-Features: AclHuK_dXuGnJOPYodrtO7InoqnggBz8eivzSKeWlZZf0S62XMBs_UI8KNZJzwU
Message-ID: <CANiq72k=u195jL_Ki08pc44DfmL2y+CMv249gSE6Ocp_RZLmsg@mail.gmail.com>
Subject: Re: [PATCH] rust: of: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Nils Lehnen <nils.lehnen@proton.me>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur Ozkan <work@onurozkan.dev>, 
	Moritz Zielke <moritz.zielke@gmail.com>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 9:45=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Looks fine, thanks!
>
> Rob, Saravana: it would be nice to get this done, please let me know
> if you prefer me to pick it up. Thanks!

Pinging about this -- happy to pick it up.

Thanks!

Cheers,
Miguel

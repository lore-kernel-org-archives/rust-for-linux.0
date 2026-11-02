Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793662955;
	b=NZu2sh1bPFpEl8AWYXmQGtcih6a/LO++5pXwtnBeJs8rTYRR3oX9dvvoyKi1uqHT8i6C
	 ndPUzkzbBmmki06F/yfiwuhPGAtAaswH64spXgHdBUCaSv/9Cu4LrKpMuNKU+2gibSJ50
	 HXG3d0Pur5PZtyBz+E7Fj/c7CBS27jiupI6TogbSj36YdDAhhQDUZ6QJHcTRGkVI1nYno
	 caclCGe9q2TcOkEgEvyJw32PTJGJvkVc+KyXO5bxNeFw7q/PXQ2EvKDTpS28KJXiJMN/B
	 j6wO5AhnWpR9/IkzcfQvsUGoV7aM8EZ2NeffeCB/VccGP0+64s6hnSoefXhe0SXXoOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HBpzp3eggKLBhjsACcyOTF2uTScp1qiWUW+WIqmI+CQ=;
	b=JZcR1vG8K4IC2aNzykuS1wlN9QXTFkN4d1TrIyQYVmSYHuztDoofmLL2TJ5a0nDJEAXB
	 DrupT++NErQO6OJFsF6L4SdzAwlh+k1k2scA6XPbzkqAT7J5wbjrlo98AUgIRSW9UJS1I
	 gPVMajKxr7c6OuM7SPSNbDuh9rZDGaUNC0Zh0GHE1mSVx/1HyJzlZFTeCfYKImbeR2TFr
	 kZHn8fO+Ot529d4ZkSevS8K/MF1h/8YFihCazmc+212opzZzWYi3+w1LWjAHbv+LUFnGY
	 8scGQ3JcGpP9M0eg1kAGgtd8WgcJNmRz5umdLW7qcZL1l2lypNlkE27Yty+THTBD1sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPgW9gVb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F049E606A324
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 23:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F049E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPgW9gVb
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a1467ca93so330382eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Nov 2026 15:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793662954; cv=none;
        d=google.com; s=arc-20260327;
        b=a6ESRJUmBoasW5G2r8mpvAnZJ/R6X+SnfSB3up+3mYouhaxmi14gPUe2vJPK5bNVJz
         RDSBqSsvzP403EfB+x36rH2tpwEj8NCnso6DlCKq/z/HZJOh8lx37yKBD1d9BIN54MEw
         1lzFgCiGhowt7eyxd7hxA+haxL2EcnSbGD4RXSvFMOpdhRIhQD5tj65h+koEd62e/faK
         TZ0TH//ng3Cs3UlZoufz7N84f0yJ5WdtQJmqDXtTef0NBEO8JhpMTX6OwqkbM4ytOkwP
         y+076noUNaw2kJZG+loC7YtuBqMPlOEBQ65UWMYcLMzNetOzbr9Z2JXzuN6aUfie2NTN
         rLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HBpzp3eggKLBhjsACcyOTF2uTScp1qiWUW+WIqmI+CQ=;
        fh=4p/BNPJMq+psqUOQoYg2kBi57RzyUnVXavFXVre47QY=;
        b=OVlTKQKxYF1Kt5GyimSwo/l8hEdSdSao+W96AIKACKZkopLmwcZwzDwZ49S4sKx0at
         r87Rfyd3hDgiFn2O/MqEo0S0tw/X/LWsoacVGPoUL5zETwkyN+MUyh3Sq4v+bs8wZ/AA
         3ZRb1yS8xFKXNl+jH2m+KFdRtiKTTyP2luaNHAuFZ7Y8mMzC6w1Pg3wr9uxYg6L+T8/k
         SnNKChoHIJCsKBrFWEJPc7sXPFJj2xvx02xLl9oBnMgORKMb2X9ZyjvLe4MWehFtkr/L
         iryFFOTBwdiBF4x8bIggAHv4+wcP6i72b2ZL2zRCMxH2m96kpiSO/9InbYISdWFGCM1Z
         W16A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662954; x=1794267754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HBpzp3eggKLBhjsACcyOTF2uTScp1qiWUW+WIqmI+CQ=;
        b=zPgW9gVbQ15jkElnCvMMZMonAQsDKT3FDcdBjurmj5LguZ1nsoxFldugMzrGy68hhO
         sU0zoWGNIm1/gz//zIPaofNDCvz+gofbNKopaXtODI85GJcYKjxtI3mEd6PVPol+4nP/
         sWdFK5/8h3VIH3skXL8rX/wGXusUWbb1DFJIC9VfigYkpWF5vyaxjECDFe3aZnAbOtFF
         FoZI3XeSGvj8vygKJXxRnNIweoaq7VdPQBIztIDDZVnJxJRNte7F7BRSR1QfcB+Pa/Im
         zhS4cXZr1nQciv0eJ+8GJbVGxwZnFNCwWAzCtnH5y0mL3SfSs/fmDreFy6MQg0K9hrlO
         ufCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662954; x=1794267754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HBpzp3eggKLBhjsACcyOTF2uTScp1qiWUW+WIqmI+CQ=;
        b=NMwsqKXCkTvPz3nPjKqx5dWeJAqo0CMvrZdYhZVz5qc9/LcBPwB7Ew0I4EXTxZrR7Y
         TodPx4DbfVYIZHlelvFYOGeWcsKbOHR7AS+tGWAatYIYP1JxR8KdQrQEc7HQKgKcNqrc
         7X3HSBXJZSe1GdNA4lOgU/CIxdtsOhN2nE8z9fp/6HJF+Ff4ULmxvwhpCoEJAdkjiryv
         AsN279sFbUzgS0t9zcK/sbrjUgp7f8vveRBUUgN0HJyKGLeS4nSJAEliaSz51hpfKtnx
         tupprI8DyHu8bnB5sPydF4S539sYneKST88Jaxhr8G1NQgK4b8PrRkZrsqn+ZPSCvosJ
         ZPFw==
X-Forwarded-Encrypted: i=1; AKwUvBwt+o/n+SbmW/anvHw1XfOzeqLdVLudsaaOJtH8jUcafM02+W7lZBoiDiA8aaDnpQxNOOdlIikN5jF5XrKhqg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9OJzeDCRf5JwqzcEV4Kk1Hu6pJhJf1+6Yhp6TAZHpjqGsHXSRU
	8PNERis1E3h8r4xZ4wv2ANYTPHlfUG2koEmako9W2L/sONT7RMHM14Lg9YGDj4gCfN2v6jtErB5
	Gh7JTM2U4U9W68WSBuM7E7NmykwRo7wc=
X-Gm-Gg: AYBFou17OCIdik8VREu10y6AYOI/7rPBW/8+YSnjdLQJOvXLXKQEhEZ4sCu5sh9tYuK
	7bP5U+iqkaBdOOih53fzJpICujdFB/OGEFwGdTcVNZs7UNkm7MONqD3ahooyhHkBWW6i9IZTcvh
	aHE9YOfC9pARVEQVWzfFvg4J6sBHR9+prBMkx+L5/guhEhLY1VKy9B9K3MqBjHKWenYDl+AlZ9o
	FuALwrX1aH+1tOAIcfAjxYp204SpU3xF4v24amHjGS22+ZHOT54tybZYlP9dJw9o6of4D/EPz9z
	Ld7aAYCsVVo20ASNoCs3PTQNgBhqCllc62fPE/ug3eWzSSqDWhexxwVdORD7DjEtXIpZ44kwAJ1
	21K55dbHQtNuAWq1P+5J/bC+DhS4gneEKj3oI37mW7Samljc6Qc0/AWMo8ND8xhi0K35eqacwNW
	zQ9v8o8zUjQUEgo3OAOgzyM5mOoyF2ZR81BIxt/KkI7za38N7yTgm2B4EvpQ/XEscglCmU0g0U5
	EF5BtF3L5OJ4wyVwcQRBqaXbJ4sTl8Pt6eo
X-Received: by 2002:a05:693c:6304:b0:368:1f8c:5f23 with SMTP id
 5a478bee46e88-36a4205b0bfmr26204213eec.0.1793662953823; Mon, 02 Nov 2026
 15:42:33 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <8yvpSoQ7ihtTj508nQU_nAlk2eMmGH5zK6H5pow6z5cTYGO3yL_DvqwbFMwqzhtbL-52eMYXpT5Cyg0g7fUN7w==@protonmail.internalid>
 <20261031003334.4161188-1-tomo@flapping.org> <87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
 <20261103.083342.865260022622203055.tomo@flapping.org>
In-Reply-To: <20261103.083342.865260022622203055.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 00:42:20 +0100
X-Gm-Features: AclHuK9TK1MYRhsDSlFy56wmo_12qFzirsbu4l7ioYhdBF1oVl2vyCzq2ECsZUI
Message-ID: <CANiq72ka+YS+O31zm7sm7-at1TyPky+7W_5cNMLvqTK3=mHEgw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, lossin@kernel.org, 
	lyude@redhat.com, mike@fireburn.co.uk, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:33=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> Mike's drm/vino series will use Instant<C, Sec>, and that series is
> based on drm-rust-next. There are other time patches on the list, so
> it might be simpler to take these two patches through rust-next or
> timekeeping-next, and provide a tag that drm-rust-next can also merge.
> Andreas, Miguel, would that work for you?

Up to Andreas and what his plans are for timekeeping-next this cycle,
but whatever is easiest I would say -- thanks!

Cheers,
Miguel

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00C03C1D78
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084203; cv=none; b=eNLWIPROVI8ezC5OBWEmqn1Dj9WzsN9RVYBfvjq8SSNau+dIALrVJwSKe6JuH/IauvihyxBZUMfkp1LvYK7e476fFXdjHDHHds2dqhEp8uufygOYRifGPC/qlp9jLfoHO3qbqMSUozh6rC6IiFkFsVU/wG2m90YrhjOpXJmPQQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084203; c=relaxed/simple;
	bh=CYx87CEfR4uqo0EdKxZaeNEoOSY8JEECADRirN2DhDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SBfUcebSsKUenCuqFYojhEKJdKhcQZxEfBOwN5vmQflwTvOrliKLGt0bc88anuLi43kk9nKXp59Hkgcwh/C4lUQd25BETsm7gw/IbY3CM8WjmPVD22Xidtcvc5Jg6f4lPaOJ9Z97MnCyt4EwBqWFcDuPEKu9YF7GN9gZWIaQ6O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F13fU5Rv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F13fU5Rv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790084200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MDXjlNk0ngo/R8fuvqVhboxL4miIeE6je51J88+F1rQ=;
	b=F13fU5RvInzl9BhyO/uyhbtRJwEuX8PL28CL4IljNMg0IDj8sFcqX+K9PbMcr/zU1mqoSf
	ez6DtpB9uhfuwprprSQGogXoIitPBYbuQ6AUAa88ma1lbLOT8+2FG0qJjIm5MAWEvZ4Sld
	YpoGrlyfafUXQ9eaZMWwIXvxWTuGlfA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-B-B0GfC1MIuwi-tEKImegQ-1; Tue, 22 Sep 2026 09:36:39 -0400
X-MC-Unique: B-B0GfC1MIuwi-tEKImegQ-1
X-Mimecast-MFC-AGG-ID: B-B0GfC1MIuwi-tEKImegQ_1790084198
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c294442d71dso495909366b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 06:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084198; x=1790688998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDXjlNk0ngo/R8fuvqVhboxL4miIeE6je51J88+F1rQ=;
        b=jGa4mlb2xF4cKVlxYPPT6amFXo15daepZNwXhpsEJe2LDlVjEUNtsFEjy7+W251Er6
         0lWR+oCkAO6Fnm1zRzRuSOFg/U6v5sEEfpOhWDyjgzxpVxtQV3gCs8j/fG0Iin0FXPXE
         b+htZWVL5cderV5hncL803arAcdEX9UicfWJEttvvMNKOwUCXdFQVx4vyHhBYWmtEHbe
         9wv8UN4ycNFsam+48wdc9ueHm/HCQJO8EarhrqTWqhBZn/nBEjGvDG8Sp7CwyQjusD2V
         5ca1MK2dO4j4llR98N/4zeyMNvbNHgnYuTbp5TQGAb+wgMtGRCqiLhnXhQK3Cz2lCwww
         3gng==
X-Forwarded-Encrypted: i=1; AKwUvBwTxjcmK00N0lopSaF39xFJjV+ybMQ/UgkmrBBg9EGxsMaWD0N/ZTUP0u7LR7a01cAe3T5QZletQABs9uCEYw==@vger.kernel.org
X-Gm-Message-State: AFuF++ma1kcyQAGgVr363+53O1cXipWnZiyOne1yTtNu0HhdqWdx+c+8
	rZP5i78EadtDG+xVZ+pUkphzi230ns9lxLg5aMLu/RaZeviAirzJopUdNATwt4N893Ckef89Ilr
	5wBT/i/ZmYEcUFOQPWa5h5ZgYBKu8Jn1FunV6aVfqU6+Ootx4pxBpDevVIuVaJjMzdu0I
X-Gm-Gg: AYBFou0sMNFCS2dydaKV6RFQCsXUmq+ekWdeKIROypaCK9tygk2NVa8hDbtY0IX4s1o
	xtYbYygaJ58OAphr4xHSuFU4VJXVYk0uis5QjFpwZrSIcb0D1UTFuM8RXLgnSi50UAB4eMZEk5L
	UN107vF4Kogm44BEgWeJhYG87pDzgqcK2+qUdD0Achz3rFQNQDpNQZL6Tnm527DbZeMG1tCrBsU
	7lGr+fVyg9sw4ZaAdAiSsuZXEsOo5MDQnjTg4IciEZhcJNsl+lIUgrTATtz8s065esIOW+LHUJ5
	Rj0TuS2LkN2qxwdST9omVTnH/z33zJw6ihryh6PNF0AByAQhURKN0qBla462IT79o/I+BJtlAeS
	yFb7rqtuxc48veR/rYo82X9ywJfBWIucgFbSn17gXZ1iKY47S+lRUEzzkM+2hbKZmBlrocWRqPg
	==
X-Received: by 2002:a17:907:3c8f:b0:c20:af9d:4533 with SMTP id a640c23a62f3a-c2a15896523mr1137714366b.19.1790084198438;
        Tue, 22 Sep 2026 06:36:38 -0700 (PDT)
X-Received: by 2002:a17:907:3c8f:b0:c20:af9d:4533 with SMTP id a640c23a62f3a-c2a15896523mr1137712266b.19.1790084198030;
        Tue, 22 Sep 2026 06:36:38 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c62555fsm86995266b.53.2026.09.22.06.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:36:37 -0700 (PDT)
Message-ID: <164304b3-3324-45f1-8766-536767e7b9d7@redhat.com>
Date: Tue, 22 Sep 2026 15:36:35 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] rust: net: netlink: validate attribute length
 before casting to `c_int`
To: Sagar Taunk <sagartaunk@proton.me>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Matthew Maurer <mmaurer@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn
 <andrew@lunn.ch>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918100016.100988-1-sagartaunk@proton.me>
 <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mNOXsST_4QZM6kftIN-tbHo3j1Hmmuowh-jJpztpvVY_1790084198
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 04:31, Sagar Taunk wrote:
> Hello, are there any updates for this?
> 
> Also, I wanted to ask is it fine if I keep fixing stuff pointed out by sashiko for now ? (I.e pre-existing issues pointed out by it in other's patches or should I ask the original authors of it first ?)
Does not apply cleanly to net. Since a repost is needed, you must
also avoid empty lines in the tag area (i.e. after the fixes tag).

WRT sashiko-reported issues, beyond be aware of false-positives,
generally speaking net-next is the preferred target tree (i.e. no
or very limited impact, very old issue, etc...) with no fixes tag.

Focusing on high stakes changes would be appreciated.

/P


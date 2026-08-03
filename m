Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8EC40314F
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757161; cv=none; b=CMI1JxsPh9FQ2VnctG0uzh9d5vCQf3QcyeYxfDeRrWWJLY7dwP2sFjYP0zcGbK0TISCH/LG00uHR3lIsSoTfWFjAcel2b/vWIgvkeoIF7TohPKYsGhnF2exBdwsQlyc7i1BoSDdkb0tPS3ZvNWjJO1IoeW+ImUx4TSRPryqm538=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757161; c=relaxed/simple;
	bh=CdfWodirFgw1Ed9n5sstSXJyDj8AhHM/oa+p0Cx4vOg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nA2pD0xZtp2hBz2a6/9XNUFafTZjllGNX7JjA9nlZUmQg9tv82XeziudHjW3/111+xnSCQ8K58OwVinDmoIJSUw6y7GADOLYLuCbSs3ZmF8/wUA72QRGP0z+yLCz2EVi6yOjJX6JfdakEVuPFqqG6dOAe6+TREmcE9lafgJDKWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=QI5HPf7U; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="QI5HPf7U"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954df200ddso12833155e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 04:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1785757156; x=1786361956; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WJd2b+nAhn+22H9JaMbhByCLa4f0+AZx4UQqq+PPVEI=;
        b=QI5HPf7UGqkEazzVR+7a97M8hZb+npAuOjr8fsjViJjeSSBTrtqdIY+SyC+PKMXyMj
         S64Js/QIlFEBXTSTZhTb1lSuwX4tcjJ3U4vJX3tRBkH4PktyWTr7N3mSxhei7w8MneJ2
         7i4FdUxdUeDeEXreaSvab5h+Th7uOPlrtgaqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785757156; x=1786361956;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJd2b+nAhn+22H9JaMbhByCLa4f0+AZx4UQqq+PPVEI=;
        b=Qga54L2ojVvOLJz0/7O0LoTY/6V6UdRJZw29cPO1LfGKp8XVqJsl5JSBmFadQLieoh
         Y95ZKHmLpfCgDYV/OlGR2pSN1SEpXoHrdteUMju3+lgfEPbKK/yuy+aF/QSR2HbLolIw
         HeoccVxX7SjoLIcXAGcuCHVVHisbpwy0MXJoZIZIZ9BR8rVWdallYVkA9xXPY8AJuf/k
         R9MBXW9qZrWpaOLio7MxWATbtPPRpzJajwJ8IXPFJjsJ0CsauU2dujizcy5tXkkF2gtd
         re9yKVoFP2ICdv9GHn7FvcEvzMZXtqCFsP0ZCLPn6dB88Dp2hPbO8R7b3G3PbgARXb0g
         3Y9A==
X-Forwarded-Encrypted: i=1; AHgh+RpDhtOUDZ50+McHav8h8p7a5ZV/l+UMRPFJ2BXLj7lenYFaThf56OSlj5/+O8ufoMTRvNqo3/ZbQFDnP+qSAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Cd/zaYJOx8CLQ6pA4Le1B/cL21cyiLZ0ByJLGyiN7mqg41GW
	SWmiClHU+NArCjzkKr9HJm2AOHtf0AVx76ZY80vdA+HuNNt3jq+PbGHcePnYHBx2Upw=
X-Gm-Gg: AR+sD12Bku7B6CBUR2VQT8iCH5sj6eLaO4w7/TKKUJqMRqT4pddr/ZMIdSSdxikNaWk
	D3NFwmKdQk3gKeTUexV1gbmgjnl14WAQF/icZbeLt2gp2QPaJEKb+LcfUcqyhsfkC/f9wkTrE2O
	5KzRI3Cloa1mgnBV2LXM6c1han9ZxHlQW+jvLFBaz7OS5PaJQHKbX0I6BbgkHYePfi5S+DlncTh
	4LvRINbnB5YYyxlQcHrESOCQ2BDGVzQ7RycXJTAbd/kpO+kA++l1Oyql09/ijlMkqF+RuyeNT8N
	HGVru5D769wZ1rvNq1YCqTs2MIJN0CtnMIbp/hNtTzSSWDJhkFjXoiDmj2+2bpOY/yfovGWCWeZ
	1v+hXFpNDsZ1SVS6neOX92l6k1DteV8isJkH+hparOeAZt+8ZE4kjx29D95Yn3s+nuN9ozd1LX8
	xX1VHo6ifgkSeHXbBb3EdAqGrBaJFSg86tpcaTfK8u4SiVzYanVEryABHEqO1iTM/7B8od6fzJL
	MkuJ1JbkqYoUfODNF+Z4HEQkmby+R7Yqw==
X-Received: by 2002:a05:600c:c8c:b0:495:4589:707 with SMTP id 5b1f17b1804b1-4980c6452f7mr203906995e9.5.1785757156437;
        Mon, 03 Aug 2026 04:39:16 -0700 (PDT)
Received: from localhost ([217.73.170.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2961sm35814991f8f.13.2026.08.03.04.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 04:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 14:39:14 +0300
Message-Id: <DKFA2VDUIJNX.2UAJMD907F7TS@wyliodrin.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] rust: usb: add control message send and receive
From: "Alrexandru Radovici" <alexandru.radovici@wyliodrin.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alexandru Radovici"
 <alexandru.radovici@wyliodrin.com>
X-Mailer: aerc 0.21.0
References: <20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com>
 <20260801-rust-usb_control_msg-v1-2-655bb444b52c@wyliodrin.com>
 <2026080244-ability-education-535f@gregkh>
In-Reply-To: <2026080244-ability-education-535f@gregkh>

On Sun Aug 2, 2026 at 11:32 AM EEST, Greg Kroah-Hartman wrote:
> On Sat, Aug 01, 2026 at 03:01:08AM +0300, Alexandru Radovici wrote:
>> Add `Device::send_control_message()` and
>> `Device::receive_control_message()`, wrapping usb_control_msg_send()
>> and usb_control_msg_recv(), plus a `Request` type describing the
>> bmRequestType, bRequest, wValue and wIndex fields of a setup packet.
>
> Why not keep the names as close as possible to the C calls?  You have
> switched around the noun/verb use here.

Sorry, my bad, I will rename them in v2 to `control_message_send` and
`control_message_receive`. Thanks for pointing this out.

> thanks,
>
> greg k-h

Alexandru


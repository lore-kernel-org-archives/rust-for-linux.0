Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4085920E02C
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734007945; cv=none; b=rIMguaMID2/iDL1A0akhBmqbnjxlyKmYeCCPjG+PlsGYbVCJ7JhYQ6+kXnM41UVxmQx99ES9SPzV6cImwVHs0RqzV0INSk3Zl9v2ndmx6azmWpmTNcDAu9TDZKzq+V2p8jNx5Hv1Iedr8sN3ijcgSEXX4eiJukRaUEHVPYzs3Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734007945; c=relaxed/simple;
	bh=yO8+vjxRHNbXu5VtK6DdP3cfRRnmZLWmqBMtLh3BuFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHD0Z3CPIJwOWL5UoaIiD9CaQYmylyFFm1JF2UkBHi8vLsCaIiOQMSpUZT9Qk9jF/jpJUx/8ZFnrmqzQm2JEV6LooCcXCVa3GrsUmqYF9z1rOPhv813fXKuTy59pvliRc1bVfw4YDyuEByq6CKyM0Xj86kNDULxbPFRmee9nOLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h5qVsF9A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h5qVsF9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734007943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2U8bkLyFY0VG17PM3STLGJocxPEcgK3UJa/VywLtKw=;
	b=h5qVsF9A9HN16qEzktoy784tBYVLhgMxNEnnPqy+EmvTfTjIcIztuN5Hq+X/eY4CwXdFcS
	WUNa6m7Di6vpcylYJ1rLVnyzvJpHpjfrnkFdpkgUgUu6jX5VXmMmknGOJThq4yiVpELrZO
	2P8RUymT0omoDjg3VZS4ClOfaVYPKV8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-jE-U3z6hP7ywJAgg4uqxTQ-1; Thu, 12 Dec 2024 07:52:21 -0500
X-MC-Unique: jE-U3z6hP7ywJAgg4uqxTQ-1
X-Mimecast-MFC-AGG-ID: jE-U3z6hP7ywJAgg4uqxTQ
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-466c88a95e5so11370541cf.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Dec 2024 04:52:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007941; x=1734612741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m2U8bkLyFY0VG17PM3STLGJocxPEcgK3UJa/VywLtKw=;
        b=pnWgjmIBBUHHreUo77uAOzk+2LPdCyh70oXeuBEPhTeVL16xW86XOy3Y5oW64iNPyz
         cfIJ4fw9wCBloY7PDM230sRmcgH2SQnb8+MICTsyGuHMMTmQUO8xZDGgIHxDblAJgtbY
         x7MqQjPANzYLU3oMYPG5P+v02JErLE8eJmoKXPC0ObRXr92OofM9pWSAtsWXtKnkPiwz
         /nTFZFgu6+GuKy0yE4+LP3k9gFA6pTQQx18R96YZvZM8LDZB66q/f1LJDBQtRZNrulfT
         Z3OH3BGsWqq4tqoWG3zsA/uPLvCVAqVl3Aq1TytiYFA5FjmHXvTHmmLY53BvI/AP+1SM
         C3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUSfapW5Pi41XOIAU8O7UQwOLAqHT/OyJlD8g9n9EnZZjibgL+1RkjcIuXyXd42ajiPVPzQgYDNSW6r/LyMIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWPoG3caHvyvQ1IU/L0Gx/+4ej3vIXEUaJcdFB/lAexxdDhnMi
	2xXXDvEwrho4oa2zXY0aCo5S/HKxycBuBVsaS02IM7lWlO8/ZspCixyuZBHOVXAaUyrlEBW4k0W
	sB6HFJAlw0kN4j7MZOK+IJnS2WbJ1swNfAd/mPoyGl2OMe9oj6k1SVWwYpISXSEkC
X-Gm-Gg: ASbGncvTZMTDw9HUTY+Oxma5qAUqUYl27HpppWNq9XU6IegC2iw/B56AMvLaQ3/7WNT
	atMngzurd1m2ca+YgarWwmztGAyfFrihgIDMh4Rh4PDxDkAM+9MLCBcmefjpKdvEEoEOxlQqF8o
	dc7TtFP59D6UuNVnopBHcsc97g2bu91tcgDuJGA2RcZp1LZAJnK8OiNDwz976jfTuOS398OeJ2a
	H0fskjv9htmTyTQk1/ubvOTbHZ+0xp19pME+/xnF/KKJwxdg1fd11Vym0aWLr3ZQjvt2aAqIk3j
	DD/trdA=
X-Received: by 2002:ac8:5d07:0:b0:467:6c95:19e5 with SMTP id d75a77b69052e-467a14ed4b2mr2348911cf.8.1734007941360;
        Thu, 12 Dec 2024 04:52:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGaDZSwGXxYjd1DIh1/Q3QGUjXWEtvxdUTyx/9cTGDp2oBjGeLbR9wGeehKN43AJ3psBykxkA==
X-Received: by 2002:ac8:5d07:0:b0:467:6c95:19e5 with SMTP id d75a77b69052e-467a14ed4b2mr2348641cf.8.1734007940999;
        Thu, 12 Dec 2024 04:52:20 -0800 (PST)
Received: from [192.168.88.24] (146-241-48-67.dyn.eolo.it. [146.241.48.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46783eb0d91sm25201731cf.63.2024.12.12.04.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 04:52:20 -0800 (PST)
Message-ID: <24cea251-333a-49d3-b0ad-ad19ff5336a0@redhat.com>
Date: Thu, 12 Dec 2024 13:52:17 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1] rust: net::phy fix module autoloading
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, tmgross@umich.edu, aliceryhl@google.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com
References: <20241211000616.232482-1-fujita.tomonori@gmail.com>
 <8d00ebff-5f5e-4b00-865c-aa7e48395d08@redhat.com>
 <20241212.214723.846689767325390398.fujita.tomonori@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241212.214723.846689767325390398.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xWM8xwuFKVcx_PEwb-t9Agf1IWRtukea_hNB2m4-7KY_1734007941
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/24 13:47, FUJITA Tomonori wrote:
> On Thu, 12 Dec 2024 12:42:51 +0100 Paolo Abeni <pabeni@redhat.com> wrote:
>> Side note: the netdev CI is lamenting a linking issue on top of this
>> patch, but I could not reproduce the issue locally.
> 
> Hmm, I don't think this causes a compile error because it just changes
> the variable name. I confirmed that this works on hardware.
> 
> I don't know what the error message means but it might be an
> environment issue?

I believe it's a netdev (nipa) build system issue.

Thanks,

Paolo


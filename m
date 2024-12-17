Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5221DE2B3
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 08:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734425660; cv=none; b=ShvPMr+AM6QvoBJpFOZxcaagmzr+WX+5hfYdSO8wqWePHCRfBV7qqcwES1Dc1TNvT5uzPKl4nEgIcvjVFMxn6wblksTdAUH7L7RwF0Gaejwf+nXI/N3CvJjRfNYnzUCB8IfYewlBNVdk4zBUYLeetXP6qeVpM7BBSXuACpjtPZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734425660; c=relaxed/simple;
	bh=IYpN1VVYlyC9PW1SyeSCibiTSUuzeqESTC578tdX7/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5qWyfcgI1B1irGFP31WcFD7SZeyTe6hjuqqLD7Ope3W7fMkSIAyGn+QdCJF4b5RTHPywcBTYa9vC27jm+PcfJNPuafHGxPEdSWf7st9q9nSeKaEKqgC0MY98tbMY+DlmtVDj3a7Db7XVomZV+Phfc2aiAa8vxRoHH0fjHtAbE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LmFqT6bQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LmFqT6bQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734425657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SsYhJqBXdWYaV/I7Ym1gevj9lOrxHxPlvWSxmyMp0Zo=;
	b=LmFqT6bQKsKu8cNAHl/5yV4Ousyi8uminynnDcCagR5VXXvAPEONHyK/ggfIxPKIKXj8S6
	hJ9kmaEE1sQOY3CLm4FH0BhbIezPNKVgd8w4OFB+/ELiuDQLnfXkUKgAOwbOSvEusC1CO4
	ddk/IuXt0S2J4lvLLOkxwL1mOVpKIEs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-4ttt20LcMMWDcsDAaJQTtg-1; Tue, 17 Dec 2024 03:54:16 -0500
X-MC-Unique: 4ttt20LcMMWDcsDAaJQTtg-1
X-Mimecast-MFC-AGG-ID: 4ttt20LcMMWDcsDAaJQTtg
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d899291908so8644446d6.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 00:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425656; x=1735030456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsYhJqBXdWYaV/I7Ym1gevj9lOrxHxPlvWSxmyMp0Zo=;
        b=VTh0kZiSp6ISFLi5XaVTXne0/oHPpHByfOotxXMAxlbvdB7b0SBdRHHxwPXkgmyJeM
         noNH5iN/Onj5ol6pr5yvB17PADg8uZxugN5qHp3G6JvIYYw96ggfBmxNuob2KsasAvnz
         m9WLP3vdHoHdn1czN/Yp+LgbnaXJvdeaGMAlpXQA/oCICQWdIdsU0HO3LYmC5gYeVkBD
         bTZcEKb15KOo5hp2lhktmTud1VufyhOKZAEp/KW0XcbQkHq0+lxmALXtkrLB6quWUkCs
         MKbD4nj/ITv2/jMMSZdxQ84fDqaWmy8Jj+mbjdsx8t3u1JkNbsz/E7uGhC+p6ltv0P3e
         edFg==
X-Forwarded-Encrypted: i=1; AJvYcCVBQXyZLLEOjbW0LsJNm5jjXrTIuYxoEMObI54ubxBtbA2sezQIeDjpXAm75GCZAD/qd5V7C88ZgmoFWtjc0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx58BZNlR3QTYe9PZXKzawnYKxi7Cr0yIG7fspG7bReEsOaptuU
	QRTUG7klbPuWYJ2wlYIl6Bx9Andyzs0ZgNB4Fh34Y8oSdn7ts1mKnhBiK0Z0czuoi7MjResawZx
	ay7UqcRp+Tpdf2YkCiONj6iuQem412F60tBpheOJZrrU1AG0RXbcN/+8lTWYi2kcq
X-Gm-Gg: ASbGncua9IzKTwg/I+OAh4Ujd13cMvv3tTIJlvhpjfhyXAWzyMUxIHqTr3icQdDiyg2
	WFU8E2vC0Q5BrSi81meP/hvMiKp5ECn2bmatv3B4k2b3zjdpebGhu+VtiJpQ9MW4O+aKZ3mA4CE
	FOXUA4SLoR5E3aXCHDQFAR0yJ0aAdKZDFz4RQejcI+q/1Tx5tnceqwFhFqc2QU0Qf3ByyMi2Okp
	HzGgRhvUzbP62yymPzECZ9svRfvdgrWBTE99ZCHG/hre7ind/qM8D3EoeXe6PxFc6N31jleleKF
	Fy217sSVYA==
X-Received: by 2002:a05:6214:1d28:b0:6d8:e0a0:a949 with SMTP id 6a1803df08f44-6dc96873172mr243412036d6.32.1734425656448;
        Tue, 17 Dec 2024 00:54:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcm8GyO90b1t5sO+KCBoWpLV+afNYkxyBXUbffk7IskhsQSen9pfMAJkBAXdbYUtYCj4WRZw==
X-Received: by 2002:a05:6214:1d28:b0:6d8:e0a0:a949 with SMTP id 6a1803df08f44-6dc96873172mr243411876d6.32.1734425656174;
        Tue, 17 Dec 2024 00:54:16 -0800 (PST)
Received: from [192.168.88.24] (146-241-69-227.dyn.eolo.it. [146.241.69.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd22f494sm36350226d6.18.2024.12.17.00.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 00:54:15 -0800 (PST)
Message-ID: <778db676-9719-4139-a9e3-8b64ffa87fd2@redhat.com>
Date: Tue, 17 Dec 2024 09:54:11 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] rust: net::phy fix module autoloading
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, kuba@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, hkallweit1@gmail.com, tmgross@umich.edu,
 aliceryhl@google.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, netdev@vger.kernel.org
References: <20241212130015.238863-1-fujita.tomonori@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241212130015.238863-1-fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I-fL9b_QF5YeaSK_tsDqS9aq_4fNNuWHKy0FPB_atTc_1734425656
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/24 14:00, FUJITA Tomonori wrote:
> The alias symbol name was renamed. Adjust module_phy_driver macro to
> create the proper symbol name to fix module autoloading.
> 
> Fixes: 054a9cd395a7 ("modpost: rename alias symbol for MODULE_DEVICE_TABLE()")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

You should have retained the acked-by tag that Miguel provided on V1. No
need to repost, just for future memory.

@Jakub: I still can't reproduce the nipa (rust) build failures locally.

/P


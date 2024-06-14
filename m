Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FE81922C2
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Jun 2024 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718359087; cv=none; b=Qrmmln7+X6DDB1ZPjIZfIk3Oi8ZopTRRS0QzyqCg3bixiUL5oRKVxF7zIOI04t6E/tmkBzbVXm6EKv54QB8H4vIjNpgQf0UVgKneB4JbUGYXBXnSIk70ful7ksM2zVbRm6uvme8Bm47d48Kj2/Dpexi9eX3TguBLXNg8P77St6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718359087; c=relaxed/simple;
	bh=PppIF2oxzLoMr5bhd36wr7h3NLYqoJ5XAUDcJvtC5DU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MjxRpEnZ6V6UjJdCIyBX1W+Gq1rKEWwfftKl6jExt4D411tjnyt2GboYKhDFaN/qKrXKK2jbPYPdf4AwFJwyP97ni58p/mtXoKNWhKBln/Ka80vETPLafiJJHPWaAA0kaM6z1qrOv734QNXf9+spn/fN+vPdJZbkrw+lmrs89eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfYasPZM; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfYasPZM"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2c2cb6750fcso338223a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jun 2024 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718359086; x=1718963886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKc/kM/hiKTHP/cdFaq30RsEqXjf0iQQycsBO/HV2Kw=;
        b=NfYasPZMUMW1RkNq4Z8CNu+ZNDEiS4Vsk4uIGZtlVC2q9yJ7NsJPKiNIW1CLYJJy30
         ErEnX3x/AKq6Vpu1c8VpOIdTtJ9X4sbv4ozkmwl3bFp4MsjW/DOF+C2cn9U86PuoEO8U
         pMLYcW0MYQ0KtI11kS9pPD3VEc9u5BHFXsXn34liTkK9lMlFjzYLBrKLvI9W+Nbce0iD
         OfcjNH7bruAjm7jHh0AobbcGI244OE9vQoozx35leRSX6yZH+wTQw73n3gP7+S1F9u9r
         JOfAcy3IMwV/QsUJG2y0T7Du01Idb24lki3D4Xj4IEM2Y3YlKX+VgqPt8uRmu7nGpjXI
         6qKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718359086; x=1718963886;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iKc/kM/hiKTHP/cdFaq30RsEqXjf0iQQycsBO/HV2Kw=;
        b=IH/J5o15YsQr23jOfumJYF1Z105+c1yCI37NkjOEgVqL1iUw8EP1oWvGD0dBixB/aK
         v4+524NZPNuNLNGG2JQ9WfFfa5qeaNjG7ZCwgdNjiL+N6FlEgG8+mGQGYMxuRphQTX8X
         kIDRWxz00awXa6h3artxtqQfkDR7l3WvNfUddDBLq1eQU//Zmf7IgVir4MuaCY8rQkNq
         0V1kFj4YJuEunzM2pmhYMKOQfbAG/i3y8JyE4FD2Lavi8yurwCJC+bai0UgGMWZtvhwR
         xbOlwqS4Qj1VkC0I/YDAm/IzoaG32IY1Ej3wdiyaMEg2Ku/gkzTeKP2pP/jo7zbDHYyL
         BEYg==
X-Forwarded-Encrypted: i=1; AJvYcCWAF8WU/Jr8TF68YON+7lPSSvrNThZoIdmM5OqWndL7leH8b31sSWRC53DeDhPEb3b8eBcDwxdEwfGWX5Lpaf9LoqmHhE5v4MqiF0MyO4Q=
X-Gm-Message-State: AOJu0Yx50H0FTtCh6kbweebh3HlXMw845eVTVt1I3JKAxaoHqZhxVrB6
	+PUXss8MKC6TU3ab9Bpo5ihIxt+9AKlN1RVyy8bXtrnFSXgNpzmzXrjnxvJT
X-Google-Smtp-Source: AGHT+IGhuNf9wcdDmq7YldpGzfZSty3Z4zF6vFFnltgFetdqy9Em0q7eCVbpjGBSU0iQsOn3Oy/Slg==
X-Received: by 2002:a05:6a21:6da3:b0:1af:d9a3:f3a3 with SMTP id adf61e73a8af0-1bae8253a95mr2388577637.4.1718359085751;
        Fri, 14 Jun 2024 02:58:05 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855efea73sm28320145ad.182.2024.06.14.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:58:05 -0700 (PDT)
Date: Fri, 14 Jun 2024 18:57:52 +0900 (JST)
Message-Id: <20240614.185752.1273244464018578044.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, andrew@lunn.ch
Subject: Re: [RFC PATCH v4 1/2] rust: net::phy unified read/write API for
 C22 and C45 registers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <77052e4e-c7d8-4e2c-8bb1-274c7cd3f555@proton.me>
References: <CALNs47vVU-rD99zrGPT2DG9BsAEwQdjVwaBfFx-268TbsEc3rg@mail.gmail.com>
	<20240614.083206.60448678473106718.fujita.tomonori@gmail.com>
	<77052e4e-c7d8-4e2c-8bb1-274c7cd3f555@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 14 Jun 2024 08:30:56 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

>>> It should probably also get Benno's review since he suggested the API.
>> 
>> Indeed. Benno, that patchset looks good?
> 
> I haven't had a lot of time recently, I can try to take a look today or
> the next few days.

Sorry, no need to rust.

> I am a bit confused though, why is this marked as RFC? The previous
> patches weren't RFCs.

Oops, my bad. Shouldn't have benn marked as RFC.

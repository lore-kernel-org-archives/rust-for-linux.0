Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213111853
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 08:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642740; cv=none; b=boXMtv2VLeJgmp/A3xqSr+R3+tv49EzKOoEaH9fhYL8GAvZLEihr9rVtN8yzoQo6YMKn/6AvDoxZMPiJGx2tshXjOF0/cmUAXxLdYp0AulZ4nDN8ge6pSZnpwJ+dvVExmKbIEQooHOui7LJEtd2QARNYC1VRb3Ute2Q35uJin74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642740; c=relaxed/simple;
	bh=Qs6Yrbo7/sOegCiHEm4WkS4yj5ksV9PEmyFu6BMMGeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGhib8JTPO3BcPbHb9QrfDdNmWJtalrOcva02QWEAIJ+Sy2hrxy3lkbJ+uFf8O1pJtDmoZcjB6db83Zt9L0H5AbfCVs8CaTsCPKbfVVukUB2mTDkJArIN6NlO4w2C2RbAHVoNx7UoFH7i8PzuEohHOJlQzkEtuVwIQFi/6CLqIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lW8cS1Tu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lW8cS1Tu"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55b9a3e69d3so1752706e87.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 01:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642736; x=1755247536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HmA5+6XIRdwaBO7ANrwg4D8NeerfTjTtRKeIO4Topo8=;
        b=lW8cS1TuizGItmCdZqDsgTijxsABmnuky1O23D5OThvMoznx/WRUi9wNjTGd1v7iEn
         EosHdT8XvBnULkPHKJG2J4TabeBxcefhAS+WT8wU9Zvfwa1Ze2dO1pLnbTfQNNxA2JH2
         AHFwQ3nz82UQX/luORD5gvtwYvWQwji8GdDcrQadpclo3xNpKGb4IZcUwPujGtHYhmEA
         zLJMI6gVAKgnfSZRmHhL/WHKJp5oP6b/i8K2UjHVv5lkJej7XHltZQgUecXePATEuldc
         APFOq83f4Gdr3JsIGmxeppJy9aoi5Dpp534wBNjhX84O+hOD5f57dbNFCDzivA0+nzdz
         GSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642736; x=1755247536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HmA5+6XIRdwaBO7ANrwg4D8NeerfTjTtRKeIO4Topo8=;
        b=YFEMFMcj6Ibxv+UjucFUoYibz5nxdelbkmOdS4qzYAznCGkdfk5e8GNto5MMzLciS+
         Y5jBZquyGzewzoJK7JTEa1VWC9V2gJZWEgGAelOlFThx4jUn3wEXNC//AhXcD+AwkL1F
         V3GrHN2zC93wI+PfrZhjvXeIB1SjtM7l71zCXh9MkDxYzd5XD1+YDLIQSVgoPw2R2e58
         Q809o2iEcJ8K7/4xTLBZC9Pswu38vW3V92CkWf/DhLDHPJy530cjzoCZHzN88/pdJe3U
         Mkmhgk6MuECF7WIYmeYPduM1Nho13NAT0Ld0Ac5QAj6wfjTaIplxVOViNlucVOzpC2Wy
         Dy+Q==
X-Gm-Message-State: AOJu0YxUOxJ+NTu8XxNCF4/nx+3gV3l/KAqCZJKZqjj1TOtFFI4GtfWF
	Q43apNzoHP6iY7hDsaszMahUXqP+ua7EwICcV9ERVQ3b6dzojYhA6C37
X-Gm-Gg: ASbGnctZH3mqyfA8tert8GAmWbvAL5LW2UzqqApm6Wr0dtwt+zGypDpnTSwh4ojHW1H
	SwBr4SvrENUD2bA2/BLPu9HuOJheCN6kWofCvK2IcqeGBTNnnHwtZ7ooWE2JSefBk7wZrmuUSp0
	e5zn5SY9FIwRMtD/Sg/L6gYCL1SH1hOx5dcGsHseKgJCluu2slplWow3V8V0NJs/dhbfsQ9Nzlv
	MG91PXeJqoTZPfJTq0DaUBEF8c2m0D8k/twk1x/6HU25MSlYHh6U/pqvVQOqu2aEZmZqyzvahg5
	NsvWA2v+skSEoJBDiyKFvWUN5B57INt4j6NaloQwBzfcOxQhmpCSfPYVH4RGDKN2LDJXgm/WGOM
	lKKKiw2HX8NoazNpU9YQizjuDNBr6vX/208k66I5a5FpLJ/ULgJ+N8gw7njysgTyW1tpW/1hLX9
	8=
X-Google-Smtp-Source: AGHT+IFV8AtUkS7GBHERxsC9I+LAqnG9a7dr1OiiqYL/LOEOT/2kEPkqW5c6g5FaLkliiMwFRXksdg==
X-Received: by 2002:a05:6512:12ce:b0:553:a9af:9e43 with SMTP id 2adb3069b0e04-55cc013480amr433691e87.53.1754642735957;
        Fri, 08 Aug 2025 01:45:35 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cae34ca16sm908637e87.119.2025.08.08.01.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 01:45:35 -0700 (PDT)
Message-ID: <bd35325d-5613-4adf-b6d8-648ac0942648@gmail.com>
Date: Fri, 8 Aug 2025 11:45:35 +0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] rust: alloc: layout: implement ArrayLayout::size()
To: Danilo Krummrich <dakr@kernel.org>, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, Liam.Howlett@oracle.com, urezki@gmail.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org
References: <20250806205044.85085-1-dakr@kernel.org>
 <20250806205044.85085-5-dakr@kernel.org>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <20250806205044.85085-5-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/08/2025 23:50, Danilo Krummrich wrote:
> Provide a convenience method for ArrayLayout to calculate the size of
> the ArrayLayout in bytes.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
Reviewed-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>

Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210272E285E
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 05:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755841958; cv=none; b=hQK26CedzNnDgj76lezbjY/jyOWNHULFZMXaSpmbxpW/H1a+J7GZ8GDItEQhjn6F9w2eUBqL53Zkx54GzvNRZouhC+jEbea9Wbx5YFcb9OPFLXEGtx5vnAQfgKgJNSt8gl87gr2xPYdFDQqcTn+JTWDjed3ymUIvZr9+ZyQqv98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755841958; c=relaxed/simple;
	bh=7uX8JWTac+f6ksh/wu4QfEa5tteH904VkAXQGClcFe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1LIJ2jpKVu86O7cO/SWcbV3tx2JkR+ELZlQuCD3lNb8FStzaNz9rAEUO7pUD/bpenYWKhFv1ASXvIX1/u2mfZB7VqIcVwL+jexcXe0n2UeD974k9two8bh1MbJT1APCOQfxnzEWuDxegS4cZWv6tb6lP21lsdaa01QO81KaTs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCvJBf5H; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCvJBf5H"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e2ea79219so2145495b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Aug 2025 22:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755841956; x=1756446756; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YovWw4m77QAU1eZq6mNcpwZ3XWg61x3JgwqV7QjcnZU=;
        b=ZCvJBf5HSr33KUAxPzvWxalVdOcbjDmhI82eR08WZiDG8/Fd36sdv25cFcCu8lGJcT
         VLKkaCj/PPUX0nYm3uvzjT9LwouuUusb8R5QiEAHOREAww67piw1LPSGhCd7Ze5w662y
         gF3ZC57qBTQyVZWMn5GsOT84dbhwOQmRugboLw7xcHzQXESxhNEZYUeYEz3zEpyFz5LR
         1z892wHx3qTT0EUq6rGZFWPx8An20n3iSa/5R8svtl4++LWyK0bHvfOEXkQs52NMdWBz
         GxYV06tlhSrsU9veg/5bAJHpI1P6Mq3y5lQpXop7BAvE+d3HfX012Sgs2W+0sl65KcIq
         bvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755841956; x=1756446756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YovWw4m77QAU1eZq6mNcpwZ3XWg61x3JgwqV7QjcnZU=;
        b=EXZJ/7+Vul7dQMwYGIW/NJyO9cgZciWjRCQErcNsxmDfPKOURA3ry7L03z4RvlCc4Q
         cimK5x0+ZxrsMcJlalNGAMPBZxCHI7pt9o27drQyEwVQ56EUTAlqLD9bBeWQ+CaViCk3
         04CIMDaWCoSNOmlJE1skeg7af3vgo9N/qC9n7xRlic13xj5hg9SUqDj9OxNu4qc9qlmo
         PLJ0dqyC16isp4zPny1VRHG9mZWgZv1Wyvipf74zhb2wyfm9CySckC0XtCuImReUyGKS
         TFmhCq4ZlvOH3wRqFWtPTciC871gSQOAtgETf9LemynJa2C9GQ3Kj5gFv/AfZxEJc+ob
         f0Jw==
X-Gm-Message-State: AOJu0YwAwThaXVJzf1zIeQ2sjgggUk1kyzh39jk3e5dG9E3+t/gge5+C
	Jj0LWanq8RlEybb0uaPd6mpwfan6K27chQdvxaMwzd+chYGbjTYckqENK9i1gZfB+oRNMw4Ytyg
	NxOYH
X-Gm-Gg: ASbGncu+Oh7scYjj4pq/pmgqxxd2IK2sqs9DMnGbf0PEGmmWYoJZTM38qMWJoVihPI0
	sbcLheN0Yj2l8e4r/gj/gq3JMIqeeJvWXyC9t+x8XkEtnSFmXpP45C8g8gmn/se6yGRsot/sA1d
	Adm0pUq93A+Y/YaKrQRZTzwSUbK1zox+aiUnxFSjwnkY8K4JC88qbb9J2Q0x+Y/FXM7+tBED/iv
	nkKhbnCp1wc8Jtj5LGbRYnMGKgad8tgKNQXPu9K6RBXxsY3wL6lhUGpuzr/itlt8a76FLnCblV8
	IWKO7/jPRfuGaxEm5kFI9bONMTeCzfNCbafkxjeGwT5uMrhMH9QH92E9KcTDy7fiI+XrvEH1Gw3
	s5YFzIK6RHcMckmWj/cymAfBeUAAVEGNTiSg=
X-Google-Smtp-Source: AGHT+IERMmQ5QIMLdzGNTUZWTWABVarbRh+hsNdg9Eto0PuDHGxQR+AsczHzwOmYsK59MW3cwZ9ykw==
X-Received: by 2002:a05:6a21:3299:b0:232:fcfc:7209 with SMTP id adf61e73a8af0-24340e197afmr2543328637.35.1755841956381;
        Thu, 21 Aug 2025 22:52:36 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77037ae065dsm199357b3a.4.2025.08.21.22.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 22:52:35 -0700 (PDT)
Date: Fri, 22 Aug 2025 11:22:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, vireshk@kernel.org, nm@ti.com,
	sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: opp: use to_result for error handling
Message-ID: <20250822055233.otexzvta35jjnqrb@vireshk-i7>
References: <20250821091606.7470-1-work@onurozkan.dev>
 <20250821092137.wttiixhiidt27hnq@vireshk-i7>
 <20250822081343.4041a3d5@nimda.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822081343.4041a3d5@nimda.home>

On 22-08-25, 08:13, Onur Özkan wrote:
> `ret` is returned at the end unlike other `to_result` usages in other
> functions.

Ahh, I missed that to_result() doesn't return `ret` at all.

-- 
viresh

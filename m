Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBA91A76A3
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 12:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731329978; cv=none; b=KrGXbjrfOYUCG5rjVtjHjgZaYvUOvAN2cjnf1HiOBoILiFtfzN7QtKfV8BZay/alaCInXX1rs3NQ5+2YqIhMAXlJ/7uQ9yzMxL4h5jVpY1TZcz7u+YuXu5Dfy6ZRPlxXl0gxsKSfIZDoPjvJlSV7bUZtnmKSgdWj7x7AR1ZPN/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731329978; c=relaxed/simple;
	bh=XPC9cfPyCEmhoJN4f74/YU1GVIWkWhkKNwLppbyAU/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvCmls7SnYnwPTp3qyhnTT8Y9MkVPCIPsScFP6mVmkhzhcbhcBvrrHkwgvEhF0NPubNY8aZ2H0WFtOXGXybb3sz9l/C/FasltiAqCu7QUlcfcHYskwL83WVCaIA+u4pBwtVLeLOcOdthkOO/9stlcj6ooGMh5OH3CNIpO6IuMGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8PDYt4V; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8PDYt4V"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53a0c160b94so5339671e87.2
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 04:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731329974; x=1731934774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gf8vUH6dpomwIjUqimBF5PvyvGCn4zE/n9wxy4II+8c=;
        b=G8PDYt4VVa2eDta03+b1ogy2tu1J1RMJmunOtc4oVmchEqtfXmhyJ+cvvy3nn/mJZn
         y1xTqYr442u25fDNR0ejRnC5edAlGweHbaTPxcEcQIaJ/I6dsvTx9y4hsqzunSR38B4+
         drl/OOYsUE8e9nPFx6XcO7Kzu8vFyDqvjtxnrg5qIbTuvM4LXppD61pLHFj35Qf7LA+2
         gTRpOFDKlWzOiamFVXxDnwfdhLckHe7F5QBd3qp9npwVQZ9Jsa3BfwMPtHhGXK6hfcYh
         lAGYRaTIFin3Im7VFEw+T6IoaG1Kj7Ah5OXtPupokSNSWKhfJ3kuB5w1AB5LSFL5iTNn
         a+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731329974; x=1731934774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gf8vUH6dpomwIjUqimBF5PvyvGCn4zE/n9wxy4II+8c=;
        b=jbd4e8GDZ+Wimwf39Cx7F/CM3W73BNltyxacpdPbutcfmV2BwVrceM6WKUVaTQCyRa
         iBzBn44kW8ivbWyaxVsyX+txCmbVz0PdM8iO98jFVVQ9Fkc64ev2EorwGHwuRGkMApUG
         /Sh7fUIXQGPMauiyIdZI0WVB4ap2F6OEaeB0urn+zpMgd3A3kYsb/DiDpWCHXU8WahHY
         zC9ZMvBSFC6CKbGI/3zqpu/coaYeFnMBGL9RBYw/RJgDTvwI4iIgAH8U62zXEQEdEn5x
         cyWxJ/KYPtI6KDN0yd+RfG6skgL+RjvcWUEAH8VlVx4ReFdtsbjcvMTquu3KlGuSvqcK
         lHZA==
X-Gm-Message-State: AOJu0Yzl3a7vs6IeDXOd7UStiegl88THpOD8b2E62pfcipz67sosLQ/W
	nZvJV/5oDSmHBiO1ejzFfMmQDYf6+E4BI2/nyLMeINp/8M9aI4Lz
X-Google-Smtp-Source: AGHT+IFGlZTte2YhBvaQrtcbpC2w7LDDBBEtS4mg69Zrg4k+yjC707/voj95AGTF6RPTBH/c6Z4wNQ==
X-Received: by 2002:a05:6512:131f:b0:536:a583:2777 with SMTP id 2adb3069b0e04-53d862b3628mr5386410e87.9.1731329974067;
        Mon, 11 Nov 2024 04:59:34 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826786acsm1554975e87.30.2024.11.11.04.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 04:59:32 -0800 (PST)
Message-ID: <24dfb190-10eb-4c1e-96cc-3f9aa4089152@gmail.com>
Date: Mon, 11 Nov 2024 14:59:32 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] rust: add dma coherent allocator abstraction.
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, aliceryhl@google.com,
 daniel.almeida@collabora.com, dakr@redhat.com, airlied@redhat.com,
 miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com, a.hindborg@samsung.com
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
 <8jTLfoUiWkunCHYeNi0cgz1kZH1a8JrtKeW2Y9GRS1AgEZmt1dercUTHHJN54C0FPjtjUTyXpIjDFoF0hofx2A==@protonmail.internalid>
 <20241105104726.3111058-3-abdiel.janulgue@gmail.com>
 <87v7wurkuj.fsf@kernel.org>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <87v7wurkuj.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2024 14:55, Andreas Hindborg wrote:

> 
> I think someone suggested elsewhere to make the slice publicly
> available. Is there any reason not to make this and the `mut` version
> public?

Yes, this is in the pipeline.

Regards,
Abdiel

Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1B7101CA
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714567061; cv=none; b=SMlacFyhbRv/tlo2GvTqSkvn5rfN3+haMpEybWAMJhr2oQ630/6w7Gxk9NcDPSjAWPB7HCuBchR8R9/NXLDIHCHwXiWTCmXDfxii0SC9JCoJMM7Y00qWy6iHoBX7b3p0rkWPO/Gu3jaj05Jfb+KEh21JuNQSicDa4daRX9HUhmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714567061; c=relaxed/simple;
	bh=tZzwU12bmgBAILJvpQhFHyN2Wpfk1Krc/iVq7+k+I98=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UREATWgver+620bVt9sUfJrCD4rMDfu+KXohVcO7XjRUqZ/v/kAi9+99UrnYI3bw8xGpG15lsMJnozTFb5xklON51ghoBQiMz8m/oU5W/dvOz5Nh9CDDQ3uOjytmiRzDqWBYWafK6hAPTVAbt5GRIVstrbFZIh92fX1XJlVtUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuU7UoR8; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuU7UoR8"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f0556080a0so69105b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 05:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714567059; x=1715171859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGT5dwcLKbUhlBMKJ3JQJTahcaX7Lgs4j+maIgJnzWk=;
        b=TuU7UoR8mMbGtZG+8ko19fviWdt5hKOa6b1st6jlIVUPXN8A1liXdCTQxQlbnZCmYp
         j3O5q1zz5mvv1r9O4eH5bc37Y5j0a3XgX+D18zkE2nUenrfLULGeei8qZwkCCOsDH3gm
         6tuMNXcGOJtA+YquILIBvAqntQOp+fiS2UDm+Vu7WsOVBbL3B8HT0KLMniOrOF6+c6gm
         ADxYe/fHFxpNG8SnBsEz/T8DTVhsYOI6Xbqwi+PIoPWmR1J5X1x26nRjgTBN53sjrxr8
         NXjPa4d7/34bNGWIBjjA2ylpcOvEAG7uwYRNhPANWWITPvA3fHfPkMYcwX9X91+c7bIw
         53vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714567059; x=1715171859;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pGT5dwcLKbUhlBMKJ3JQJTahcaX7Lgs4j+maIgJnzWk=;
        b=X8XXV4cGG7Jjg8F93cJn26Na4mq7h1mM5x1phca03Rc/btCmOMEdrsYP9c4l+/9n6X
         2Er7sAkoFtMekLhIZdWOCv/MFQ/FQYXlPTCAdar8SlPdQD09LVpimpIgmIGLQ4cS1He2
         06gaBrk+jAEIsAeMF6fiOxhDF6icJ71FqgH3BHrTeUQW2u3GAn6wnQtTjHH+/EH7ZB+m
         gqRE6PGbfSebmWYGTxS+1Z4ABzGifxKLkbxy6ELYqWepCxKUzkJuxjFJmjw6mMzgrnB+
         2Yg23DvrUa3bX70ICcPWMxnobgEYIR8234jKD/JkkoskJtaPvofGcGWDGyz4/llDS6y4
         UxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhJ3nXmDuxCgEyIP0mC/dkVcbc3PCf4DqscD17GxSDIOO/wqu1Fn+65BuaaRcTRqckA78/rBAhO7nXrh52foPldZPTOM/VwlYQrHuEyiQ=
X-Gm-Message-State: AOJu0YyIqwPSZnCOEFBpap6zk6y+zVijO/BtbUYeBdr75nO7qsXPQWRh
	WIge1QEeUjpqJzZS5NOImZgIzTR3/FZgQ9Qrd/ynlr1cRPWT4nNJ
X-Google-Smtp-Source: AGHT+IHMjizN+OtB9Jx89Lzp3xfEETaonS/b7PybCWGSyNEMgrc8Vlni9+dDDANNm8LxV+p4tS+AwQ==
X-Received: by 2002:a05:6a00:4b51:b0:6f3:e9c0:a197 with SMTP id kr17-20020a056a004b5100b006f3e9c0a197mr2647021pfb.0.1714567058930;
        Wed, 01 May 2024 05:37:38 -0700 (PDT)
Received: from localhost (p4300206-ipxg22801hodogaya.kanagawa.ocn.ne.jp. [153.172.224.206])
        by smtp.gmail.com with ESMTPSA id g26-20020a63521a000000b005b458aa0541sm21988358pgb.15.2024.05.01.05.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:37:38 -0700 (PDT)
Date: Wed, 01 May 2024 21:37:35 +0900 (JST)
Message-Id: <20240501.213735.249541417796837964.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH v1] rust: add 'firmware' field support to module! macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <d6e2ea94-17a7-46c6-918e-e02ce3a0922e@proton.me>
References: <20240426095627.37333-1-fujita.tomonori@gmail.com>
	<d6e2ea94-17a7-46c6-918e-e02ce3a0922e@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 01 May 2024 09:06:18 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

>>  /// # Supported argument types
>>  ///   - `type`: type which implements the [`Module`] trait (required).
>>  ///   - `name`: byte array of the name of the kernel module (required).
>> @@ -74,6 +104,7 @@
>>  ///   - `description`: byte array of the description of the kernel module.
>>  ///   - `license`: byte array of the license of the kernel module (required).
>>  ///   - `alias`: byte array of alias name of the kernel module.
>> +///   - `firmware`: array of the file names of firmware required by the kernel module.
> 
> There is a patch [1] that updates this list. It will have a v2, with
> this list specifying the types that can be put there due to this [2]
> comment.
> 
> We should have the same kind of item for the `firmware` field here. I
> would suggest:
> 
>      ///   - `firmware`: array of ASCII string literals of the firmware files of the kernel module.
> 
> [1]: https://lore.kernel.org/rust-for-linux/20240419215015.157258-3-aswinunni01@gmail.com/
> [2]: https://lore.kernel.org/rust-for-linux/CANiq72=g4f60n8x=-fCxqQ4QzD2eOrEb=vEXgoNidY-N4omN1A@mail.gmail.com/

Thanks a lot!

I updated the comment as you suggested. I'll send v2 with your
Reviewed-by added shortly.

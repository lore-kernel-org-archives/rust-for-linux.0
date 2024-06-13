Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3663314BF91
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 23:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718321541; cv=none; b=EaEWK+6Gb/FusR458OzUc4gfY/2VY4lFnK1v2x07bSQOJ17SrcREK0c5PFe/cMehbhImeC8qHnAf9lhlBdgovn36//h3MWrOdPqm2jfCLBFi0whPXK5mgx8vpZOJxn1eMmFFL0DIg2i5JcmsTFdhoJ7LnoqKb7mTG3tg7JU81ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718321541; c=relaxed/simple;
	bh=GjP2uAN8jblETmJ3yuN6ZerylWMI7UjM9n8UqgoJgaY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=lheVmnMMjTr7T55aPiJpkwlEMKP2WIFhXIEHr+BYRnBhuAqvV0AF1N0qBSEdGmGmtKE4X0DYNToFSv6bQaq1ECGW+7/PIn5Ug09d3eJCgN1zMzHySsdn8zE46R5ESrHpu+bk6mWpmZOzdiOWyN6wiTxeK27CLFsR8Qfj36W8Nag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDChtSwH; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDChtSwH"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2c30a527479so253566a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 16:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718321539; x=1718926339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjhfXiwy4Yiot/ntBBLSLpKIhMpEVoDs7KpnGOYNAuU=;
        b=RDChtSwH5eDs1Oeg6fOq0tIwB6iruyxi/vhbxU2ymSCeZgfRrTRAyGCy128CXEC2JY
         TURO9bV8fgHNf8zFGVL9FVJA5aBlmhvEOk+/KQAQ624UvCzB8fbzSuzHqMH20p4J1qf2
         eA3Xba3e1v2C+vg/Jq3c79+h5cXQdMno1/6M316SKGhaM953ovqEDQQfYHP5lxE8uBRE
         hBdzXX5XpDmNRZ3ICG8+G2F4fapSdmbtftbUfBDkS2Sk6+DyBZkEdwqrfN1PYxuTZ8+u
         jsaA/+aGTHH4hWYlW2sk7dI8ZQicrCyt9dovoVVynOUXEI9VuVrtjGm2eG4mHAj3uziA
         QJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718321539; x=1718926339;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PjhfXiwy4Yiot/ntBBLSLpKIhMpEVoDs7KpnGOYNAuU=;
        b=DxQZyaMNQ1BnpfUMqK8jWaKd81ccZqlFyRUqDhQSPNiahLVt2iV/RMeHecnd9SkTQN
         fToiCsZ/iBk6Dm0aAKgu9TpU2KrqQAeQJMa0GjnHLYSVHTd1K3KpsYaI7zraJFR43mxa
         jrgGVIF2DpsJ7D7P1rH0VENjWj6vTM7s+Px9hinZVjGAr/v57//sVh9LpNnFBEWz9nSF
         LSuSk+WZHqdraQbhFhDLnxrxTjZQ7oUVNg25+Jmy02zu4MBDTf22mKAjqLmUCUa005x1
         qqLtDqXn8mlQZ4uxPCR1ETTBCwO3hcQlmP2nCADZscb8BIx7g1PYuC+CsPam66EtC/YL
         OE4A==
X-Forwarded-Encrypted: i=1; AJvYcCUKfla/qtgU/x3ZkBuDsbshagImZpZ+vOnuXBunCFhuRBPrBxIKN9Xqov/M6CVUMf3MMIo3xfBoWCHXTDR1iswf+CMYEN6tU8HE0LNx3fs=
X-Gm-Message-State: AOJu0Yzamgtb3qg73QhnZ5sg8b8lYJGsCBcUHYSx2H05DxF2iWm6JF3A
	GmmiBvScB3f10832FJXF1DOkSZBUovM+1ZaT5aftlL6eNv2T7zZ4
X-Google-Smtp-Source: AGHT+IFuLdhwE00/MoWYXEEdcfAyQ2z21n0FQ9ixdD+ltqkRUKJz8WuHhyEG/0CNvTsyJ8l+DyvpPQ==
X-Received: by 2002:a05:6a21:9988:b0:1b8:622a:cf74 with SMTP id adf61e73a8af0-1bae8414973mr1417014637.6.1718321539474;
        Thu, 13 Jun 2024 16:32:19 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee2d366e0sm1648563a12.75.2024.06.13.16.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 16:32:19 -0700 (PDT)
Date: Fri, 14 Jun 2024 08:32:06 +0900 (JST)
Message-Id: <20240614.083206.60448678473106718.fujita.tomonori@gmail.com>
To: tmgross@umich.edu, benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch
Subject: Re: [RFC PATCH v4 1/2] rust: net::phy unified read/write API for
 C22 and C45 registers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47vVU-rD99zrGPT2DG9BsAEwQdjVwaBfFx-268TbsEc3rg@mail.gmail.com>
References: <20240607052113.69026-1-fujita.tomonori@gmail.com>
	<20240607052113.69026-2-fujita.tomonori@gmail.com>
	<CALNs47vVU-rD99zrGPT2DG9BsAEwQdjVwaBfFx-268TbsEc3rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 13 Jun 2024 12:59:52 -0500
Trevor Gross <tmgross@umich.edu> wrote:

>> Add the unified read/write API for C22 and C45 registers. The
>> abstractions support access to only C22 registers now. Instead of
>> adding read/write_c45 methods specifically for C45, a new reg module
>> supports the unified API to access C22 and C45 registers with trait,
>> by calling an appropriate phylib functions.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> This new API looks good to me:
> 
> Reviewed-by: Trevor Gross <tmgross@umich.edu>

Thanks a lot!

> It should probably also get Benno's review since he suggested the API.

Indeed. Benno, that patchset looks good?

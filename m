Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3977882D8E
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Jun 2024 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717425607; cv=none; b=PNoLcOP0A4Nz6iY641kEciIXR5pDAVlX6w67nco/NGu1192Z6Owj2Y1ixv0tH+IBxBYtH6AafbCFxpf8IRGvs4scbBkE0bDWcc1LTe1ttuU538ROW03/srRegAieP/EGljdd7PrKYzBi+BPUzaEmOPgq45/gxaYX+qLvx7VW+M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717425607; c=relaxed/simple;
	bh=kqYLXcGYp/KWL+9IipKY5XtLfrF15qEgtLpY55wFdOU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hpVrc91rvPPuKK9w3aGFiHnovdjhXh1ydkBCDXIr37asXVf0pOD38Ie6/vLmKWtFQhqBrPWTTdBTCnO+lutvJ7BnQ74BAmEOq00QXOblQqPXhBXh7q4l1EzCRNW4li/SnKUF09944Lz+f7pwTGPib7WdaFfInzwy2VZD2OKReYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUAZzfxr; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUAZzfxr"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6c53be088b1so330158a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jun 2024 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717425605; x=1718030405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3oFvMzCnK+3aQlF/Ii7pir+WS7q7XHsEPXF/1mVHbA=;
        b=MUAZzfxrXHp3Qdy7J421KZR0BzEtiZyt/fCorl/IJLS0sZE2pWBj/eNBH94iWWsvBQ
         3vD879oEnPzxt1XGdmNiuSW2h5vEovyw0J/7YKYemgoITKTqMsu6FF0anCWv1XAHtm7A
         CYoClzqv1pbP/u2I29RzP0IgGinZP8v/w5JoEaEuDOulogGo/tfflGtLdWrRs62LbZTI
         Sg4LJ2C5tjmGNqa8nT6QTh/Gwv0R2GC3lc9n3oaTy0guedlF1ZPD2lcXhMDMDdVel257
         M47pY24f1aSWvXNRyHLTE7t8A8ecThST+uXgGHukDnqkLscyuQI12MHNDe238bGacJcQ
         ApsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717425605; x=1718030405;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v3oFvMzCnK+3aQlF/Ii7pir+WS7q7XHsEPXF/1mVHbA=;
        b=IOlHjYIvJhLSbpyVstAJ3Br7DLKuKZA9/Av0QE8/zfInD2asYE8rD77H9caZqWPJdG
         spqcLf90OzTvwBqIVfP4d+SyMGCnG67liCmvH3O+7NlkHRXWTGzH2Li0FLOpS7CV0gJv
         0Xejf4D64qgjIPVFcPd9M9fkQsi6pVhtC8cXGycj856ak9MnJ5DvJG5v6HB07S2rcgdp
         Y0tQCoxN83X6Zls9i2/wOdRm+x1X0zhRSyfTU7Myjr6v/ZbtI1c9k78gRNMKXucRKCHs
         EUMAKC/AnEzr6D0DgCxQzpsfoc5Dt+qT578aTmZw4oHJSc94wbN450BuoAXurlXZQwu+
         vb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQyyfydeft6SLKtdv3Kk2I0mfvf+5BDmz3DfD9LLyV/tEqpSg/Jx/ylkTUF1+ZROt68rDxOTKJ9YL3dA01KOGYwfeIPD2auA32JYGSCWg=
X-Gm-Message-State: AOJu0Yw2p89UlAfvuqxVe2Zm33QTyyv123GOG6Iamh2dkqsA8PZwe/Pe
	TIKjEN8k7NV5/R8v8cjYFWFcusRctvVB79wyQOGZL9lcha55/5zj
X-Google-Smtp-Source: AGHT+IG5UWVJZWMjD44APibRz5V6eaQFSrjiWUK1Vi6yxGNPT+17Q47QCNmeS1A8RLERyOVQ2D+32Q==
X-Received: by 2002:a17:902:e851:b0:1f4:b02d:bb61 with SMTP id d9443c01a7336-1f63705d4c5mr106937835ad.3.1717425605344;
        Mon, 03 Jun 2024 07:40:05 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632415731sm66900325ad.279.2024.06.03.07.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 07:40:05 -0700 (PDT)
Date: Mon, 03 Jun 2024 23:39:54 +0900 (JST)
Message-Id: <20240603.233954.1644803151268035787.fujita.tomonori@gmail.com>
To: andrew@lunn.ch
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 benno.lossin@proton.me, tmgross@umich.edu
Subject: Re: [PATCH v3 2/2] rust: net::phy unified genphy_read_status
 function for C22 and C45 registers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <b663e009-ca8d-4cb4-8a16-9e28177baa56@lunn.ch>
References: <20240602231749.57111-1-fujita.tomonori@gmail.com>
	<20240602231749.57111-3-fujita.tomonori@gmail.com>
	<b663e009-ca8d-4cb4-8a16-9e28177baa56@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 3 Jun 2024 16:09:44 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Mon, Jun 03, 2024 at 08:17:49AM +0900, FUJITA Tomonori wrote:
>> Add unified genphy_read_status function for C22 and C45
>> registers. Instead of having genphy_c22 and genphy_c45 methods, this
>> unifies genphy_read_status functions for C22 and C45.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/net/phy.rs     | 12 ++----------
>>  rust/kernel/net/phy/reg.rs | 27 +++++++++++++++++++++++++++
>>  2 files changed, 29 insertions(+), 10 deletions(-)
> 
> When this hits the netdev list, it needs a user. Having a user would
> probably help me understand how you actually use this. How do it

I suppose that this needs to be sent along with QT2025 PHY driver.

> control if it does a C22 or a C45 version?

Currently, a driver can execute C22 version like the following:

dev.genphy_read_status();

With this patch, a driver can execute C22 version like:

dev.genphy_read_status::<C22>();

And a driver can execute C45 version like:

dev.genphy_read_status::<C45>();

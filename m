Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1D112CD84
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 23:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705967991; cv=none; b=ME/ywGGe/UTmKNr1K3MSgWEVfo5T9W9cVth5lUstNdA7gFgqtzpnOrmYe1W2gWUHmEd6xBDWvW1A9dRBmrs5SosajywQFqA8v2EC99+AI+9bnFu2dfAnQtovV2M9PV8aT228JlA7KI1un8TUV6S79Z9WDRT01z+zVBNrJB9ISDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705967991; c=relaxed/simple;
	bh=1cpuXFapHllyU5JZGY5dSnZoVqrMowgjvxAj773vc1g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=KxZzwcYQnxmE8UcJtENhy8f3Ib2Nky7Lxsa7stlDbzWDoVj+D8RWVQuzo8KEzEl69PUAm2ZFt4KqHoYWRjLxk0X1+Ps1FtByA3FEqq66OPgU1sAXrVKl6TDLG3whvE/oJCBzq3Y2AFaEKHQEc7VPfR4m11gwceSU4I2ETiqfHfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=m5j53zVB; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="m5j53zVB"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5ff84214fc7so34606827b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 15:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705967988; x=1706572788; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1cpuXFapHllyU5JZGY5dSnZoVqrMowgjvxAj773vc1g=;
        b=m5j53zVBJ54WwgO8oRcaMUfffrnFU65XQKVBYajW8BVc9FSGK6ry5kCRW24RMSwP1A
         sUFCk+3gvWkMiyVwfQgAIqRjmA5jy8GC7aDK/s7lwPPjHryoK132ccD+ckJdovj4FsOB
         U+ioW4gurU3ILHcTG/R/2rGUDygxlx6+0i35x6gmKVbBcQqhjzT1HpgpMHYXicyVOjqe
         EtT2bTgwCEWaZyImx/DcD72KM8mbYv6FqZe9AYXALkn2LToGDRI5lsA6KClUsv7Kx64S
         756uZW+4L6bdPruaHbg1wDJVyUk6PLR30Ivhk1uLhwUw78hbbu7MIv9dFEVwhcMybFoF
         5Tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705967988; x=1706572788;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cpuXFapHllyU5JZGY5dSnZoVqrMowgjvxAj773vc1g=;
        b=cIstQJNERGKN46K1LBa8VOAhviPlD9GgWE9Ta9zTUys46CfdKIGNLJ16c5npSPOIbX
         Q736AMynSvFcozgpZ9UZeJNwQGx67zMEkjwkeSPG7hBkN3+orb0mkw4agnQGeho+AO9r
         gUdFaQklCQRztG9c6OPn08ppt8lWwqyqv0MT6N970ZdLyrHTVQ6h/IuZ4fYbfBFdFTKh
         dDTUbAdsOdCKUKGIQPSJze+DHURSPvGai8cwZPLRRY59i03gPljsoxsa5KtYsdNINb5W
         iHpkH1tDOLq5mjVUr7NLitH7/Zz146E5COy1ozIXh0Q9eLV7hKgusIJzKof85/nk4gtQ
         pVGg==
X-Gm-Message-State: AOJu0YxYK7nRt85mHh49m3XBZzN16XhMUxz+4lWKF32n56z/seGby2ys
	vTno19ty87NoVBpJgxBQXfcilL6uCYZavQ3+6OBWmeoTfASTA8Q8TuYXbrh6v8yXjYWK1zAz8UC
	jFXAMPKQfnqOH9jaiGvRc7ZiDwntMCacrWdaWpA==
X-Google-Smtp-Source: AGHT+IEXnljb49I9p7A6olKst+2c/syrXFQTkvCTns3I7EOUunt4MEECpj7JTo0++c2hnOxBxZ0ZT8+Rd+PN5RqIgZI=
X-Received: by 2002:a81:52c5:0:b0:5ff:55f6:7530 with SMTP id
 g188-20020a8152c5000000b005ff55f67530mr3744078ywb.12.1705967988107; Mon, 22
 Jan 2024 15:59:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 22 Jan 2024 18:59:37 -0500
Message-ID: <CALNs47v8x8RsV=EOKQnsL3RFycbY9asrq9bBV5z-sLjYYy+AVw@mail.gmail.com>
Subject: Suggestions for TC Rust Projects
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>
Content-Type: text/plain; charset="UTF-8"

Hi Jamal,

At a meeting you mentioned that TC might have some interest in a
Rust-written component, I assume probably a scheduler or BPF. Is there
anything specific you have in mind that would be useful?

We are getting more contributors interested in doing Rust work that
are looking for projects, so just collecting some ideas we can point
them at.

Thanks,
Trevor

Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D62C2D5408
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 21:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785534867; cv=none; b=tCEESEC+awNnWG5wSMoKvP55IodW+ip48Ky2QBmfr29Pd6f4RZ+RuF0Qr6zQ0qsmXkHDeVfJMg4aR/UWoaningvccahv0mBicsahJuP7xprsu8R6v9R85amew3LSyZ0ZfFmTTOAbeXS0yygKImBqk+VdsAx3AEZ6w0D49ccI7nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785534867; c=relaxed/simple;
	bh=XhqI10lmMrmTVFFq/vM3cEJDFuYn3VfaGb8/y6gRuag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUBoxsIwDTjvqf7pGA/YLVCDhceCWyPk2b4z5wgrC53v4X5F2EdYPl9ndgToNRZ+pKhA0itKKNOZvrvkzTekUYTgARehILbGMfQV9qOrPYATBLmi+OF3+vrCDLPh6L/85lk2xYzjm2oEqJ63/zr7kb0ume4pPiKjftXhUQUdU4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dz/2mLOS; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dz/2mLOS"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81e69a2db34so22012427b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 14:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785534865; x=1786139665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhqI10lmMrmTVFFq/vM3cEJDFuYn3VfaGb8/y6gRuag=;
        b=dz/2mLOS7Smla0J+GLjWDBIqVbTX6NiQfkEIgdimMTFCB+75zOeAMFGY86pM+vTrtH
         33EBo5MjdcOc3XWz5IwHGNWBlioX4q3ZehW6EqZKiG4lKvo0G6OkEbU4zXWxWETdG7gQ
         f9MOCSyKScjZ23jMV83/2o2tYIJhlEx1GKvcqwSJBefWXTKDrLUKvkSTUPuIYVH7bOjD
         T7GYHm7hr3r83kfJf9pJzTZdwkuKzmALBYQxYpnlzAOJr8+6yr1NYjdaGrEShbhVUyXX
         GmPXzHbm3uSBa5Dvnvclu/z3jSNy7YH9tcIQQNWQXTIs5DnP+wmLqKTwwc5qGMIuWl3v
         P3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534865; x=1786139665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhqI10lmMrmTVFFq/vM3cEJDFuYn3VfaGb8/y6gRuag=;
        b=AxzZdrRqMZG9JpIxm7/WZ7QSsD7wytt4OURYomtXil/GWoHqmelIt23qu4Uk0NDHBv
         QrXgLVtQIF4Z4tCjHzepOEwQj2CPf+XwR+FbM+i+EGvlcBz9tqn1FE6ByyOz/s+H8uku
         GsqWbSb4jxjVVLjYf4Mr4j3fljiq6gk8cHGM1oD80DIQoQ3tqj2GfTM6Zvp4yyEhIhkh
         Z+Dz+GRz9Bir4w+vwqlz/AQx+50qDIHFfydvrAx+WCfAtzPts9d0QbeyI35OyIAHAbBz
         IG00Wb3PJRWuQD9p2s8+tFNeC0ArBX+lvrF8silyyFJOmN+t+3vSRR0R/D4TWGUA7oi9
         5YSA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/3HepLeQHWnBvgRlOnGohZgQEC6akLWs5bpK9tbSRxk7AS+yqOkD/fRKoGj1pCKkLOHuZ2rT/n19zmg2VGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfsa1LIyo8YmELOo+1pD+ZG2rHaZwQWPprc58r1ytLVFKSbn5N
	PET0LaR56O5m8zOFM2a4eEKwU3uxs3pRQ7ZmRZkeheiDpH1ASzLScM/+
X-Gm-Gg: AR+sD13CMfjvr1yFWHN+faZGAF5J6KiR1Qpb0fO7Wysij6GfzV0hlISeMLFsO/cDVpn
	Di+RaYNilssXszzOIVGOcJ5qMU9Y+ZpVsD0y6QYVRei8xl6X1UkmZA84MSSv6n9iPyop92zeKJ6
	QUpLdb/tSclg6jk3ug0mVr795jkMZkYO21LhA8W0s4+dtX6/LD9ORkf9F7wajBC0cWJ/f0hl0Od
	nrStTYy1gQFgn0BkvOSO8HFQE0arbNV201K7drIC4Z+YR3Gf9Xj3e39UtKflCmL2kmctkgLLP0S
	GOA9+bafOY0YENn/OOgLLBa6aDaG0WHz6vPNtiQHF6bG6hJh20CqmE8hu3CQdOPpHfEkxPg4GMZ
	LxrBItP/vK/WDX6kwjuqXd+T8O/MbiUuYhBmRKn33p5BcQN+TFn0TQPLnGewnC2DOXLA2awADqS
	JRKUmHpP8Czsqxj0j63lJEUDnHTarNAbEyYCLe71JqPzWGvTq3hG2tLScEre0XgIoWrSctv2+IE
	7bPlAKwkB+8CGx6xRxXvj0pI27afLW2/MDf0X9vmfp/skPp0C9MGg==
X-Received: by 2002:a05:690c:d8f:b0:80d:a249:4854 with SMTP id 00721157ae682-81fd4b59a06mr19666227b3.17.1785534865000;
        Fri, 31 Jul 2026 14:54:25 -0700 (PDT)
Received: from pop-os.tail4f8d5c.ts.net ([2800:810:473:6eb:bc9d:6ed6:1f62:1459])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd164474sm15068817b3.48.2026.07.31.14.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 14:54:24 -0700 (PDT)
From: Juan Patricio Marchetto <juanpatriciomarchetto@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Juan Patricio Marchetto <juanpatriciomarchetto@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: rbtree: document peek_next() on the immutable cursor
Date: Fri, 31 Jul 2026 18:54:04 -0300
Message-ID: <20260731215406.2803541-1-juanpatriciomarchetto@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DKAZ8X2BO1AE.1NB7FZQ4W90B1@garyguo.net>
References: <20260729023420.1323906-1-juanpatriciomarchetto@gmail.com> <DKAZ8X2BO1AE.1NB7FZQ4W90B1@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Jul 29, 2026 at 11:19 AM +0100, Gary Guo wrote:
> I am failing to see why this should be a type documentation.

I followed the existing pattern in the file: the only worked example of
peeking lives on the CursorMut type documentation, and Cursor's example
is on the type as well. But this example is specific to peek_next(), so
the method documentation is the more discoverable home for it. Moved
onto Cursor::peek_next() in v3.

Thanks,
Juan Patricio Marchetto

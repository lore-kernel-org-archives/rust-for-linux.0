Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737892C3248
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 03:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748836269; cv=none; b=qmRgVZXgE0fB4xhDwPBCLqNBJt53TUCh5mKPSfmfKENyEgPayci4h18mM+NjlYQXEgyU3SYl4/jcha6hqvBzmCPeakpnZvtj3hDAngmEVlZjchkMKWT6PpLC/fTP2TqAucO33FJRqLso4K73irbWv5Kbo7HasQndffy4BJkSzkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748836269; c=relaxed/simple;
	bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=PKhx36m4d/z3XuzuSI8fPCsmiGR5kJ+R8y6VssDZMgtsoN1Z9e0k+01cEKRSOMIdUSuJvsOwOvEcOm+hAJyt0TD6Vcj+Hjgs8BA9uzbJ1Rd2bHKXK3bJZQXRVUB+O5uvqS0SLjFfyOT8P9VjWna7kML/ib2urRmrUro+4A65Jtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFBDGj/N; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFBDGj/N"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso319400a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Jun 2025 20:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748836264; x=1749441064; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=CFBDGj/N5UhcFn0psoHH+fcatJ5BpTFz+DIdW2MWkI7TirLgeHE57s2OmqzHXd4Vrz
         0C5u2B/h1yOBt1/Ly4HhAtRALB0a2hsnk6TALn7J4AKJWBX/gtHOZd4oqhfDveC5jrxu
         Y84yo03juRLKbcGO5zVG20OHFjMVRM+2LrF5HsZgBNWIb755IKTI/iBi2k2BDdFUxprx
         Gb0sybm64rwOV6Y6gs3flL6FNTC68srxmKk+8vj8GUGYE9ANhgIrpJ+IFAoRVUTT6Lvw
         UVULHg7++8F91Uwd6Bbf8P2vrn7n62VRgzCO40lB6DU6ary1vQNTotFV6D63vUbt4uIK
         lMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748836264; x=1749441064;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIkL3j1SUti+mxRknWXsGzjEHfZ++LfAOrCAj6OvBfk=;
        b=VtY8/VfuoiWCBKgzPEh9ycsrv2kDP8UlfdV+uNgGlJbtp1A0gelSZRPBxCr7SnNHQF
         iBieyfA4ICRmBjEiEQ8T1nVQsDjHDjulj8Om1wZoAm+HS8F1Nu5ZfbPy3eHBTkmd6TKx
         N/32a9U2CpnAzcKRck5Pkv7ofJTdwfk9PetTEf0LmvcpWQw4haxbPnwTkV+tS2A75Ury
         S8YxZQEUl7fIQ5gecTtSewfIlKBWr+ew+8UlKlcrYa+AdVImZXQoyRYI9BpBmxQH936p
         72hh1zke/fN0RyTcjxxBOHbxkqvaEb2OyjnM1yvR6WIglR+99+ggGxrb+qPPjnHLQ5HC
         YgnQ==
X-Gm-Message-State: AOJu0YyOTmEEA5Rwrpzut4uSGMYmtdrSRRhvS10o6WcZ+8M9H0pFInKv
	dCwpt0Lnn3bCPeUOeH+i/hF4DaFtW1/9keLNVEB9+wLr0SOGVdR7tkRe9iDKiKjTBIXvQw0ntgI
	HZFTr6PbwzB/1peQoNtZ6oba+DZ+3oSsRGNQ2
X-Gm-Gg: ASbGnctYm3ye3fc9QGleIzhTKhZGhqPysqMRNSY/uAS69vt7nw9gTEOQwLOdvzccp0n
	28NzxaL602eI7pk2bSTUldaLlGCOqFnNX3H8r1gKTDnufe3dhp2uAa2sHc0zbym9TS4K6DcmJaI
	7Zf/BHibnOWjucF0HkuXupY9+MyfYUP0g=
X-Google-Smtp-Source: AGHT+IFTMdESJg6P/NhVCAJcoTHV0sppNpCezaxx2pI9g02BZ6b7Btc0Q/oibHrN8ohWIIgjHkqNo//7rDsRoIIdrYw=
X-Received: by 2002:a17:907:1c92:b0:ad8:9b2c:ee21 with SMTP id
 a640c23a62f3a-adb322b344cmr944077966b.2.1748836263851; Sun, 01 Jun 2025
 20:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 2 Jun 2025 09:20:47 +0530
X-Gm-Features: AX0GCFtwD0FSskq_v1gBhihpOiqPBQwt6CeIW0PEXyZlHxyaqA9KiKV2g0Eiygg
Message-ID: <CANAwSgTEj44yYHUNiPvoh347KZzco6Zu-YqB=AGmsthqTcX-=Q@mail.gmail.com>
Subject: 
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

subscribe

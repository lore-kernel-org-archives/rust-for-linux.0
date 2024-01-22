Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB04F804
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 02:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705888891; cv=none; b=Y8AtOcSWsuWzUPANzPYon4YY1THjqpnUVER8mH1eD5eSRKRH0vaNm45/pBe3CIp5H+r4SKngPvihJY4pukl4dF63uA2/hMfpA8InPxzcQCE9x3C9eWKGWzU8aluSznjCb+0/atEjpg/UJahCI5H79zBXaivnA6GKu1E8rzEZKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705888891; c=relaxed/simple;
	bh=L9caFIzXJe4OPS9m+6Tq4DvJvoz40dOh/EoO/TJukio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CokRN28FykzN2Z4IBfvGd6V442HyYi8O5q7xQxHx1sceb/VK9BApAUBOlQMbnEawJeKRFvSz3QY4OQCF/GhzZflVNvYkfTmrIairiJUwOuisJA0LDmcXwufmMnqJCHcmAaMBth6n2aPyKkmRIrDhF3EyMuz7l5b6vBow/vd/ekY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PLZGdzDs; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PLZGdzDs"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-337cf4eabc9so2153462f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Jan 2024 18:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705888888; x=1706493688; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L9caFIzXJe4OPS9m+6Tq4DvJvoz40dOh/EoO/TJukio=;
        b=PLZGdzDsJLEoPXTsEh/ZNi7tguxJY0YUxwWVwJD2Y255zEYetQKUJ8d/obEw0D+hie
         xE+/3VjI1T05XEpQqRwXd4buCTv4SKwJilUGS9rTPo5mAhcCt438zEIxA+KG+VA55mT+
         PPGAW4CjLAZLRXkcZnaQAPK8tt3ENbJUDoDzv7MUMdDLRrOA4NUhwx41ETAvbJI/E3F+
         aOtgyaXUquGDOHC9rgnqnD/bj23yZea/0pwn46zDWcQL2e1wrHW0GRgukZgDOHhbM+eB
         I+TIyaJfgGfnSRE2815U4nGbQTdOLB88AzEHr59Jqb0G0vH3mE5TJTyyoIJ+Kw5IVkB0
         yvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705888888; x=1706493688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9caFIzXJe4OPS9m+6Tq4DvJvoz40dOh/EoO/TJukio=;
        b=M7vu1A7XrENDYbAhA24jcEQhA0I1/flXnt1C44fTqBVgdwzbLJQFpa3vYGxr3dTM0X
         oStSe+yA1pq5vpvIApzKQJ4h7XXC4eS3VvUABvoDL9koRJQDrSPJrrKwyPc9gE7qwk5q
         QJBYkdfyKl2U54GzR+gVTMVIBl6z3KS9e57d+QtIdsTUpTGHbUysT7A8TKZQPKh+uTgH
         j/cGVIAmn9x5mfwXahcZdsrf1/KGyyQ/9Bx0uoRsT4bNYDvWEdDC4y4NxK4bIuKyCh5m
         UerJ5quhHmROXrqh1t5f2LCfERz/xudvqgaaFaC1GjhjVmtnbQxIbrYFEegzQG2Eb5y0
         Q2nA==
X-Gm-Message-State: AOJu0YynHgp7n0dRHcxN/IU4yprICJ1gZ0MjnbYSWUmJ2Y/f2GePStkc
	T6DnTSPBN8nS4TeKHCGFkL0tEasOsd90mWk5snGtNNfaFP32EkzuluTiKdSPRR5msWvEYmk0mAv
	F/NurFYR7BQwjAH0al94QVaXo3BicwWozG+O77g==
X-Google-Smtp-Source: AGHT+IFwuhQV2c0RTlO72LiFp+hDx39yn5vNQXwz+dqwSldqI7KojkPgtdpF+J5XGfzMp0sDK4VjpZKIv7u46m0UG8k=
X-Received: by 2002:a5d:58e5:0:b0:337:bfaa:7963 with SMTP id
 f5-20020a5d58e5000000b00337bfaa7963mr1620860wrd.97.1705888888040; Sun, 21 Jan
 2024 18:01:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com> <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
In-Reply-To: <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
From: Fabien Parent <fabien.parent@linaro.org>
Date: Sun, 21 Jan 2024 18:01:07 -0800
Message-ID: <CAPFo5VL09++o_9rrD4jsddnp+D2c8q=UDippescLo0e+MUXnvA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"

I've been using this patch for quite some time, so:

Tested-by: Fabien Parent <fabien.parent@linaro.org>

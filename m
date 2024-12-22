Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E180B;
	Sun, 22 Dec 2024 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734878171; cv=none; b=Y/Is9l0N1Qd4nMdbiPcsR5Efj+LYIdAU6vX+NqZMG0b2MZ29safE94y8yjSXzlVA5aWJmP5YJTI//LvDykZ9pl8TGQcbIEbAc1GSxN41QMWB6uCkDFLg46EIb1ExrY73Ih30x2Gs0frcpVohbMQBvy0tF9/6JDEtd/7COTVCSt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734878171; c=relaxed/simple;
	bh=0L0s1+VZIFuSfZblNYWVXAWL4Atmv5byrLaC5wb+GoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZ+CnfvhEMSqM6/E0iWmzMowQhtJGEGRL2fs4/jpMPeX4aKRrMidmhxUDu6o8qRjsOChFf5H3D09yArxkejJuoFAAeOk3tvzRMjTM9ayjEvh0VEr1FMxOlwLMAZ43wrK72Md982SfSi3KJ3dAHIxJHlRPMDKZFTBAWFqReSNHoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIAB1V3j; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIAB1V3j"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f0054cb797so25845987b3.0;
        Sun, 22 Dec 2024 06:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734878169; x=1735482969; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0L0s1+VZIFuSfZblNYWVXAWL4Atmv5byrLaC5wb+GoY=;
        b=iIAB1V3j9M925qL/3VPu1j7fSsPyMzk3gxuKQXer1VJymu3Ln8vxO/lklU6oM6q3GL
         JsPQ2FVCVuBBhc4/qg8FVXVgrIQ/hYpcFmmKVqL3kfS9hKFRCXMUCeHPrIVCD5Re2u+K
         AMYrOUFQI+6xCSWmg7pzA0SOlpwjB4eiSn29VN8wet5LYlO2gPikoDExuNmMpSVME7o5
         vCVM72hIq4In7CxCffQINvsulFp6923Vva0Lcq4nz+6lKqBgd7LoIGmGWfZE314uyZJ/
         IQ9HdgllT98OrfgshzGs0LoTaBzNTjAwjMEZSVMEKbDL6GbLVavg81JtJwBo+QKhf6aE
         Ktsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734878169; x=1735482969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0L0s1+VZIFuSfZblNYWVXAWL4Atmv5byrLaC5wb+GoY=;
        b=qjLrS4TwbOekQj+SQGin5hdipqz7BYJDEL5l/64hxgzSdQat51M/1HFBvGxQOylL/2
         SXfaOh4pu6ROs7TSBW3+jwDNNZxtA4GZNDUCD8n08TZfVhqTTxRpIYun8W94Nvoj71yK
         ZzxTuUG5GvcuXsnZkpbJpESlH2JGNmx2TZh9UBmMlJL/OYiyMODpUXtgS5pb7XI/6wWC
         JjsVrdn3GC8m3CgcU7jMCqcKfJKOJF/oH52yoEX/SKdyJ1HPJYsL3LHowaaZb5gxZ8qs
         Y0IrJLGA1FrVGtT3+T81W7icWMorJ/UJ/liuFIVPpR8ty7TjkFnZ13YEk+t+iVK0Hyfn
         vBnQ==
X-Gm-Message-State: AOJu0YyRO0AGHyrH0ooj3ZgctznQzDGcgQbF0PVvkOtYvr+6xYmKFr8h
	0DhdD2qDr1CvduQlNhIvJo3avAc0HCvcKlO3DJBoJkeMXVfxct4qKiKw4BM74Vkl3tjUDydIjeq
	WMkrVprTfX4rEq9K/JBuKFNepNj3de3ETL2OVmA==
X-Gm-Gg: ASbGncsDK+XK5e7XLMvCcQMdPlqvAHxZcSlZ4dPmsGvdhAbIUEnOtMg7v62cjUMOPlJ
	hpsHkTRD+YcNu7UvWy6EnqhL9qOQuSKHIOazIe+0=
X-Google-Smtp-Source: AGHT+IECFe0PvtzFBSh/9/XbzW/hydN4KswXbpcnsqqQ/8n98NeoZHzJuLwGEjKQilAnxXJK0I/wkwybE4vIIT1l6+Q=
X-Received: by 2002:a05:690c:368f:b0:6ef:6ba2:e851 with SMTP id
 00721157ae682-6f3f812582dmr69194497b3.12.1734878169307; Sun, 22 Dec 2024
 06:36:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241222142025.104284-1-simeddon@gmail.com>
In-Reply-To: <20241222142025.104284-1-simeddon@gmail.com>
From: Siddharth <simeddon@gmail.com>
Date: Sun, 22 Dec 2024 20:05:33 +0530
Message-ID: <CAGd6pzNgWBDYQaz0j815_5i3=5_OyQaP2O9P+X3XQFy=ceYtjw@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] scripts/checkpatch.pl: check for non-permalinks
 to Zulip
To: rust-for-linux@vger.kernel.org, apw@canonical.com, joe@perches.com
Cc: linux-kernel@vger.kernel.org, ojeda@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"

Please disregard the previously resent v2 patch.
The v3 patch is the desired patch to be picked.
I sincerely apologize for any confusion this may have caused.

Sincerely,
BiscuitBobby

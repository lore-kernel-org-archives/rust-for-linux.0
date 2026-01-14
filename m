Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ED429A9FA
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 01:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768353915; cv=none; b=S9+rZxp3IVlyNHPiIz45AM+rSSIXI787UkC2WX83WN3szfqku/rOGXz4nNX9wQfftfLQnLM3figyaxYmnxxydlrAsqcI4t806b+IJX/IInAI4noXJ+LtpzctkkASbjXMnWdrad2BP+HpzM9XPZNXEwgMHSpYdJqXV4YZMzehrzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768353915; c=relaxed/simple;
	bh=tQOYAceq1jN6K8WHvhB95/29jogW18uvIgDUNueqvos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPIJwNzpBhWetrS2MymOnt7F9HYbmY00vTmyKiK8zVHM7pIhHodm2qXxdLJusdnglBUD1wv+P1HYsx+hCB/tpA1bzNVjeH99upeuvIK2dJ+pFrse/vOzGFQI6zt/2WttRBOXwMgOwCIALgElaER4z4i8bmMuH7W2HvPeY8QvA1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKqIH3KX; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKqIH3KX"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b04a410f42so7258029eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 17:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768353912; x=1768958712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQOYAceq1jN6K8WHvhB95/29jogW18uvIgDUNueqvos=;
        b=XKqIH3KXRr//toF6cENTM21dZLokTpdGNBGFsl9edQq4J7bY92wGtWWToGIZBlEqt1
         sNhpLvW8gxOeSxF1Lew0+25Ir9luMYRbt+nukmDKpf7z7nIj57DM0tVP+ILFRubL9XC7
         T6J9mmAVf+lCGGpMAH6Bn3rdaKauGpyKMkU9A122DeArO02pqRUWVpyKMImnO8QCgVun
         7+788P/moyKZ82yjPqQiuzpnU6zjsALg3rub1gSwn6Lvyv/9ABbNRzWtw8Kvq1V1S1D2
         AbrkQzX2Eun06+qm81EIt8g+UQFn15nTrnFAVz5GHjiuY2S0lety9qbxybfmX6ZdN5Zt
         RHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768353912; x=1768958712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tQOYAceq1jN6K8WHvhB95/29jogW18uvIgDUNueqvos=;
        b=wtjUvm3f5IfdQytwA6A0tLrRwMzn0fekNh0AlnxIKOifDO4Tg+pEaYTCqXSzSHas1D
         i+6CTVagECpj2UOM9gfuMmBAJjHH0tRTnabrbwaVIebUy9wuAT1Fwo/dzeWdCAzcpEby
         o6MZ5oib4LynZ6yBqgEuX/OoH3WF23iF55PMGKBBAzPOBTYQhqbYdCWmtzeHH8rSD7n5
         NesywKGXxLUbzWWPAZgO/m2m9nwZq8CeTo5zNe/AV3JBItymWpuTuemjyklJN3TyxkoO
         yNwaS23dqbuhnw2aYuOpR4rm/ClXkZEjQYz7YLyP+LA+m0tBf9Wh8S9kB8gMqihBy0uQ
         HMwg==
X-Forwarded-Encrypted: i=1; AJvYcCXPszcOKUVP4JdM7JjZHRJvqyKTK8NPmi7J510R6Bj2KzKc3T89LmyhTn1ppkKkCml1AvioYZsjanYozHlouw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxka5yrpJFM2MtYi/IQemmOZU0kIfBpGeI94XDqwY/mhAMLLRWb
	zGB8+87UEh87X1bvdtNcqOxrl9BWXvIXw0zuoLCu+VIExw1QCSoYKmHI
X-Gm-Gg: AY/fxX6m9rcKh2SZHp9BRQ/sEWuDdNq8vpvKsCkLsht9pMNwhHVhMw0JL4SDEZkVvzr
	etL9EuLWKeQRu3DSk3IYZg0VlFMbnkygQL7Y6qOt3s+bEwRs0bgYK0bFc2vKyL+2WSihkLAvuMA
	6Xxn5Espcua9IJU4DwtAs0egYZ+ljPn0ta33b2fe0zjkCsoR4mv8+41t5dclYFNwzbvbvNiZLMr
	qV39rb6r6UGqd/0TBlu8R7BP/mjoU4Z+abdTnEEKqRWPV/umZWQrfaW5BCR4GKeJh6JvP7ynyZX
	ARH3Gcw/866qFmjvbIxktiBvysY1CT5rXO/YKiVUQSU4fHpDpbs3jv7cLJCSASDQ2csW7JoBw0Y
	xsDzSTKjxG+iEYr9idfsrGi8EaXilFn3BjFL3YmY/q82Pn7WXYAKDBMKXJfMYRYul5/aMzEFtaW
	sI
X-Received: by 2002:a05:7300:3215:b0:2ae:5f34:e93f with SMTP id 5a478bee46e88-2b486cac6f6mr1300602eec.15.1768353912008;
        Tue, 13 Jan 2026 17:25:12 -0800 (PST)
Received: from localhost.localdomain ([2607:f130:0:11a::31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f24985d1sm28862935c88.16.2026.01.13.17.25.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Jan 2026 17:25:11 -0800 (PST)
From: wang lian <lianux.mm@gmail.com>
To: lorenzo.stoakes@oracle.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	clm@meta.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	wang lian <lianux.mm@gmail.com>
Subject: Re: [PATCH] rust: fix typo in bindings
Date: Wed, 14 Jan 2026 09:24:50 +0800
Message-ID: <20260114012450.77608-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


>
> Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") added a number of
> overrides to the rust bindings helper as the change performed in the commit
> caused the rust binder to not be able to automatically determine values of
> VMA flags.
>
> However a typo was introduced leaving VM_MAYSHARE to be incorrectly
> interpreted as VM_MAYEXEC in rust code. This patch fixes the typo.
>
> Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> Reported-by: Chris Mason <clm@meta.com>
> Closes: https://lore.kernel.org/all/20260113185142.254821-1-clm@meta.com/
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

LGTM.

Reviewed-by: wang lian <lianux.mm@gmail.com>

--
Best Regards,
wang lian

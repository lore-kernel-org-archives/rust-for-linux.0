Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E63B8BDF
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132350; cv=none; b=tsnBsssuOpBe3MTLZKD28OEr0A0vIdoAw3t1ejMZYQQmZI/bWfw6V6/jNkE7B9xTjoqNGGBKaos90h8Pvo1UEOPWkP6HfqRBRp2R7d/+ByetANJ+xXWDWEOladfKUF5F+TfMD3n2KKQ7ryHHtYJ00haKKIGhmmBMLVPrOiXVn+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132350; c=relaxed/simple;
	bh=js7pJ3zyvq0wYo3ghFenmDb/dmGT2LdJMG/C3DuFqtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qj9wcj/v/s58RPLdpzyPqYRyL2YcRzpmmttKty5AILRhDcuSP7O03ZoDw1nV5cgEIBbmVUfQjM6RYmhh0J9N+y4GH8JcHzzOSt3Yu8J2Hq+mPCcsagqX57KuAHBXQ+QlKFr+FZ/OkfTsKQQ9Ns4qr0/k0i5A90zd9pUC8brWzEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIpqYKAn; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIpqYKAn"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12339e2e2c1so522216c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 07:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770132348; x=1770737148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/1TEYjQ5DlogmePQfNapHq9kBJRIYslXLArK+roqh4=;
        b=gIpqYKAnGMfZYYlwTjeDshYR0qJ95F9niinvc6HA0GM6hhJsvyHvnAtoBx87n5PB/Q
         XsDzMI5moQf3IfIC4uHiWQ/RGoFK1oUTsDkdDXHfeYF2Hc8ROlIH508BISNLQS2YqvSt
         CPYXw4tiTvUpxaLI4AEOXDk8fylpc00tHGLmRxuY+2aBIKV/KSQuckvUG+MpY7mJhK/c
         tqO+J0Imrp2Eh4XZG8xg/HolBs+jwIWoYCvJEJhY84iFJETxn3SajM5W8j0TmZFxI/O7
         eiVXNKj1FK1Z7vjfV3Yvye4LdR6PhH5hNj+35gxYvURQQMfg9oIK1Wzlq3WzigcbKH70
         Iu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770132348; x=1770737148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/1TEYjQ5DlogmePQfNapHq9kBJRIYslXLArK+roqh4=;
        b=Uea1GSzNRNFp6kw5k0drEV5YNU+xc0x+oK5Mm3QlJa+r4mXgNwPBuGFMm+vBzB2bld
         GAlIHEpf3C4mZwALoWn9LJFijJwm9J5Gbs1ipjoSI3nf1RKmBrgq3GZ/9/VbjH2vu+Hh
         Yk2DIsZUPmTVd7CdC4jb7uNclL82p1DaBPbPVoy8oT3BJRiF+DIUBtwi97+r0iT8voJW
         /x+i1rvbz285EW5qjnoQxkalhXzK9koYfn84GX36qZrbUBRQhrbDa6cPQ+6ZeFQsDtxX
         4xBUwCL3CS+jLloHqPbtghRjZ5Gq8WGVzVqLyGZd6GEJKEmmH5qZ7Hs6nXqTsK70OpZO
         1hEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8xmSPdf9vqoP1NFeBET1/P16Yqw7v00kK2EPT+JmfBlSuEwP4p2as5lpRPmBqWHrTNfEVOS7LUlaxlParzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcBJnfHWQWbTD9M8koukdbB2LQ26H21Noy/UupNOFciez9+Em
	CnK/a+naL2G6S1EhfR0hKl45eHXJsW4R822CwQAV1gIveIuMDDMKiEXv
X-Gm-Gg: AZuq6aJ3qtcQBJJwo8zyNKtpMsFGNh0h57gHVQk1oHVhB1jDLy7u28kl++9ZU2/Gq9S
	+Lbkn1owYj7kbwjlnpsPKhl9qNI7BMWnH98BmL/EpaRBvwunKPT2M22DBSl8ODXIQkN3HbUS1l5
	TkSOXX6uMluv7tPvBZkpRgdvNqpeN4/QJlAKri/tK4cSjhmG/10eMlmwJVeERBpp//36jkVuUvp
	vmIHBBJ3d6UWQxdBMwVaxgsfdzJwJwu8+c425X+oJVwRj2o69a2iytcBr8Zxez+UcV/+EWaUO12
	zs3QL+M1tmB1/C/4GTkE4NWJhhcFaDbKH6TrJFyzTCaHY/2lnYrVov3X+iXPk/97YRxKqeY224P
	pHf0gka4mCZj9+QAg+N1Z+Pxunnm2to4hGxjy4RP67kNLMCb6S4EjjQjpq+pQSecxaSJ99zcp2I
	Bzouh/GvGe/CzkEX/Knpbsju3+/JAZC64pvtkiKHxatgjiYB4rlfjv+f3+AnweJQ==
X-Received: by 2002:a05:7022:692:b0:11b:b471:dc8d with SMTP id a92af1059eb24-126ea8d1689mr1394752c88.2.1770132347824;
        Tue, 03 Feb 2026 07:25:47 -0800 (PST)
Received: from fogserver.domain.local ([65.132.159.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8ac0sm22429148eec.35.2026.02.03.07.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 07:25:47 -0800 (PST)
From: Jkhall81 <jason.kei.hall@gmail.com>
To: dirk.behme@de.bosch.com
Cc: joe@perches.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] scripts: checkpatch: warn on Rust panicking methods
Date: Tue,  3 Feb 2026 08:25:41 -0700
Message-ID: <20260203152542.45017-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
References: <288d4aeb-af0d-4d50-bb0d-7a046abaaf10@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nice, emails sent from gmail get automatically rejected.

So, Dirk.  To satisfy your concerns the current 10ish line
code update is going to slowly, after many more emails
written in nano, mutate into a franken-regex-perl beast. 
checkpatch.pl is already huge.  I'm not a fan of this 
approach.

We could just not do this. Right now we are trying to
get a warning if someone uses rust code that can cause a
panic.  Software Engineers are smart people.  What if they
just don't use rust code that causes panics inside core
files.  Problem solved.



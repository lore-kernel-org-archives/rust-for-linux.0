Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7CD1A3029
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771159639; cv=pass; b=YKEoSQnxleqBJzAvFLEVUWjAeVkS1pFaN6qptpiYnHuT8HThfwQPMf09XwXokc08upmEvP7+2FsE+3OHD+ID/J53ir2lURBvvO8RYNRceiNrfvM6fl+R0qa2Sie6D0lQ70W59j8o84W8uT1nwR15eGG8qsGAuDvL/CoGuH1NaLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771159639; c=relaxed/simple;
	bh=B4uqGI0KWBIUJL6YDXBlbt8QMQCu/u6x+jYyWmIroY4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tPKdm0NpMN32OUaoMJXreuU/wevLnSx4XTzgd9+OcLHqDxDtCxtMS3oF79QKY+K6C9mqNg1AifPPHPRgjPfj6KjWWi51/HsADPKq630D+Gmp5VLcKs0gbIluPlZF4f7Y1GKvHAZGQIjwuEdWtDRr94gQ04aR+eQnNkMVw7K7o2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnnKzklw; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnnKzklw"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ba6737fafbso125022eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 04:47:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771159638; cv=none;
        d=google.com; s=arc-20240605;
        b=h2a1cBhWp1UFNz7VwS6fgCxSu5Bz5/y0VbZwAQBExXn9kRkCFIdwOUc3h0n+M5uvBs
         jQpY3+YFdCEf2VhF4j13GrSSDjd8Wgt9qkBHzOVDwKDwTpn2fCvvejXTSd9LpmqGMtJu
         87MVlMu+JdLhzb7zTZGcJD2U5Xr1QCD2hu9dit+LBB1HZJfskLkJBrUvss6H/4WMHWO1
         CQG/AEf+V+LPDBhvf8Wnx43KCB1I+Hk2r47Ao68rAO1lhbf5ifcKstReIuJ87e3HDQh/
         +D7NLs1ZYwWAb9SoZVKOUuM2tOHDhMDRq6GVoF68ipG+rw4Mshto5uzKtPqMyeRxxE+t
         x7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=555QthD3BOi0oKnL9Ait9gVqXQiUN7RsLDwjha1Lgzs=;
        fh=5PG/RyFDQq2diSfoW5l6v6fy72gNFMgZuflr5Yj+IPg=;
        b=BVXoT1DEyr1tR6TG2pIYhKrpzeXa8KvXAjM5X68uWIBr2baD7jR6hkjUrU5lY5+iwa
         WMci43fdiIM1jGaduv7d4qkGmxfj6hxEaGYL2qt3ApsI/Cr9b7tDsKvSWXdz3PyfKxnk
         zIgYGwaPtJfYpSHzAL8hIpCUYmyPPFkSj1UVg+RYsRAmS2zd192PHF/F2ZvKDwGxploa
         F03tS3hrWe1Bs966ZK8qTPxjDrQ3SoibXgBDzawCYo1cfQEORmEEvxpDmHO8mVX3G7B3
         pcl4qzDRSmNLKx/0cW/ZUMq+6Z9lYu3Vetk1FpRKsdBRWlxgCb5Mt2BgiU6wvuFC8DI+
         jKmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771159638; x=1771764438; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=555QthD3BOi0oKnL9Ait9gVqXQiUN7RsLDwjha1Lgzs=;
        b=KnnKzklw3u3iuFemhkJWujP7NVM/bP6c232xxqHXrJi6oMlcSw2sRaQiiZglOmgofz
         5CovYbrBC0WJa5THymEIdh7ZWuezAp5yogSwFsevtXIweCXOqra3vLkcps9MIv6juLjn
         DoK2if9hI1QyUYV/NG/QCtPLIiZ75igrvvBKk98DOUthFfn41OA5ItsIdTiPZK8Hiu+n
         BhXirWhrFNFEPbQ/lEatRlP/iPHqXgcYFOOIBMeT22NKcJigU/RaM8Wq3zz8joXK6A7E
         Jtb/3iDpKio+d7JINNCMnrYGLq0msP2v2jLQbeWplEP9yZICGUuvlbdrW4hzW3twGv08
         Wj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771159638; x=1771764438;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=555QthD3BOi0oKnL9Ait9gVqXQiUN7RsLDwjha1Lgzs=;
        b=pfVNqFWMfRRJlOc2hlZURcWN8isldYM9/eGPy7bjUlOhhBgGwEBW3oCJtqs8FR9BE3
         DcUxhse3xl6mPqhZKdjAzVg2T95UpHEUXLa4NykSIvbyjUbel3h6REfRWHG+9QIYBpWs
         s2Mgv2InzOwVuAoh2se/YBo7pm60yMkiql8pAA9wtPB+ebONw1z7ZMaed3swKv+0OYtw
         SU0svpSQA7C9a4ox3yz7KLNjBVDzBybwH2tMkMEpN4/fah0XA2kknFeD6ViL/mX3QKuU
         gvlwbwy+y0kOedUMs9TwPF5ySac/mp8KK/2QAzWHuyPYde5fnt3l3tNEG/rF1vkqfEfR
         Kz8A==
X-Forwarded-Encrypted: i=1; AJvYcCXbUM66sQIbop54jkQL2dPPvHUBiXfurE1VIrWUgBvbHdqfvs57fDRmb8DN4wJrCrNOSHnxHSl5OFxvYmicDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf5/0lgoqfwFaIJ3QNTPyafBwXU4perMen4zpAIw7x9Jw8ZWpu
	WlwRxmU6XsoOrkWbwQTekb/HTz5fw54sjCT/9XF30PJW8SbuK8jfTF5gmOaUgU4KBEielN1jzno
	EipZzg7OzWGADIcDYapAOr9lb+A3vMZXVUoA28fg=
X-Gm-Gg: AZuq6aKnEd7PDXF46gbGapg9HGhwY6hgb/ei2ONj+SlS/WWqbbGWzG9yMTuyCxYY/4d
	6IUPbLyo2Xpj9imo5w1vryItHjxARbAtgOwsiOjjxelal5g3W1jJJ7VfMzlxDeCcmGn6ZYNlAz0
	qfzJ++AIYIophwC38mTW2Oi+z1BbzH0CluX8xUD+iqLLDWzXOJTWchBvOUOfZA4FncXCifqpCdV
	SnwRcQudSC0UlzqJ/OwA2WHSWTJKxise9EfNshLKLPnLOCsU95IW7gDvpR9YvnsGKQp/o0KbP5b
	x6t/2OlaLQP7uZYv7PndX9QX1VfRGW8pvynOG1NfkKs3PgqJabknRkJ0tWlJ84wTu3UPV2DRT8z
	yfLq202eES+igWu7SlVtGokenGC5IIDMB8iU=
X-Received: by 2002:a05:693c:3747:b0:2b7:f145:a98 with SMTP id
 5a478bee46e88-2baba010c63mr1740180eec.2.1771159637646; Sun, 15 Feb 2026
 04:47:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 13:47:05 +0100
X-Gm-Features: AaiRm52xhFAYmyYTEXemxfhC4DHyUHZ4W6znoAlEOviZgMAfjb63hI2InUlCZ8g
Message-ID: <CANiq72khOYkt6t5zwMvSiyZvWWHMZuNCMERXu=7K=_5tT-8Pgg@mail.gmail.com>
Subject: Mainline UML Rust stable io.rs unused imports
To: David Gow <davidgow@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, driver-core@lists.linux.dev, 
	linux-um <linux-um@lists.infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

In mainline and next, for UML with Rust stable (but not with Rust
minimum), I am seeing:

      RUSTC L rust/kernel.o - due to target missing
    error: unused import: `define_read`
       --> rust/kernel/io.rs:229:16
        |
    229 | pub(crate) use define_read;
        |                ^^^^^^^^^^^
        |
        = note: `-D unused-imports` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(unused_imports)]`

    error: unused import: `define_write`
       --> rust/kernel/io.rs:262:16
        |
    262 | pub(crate) use define_write;
        |                ^^^^^^^^^^^

Cheers,
Miguel

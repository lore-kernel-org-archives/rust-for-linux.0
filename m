Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7DB2DB780
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774099901; cv=pass; b=JlwlT5eN1tBmwOpLUasr/2fEo8A5uERRuVFGVx247s0rMdemL5DsmxKuOrsokQVNDJPOrrbCkl/nrOhY3+PYLMjLQVbrbZURdtqP+bdJyK8gg/cc4YLCXhHGqp3fOTK5LVIkQC14y/iE+jwRay02z3uZ9/rxyJMvFEmMAUFXb2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774099901; c=relaxed/simple;
	bh=zxbnLCw30eynbwP9WleLr1s92QRQMkPjK9+3lgFFg8c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Jt1pu+YNkqjJEW2gyOUa9TwFQTTRRUhEhBSNeZBVu3xLHAur8A0B80yaggZQAURkj2y/5hdi7bNX3kk8G3OQRGOw45gUotQu9vSo84p3qWjJBv0A+5KCDw9lz6OhLBAC/OsmJ53YUooGZ+aE90r6OE1kjB/rjXAnlS0RmIlV9Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NoMyjo1p; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NoMyjo1p"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0f4a65bfaso65725eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 06:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774099900; cv=none;
        d=google.com; s=arc-20240605;
        b=RRUgh6Sub/LtUEHOlR5yvKn9XjQTfp5+HRc7XJ9KYJo26ZcvqPvcMt4d82U3RVmdXi
         AsKdJJ4uOl4smO29YMCmIFY8Zm7cu59wzB3cnlUSMxX4DlLGlZKR9GmJFSSwGPWWHDrD
         +G8rbYkv19ENK9nLHdTmOpSSWJlS/tawbubIjuLipGZchP961O/jxYeEv3JqEmq4TKNX
         gjjcd3UFkZBpNkuTk7drIXi6kAfTEL5GdR23+2CYRCGhd9dSNroLwXFYTrht/4IYWZZd
         Br/YyjXz57398pIL3ZrdOoIbMkPuThZpTKs6Wm6LY/TcEUIJeGcTh3LJmaYxenVG+Rtl
         wCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=AfEGYhhr45tsGwmf/AwlPFU31q+DnCaW552Ef/iQN/4=;
        fh=vIfMYaB4hUiqSi8Y/QXtUA+iyldoF7CoDVHVEeUM5j8=;
        b=At/0Q1VY13ETH8hF/LYfbxO3JoixdnBIn7298G4cBzU03ZPfhvA5uifM6gxTcgokHe
         qBlwPJzj3mZiLGe/bb/3wUE5I6zsi9aj0V6y+EWwyFRbXCoCzMmUevcWY+ZKheANihpr
         z1oZtah/MJGjx6K4Yu+SZ7e+OZa/6Dgdppba1193u0wmRwk60qZa7YMufN72yB6CSrkR
         5Q6DBpCa6O0nNtPMhH1na3Q9QtE8WUb8+f54Z4kkC39qMSvCXTscbTnsbVGlXrQjJe9S
         fX9BLP/A5ocAc+7N5CzT/0U7Birh4TdLjWd02ue7xi29BlhmTcPjF6jbKUXxHKCB1XwG
         WMlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774099900; x=1774704700; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AfEGYhhr45tsGwmf/AwlPFU31q+DnCaW552Ef/iQN/4=;
        b=NoMyjo1pnoxheBQmoO9pAugBubmxYH02L3Ox68FDKsZi3IcB6yzPZYK6t1Y6vOgr8/
         O5JQngRx7sTyjk/vxRzPc1zd3ikl995liZaQf0aT2Rqab+PjOVSZUzB1WG8F3vCNq6lo
         LLI1t5CCNoPqv2j11/WA5G/sXtpqYDDdbNC06speNrIFkQnyeLP6F0Vq8z2gj9UqlRYz
         eZ1pKNuVFHfdrlVZza3b+FLs8d1zHTnkIXXLpZU7PgCeXdHL0bArX01UXPaaLhdep06m
         90ClNueBa05dSdZA8rvIz5LNj3WZvNzMzE815Rxskk/VsO/V64zbFnCTFX/zXHQ4QG0o
         Svow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774099900; x=1774704700;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AfEGYhhr45tsGwmf/AwlPFU31q+DnCaW552Ef/iQN/4=;
        b=EGZmXFbISrQ5o5PiUOZOS8QnYzyYANLqU4yRU0o/s0jYIw/qIdUMWUvrR5jPX6jr5I
         t04CFNk4Aesd2nL/8DI3vhUQJxP/togmFftELNaATq/MhHL01MHcFH97Rmh/WXs2NeAL
         meQHe4S7EOTCormsrXakw9l75FFYPS5nKS/x7MdYOi9MrXp4kbwwMPJyEHuARQOKruxA
         vb/5vFwk22Ipn5fCqODIJv/BdMYI7oUVxrgSqhmjsNENI1h5LhENZ/QF795qX2jSw30A
         ktIcb0BqPs5xbnxRvc0fk/JjutksGqnAJwlJ/P29kDiTyilfNQjFM44xnDoEYsyUTXKX
         buNA==
X-Gm-Message-State: AOJu0Yyu+9Jv03EP92WR1IiloEmP4+Rbm+RZWQ5i7v8ukLyc+ZBQggew
	qUoGO7AHqq4bEu4AVL9IsLcH3OR9ens/jEJN+pyiF+oxkx9vejnNWTq4fWqqipPQb8wUXwsrEwF
	sBAbA9vdrV60aEKmZaaoLGANV8gysNVhw9vtdUZRvMA==
X-Gm-Gg: ATEYQzynehuGBuls4DxNz0/N+1GuwXq6t01k1U+1Yya024ekQ7+9TsGx2om+pD1MgcT
	GNAjIJ9TPIBhuMNuLhRTFhpLsKX94ux4AGxcjFZFuwBC93NCHarq3VcVIdsZ5afbK8C/TMzjAPn
	v3Rs1VKmtDWhCmNYLuMIRoK39NTJZOPQ2EhSAbkZ+nwzxjwakN7fm9k6mblELlKzAWVLEmvOUFJ
	ooi/A0MSZDZACQjfApaWVN8YDcXPv9SCRUX1Ym1n/juMzZr9+Ftur7XRd4R69tc70+WboAqnaQ7
	GQgGXQxs+FDQZ3DuHuxpeqQ5RwxYF6qrMIVDOVlSzktTbyhlxmtRmQO4PwGcSvHkEw4l93lDtfY
	/n6aznITvqUpVI6vPjx+N6mu1fQ1rno7Dgw==
X-Received: by 2002:a05:693c:2b06:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2c1096d8269mr1489450eec.3.1774099899566; Sat, 21 Mar 2026
 06:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Mar 2026 14:31:27 +0100
X-Gm-Features: AaiRm504I3IR9IxaCY7bMKLQTsNDrUI67z7AlnIANkCCi3tvXE0Nei-zJ6mVFdI
Message-ID: <CANiq72kw_dy=kQ_0dyOwM83z-kMTTmHjoJV+kV93Ks2L1Yo5kA@mail.gmail.com>
Subject: Sashiko for Rust for Linux
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, Tathagata Roy <tathagata.roy1278@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Sashiko (AI review) is now available for the rust-for-linux mailing list:

  https://sashiko.dev/#/?list=org.kernel.vger.rust-for-linux

It currently doesn't have custom Rust prompts, so it is likely we can
improve the reviews over time.

For instance, Gary is working on some prompts, I plan to add e.g. our
guidelines rules, we could also do things like add skills like a
Coccinelle for Rust one to pair it with the recently added Coccinelle
one (i.e. for C), and so on (Cc Tathagata).

Thanks to John for asking Roman about it, Gary who has been looking at
the existing reviews already for some days and, most importantly, to
Roman and Elkin for creating and maintaining Sashiko! :)

Cheers,
Miguel

Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F001586C8
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Apr 2025 20:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744059556; cv=none; b=TkA9wCiDr9w1NhibfOqT4nRO6ol81aGkPQakCOuFAgbGk7Gyq86rUBCTmfw5kw4rsrkm6rTgqQR2x+fSMmsjN9y5o03BTyRqJKm29Z9lOvdxAPE4jYhiFiuWImLXE0rf4uHQlp6LrusLZqiqLo4iymaZhAiI+NsIPs20THFbfHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744059556; c=relaxed/simple;
	bh=CMKlKRBykhV2Vsudd9XNnE+CafQlS8pwi2IwK0ZZcyw=;
	h=Message-ID:Date:From:To:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7xA+BPYCBw4WrS+WLutoiILYmxLx7F6HvtPcav7HVsjT2hmU04sCoJtYzgj3fOrsEhABxss1rYrEsOspE9VI6eqKWs3bb8yVBQkPfX7ky/IOmzYAjzKti1jMeriiJQMW2e9Sp++KZSuTCsHGUVVuHsRZYjGSWsZ9/wJSKQY0EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR3KiIoJ; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR3KiIoJ"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5568355ffso407863985a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Apr 2025 13:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744059553; x=1744664353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:feedback-id:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGPI4lvBCZPUlbAQ0SkwF6AEjWpXsqREJxoTby7jB74=;
        b=kR3KiIoJI5OZ0+kaY1i11FNZzc+NZHZXcOpE3pGYxnxRHqI7xdHye+0L/im6QBwtwO
         eDb1bHw07lxWue5YebME6Vpoa59cTFGnFVD/0tjMDWK/5OZYTB9oU9BJ/zgEzCDbOgDg
         eZDdeVrA2//1O8jtnyvGZza5G7ZhN9xp6LwNFFNkNEZsNlyfEqsSvhjwFIuLoAAMfOrW
         WohBbyhscZc96khG+jbqB6u6++xikokfzEah8tMCER1kPUu+GpCzHhZik5oi2vz1tm3g
         5JrrFXX4c/3rqSJoyI4gnCFbEsSxZQxM9FWefKKnd9K9teblrQPyeVOwWnlwmjsd5G2P
         EhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744059553; x=1744664353;
        h=in-reply-to:content-disposition:mime-version:references:subject:to
         :from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGPI4lvBCZPUlbAQ0SkwF6AEjWpXsqREJxoTby7jB74=;
        b=NNm9RloGdQaoBUm3jByLTTylatyZNaevKZ4X+E+lEL2ZGpBvYz6YIROFmoPYo6egZk
         1bV2yD4EESIxDQR3ZPiz/tntj4DP+K4MyZjD22wookgx/5wm1TcG89BuWc6FT8Tu3qkH
         QBgLqzbId7kN+88W4YirSia0kh9rCpTrXoQLXFnmitZGu2HQETmjnuiGJByLWb96yZr8
         AhsBypNEtFj2UtdeaSZ3SWxBUGm2/9HXTST0n6K+NN5HTYprRShsV9JXQbWPtdillixR
         aMvnF5gFn75zENKWExx5Y/tEClwyi7FGHExtKQj7rg3QtjzVXyP86HvguZNYgmiSw5t3
         L9iw==
X-Gm-Message-State: AOJu0Yw6F3N+MNUqds5Wk3FpJ/l+f5A8+gOWKPuwff62qJ+qAtLpyyV+
	r1J+ry73wFSsshh8SCVMuhj6I9drMnPblOW13YFn+v9XJvRkoI2meT3jSw==
X-Gm-Gg: ASbGncstqR0zY5Z+a55FwlyGtC4Tjr2HejFBFNWvDnrOHpTpzwPqidex8C5whbSeO5i
	ytUjphQEIKJVoa2VNvq5GnRn3JEpt+ShYcbJqMIQ53l0fxEFhG+HLr7keB9xOfIEMl0OkU9Yc8m
	BqnEglk0Rb5cNQJ/nZFwxgKROAQJQONTcyiWLOwWJfjzNDwo+BbkGwQA9dWeB6MWnngCaTyH7Iz
	PPGlU95wHt8mRCA3lhczx7UW05vjfdO9lQr6P5owJN516Xvb8G3kR2Cgjp7LqswIdpGWEOXJet1
	onRIyQiX1XXziVVvtN1CuLnIC7Y74E6HP6iCVvOFiL0kwafnRl4huLW7DvgGO8WEQYmE+h1ANy5
	K4NtqCNNztzEugFB9cESA5eN/OjKqsx+mm8w=
X-Google-Smtp-Source: AGHT+IGf3vj6gu8G7Ryrs1DLLAOdnLw8//jRJ5xB2Z+br9yeWpnJcYHqqtIZfYG6kqyKtKK+QUJEXg==
X-Received: by 2002:a05:620a:2913:b0:7c5:562d:cd02 with SMTP id af79cd13be357-7c774e17046mr2146547985a.41.1744059553450;
        Mon, 07 Apr 2025 13:59:13 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f14d4basm62823056d6.108.2025.04.07.13.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 13:59:12 -0700 (PDT)
Message-ID: <67f43ca0.0c0a0220.a75ba.35cb@mx.google.com>
X-Google-Original-Message-ID: <Z_Q8nWpogpeSzJ0v@winterfell.>
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6F1D6120006D;
	Mon,  7 Apr 2025 16:59:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 07 Apr 2025 16:59:12 -0400
X-ME-Sender: <xms:oDz0Z67VDD3p96YGfbH2hlK9yAFaFF-Q8t8vsGYbLlMOBktCXGNTCQ>
    <xme:oDz0Zz5rz668O9h5nM37YydTwFGyBenMeX3MJ26pnyi8SIJHTz5vLTU2SZ6MEjZ28
    65HL8933OX99J2uEg>
X-ME-Received: <xmr:oDz0Z5e1MmElJzgyCyMnwEAWsnLqzSvDpNUENc2C9lwlT0yc_vIgnHNCtPV-9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdduvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceo
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpefhte
    fftdelgffgheegfeffteeiuefhieejkeffgeevjeeffffhtddtkeeghedtheenucffohhm
    rghinhepghhoohhglhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghm
    vg
X-ME-Proxy: <xmx:oDz0Z3Jn1I_D0xoAwyzXvJ33zYMkDoWi2jhOWC0YNeFl9DEjSCskxA>
    <xmx:oDz0Z-I7vIcnIkyYkp9LmX_ONsioqWKN4dBzzK2JLrM3hjonT1afSw>
    <xmx:oDz0Z4wnMZrRjGFEwRPQSf9nK6DIDkdRmWlFjUb6cGQk_AXt3oAPCw>
    <xmx:oDz0ZyIwIyD-BwB0yrgXcusu4b5398NM8XJR5CECq8tAzj34p1z9pA>
    <xmx:oDz0Z1bXQjD45idRc9raLwUXigc1u-PUAmyEz4IDoAc8N9yo-F2xwL4s>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Apr 2025 16:59:11 -0400 (EDT)
Date: Mon, 7 Apr 2025 13:59:09 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Open Meeting at April 16
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
 <ZPyqLJ62B2GZg6BA@boqun-archlinux>
 <ZUk14802ZWGpR2iM@boqun-archlinux>
 <Za_9bJxeyW0pddKL@boqun-archlinux>
 <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
 <ZlX_KOjdd65k9Jkw@boqun-archlinux>
 <ZqpWRo2M2SaTWU76@Boquns-Mac-mini.home>
 <Z1ClkseCwaEXS6GE@boqun-archlinux>
 <Z6IvhjRFU9R32jHV@Mac.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6IvhjRFU9R32jHV@Mac.home>

Hi all,

The scheduled open meeting in this week has a conflict with Rust
Project/Rust for Linux sync meeting, so let's schedule it to the next
week. Please join us:

     https://meet.google.com/vii-meij-xpw

at next Wednesday (April 16, 2025) 18:00 UTC. See you guys there.

Regards,
Boqun


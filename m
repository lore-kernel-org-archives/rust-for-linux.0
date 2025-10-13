Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D251299949
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760374322; cv=none; b=qUHF3TEw2Za/k9msYh3gBqC18mLx4OzJVwUYNQO6LifHchwm6MsXoXxUsKCmxlc9lQMFmFF+nkL/e8wjeGN3Vs4+eYDe+GFP9sUvfO/R7EEIqzrLKNjr5UjT3AhkQhTj6MrIEl7RpG3P3GtsTeW2iFyv8iHa/vVwsVHwdDkbzTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760374322; c=relaxed/simple;
	bh=30sreQz6G6DfZJ5WOLIWvFnnyfh/rndubyHqDj2DbdE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i64f7ZzHE0rKZl4EYEUfB5XT8c0DfDZTwMXRsnYeOQRgpkjqDRxvNrP4FrFHpNAuncJd3Fm5/4BheMtcoTBIfVHSXjBYR5tdznMh3lyKFoqgCLtX56c7Fq49WUKMQCoPt6xnUYdaqv0FBOmUQXM4c1wsDTWOnrVLFxP1ksannCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZnqeGWe1; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnqeGWe1"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-856cbf74c4aso841108585a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760374320; x=1760979120; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVqiO8bJmyKRwpNi1+CsN+SwowAbNzLzKhKqUaZQaQ0=;
        b=ZnqeGWe1enS744VhX4SezoVz64xK4kVjzj9XT4072f1b98vPpZzABzGu3EU7Irjlcz
         5bA2k/wS8nNbqkUuzFrZOEOOwlNcVSwZ3vhpHQIYlovhfYmzBBp/czwl+7Zx9pT+e7KQ
         cOwhuJssd/iXgiDWI8jDRtKaPTet1NHDURafvf7IVrREMNUOzFC1gws8aKNT5YvUR9oD
         6gPxysYzpNMXSjTXVdIvTTTQHn9Y+HywwJdOHDgzMRMIL9Ug8ex4FAQBz5goRdF1zdoh
         Gy9oBKWrjB7/OMDIlkaeznRA7YqPgyy2UFDQ5tTA3sXXC9GVpAFlmXLH6xuuSol9HvII
         Ji6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760374320; x=1760979120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVqiO8bJmyKRwpNi1+CsN+SwowAbNzLzKhKqUaZQaQ0=;
        b=gjKXOENuLV8GAqhOPkmhmuWCHh5QAiQJHTesth4sPMq/ByWVPjs/zFxOVkI+ZKgV3v
         UIHc6/xlzY12ZIzgUXshKwt/B3gQmNwMzicdNYmjG/jIJg+FBK73n/x6YjombG65a3FB
         Zaz1b+NTz4cN5vIQJYfqrd9edQMw4vBNBpsi5pQ7+vfs0wL2JLo4FQ3D0Z1L/WoLgAwb
         MYBWguJyd0hmQ2OmyhMWnpuv+yocQGhpaE427vDO4TWlBICKWXr6T9n/nFe0nsytQruz
         r3h0cIxZoRHN865aS0NJ3iB86Qe0m793JdOvKXUudzsDCRv+9lVabRDKe7YNWd/zQRju
         z0cw==
X-Gm-Message-State: AOJu0YxCdaEqkGghSSX1t3kqVkwTWesSnoXH0XrjpQffXOlC8Y9qwS2T
	xrmNINl9PLLKEyA2zhX23DVJLnHfpD3f08dbxqhq0Tq3XKF5G6S8kWyYmvk5lQ==
X-Gm-Gg: ASbGncsjKsLXSxmXsKJo9fsI6ShGosln8fVFdM1PXWJJeCzyjZUvwYQ9R/+0jBxlkzo
	8CZTCkTYyOh09xlrCw8U6fBsJj3t+XM853nFeQ5gsgjohprp5JBql/Oj1YhgtO9SMC/a4h80buw
	nBNPE9yhtmgf8LjxaQEu2zHnfGa+J7WHee7cCjbRqmu4gXypvscJWg+CfaJXoT4QxF4JgyMcpAt
	78Ae7vrV2NyOiGYWWm4fD6h4d1FV5A/rg2KUxekecaVqhh+TTr04gnrfkscGRdKzjMiEqx/DR1a
	7KTrQdCGUYqgyKGJ+DVtMdKhoNT3xSmqwIvu2hmT4VMCKKiuoMlesok+jHl4SYOUKC9RH9PS4co
	UXSlGpaHjhq6efYdql8MtyT4Psw6rdm2nIQoelKmZgRCpy0dBt6Z5hken47BSjpQKsCtUb2h93s
	5OAGB3EBgog3of2O6t0fpICBTcsSJPsMHwrdDEdlfDryn5LdlO2hfi
X-Google-Smtp-Source: AGHT+IHznjBkMq8oqhOOAShlCFF3P0nvkg8QNBAkmxsRf3kc/ONsudnxbuDH8PHIIKsumalQf/JELg==
X-Received: by 2002:a05:620a:17ac:b0:85e:5022:33a2 with SMTP id af79cd13be357-88353c28688mr3502633685a.39.1760374319706;
        Mon, 13 Oct 2025 09:51:59 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a2272670sm1026751185a.42.2025.10.13.09.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 09:51:59 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id D8689F4006F;
	Mon, 13 Oct 2025 12:51:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 13 Oct 2025 12:51:58 -0400
X-ME-Sender: <xms:Li7taOqjku9ZQ2uiVdKom9d-ogYuBqOtFiiDKoZo3fJyx83IypKOkw>
    <xme:Li7taCqm_6BdBHjgtV9Fb2Ki-Q7-KQNO263tW2nL5BEvEOnImAQl_9NuqQCkzEHtg
    A2bkeK1_rbkiz7wSPlCumvVW1rt8luOnx7St7RxhESQXHH5Aw0J1Q>
X-ME-Received: <xmr:Li7taA1yJAsjty4T2FKT4zb8F4f9Rb1xpViITyFB4I28AH_g-BBpPrwDhCmv8UNgibq9R-wr7pGEHlhIT9_uMGv-bi3n1TRy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduudekudekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtredttd
    dtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgr
    ihhlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtefftdelgffgheegfeffteeiuefhie
    ejkeffgeevjeeffffhtddtkeeghedtheenucffohhmrghinhepghhoohhglhgvrdgtohhm
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:Li7taJCG0g5iqpBhoBjkXAJssf5jodZNWy4V-OiliGk5sjw185m7Kw>
    <xmx:Li7taAcpD0vZtRwRpZThq7F2N6Xu0s5h_Zu2DUWsrhbU6ra9P3Ex1w>
    <xmx:Li7taGitXBaiduEz-xQd1TVj1AUDzHBUQtqPM26rmeXJ0p6zk929UA>
    <xmx:Li7taAr4tbDXiteJMXk3-vBm7m74oOZwLZFsdNsHiNzcKyEJg1vWMw>
    <xmx:Li7taOGPXcHN1dvk1hSnv6cLiIgM7uatqdij0EafNhVlglHalKb3p8QV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Oct 2025 12:51:58 -0400 (EDT)
Date: Mon, 13 Oct 2025 09:51:56 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Open Meeting at Oct 15
Message-ID: <aO0uLL8dZF6MuRib@tardis.local>
References: <ZUk14802ZWGpR2iM@boqun-archlinux>
 <Za_9bJxeyW0pddKL@boqun-archlinux>
 <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
 <ZlX_KOjdd65k9Jkw@boqun-archlinux>
 <ZqpWRo2M2SaTWU76@Boquns-Mac-mini.home>
 <Z1ClkseCwaEXS6GE@boqun-archlinux>
 <Z6IvhjRFU9R32jHV@Mac.home>
 <67f43ca0.0c0a0220.a75ba.35cb@mx.google.com>
 <aEXLAPOV_FrH7Q5C@tardis.local>
 <aJtkNLp1pETbl9UI@Mac.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJtkNLp1pETbl9UI@Mac.home>

Hi all,

This is probably the last open meeting of this year because the next one
will likely be in Linux Plumbers/Christmas/New Year time. So feel free
to come to the open meeting at Wednesday (Oct 15, 2025) 18:00 UTC and
share what you have done and what you want to do in the next year in
Rust-for-Linux:

	https://meet.google.com/cik-xrih-wij

If you plan to present something cool, feel free to let us know
ahead of the time ;-)

Regards,
Boqun

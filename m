Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F173FC2
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Jun 2025 17:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749404424; cv=none; b=irj1c19QORT34AU8Fme14Y9bqTriZ+0Q8KfGDmnI1djZi6/V/azmvg4ZwYdBlmjcGIh7FuliXwVRPfs6kqkoLV/yqT2KLAO5su1qUFifIwTf6AwUPOSKLDpYo/iVxHNx+XUsgZ3ldJOtvpOePHj49ZrxMGH79c019KovP4xuMtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749404424; c=relaxed/simple;
	bh=oMumIAWvqFCTfMbfetAORGpnQGZd3T0K/Fd+HtidrxM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biPvtvendqrWfisKYD5tq50MWwCH9uGI9vzpaKDfnSkrHrf4AT89zUsAyAG1rvnLjd7wqaI1xNSXlfyYVAhCTvztBMLWe6MOO8s6rstAy83JC2PvR4v9CX1GVu1MOThSxjXw95OVx9Ecj2Fa/ppLsINqjkjwzISLfrj9sGIQCws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ng1ZzgqQ; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng1ZzgqQ"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7d38cfa9773so103749085a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Jun 2025 10:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749404422; x=1750009222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spK3Dw/CDHh1g8ikCokO6njmP9oEAxms+o5epaUzk8I=;
        b=Ng1ZzgqQyJ9NQ0X8JGUmGsTf8QJjOOkXNmNU+Gv3vGBsc1KoEHx3QNSJW+BQ9kfIA8
         B/PeoNczMrGX16vmig7Jes4LQ9OJc+oXl1Nm9gHTONEQoZbDzJAHqOkFJCdOivrFO8Ts
         iIaodYU/lgIlDGg1LqjGcYUCY0keKCrmKw//wS0zUcwgowvTX9cjwDnbrJJratOfuMiD
         gLyGRyMd2bkfm4YmBw0aZWFuqU5dtd+7iGXL9eo5wVjhAlpQ/wHpbRBNzKWGvVOJhXwp
         lB9U/PL6TJoZZSib6puSqbXsawmAXd063aUG9J28bQmboFqb8agSLg1e/1ZAZbaLIKsP
         ShBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749404422; x=1750009222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spK3Dw/CDHh1g8ikCokO6njmP9oEAxms+o5epaUzk8I=;
        b=Bu6EaMpGgbs/kU8jU5Rwh1LZUXwAZyEpd8XwFY8XHDHB1Of8x/2BbmjNolCPykHWOd
         u9HBKGF0YRlJlT3p+WMvZy5wD6I8Y0u/L/OvEMgs99DWCkMXBbdh9jBCYTS9eQepXofz
         piHHUQS001atCN69rfeogkbRASgkFh6od7hgRx+/IXJJDEzilkxVl3REWGianpQEt2UV
         OrjWzDrr0MC00hppqf+AmE2KUapTA6YtXJQNevxqEjSTEXn8PH082hudSSLkuCxy7Nez
         VYzVJ5kL4rL9Juz7KwAbLnBxokioSHlQOyoWVCjuSDV8YD39jvCn3o7y12b/dvZ71E3/
         eysg==
X-Gm-Message-State: AOJu0YyeHP3jrCGoTSClcQPoUwOylO06yiFTbR/3MR8i08a+Ur3PLMrU
	XFS7wkH+y8/7nJHxzO7ZWPSl8lBty8UHkY3OWPrsqvfcrv+S1lEYPX7CphUoTQ==
X-Gm-Gg: ASbGnctj6GHdFOMat1/kbTbl0MONVJErwNztBtgzmrefSjhkk91unGs+fRtpFT0aXyk
	ooP154kij2MLFFJEPhwUthv+9FgsnyPa0DjqV+GlWJFhqNovNyWxW8to9fl9lxnYc+8+0JTvEUz
	IQE1Ewc0H1zm+3U5l2eiXyniiO8fZjCnp9b5QyzEA7bMHDKTX9mLKTsBDeJulFEz1WABMTc9SCa
	rYNvKx6LugNyM+4GCNxNhnCXZ4c7+RaVFky+fMJXooDQ96FUh/XxKU1OAHEZPOrjWrevg0ZtV3Q
	Zt9SFuMRjbQikH/U+ZPZinsZ3S+S7RPQLLVgb/YY3/mXaOs2uM1l8iQs/feqzkIEFDpc5vTaaIo
	kjcawNABvgbvYeLoeFOnwW4/AtEV7DEpiQE/KvswUQw==
X-Google-Smtp-Source: AGHT+IHInq9OcVgndwsg8jG21SZB8mBvFFhuCuMPmpP6YEpv2lAhlbgRBNITPoVQvyI7K5fQX2Mlew==
X-Received: by 2002:a05:620a:25c7:b0:7cd:3b02:b6e4 with SMTP id af79cd13be357-7d229851a29mr1666832985a.1.1749404421782;
        Sun, 08 Jun 2025 10:40:21 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a61116bc94sm45663101cf.23.2025.06.08.10.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 10:40:21 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id E0CEC1200043;
	Sun,  8 Jun 2025 13:40:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 08 Jun 2025 13:40:20 -0400
X-ME-Sender: <xms:BMtFaKpeN0tsBA0EDdtNZF8RekvfdwVDfjMkhN5PJloT1Zyr1O3qMw>
    <xme:BMtFaIomTr6yAjFnxfHeoc2K7I6WtU3NFc0Qpyq115EY6iZ3kLbTmQZ8TVCOllPK_
    cn9PS6h6C-Mbw_Gxw>
X-ME-Received: <xmr:BMtFaPO8fmhwSMXNZLs6BgQTcgC03tY7EHdnFQFvrcWXmqGqhSMzRdKoFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdekudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuf
    fkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosgho
    qhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpefhveegtd
    ehuddtvdeiueeludeileekgeduheeihffhtdduudeiieeuueejvefgteenucffohhmrghi
    nhepghhoohhglhgvrdgtohhmpdhgihhthhhusgdrtghomhdpiigslhhotghkpghruhhsth
    drrhhsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    sghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtie
    egqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhi
    gihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:BMtFaJ4xoIp72TODajoitmHC5vWJrVHdmQ7CyYR37GKipnxnH5jYdQ>
    <xmx:BMtFaJ7YtPBbqcbxEwgVuFr5ncOz3KdcTPpqg3S-mlspAZO5B0w3SQ>
    <xmx:BMtFaJjLLC653H8nVibzb7z2jk7vW4FA0qalSZYyD30OELMQ54lVPA>
    <xmx:BMtFaD7RutpNwBvWsBQFztKPxPnJRG_Mdkrs5KmoVRmFKFJ3SsPa-w>
    <xmx:BMtFaEKYYasrtcINVq6Fpo67gn-VXAENAIzLGI8Ea_Y1UWFdbtdX7b4h>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jun 2025 13:40:19 -0400 (EDT)
Date: Sun, 8 Jun 2025 10:40:16 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Open Meeting at Jun 11
Message-ID: <aEXLAPOV_FrH7Q5C@tardis.local>
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
 <ZPyqLJ62B2GZg6BA@boqun-archlinux>
 <ZUk14802ZWGpR2iM@boqun-archlinux>
 <Za_9bJxeyW0pddKL@boqun-archlinux>
 <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
 <ZlX_KOjdd65k9Jkw@boqun-archlinux>
 <ZqpWRo2M2SaTWU76@Boquns-Mac-mini.home>
 <Z1ClkseCwaEXS6GE@boqun-archlinux>
 <Z6IvhjRFU9R32jHV@Mac.home>
 <67f43ca0.0c0a0220.a75ba.35cb@mx.google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f43ca0.0c0a0220.a75ba.35cb@mx.google.com>

Hi all,

As I learned my lesson last time, we are using a more reliable meeting
link for the upcoming open meeting:

	https://meet.google.com/cik-xrih-wij

Please join us at Wednesday (Jun 11, 2025) 18:00 UTC. This time, the
meeting will include a presentation from Vitaly Wool on the work of Rust
zblock implementation [1]. See you guys there!

[1]: https://github.com/vwool/linux-mm/blob/zblock_rust1/mm/zblock_rust.rs

Regards,
Boqun

Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9791159B48
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711391030; cv=none; b=cL2Gt6oJ7EmDcZYiofFYwo03BdOS8k+96dHne/oFRqdr6ogzZe5Oz91sEJm5bosNwOm1Rn0A3xxVIkNBnybMRjpILXNTmyJJVZkEAxgxOhnRMXp5r95U6HIoh077OdEM0+McUqdJniAAJXFwJF4/CG/dRbMhjDbmArkLTlL6acM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711391030; c=relaxed/simple;
	bh=EMxvAxCl6Urof7fQkiH/Il7RJ8MvUr55hQi1Rm2mJ+0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+cdIHsG9nglPGTkjz8059hQpwifCyIY4fO05WtQrAJEtG5J3L0XwIvf7FalFgmwryj+baDI1noRdWHa+fQQdEDKNjpvc5wFBoeOUTKEigycOpAUl3qFVYfQmR0uBzgIVE4Gt31EzFnmghQsoP+0r7E78w6HbJ1eEWw1vwXSrRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD+WDRbc; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KD+WDRbc"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-476e40657a0so858306137.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711391027; x=1711995827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fySwI4LpJR97VdT670Ch5Y32pVMVgX2pa7LibmxiZQ=;
        b=KD+WDRbcLN/brs3ZKBka3i1XB7u25syQoqQ+YG4zgqVmgnuGJlsxKg7hPz/+gZ5Vrv
         l0gyU5FtWZ5gpEQ4EKTFFlQgy+h/FlmQB6jgtvUX5apC+Rmsys70oq/A4mQeif3UGUaq
         iQllVsMD05vQsmUadLyQ5a+Sc7ljiuO8SHE8L72RuMlGpzqZBkMuWkj5tTMhXGe24P04
         wKKahWcUU3Q8REgTwxjfbfLhertGtkQj7nBagbSom+KAHzLuqsEkghGlHw7McZWgpTR+
         HZ3QUta0e7Osw9lxBhMWUHlPTXW29msGBfSQY9Mk3H4C9qFCrQUKzXqa8I47aPZ+Z6/a
         FUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711391027; x=1711995827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fySwI4LpJR97VdT670Ch5Y32pVMVgX2pa7LibmxiZQ=;
        b=HqhNXGfrjkBZXdOlrRV56aOYVOJuwRh5AU2sC6A3YAB0k2/rp855uxOpfVM8RndMyS
         7y4wshNxVIpOijrYeyhwGO/v5Wh8u6vyb9wh53SBVFKTg0KRxsAFDr2V0P7oVkJg0VjU
         aqSiN9DMnxIlDWJwmh8iLkehcGN9lfVs/8WHgxogmdZ9Y5UxgOAa5Gi/GyiQuP6j2FOR
         jnSjOPtb0Y7sz0mL8FbxWqmvw4FSAmD+sEux2VvvcwEHzi/9MJLZUrFvwbbYOtum2QOs
         /bpCQ3oVKRUB/U2cl8tDPa0xcQbeLt+aVNXzXAyvvKLNeQXlgG8Gbp1c/He/wgHBljv4
         JmNw==
X-Gm-Message-State: AOJu0Yz5PqRUb3x2ewADnqvKWngaDujn2Y/UOOKXt2HWuBwgqvI6/Rmn
	kA0G5gE9yXhmsJtV5xispLaHoUsLXxaVHEUA5EY1yDi2s+7WIECu
X-Google-Smtp-Source: AGHT+IGe0pxqmtYTDmNSPSnhKfIKtkLdHL1YfIyESGuelbjaEWDJXCf7isEQxtiqzAdg/UEM2k8d5Q==
X-Received: by 2002:a05:6102:30d:b0:478:241e:2ddb with SMTP id 13-20020a056102030d00b00478241e2ddbmr1360274vsa.17.1711391027445;
        Mon, 25 Mar 2024 11:23:47 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id kc1-20020a056214410100b00695e602d356sm4356858qvb.46.2024.03.25.11.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 11:23:46 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailauth.nyi.internal (Postfix) with ESMTP id 0AC8327C005B;
	Mon, 25 Mar 2024 14:23:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 25 Mar 2024 14:23:46 -0400
X-ME-Sender: <xms:McEBZg4PB2uGRNhp17erTet0ALgeLVvhGrerNguUuDdaoivC-cidwA>
    <xme:McEBZh4ZZjbWQxhliPXnPvaQHgql1fnueDzA0KiilNfXUO4xDdMC4_GbNeV7TjKsx
    UvnxpwBPmzSNSACeg>
X-ME-Received: <xmr:McEBZvf9EQc_yWMDsMdXuMCJbeOUDUCFcyPrFG7Wv_A-kjOzMKu0_ikm88s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduuddghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehg
    mhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpedtueevueejjeejfeffieelieefhf
    fhueehudekveeujeffgeduieevgfetfffggfenucffohhmrghinhepghhoohhglhgvrdgt
    ohhmpdhkvghrnhgvlhdrohhrghdprhhushhtqdhfohhrqdhlihhnuhigrdgtohhmpdhgih
    hthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeile
    dvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgt
    ohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:McEBZlJ4bMOB5SFq1SVSoPXB3XZVBQr87jLfuY_pYgYpOghq_HxdBA>
    <xmx:McEBZkKrJO1lG-ZMtOZ-yQ6-5ZLN0jLbfFtAq5juu1ZQw2GeC_jKwQ>
    <xmx:McEBZmzTOIgLwzbV3sCdt4WTuz5VyeLj4kpqXTpWh4LNrau55MudkA>
    <xmx:McEBZoKeUhDVpXrQT7QnIQcEu6mfan7pQUv1YFMlGLIkaTXL5DwpIw>
    <xmx:MsEBZrUebdMXpvGNVG2B0Wrbj8FI7CoSJfh_2ww27cGxiISTxW9cDw>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Mar 2024 14:23:45 -0400 (EDT)
Date: Mon, 25 Mar 2024 11:23:15 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Open Meeting at March 27
Message-ID: <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
 <ZPyqLJ62B2GZg6BA@boqun-archlinux>
 <ZUk14802ZWGpR2iM@boqun-archlinux>
 <Za_9bJxeyW0pddKL@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Za_9bJxeyW0pddKL@boqun-archlinux>

Hi all,

Another rc1 another meeting! Please join us:
 
  https://meet.google.com/vii-meij-xpw

at 19:00 UTC Wednesday, March 27th.

I want to do a better job on the agenda, so with the help of folks, I
put together a list of highlight news below. And during the meeting we
can discuss:

* Your question first!
* The list for anything that anyone is interested.

Looking forwards to seeing you there!

Regards,
Boqun

---------------------------------------------------->8
What's the news since v6.8-rc1:

* v6.9 pull request:

    https://lore.kernel.org/rust-for-linux/20240309133817.335439-1-ojeda@kernel.org/

* ARM64 support is merged via ARM64 PR:

    https://lore.kernel.org/linux-arm-kernel/20240313160018.2603344-1-catalin.marinas@arm.com/

* First kselftest for Rust:

    https://lore.kernel.org/lkml/fc9ccbf3-6b7d-46d3-a8da-54d5dc78a81c@linuxfoundation.org/

* Rust block device driver API RFC v2 is out:

    https://lore.kernel.org/rust-for-linux/ZfdhyfLWBIFtKO81@casper.infradead.org/T/#t

* A few "topic branches" have been created/renamed to help collaboration:

    https://rust-for-linux.com/branches#topic-branches

* Memory ordering model discussion:

    https://github.com/Rust-for-Linux/linux/issues/1067
    https://lore.kernel.org/rust-for-linux/20240322233838.868874-1-boqun.feng@gmail.com/

Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235A323D7C5
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755014201; cv=none; b=asP0TnCi9v+Ob6Io/HVDQedpDYqDukRnn8CsdxKkORGlCquPfpjR+ve4GdaHGXBxA6k4gck9d8FnZPzKeYFyFdLUmjpEgOaJU0zX8Kl06wgDA2UcUNt9wdFNvmapJDqZD4gfb2/DhXNlvXo9+lmV/keOhii/TnHMf1vkmInE9ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755014201; c=relaxed/simple;
	bh=MKBy2ptFtdluhexTaSNJsjT+1GddEgf06NUJwp5g4I4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lg7wfU5HQaqRHmixKHKUhybE+2PGuBQhyemTJzZMqT2L+RcqUC+tX/Fr1pOLmcYNzCh1siBDBqz2DAsfuOzBAzskn5FYXOAz6+u10TacaPlyDxwDrJcX+LrXpgn5wmJGWnTbK2NzUwWWd2wrjHC/o5wsyO9rdcReH+mgZqSOINs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9ZpQetl; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9ZpQetl"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4b0a13bb0b7so65427751cf.2
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 08:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755014199; x=1755618999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqTGpzjJfJfaj7mfsYNwlHyc6WOEGNm6kD4TyZr5JL4=;
        b=E9ZpQetlVwd8qwFTrNPtkwfHoqfAKvr/rzVu/JP6MaIk2WrVXDHkoNlEy8R1hmpl0t
         D8RRidBbWCS9c5InzjX/fKwU75hVmUDswIwGq2w7wogkTJwQrS2wmWDgzx6DB9Fpr+D5
         hOW3NNEewnbB3HQ5cPEd9myc99JDsgsrmUQr0EFgb94fXCb/toJ79sL1USyUzDlFIZA9
         aWLh5L0J0lD+gtdqBcJ0MhEuKmY3HQLhhHMc+s2bxmPWamA3hXWDy5sf0WlnMaN4/Ym6
         20oRSQsfg+XlA2iF9zcCTYJhKNYHnAXFpp+XlYJElC+6gNhJbHv4NaIOBcZQZKHcPwUm
         sXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755014199; x=1755618999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqTGpzjJfJfaj7mfsYNwlHyc6WOEGNm6kD4TyZr5JL4=;
        b=pQJOSyZUKdW7qwZ60lDjSH4/2mPdulZuE4eDCFs9Znse3JQ33Pi6MeGDfgDjeLQw6w
         b8VCYnvPUPf0x6/dO0MGznF/sVmMyrkiuM9i/niXW6iP5K43n3kUxi7xixwziOYASrbF
         NPrqgVqMSEtKvK5H7lW0ks2ZK6CZ5daaxMOns/JTPrKQAp1rWU3ritD+2rqOVohsUWVZ
         CeOyZx913ItOYuXNLwkQKwNmzbcbVbQrsqKE8CbZjzXwIxRPY/NR8pVZk+niJUZmnUo3
         fDf0aiWduxTYf0upFjWnkn8pS+3L8gxcdc8Zh0KqvSEm/i02ea188D9vFwqyUF2T1mcJ
         sPiw==
X-Gm-Message-State: AOJu0YwnN2f0OZxuGcgZ9iT/KkmwJdVGqDxGD+ZwrclgpZ2+/HEbfR5z
	+9WFrkchy8fdvV3eV1YHFWEmBHPyPeEzYIumpl6az4+DHmxvYU7gw+B4KOxYqA==
X-Gm-Gg: ASbGncsAqjYlm68h4RruEXJambFStonvDOYDspE83WkCM70+ImiJ8HJ/K8JivhP8Wcr
	J/RdIB0WpdpjYyHeiopNxyMNuyAXF0SN9Wp8xfGgIpbGiuzhRKo5PHxcW8KEO4WCmJHhd6VNdoi
	yU+DCPUKEPJkqHiOil2MBmZcvO9L01LjVGv7QA/LamTth8L08R0hg4gTfWKEUH3ieYBFQB6gtC/
	Wrw2quxP5As+sS7z9DnzraVtpBQ2fH4nMqhIuqW+JEPeuRD7yVn7XeeJl/9X3l8yrx7kgzZ+pRA
	LWmq6P03u7LtKWIvvx1956nComZlKebHjYQ6zZotv3VHhxT73DFITgZbLbtGa9T1mXJYo9uK4bM
	arRgsN4ifYZODoM6HWqsZMQ7wG7qEVw76vrh5QczO+0F00GqawAjGr6QwyFMJj/GTzTxRv13f4n
	zW/yt+8u/fYixHKBh8CSP0hE7AfvgNgYn4nQ==
X-Google-Smtp-Source: AGHT+IHEREDfQ3yQUY3sSNY62xae3Pz/KOCD3/xhLsbOV4F2OtGXZKFLlDG17mPVjkarrVgmoERZHQ==
X-Received: by 2002:ac8:5a13:0:b0:4b0:6ffe:5b40 with SMTP id d75a77b69052e-4b0fa7c6eaemr1489841cf.1.1755014198654;
        Tue, 12 Aug 2025 08:56:38 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b076710ff1sm115145021cf.52.2025.08.12.08.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 08:56:38 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id E481BF40066;
	Tue, 12 Aug 2025 11:56:37 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 12 Aug 2025 11:56:37 -0400
X-ME-Sender: <xms:NWSbaKqAOFqSUaoyBkgVmLaBK3oBM9AQA7AtzOANdnjM5C3skXzLEw>
    <xme:NWSbaI16qGr668IFZaqExkWEygdHgZ5p3-HsyKO9HEK9mHwSnZjhhOm3xc5RaRDAY
    _ZDAUtYZYi1UtfS9g>
X-ME-Received: <xmr:NWSbaBAlrS9V8mAcVT5rGWeLOY7xOe1hwnBM82GuzQDQ0Q6RG0rCAL8Imw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeehjeehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:NWSbaIeli9Ca4Jj0vM_ZkgACUCjubCqi-tW3MlSVyeCr_hHBtcWmLw>
    <xmx:NWSbaOivOIpEVHfMHYLaPm-yS-cwcJbz3hsINwfRr_Y6eH_kz3h3VA>
    <xmx:NWSbaIoIov0nETM4fbATZhKHkA6OG2jTNZUQqJu-CV0c8wpAIbiXzQ>
    <xmx:NWSbaGGWs853dV3fJfwPYuouURMN-MZJ8npvmTglqHlOdocrHk7oPg>
    <xmx:NWSbaKk1fE9xrztByXWv6Ju21faIRt1g4v-2nzQ_sKEoOPI9DzgWQVSQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Aug 2025 11:56:37 -0400 (EDT)
Date: Tue, 12 Aug 2025 08:56:36 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Open Meeting at Aug 20
Message-ID: <aJtkNLp1pETbl9UI@Mac.home>
References: <ZPyqLJ62B2GZg6BA@boqun-archlinux>
 <ZUk14802ZWGpR2iM@boqun-archlinux>
 <Za_9bJxeyW0pddKL@boqun-archlinux>
 <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
 <ZlX_KOjdd65k9Jkw@boqun-archlinux>
 <ZqpWRo2M2SaTWU76@Boquns-Mac-mini.home>
 <Z1ClkseCwaEXS6GE@boqun-archlinux>
 <Z6IvhjRFU9R32jHV@Mac.home>
 <67f43ca0.0c0a0220.a75ba.35cb@mx.google.com>
 <aEXLAPOV_FrH7Q5C@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEXLAPOV_FrH7Q5C@tardis.local>

Hi all,

Due to a conflict with Rust-for-Linux / Rust-language sync, the open
meeting this time will be the Wednesday next week.

Please join us at Wednesday (Aug 20, 2025) 18:00 UTC at:

	https://meet.google.com/cik-xrih-wij

If you plan to present something cool, feel free to let us know ahead of
the time ;-)

Regards,
Boqun

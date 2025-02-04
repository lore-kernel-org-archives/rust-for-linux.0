Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D03213E97
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 15:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682252; cv=none; b=qNBo79a7DFXy0TLzt+MOCq2syapBjH9weKAKFpYFS5p8Q72NRuvP99nx0UxQjX+KZFNr6x90r8XtK/T+ORjwbVIHOwbW7JsAdxguxuHX2Nu5q08KAU0Jig5Ckx6BhZ3MJmnsyn5R3ui12PGbSTD/RuiYVi+4z/uuWmB/jEJFVa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682252; c=relaxed/simple;
	bh=t+JwVQcUpd/7lnUR6FlJVq15CUL67Di22UTM2PaVaJg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtNBS72dj8rQzee2LYGTZyOOam0my6q1Paq2YIzjZOrWcVz/vjtt4wKknmmIIkNCkfclAuqWeHRynzvnpmSnbnofWQJ6V1O7HYdRvNtvB5vN5WMGYZ1I3u4S8ptl+BVc/qgTXDAiURB8X9Zt5+2z0DqBpbEZZw+rUHYNdGFvPWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHlcWzAE; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHlcWzAE"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d92e457230so52161196d6.1
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 07:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738682250; x=1739287050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mb0vW7Q8g2eXvYf2TFaOrMbjmZmuzjt5K9nxBnfv+xc=;
        b=KHlcWzAE0zEU0nEfPIMjPBtVDrmDOXoNG+WIXx61gA8APIjmZS2l61vkHnd/wHgmsU
         IKRIdEgrehb0pXdIG60tDOUEDXn2bxiUI9JJSrREboX/8CQgPaXs8FjMPjjWVPInuAMA
         SO4HFdafi2O7F1QEVMEJRvpuqOgEaDxN3ReZUKY307Zy5y3OeGdETAOLdudUdnZMH3tP
         9gxGY/pcBg8Jk/wJxWbFjK5JDgWz6rtzlvke4ZPCjrsitVmUOMiVkp74YfLj8zU1CXQV
         lPmA+7P8cCJr2cV+7Xc5cBiuayQDeupF2UsRrVPr0GQAzcSDl2F/WVX2ZwHZV0PbfbNa
         EKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738682250; x=1739287050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mb0vW7Q8g2eXvYf2TFaOrMbjmZmuzjt5K9nxBnfv+xc=;
        b=EG2yf2zXA2HZ39d+CFIhweaZ5H88WQnhXXfN6v6ehiIa8CI2BoVu6MzhTz745jiOTa
         X9DCEtgV0vwBRQ6LXtJ3iDoIeUF7sw+uEn7yuTRT3UMLs0UdbAKhirlqVM9teHcFzh83
         4WV7k2xwZbsMbY4S52VIMRW3HSYP3/G+4/HgP4e98hrFmcLqNXWyNMaMl8JDqQ2NOVgd
         bZDmGOBH6oF1SV/6bFthQIJULHsEugzaQ6B+kqEpZyMm3RZtA/jkVGAcE0AzI521Omzg
         52CkMOkEeSwYJVmJtotr6lReI4ae+eybRNRKzYY0dg8T05+xnjOt72tIOve1ZIF4oxfW
         zDFg==
X-Gm-Message-State: AOJu0Ywm/FdhRmWRf115HmmtfVlBikuj1863AXsRhhBmNGVVIv+UOql9
	a+RLjgjICavh9XtezWR61glCXebYvx/o9wwqaYZ3n14nrtglO+eHAYduKw==
X-Gm-Gg: ASbGncu4sy6rtwaJ941aErAD1IRJMUsSeFMJdt+nsJcRXUb798PSXpZBVJXvWeMIqfl
	v5DTsUot8Dc0ZH+74seu7j4RWJekYoCpDM9WniFEChkoT8VC1ql8+9+Xc0053K9XZJJcRKtFJzC
	kZ1GoDXbTCZy9cFwsXPz2bV5xYK0+ZJmTvCRC4h7x24yV7/BcpvB1nr3cIKhbfbPQo2u/7+z35g
	A6d0GhCEaSn5R9fG9xBqWRB6qy9D1m785YxAhbYqPRUqOJI2xxHOX8W7v5KE0PSw5IBLD0Xke0m
	JptkzRBTza9bqNL3nU4eGQy3di8HcClN39gcEScdFgjRqisJWJRzf94EIEOJNP28CEW0jRUFLKv
	Uckg/wg==
X-Google-Smtp-Source: AGHT+IG8oe1xhK6sUSReozbDicLl4vDt41r0ouWuiBigqRRbkDKDVg1cHUZ2LUs0/X0/51MPu2fMrQ==
X-Received: by 2002:a05:6214:1c41:b0:6d8:9be9:7d54 with SMTP id 6a1803df08f44-6e243c647e1mr395207386d6.35.1738682249778;
        Tue, 04 Feb 2025 07:17:29 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e25495e831sm63301746d6.123.2025.02.04.07.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:17:28 -0800 (PST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0FE0E1200068;
	Tue,  4 Feb 2025 10:17:28 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 04 Feb 2025 10:17:28 -0500
X-ME-Sender: <xms:hy-iZ_bPfzQfcBo0plN76E5XXJKU0EE-5e1mQDxQjgSS0PwiCyteKA>
    <xme:hy-iZ-arAII-spQ4JUHcwryXBChMNhMiuXGDHEobj1Vju4UOiNd_VhgKxE2DYVb06
    LtAagFFfYMbEiRsUQ>
X-ME-Received: <xmr:hy-iZx8tItgaonoslbQ46G4aL_QKiLwba2ZKcvoEwoWZIxoErwNGlmupcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvf
    fukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegs
    ohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephfetff
    dtlefggfehgeefffetieeuhfeijeekffegveejfeffhfdttdekgeehtdehnecuffhomhgr
    ihhnpehgohhoghhlvgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:hy-iZ1p8jnqHAd19ySHjfkbPBIHmLod6byHO9SBvDkd6bxRiFLMW-Q>
    <xmx:hy-iZ6qSnx3w_mvQ6Rjgfotcz3ogPPxNjj09puLYkMWcU66_ZkNzSw>
    <xmx:hy-iZ7TKVBw17TpzeM9JaywJtKfzITMdZaz5N09qyZnzAjPQUAmzLw>
    <xmx:hy-iZyqYxabNpcFgseirtnkLvcJVuJNR7VC6IrhA5jlW6BdVnGZOqg>
    <xmx:iC-iZ75SQETY8M-Kpy8kc-m0zdkVn74tftfM7qeFiUwVhF44lSwYrYi_>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Feb 2025 10:17:27 -0500 (EST)
Date: Tue, 4 Feb 2025 07:17:26 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Open Meeting at Feb 5
Message-ID: <Z6IvhjRFU9R32jHV@Mac.home>
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
 <ZPyqLJ62B2GZg6BA@boqun-archlinux>
 <ZUk14802ZWGpR2iM@boqun-archlinux>
 <Za_9bJxeyW0pddKL@boqun-archlinux>
 <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
 <ZlX_KOjdd65k9Jkw@boqun-archlinux>
 <ZqpWRo2M2SaTWU76@Boquns-Mac-mini.home>
 <Z1ClkseCwaEXS6GE@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1ClkseCwaEXS6GE@boqun-archlinux>

Hi all,

It's open meeting time! Please join us:

     https://meet.google.com/vii-meij-xpw

at this Wednesday (Feb 5, 2025) 19:00 UTC. See you guys there.

Regards,
Boqun

Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BFE168DC
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439245; cv=none; b=GEBxf7uofP4uzyREmO+9bV7RJWgLJp7yllW2OBv7sx3RzlWt+0bCjmhT6mcPQ3g1CZ7LKI1LZae/wTRGU5XhFrqOvUXKWIm5oSKsSlmgYYTKZOsUhg4Y9SJMdP3GneIJvGW6aAcpQonXRktfzI/7nG7MYDHEaA1j46V39VpvR1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439245; c=relaxed/simple;
	bh=qfYdDMqUz/jqJxKcOwtHxikZL32V6+EgK+68XP13ZRc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJw7/QWOfm/7vqW4DtgolXNYHuYrZsFFW0/uwZzEC4hhIG0dakWxxBFPNS0JfI1Rr1v2HpXfNdsBs8HcYQiuqdUR7DNrlZGSW55BKeyPLMcg50a2MvW87Z8TOMVVj2lZS6ANQAQY5JLUGJ9CZ+qk6dUa9TFTnw/K2XjL1Xt4GvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/l+2GwF; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/l+2GwF"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a1e1f6a924so358855385a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722439242; x=1723044042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cl+f5rrbCSDOcenfXP7fpdLzRPoW6Y/PRRAimXm9yAw=;
        b=L/l+2GwFLJCil0d3VFKncaZ+0I5sps7FXcCZezQurIvkcU0pTXkGnkqhE53FjG4nN8
         CYoJhK3nCZXmARuwH+uXpIL1dVHZUqhOqI9ufGZIglmp4kV2WP6XcqPCmF22KZU6tCix
         bFAbEKo2Uxz+WC5Nz42V6MtgMTJl2LCpukAuh6TlmH9hyqdIrsAD1aoI+5eEaHOaaxIz
         a8Q+NZsmD2flxdHwGFO+sxYQ7f8Ydafh8OQ3HC27DQRqVYZC9UD71X0Se84PXW6+dwoJ
         O+YYWydX0Wrufc+GjJVflOWFDP1wRjkMU0QpYR9poSmskzTBlT2v2U+3v2B1c5o3lA79
         6Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722439242; x=1723044042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cl+f5rrbCSDOcenfXP7fpdLzRPoW6Y/PRRAimXm9yAw=;
        b=W0D4DCPJNnNubK5IhbSlidwjVxSnvP64b0AgX5wKlOCQKqmAIlTtt/POPIpqOtotoN
         Ht4AoJp2lkEUuqFNeS4TmYRVeEW3gx6KgZeHMd9o2pzFK182GM4WMPlDTS/2CwbAJtM3
         d+LyCh9UlUK5Q9ZfN0sqaqwMX4bd2BZnG6weU/SbIMnPS/o9wlR9Ow2XDOUluXkELt9S
         Ex/gKFuc7YI3JmKvzv7CQFHmozq19zuks3AI4Q3U9VqIz3Du9K/yMxySMDCHQeB9wnoS
         DYTEMw4Gzcq6YEGpPg6pkkmB9qNLOmVvRfjojciEuz7bD3D2jEMMs5pTXtaSlrMHxaB9
         ZLVw==
X-Gm-Message-State: AOJu0Ywh1OKXTDO77yQw/DSlcx7wPbIn9bo+qmEC/pIlqeUMsjJuZYJu
	YShiWoL4ChVBhgCbJ5vTr9MXhQOvzDhDDMQvMlrVxiVBx7VNJe5U
X-Google-Smtp-Source: AGHT+IFWXDUQqBWDyXd3w44MeY0dFHKK14AQoEIBB37cgWn2OfW+O8oWqmEhWpeABe/6Ko+e4yl9vw==
X-Received: by 2002:a05:620a:4450:b0:79f:8be:e3f3 with SMTP id af79cd13be357-7a1e52cdb9amr2104837085a.50.1722439242354;
        Wed, 31 Jul 2024 08:20:42 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe814f9a6sm60949031cf.34.2024.07.31.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:20:41 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 3422D1200084;
	Wed, 31 Jul 2024 11:20:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 31 Jul 2024 11:20:41 -0400
X-ME-Sender: <xms:SVaqZqRh_9ErGoR6Dy6ej26DQ3pQRpHtFUYC8BkA5ildnAnPgNeS0A>
    <xme:SVaqZvwGnF7jRkWC0IDf2PxKyfkrZ_Ke-tSeqCZ93awH7dgj5PIvbppwmlqOh_GcN
    SMHdA7TwnIh74MtBA>
X-ME-Received: <xmr:SVaqZn25ZWYJBig-THfMZww8GWKrR_wv7A8AZsRxS6s2B55yuo_G3Mf4yA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeeigdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhm
    rghilhdrtghomheqnecuggftrfgrthhtvghrnhephfetffdtlefggfehgeefffetieeuhf
    eijeekffegveejfeffhfdttdekgeehtdehnecuffhomhgrihhnpehgohhoghhlvgdrtgho
    mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:SVaqZmC0FagMk5ruxZdt6ELpucFDU3jQgMHthuEVV2bGDUmLowknHw>
    <xmx:SVaqZjjRD9b_D7FkkjDIYQ-U-iOPqhEtOy5swTuM-j1SVALeVu89Qg>
    <xmx:SVaqZioBO0ugt0a0BjueGJxZlFxr9lSoRDjtM7tC1mwEWdkdxC6zRA>
    <xmx:SVaqZmjMgPxGn7pOnTXB8y0DLeTaCLial83jrQ9nHD1nJwBZEEYtkw>
    <xmx:SVaqZiRFDePGAa3pQsp6Gfe0bay423kvnyKuG3l4VOc-n4AmBXay7PEO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Jul 2024 11:20:40 -0400 (EDT)
Date: Wed, 31 Jul 2024 08:20:38 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Open Meeting at Aug 7
Message-ID: <ZqpWRo2M2SaTWU76@Boquns-Mac-mini.home>
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
 <ZPyqLJ62B2GZg6BA@boqun-archlinux>
 <ZUk14802ZWGpR2iM@boqun-archlinux>
 <Za_9bJxeyW0pddKL@boqun-archlinux>
 <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
 <ZlX_KOjdd65k9Jkw@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlX_KOjdd65k9Jkw@boqun-archlinux>

Hi all,

Due to a schedule conflict, the open meeting of this release cycle is
going to be at 18:00 UTC Wednesday, Aug 7th. Please join us:

    https://meet.google.com/vii-meij-xpw

See you there!

Regards,
Boqun

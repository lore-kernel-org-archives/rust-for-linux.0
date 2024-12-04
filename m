Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6460B23919E
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Dec 2024 18:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733338552; cv=none; b=CxM8y0RDpuVTNgI5IaC70IH5ZWxzP6YCyBQxDtYSvHrU8J3MERpW8kZ+2OVe4Y2hojJiyTlsGoZ2F0torUCNEnwWb2f99dqan95B5xfIMdn3rjjl8xxowc7+JjMMhN5oT1wQE+LqtSYy0DQrkS9Z3euY+1rWfst8wnNmJaPn0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733338552; c=relaxed/simple;
	bh=K3Jz13IzQYnKFFLpb+vHArstI9lXDi1fDI0tQEfeF9M=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqrDuB+aiJOdO7sKBQBVMPaFn3kJSWH/9gZfx7ZlbfBVq4fJyJH3zyCQAgD5iiMLsXj9vreMoFILDHXcHNMTX3MA5IQxfGxuF9DD44VDPcf6tL9gHmU4A49LRrDYTwV0wjlE8sCV2ftvTqVda6ePTCdo9jMNjqwnDAOcdAlCNmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6aarW/F; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6aarW/F"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d889a1f7a6so1652646d6.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Dec 2024 10:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733338550; x=1733943350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTUSOS8bTAOV1uvNMDoqzruvMpYWkuTUzmR841BbEpE=;
        b=F6aarW/Fw0v75yEMHy2pOXHl92Fo1z/mQwMYONrQVnqqmDGsU2DBIUjltXXPymatQe
         hW7k4cS5/m1GbAZME3WV3Rt1AL5nWj0ktUVNGzIsfLvdWhLQ3q/nCb4TU3+GxX4lsN4T
         Kp3t5MEBhMjoAP+e2EmX3RRivBeCm8bA81ncgm1zNEgw5hDiMhKYbdBLcLa2/k8SxtO1
         Tcv+7FndKErsTiojwA4TB78JEo8VhMe9KPbYm/BWVYSx+criI4f3517ihIJAls1U0h+7
         oz6KeOrOW9Cij0h6tqNmt47ONJCTPPtWBhd0VryuBnfRzKSUg4BOUqs/opeoep7EEcI/
         iIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733338550; x=1733943350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTUSOS8bTAOV1uvNMDoqzruvMpYWkuTUzmR841BbEpE=;
        b=thvY4CrL70zaJWY6RnW6BgmbAUQSsy1KTd7IIT6O8gPk6xWap+pJBOKY55vPvysAfY
         SZRHVrMx+2SAHswWMXU15m3Z4jE9Ea9KUwQO+gWtbu19KB2S2C66bwAEQv5l3lKSTwPD
         7/s7I9Zc/qS1czVYYmwTjDjt2Cp0A3Sy5DQw9/tdqROPxtTDuj9dk64bQVR6c59J43LZ
         lDhZ8AetNj/tbYIugn3cBxcLtpgF6XA94C7Hf7wnCZ2YvK573thDpCKkZ7KR5TpMv76J
         W5j4JxCIPJegr4EfnsCBiegyodN4+6PEwO9H5x+FOMw08GFeyFXQlCY/xBTsZUXlt71q
         AWQA==
X-Gm-Message-State: AOJu0YwOJGonItG7OusXR/hCckL8w+5Z9evEKYzsKmZKIwiPo3WmEpjF
	pI7XDKuXy10KReGgpeyeRn7nrsKiYjpQd8IW0vizL4dcLBzD9YTxPjYppg==
X-Gm-Gg: ASbGncvPUVl9ed1jAu3nOHwkNUQqa0B627O8kYxblE6yg10EIGpTqRGEHDSOZqA8Ij6
	3QHkQxw8L0nfh4f3izD95GcU3XF8EepMKFcEoWRIN+w/IsaXPQwnKwZ19+vq5Qw2RkEHpefS3+q
	QC9dHzf1A2amX1mbOFZ2aPv6gHaXARMsCrhvERLBvseXE+rfdGg1BQ17yQpJjzSpe1y8YcOdPYs
	0bOSOBFabGjanMG3ZSS3To7rmFDKIQYRW7wkC/Ii5e2AJ1GZW8RHK7mccN40nNbQLBhbK4ctIP4
	QS90N5gCbgV7hjWnlWom90/E+l8KwgNCxnR91+iV
X-Google-Smtp-Source: AGHT+IHIozDTX604xGn8XMDQHip19PrcatcGY/TM06Kk6VZ9c+Mfvn/nI6nM3RVXaFFVVDpfjdJZMA==
X-Received: by 2002:a05:6214:1d04:b0:6d8:8667:c6c2 with SMTP id 6a1803df08f44-6d8b736a640mr109139916d6.18.1733338550293;
        Wed, 04 Dec 2024 10:55:50 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d886e9ec20sm65088506d6.43.2024.12.04.10.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 10:55:49 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5A5141200068;
	Wed,  4 Dec 2024 13:55:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 04 Dec 2024 13:55:49 -0500
X-ME-Sender: <xms:taVQZ7aQSsac5hpuF5xh_dGQGDNRbHYjCDuIZQKjtsm0B-TS7dGU3w>
    <xme:taVQZ6Y9ge9MQrvu_oc8iLhye8xmXxpHIKbCkSD1iWv75VHzE6Ct9WCxNxrVITyAh
    PjeqMnnVRki_-GRbw>
X-ME-Received: <xmr:taVQZ9-70tdj0JkaEZK20UXyHojFqNT83ekNMAZEnK7DIMhokgoM95BbeuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieehgdduudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuf
    fkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosgho
    qhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtefftd
    elgffgheegfeffteeiuefhieejkeffgeevjeeffffhtddtkeeghedtheenucffohhmrghi
    nhepghhoohhglhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihht
    hidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrg
    hilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:taVQZxrE-xEdat_quKT1ZppZxRgkoG6zUUAnnsPRqRDoyQXfnqIbSg>
    <xmx:taVQZ2qfnWox4XaIVT0_91dSrY55Lx9SdwSj5a9_5DZcEruzwlqbyQ>
    <xmx:taVQZ3S49GTrk0VzXyOsNEjz6lmbPw1ZQ_703cfxWzAyhCOkNnx1Kg>
    <xmx:taVQZ-pSeO8uGNc7ZQkL-ybJDYPm3xzkOoH_mPeCUW9CRs68wfyvjA>
    <xmx:taVQZ35WInVJ1QtotjEyDeWQSQaWgCiC4VDVCH4xIG9GsIl8BDoG-QFa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Dec 2024 13:55:48 -0500 (EST)
Date: Wed, 4 Dec 2024 10:55:14 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Open Meeting at Dec 11
Message-ID: <Z1ClkseCwaEXS6GE@boqun-archlinux>
References: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
 <ZPyqLJ62B2GZg6BA@boqun-archlinux>
 <ZUk14802ZWGpR2iM@boqun-archlinux>
 <Za_9bJxeyW0pddKL@boqun-archlinux>
 <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
 <ZlX_KOjdd65k9Jkw@boqun-archlinux>
 <ZqpWRo2M2SaTWU76@Boquns-Mac-mini.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqpWRo2M2SaTWU76@Boquns-Mac-mini.home>

Hi all,

Sorry for the last minute notification. But due to a conflict with the
Rust-for-Linux / Rust project meeting, the open meeting is moved to next
Wednesday, i.e. 19:00 Dec 11 in UTC. Please join us:

    https://meet.google.com/vii-meij-xpw

Regards,
Boqun
